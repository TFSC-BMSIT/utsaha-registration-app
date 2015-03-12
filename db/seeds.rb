# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RegistrationFees = {
  fashionshow: 2000,
  streetdance22: 400,
  streetdance33: 600,
  battleofbands: 1000,
  filmmaking: 100,
  groupdance: 1000,
  duodance: 200,
  singingalap: 100,
  beatboxing: 100,
  madads: 500,
  rangoli: 50,
  photography: 100,
  mockstock: 100,
  codingdebugging: 100,
  gamingcs: 300,
  gamingfifa: 100,
  gamingnfs: 100,
  paperpresentation: 150,
  reversecoding: 100,
  circuitdebugging: 100,
  roborace: 200,
  typathon: 50,
  mockplacements: 100,
  googleit: 100,
  basketball3: 300,
  football5: 500,
  gullycricket: 500,
  volleyball: 200,
  chess: 100,
  ttsingle: 100,
  ttmixed: 200,
  ttmen: 200,
  ttwomen: 200,
  throwball: 500,
  tugofwar: 500,
  spentquiz: 100,
  debate: 100,
  generalquiz: 100,
  harrypotterquiz: 100,
  lagori: 300,
  hogathon: 100,
  aircrash: 100,
  minutetowinit: 50,
  potpuri: 200,
  lemonspooncycle: 200,
  treasurehunt: 150
}

RegistrationFees.each do |event|
  Event.create(name: event[0], registration_fee: event[1])
end
