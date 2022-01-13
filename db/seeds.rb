# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Engineer.create!([
                   {
                     first_name: 'Barbara',
                     last_name: 'Aliaga',
                     display_name: 'Barbara A.'
                   },
                   {
                     first_name: 'Lennart',
                     last_name: 'Sönke',
                     display_name: 'Lennart S.'
                   },
                   {
                     first_name: 'Benjamin',
                     last_name: 'Cuadros',
                     display_name: 'Benjamin C.'
                   }
                 ])

company = Company.create!({
                            name: 'Recorrido'
                          })

contract = Contract.create!({
                              name: 'Contrato 2022 Recorrido.cl',
                              start_at: Time.now.beginning_of_week,
                              end_at: Time.now.end_of_year,
                              slot_duration: 3600,
                              company_id: company.id
                            })

contract.engineers = Engineer.all
contract.save!

builder = Builders::Contract::ContractPlanBuilder.new(
  contract: contract,
  from: Date.today.beginning_of_week,
  to: (Date.today.end_of_week + 5.weeks),
  options: {
    1 => { start_at: 19,
           end_at: 24 },
    2 => { start_at: 19,
           end_at: 24 },
    3 => { start_at: 19,
           end_at: 24 },
    4 => { start_at: 19,
           end_at: 24 },
    5 => { start_at: 19,
           end_at: 24 },
    6 => { start_at: 10,
           end_at: 24 },
    0 => { start_at: 10,
           end_at: 24 }
  }
)

builder.build

Reservation.create(engineer_id: Engineer.first, time_slot_id: TimeSlot.first)
