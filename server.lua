local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")



vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","oxy_remat")

vRPcc = {}
Tunnel.bindInterface("oxy_remat",vRPcc)
Proxy.addInterface("oxy_remat",vRPcc)
vRPccC = Tunnel.getInterface("oxy_remat","oxy_remat")


AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	vRPclient.addBlip(source,{-421.03393554688, -1710.8310546875, 19.439516067504, 68, 49, "Vehicle Crusher"})
end)

RegisterServerEvent("crushVehicle")
AddEventHandler("crushVehicle", function(vtype, vname, vehPrice)
    local user_id = vRP.getUserId({source})
src = source
    exports.oxmysql:execute("SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle", {['@user_id'] = user_id, ['@vehicle'] = vname}, function (haveCar)
        if #haveCar > 0 then
            print(vname.."vname")
            print(vehPrice.."price")
                TriggerClientEvent("asd",src)
                local player = vRP.getUserSource({user_id})
                exports.oxmysql:execute("UPDATE vrp_user_vehicles SET user_id = @user_id WHERE user_id = @oldUser AND vehicle = @vehicle", {user_id = -5512, oldUser = user_id, vehicle = vname}, function()end) 
                vRPclient.notify(player, {"~w~Ai primit ~r~$"..vehPrice.."~w~ pentru masina!"})
                vRP.giveMoney({user_id, vehPrice})
            else
                vRPclient.notify(player, {"~w~Nu deti aceasta masina!"})
            end
        end)
end)

function vRPcc.getVehiclesPrices(vname)
    --print(vname)
    a, b = find(vname)


	return a, b
end
local vehicles = {
    [1] = {
    tablename = '#Masini de inceput',
    {numeVehicul = "logan",price = 3000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Dacia Logan", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "REN_CLIO_5",price = 2500000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Renault Clio", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "VWSTANCE",price = 7000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Volkswagen Passat", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "vantage",price = 12000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Aston Martin Vantage", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "ct5",price = 9000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Lexus CT5", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "DEMONBOI",price = 15000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Dodge Challenger", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
   -- {numeVehicul = "vwstance",price = 7000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Volkswagen Passat", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "EXPLORER20",price = 8500000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Ford Explorer", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "golf75r",price = 6000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Golf 7R", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "mache",price = 11000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Mustang Electric", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "mqgts",price = 15000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Maserati GTS", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "miata",price = 3000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Mazda Miata", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "nissantitan17",price = 9000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Nissan Titan", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "pole1",price = 8000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "American Pole", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "strrv",price = 12000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Ranger Rover Vogue", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "smart",price = 1000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "SMART", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "sonata",price = 5000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Hyundai Sonata", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "sovrs",price = 4000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Skoda Octavia Break", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "SRTDAY20",price = 16000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Dodge Charger", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "stelvio",price = 14000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Alfa Romeo Stelvio", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "supra19",price = 10000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Toyota Supra 2019", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "variszupra",price = 13000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "Toyota Supra ", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
   -- {numeVehicul = "smart",price = 1000000, speed = 27, acceleration = 46, brakes = 42, hp = 49, numemasina = "SMART", maxspeed= 160, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "SOBOL", price = 8000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Sobol", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "yaris08", price = 6900000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Toyota Aris", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "tulenis", price = 8000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Tulenis", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "volvo850r", price = 8500000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Vovlo ", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "EK9", price = 5500000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Honda Civic ", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "honcrx91", price = 4000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Honda CRX ", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "deltaintegrale", price = 2500000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Lancia Delta ", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "na6", price = 3000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Mazda Miata ", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "2dopelr3", price = 2900000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Opel Rekord", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "twizy", price = 2000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Renault Twizy", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "tico", price = 1500000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Tico", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "golf1", price = 1300000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Volkswagen Golf 1", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
    {numeVehicul = "v242", price = 3000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Volvo V242", maxspeed= 320, maxspeedbar = 91, tip = 'Masini-inceput'},
},

    [2] = {
tablename = 'BMW',
    {numeVehicul = "e60", price = 6500000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Seria 5 E60", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "22m3", price = 22000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "M3 2022", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "alpinab7", price = 20000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Seria 7 ALPINA", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "blackx6", price = 15000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "X6M", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "M760il", price = 18000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Seria 7 M760IL", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "m5cs", price = 23500000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "M5 CS", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "x7bmw", price = 19500000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "X7", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "bmwm4dtm", price = 15000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "M4 DRIFT", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "m1", price = 6000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW M1", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "2019M5", price = 30000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW M5 2019", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "16m5", price = 26000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW 16M5", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "acs8", price = 55000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW i8 AC", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "b12lang", price = 7000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW 12Lang", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "m6coupe", price = 30000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW M6 Coupe", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "235if22", price = 25000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW 235i F22", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "bm8c", price = 60000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW M8 Grand-Coupe", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "750il", price = 5000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW 750il", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "z4alchemist", price = 20000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW Z4", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "x5e53", price = 20000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW X5E53", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "BMWe90", price = 7500000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW 330i E90", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "bmwrace", price = 19500000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW M3 e36 StreetCustom", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "bmwe65", price = 8000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW 750i E65", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "x5m2016", price = 20000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW X5M 2016", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "x5m", price = 30000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW X5M 2020", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "m4c", price = 20000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW M4 Competition", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "bmwm4", price = 27000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW M4 2020", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "rmodbmwi8", price = 67000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW I8", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "rmodm3e36", price = 10000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW M3 E36", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},
    {numeVehicul = "z3m", price = 15000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "BMW Z3M", maxspeed= 190, maxspeedbar = 91, tip = 'BMW'},   
},
    [3] = {
    tablename = 'Audi',
    {numeVehicul = "AAQ4", price = 8000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "A4", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "Q7", price = 19000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Q7", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "rmodrs6", price = 40000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "RS6", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "rs7r", price = 45000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "RS7", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "audia4", price = 5000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi A4", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "a615", price = 15000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi A6", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "r8ppi", price = 35000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi R8", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "c5rs6", price = 10000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi C5RS6", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "audis8om", price = 25500000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi S8", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "tts", price = 20000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi TTS", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "a8lfsi", price = 25000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi A8", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "rs5", price = 28000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi RS5", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "audirs6tk", price = 35000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi RS6 2014", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "sq72016", price = 30000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi Q7", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "s4a", price = 7000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi S4A", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "rs318", price = 20000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi RS3 2018", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "rs3", price = 23000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi RS3", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    {numeVehicul = "rs6sedan", price = 1000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Audi RS6 2009", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    --{numeVehicul = "a6", price = 18000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "A6", maxspeed= 190, maxspeedbar = 91, tip = 'Audi'},
    --{numeVehicul = "rmodrs6", price = 65500000, speed = 75, acceleration = 65, brakes = 70, hp = 85, numemasina = "RS6", maxspeed= 300, maxspeedbar = 91, tip = 'Audi'},        
    },
    [4] = {
    tablename = 'Mercedes-Benz',
    {numeVehicul = "amggtbs", price = 30000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "AMG GT", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "Brabus850", price = 25000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Brabus S50", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "e63estate", price = 10000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "E63 Break", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "e63s", price = 20000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "E63 S", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'}, 
    {numeVehicul = "gls20", price = 15000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "GLS", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "xclass", price = 10000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "X CLASS", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "rmodg65", price = 30000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "G65 Brabus", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "gxg63", price = 11000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "G65 AMG", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "CLS53", price = 26000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz CLS53", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "gtrc", price = 34000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz AMG GTR", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "benz190e", price = 6000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz 190E", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "XPERIA38", price = 50000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz XPeria", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "amggtsmansory", price = 40000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz AMG GT", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "cls63s", price = 25000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz CLS 63AMG", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "GLE63S", price = 20000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz GLE63S", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "e500c", price = 23000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes e500 4Matic", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "gl63", price = 20000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz GL63", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "mercxclass", price = 20000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz XCLASS", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "500w124", price = 5000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz W500", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "mlbrabus", price = 25000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz Brabus", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "g65", price = 26000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz G65", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "w222s500", price = 22000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz S500L", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "cla45sb", price = 23000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz CLA 45 SB", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "gle450", price = 24000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz GLE 450", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "mb300sl", price = 20000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz MB300SL", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "s600w220", price = 7000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz S600", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "g770", price = 26000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz G770", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "c63s", price = 30000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz C63 S AMG", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "cla45", price = 33000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz CLA 45", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "cls2015", price = 26500000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz CLS 2015", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "e63amg", price = 29500000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz E63 AMG", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "rmodgt63", price = 20000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz GT63 S", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "amggtc", price = 32000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz AMG GTC", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "mlbrabus", price = 21000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz ML Brabus", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "s65f", price = 27000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz S65", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
    {numeVehicul = "sunrise1", price = 30000000, speed = 70, acceleration = 60, brakes = 65, hp = 80, numemasina = "Mercedes-Benz Sunrise", maxspeed= 280, maxspeedbar = 91, tip = 'Mercedes-Benz'},
},
    [5] = {
    tablename = 'Lamborghini',
    {numeVehicul = "veneno", price = 80000000, speed = 40, acceleration = 30, brakes = 35, hp = 50, numemasina = "Veneno", maxspeed= 170, maxspeedbar = 91, tip = 'Lamborghini'},
    {numeVehicul = "rmodlp770", price = 75000000, speed = 50, acceleration = 40, brakes = 45, hp = 60, numemasina = "Centenario", maxspeed= 200, maxspeedbar = 91, tip = 'Lamborghini'},
    --{numeVehicul = "URUS", price = 42000000, speed = 40, acceleration = 30, brakes = 35, hp = 50, numemasina = "Urus", maxspeed= 170, maxspeedbar = 91, tip = 'Lamborghini'},
    {numeVehicul = "lambose", price = 50500000, speed = 40, acceleration = 30, brakes = 35, hp = 50, numemasina = "Lamborghini Elemento", maxspeed= 170, maxspeedbar = 91, tip = 'Lamborghini'},
    {numeVehicul = "terzo", price = 70000000, speed = 40, acceleration = 30, brakes = 35, hp = 50, numemasina = "Lamborghini Electronic", maxspeed= 170, maxspeedbar = 91, tip = 'Lamborghini'},
    --{numeVehicul = "rmodlp770", price = 520000000, speed = 40, acceleration = 30, brakes = 35, hp = 50, numemasina = "Lamborghini Centenario", maxspeed= 170, maxspeedbar = 91, tip = 'Lamborghini'},
    --{numeVehicul = "veneno", price = 75000000, speed = 40, acceleration = 30, brakes = 35, hp = 50, numemasina = "Veneno", maxspeed= 170, maxspeedbar = 91, tip = 'Lamborghini'},
    --{numeVehicul = "veneno", price = 75000000, speed = 40, acceleration = 30, brakes = 35, hp = 50, numemasina = "Veneno", maxspeed= 170, maxspeedbar = 91, tip = 'Lamborghini'},
    {numeVehicul = "lp610", price = 830000000, speed = 40, acceleration = 30, brakes = 35, hp = 50, numemasina = "Lamborghini Huracan", maxspeed= 170, maxspeedbar = 91, tip = 'Lamborghini'},
},

    [6] = {
    tablename = 'Rolls Royce',
    {numeVehicul = "WRAITH", price = 70000000, speed = 65, acceleration = 55, brakes = 60, hp = 75, numemasina = "Wraith", maxspeed= 260, maxspeedbar = 91, tip = 'Rolls'},
    {numeVehicul = "RCULI", price = 50000000, speed = 65, acceleration = 55, brakes = 60, hp = 75, numemasina = "Cullinan", maxspeed= 260, maxspeedbar = 91, tip = 'Rolls'},
    {numeVehicul = "dawn", price = 55000000, speed = 65, acceleration = 55, brakes = 60, hp = 75, numemasina = "Mansory Dawn", maxspeed= 260, maxspeedbar = 91, tip = 'Rolls'},
    --{numeVehicul = "wraith", price = 45566000, speed = 65, acceleration = 55, brakes = 60, hp = 75, numemasina = "Wraith", maxspeed= 260, maxspeedbar = 91, tip = 'Rolls'},
    {numeVehicul = "dawnonyx", price = 65000000, speed = 65, acceleration = 55, brakes = 60, hp = 75, numemasina = "Dawn", maxspeed= 260, maxspeedbar = 91, tip = 'Rolls'},},  

    [7] = {
    tablename = 'Ferrari',
    {numeVehicul = "f8t", price = 65000000, speed = 60, acceleration = 50, brakes = 55, hp = 70, numemasina = "F8 Turbo", maxspeed= 240, maxspeedbar = 91, tip = 'Ferrari'},            
    {numeVehicul = "ferrari812", price = 60000000, speed = 60, acceleration = 50, brakes = 55, hp = 70, numemasina = "812", maxspeed= 240, maxspeedbar = 91, tip = 'Ferrari'},            
    {numeVehicul = "fxxk2", price = 85000000, speed = 60, acceleration = 50, brakes = 55, hp = 70, numemasina = "Ferrari FXXK2", maxspeed= 240, maxspeedbar = 91, tip = 'Ferrari'},
}, 

    [8] = {
    tablename = 'McLaren',
    {numeVehicul = "SENNA", price = 65000000, speed = 54, acceleration = 44, brakes = 49, hp = 64, numemasina = "Senna", maxspeed= 220, maxspeedbar = 91, tip = 'McLaren'},
    {numeVehicul = "P1", price = 70000000, speed = 54, acceleration = 44, brakes = 49, hp = 64, numemasina = "P1 WiddeBody", maxspeed= 220, maxspeedbar = 91, tip = 'McLaren'},
    --{numeVehicul = "720nlargo", price = 60000000, speed = 54, acceleration = 44, brakes = 49, hp = 64, numemasina = "720 S", maxspeed= 220, maxspeedbar = 91, tip = 'McLaren'},
    {numeVehicul = "rmodsennagtr", price = 70000000, speed = 54, acceleration = 44, brakes = 49, hp = 64, numemasina = "Senna GTR", maxspeed= 220, maxspeedbar = 91, tip = 'McLaren'},
    {numeVehicul = "600lt", price = 65000000, speed = 54, acceleration = 44, brakes = 49, hp = 64, numemasina = "600 LT", maxspeed= 220, maxspeedbar = 91, tip = 'McLaren'},
    {numeVehicul = "720s", price = 60000000, speed = 54, acceleration = 44, brakes = 49, hp = 64, numemasina = "720S", maxspeed= 220, maxspeedbar = 91, tip = 'McLaren'},
    {numeVehicul = "570s2", price = 82000000, speed = 54, acceleration = 44, brakes = 49, hp = 64, numemasina = "McLaren 570", maxspeed= 220, maxspeedbar = 91, tip = 'McLaren'},
    {numeVehicul = "mp412c", price = 91000000, speed = 54, acceleration = 44, brakes = 49, hp = 64, numemasina = "McLaren MP412C", maxspeed= 220, maxspeedbar = 91, tip = 'McLaren'},
},   

    [9] = {
    tablename = 'Porsche',            
    {numeVehicul = "918", price = 72000000, speed = 56, acceleration = 46, brakes = 51, hp = 66, numemasina = "918 Spider", maxspeed= 240, maxspeedbar = 91, tip = 'Porsche'},
},
    [10] = {
    tablename = 'Tesla',                    
    {numeVehicul = "tr22", price = 52000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Model Roadster", maxspeed= 210, maxspeedbar = 91, tip = 'Tesla'},      
    {numeVehicul = "teslax", price = 41000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Model X", maxspeed= 320, maxspeedbar = 91, tip = 'Tesla'},
 },
    [11] = {
    tablename = 'Jaguar',                    
    {numeVehicul = "ipace", price = 66000000, speed = 60, acceleration = 20, brakes = 50, hp = 62, numemasina = "iPace", maxspeed= 210, maxspeedbar = 91, tip = 'Jaguar'},      
    {numeVehicul = "xj", price = 72000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "XJ", maxspeed= 210, maxspeedbar = 91, tip = 'Jaguar'},        
        },
    [12] = {
    tablename = 'Altele',
    {numeVehicul = "regera", price = 75000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Koenigsegg Ragera", maxspeed= 180, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "BDIVO", price = 80000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Bugatti Divo", maxspeed= 180, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "gtr50", price = 45000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Nissan GTR 2020", maxspeed= 180, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "nismo20", price = 48000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Nissan GTR R35", maxspeed= 180, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "velar", price = 20000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Range Rover Velar", maxspeed= 180, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "rmodmartin", price = 22000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Aston Martin", maxspeed= 180, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "rmodmustang", price = 21000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Ford Mustang GT", maxspeed= 180, maxspeedbar = 91, tip = 'Altele'},
    --{numeVehicul = "WMFENYR", price = 30000000, speed = 46, acceleration = 36, brakes = 41, hp = 56, numemasina = "Fenyr", maxspeed= 180, maxspeedbar = 91, tip = 'Altele'},
    --{numeVehicul = "nismo20", price = 60000000, speed = 56, acceleration = 46, brakes = 51, hp = 66, numemasina = "Nissan GTR", maxspeed= 240, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "nissantitan17", price = 10000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Nissan Titan", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},         
    {numeVehicul = "steed2", price = 9000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Great Wall Steed", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},   
    {numeVehicul = "man", price = 9000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Tir Man", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'}, 
    {numeVehicul = "actros", price = 10000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Mercedes Tir", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'}, 
    {numeVehicul = "rav4", price = 20000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Toyota Rav", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'}, 
    {numeVehicul = "supraa90", price = 20000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Toyota Supra 90", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "golf7gti", price = 4000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Volswagen Golf 7", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "fh500", price = 11000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Tir Volvo fh500", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "vnl780", price = 11000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Tir Volvo vnl 780", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "xc60", price = 16000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Vovlo XC60", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "na1", price = 19000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Honda NSXR", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "ap2", price = 22000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Honda s2000", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "tiburon", price = 10000000, speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Hyundai Tiburon", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "FD", price = 30000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Mazda RX7", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "rx811", price = 32000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Mazda RX8", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "eclipsegt06", price = 8000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Mitsubishi Eclipse", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "cp9a", price = 20000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Mitsubishi EVO6", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "evo9mr", price = 27000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Mitsubishi EVO9", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "mitsugto", price = 29000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Mitsubishi GTO", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "gtr", price = 26000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Nissan GTR", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "silvias15", price = 30000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Nissan Silivia S 15", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
     {numeVehicul = "rmodpagani", price = 81000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Pagani Huayra", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "paganizonda", price = 72000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Pagani Zonda", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    --{numeVehicul = "phantom3", price = 63000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Rolls Royce Phantom", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "bnr32", price = 22000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Nissan R32", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "bnr34", price = 24000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Nissan R34", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "rrst", price = 25000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Range Rover 2019", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "rmodskyline", price = 35000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Nissan Skyline ", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "rmodsupra", price = 41000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Toyota Supra", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "nis13", price = 22000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Nissan Siliva S13", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    --{numeVehicul = "subisti08", price = 14000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "tsgr20", price = 20000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Toyota Supra New ", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
   {numeVehicul = "mr2sw20", price = 22000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Toyota MR 2 ", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "a80", price = 30000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Toyota Supra JZ ", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "celisupra", price = 25000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Toyota Supra Old ", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "golfgti", price = 15000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Volkswagen Golf 5 ", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "R50", price = 16000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Volkswagen Touareg ", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
    {numeVehicul = "zr390", price = 18000000 , speed = 80, acceleration = 70, brakes = 75, hp = 90, numemasina = "Annis ", maxspeed= 320, maxspeedbar = 91, tip = 'Altele'},
},


    [13] = {
    tablename = 'Motoare',                    
    {numeVehicul = "f4rr", price = 8000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Augusta", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},      
    {numeVehicul = "blazer", price = 10000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "ATV", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "bati", price = 12000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Ducatti Bati", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "diablous", price = 6000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Diablous", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "DESMO", price = 90000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Ducatti Desmo", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "double", price = 8000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Ducatti Double", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "hakuchou", price = 10000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Hakuchou", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "HSP217", price = 8500000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Honda CBR400", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "HYABUSADRAG", price = 25000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Hayabusa Drag", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "zx10r", price = 14000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Kawasaki ZX1000R", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "sanchez2", price = 7500000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Sanchez", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "bmw", price = 12000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "BMW Boxers", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "PANIGALE", price = 12000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Panigale", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},     
    {numeVehicul = "yzfr6", price = 6000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Yamaha YZF-R6", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},    
    {numeVehicul = "hcbr17", price = 5000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "CBR Honda 17", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},    
    {numeVehicul = "r25", price = 5350000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Yamaha Zinger", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'}, 
    {numeVehicul = "z1000", price = 440000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Kawasaki Z1000", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'}, 
    {numeVehicul = "chopper", price = 2000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Sons Harley", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "ktmsm", price = 1000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "KTM 450SXF", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "tmsm", price = 1000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Cross", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "cb500x", price = 5000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Honda CBR", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "h2carb", price = 5000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Kawasaki H2", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "r1", price = 5000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Yamaha R1", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "r6", price = 9000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Yamaha R6", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "20r1", price = 7000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Yamaha R1 2020", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "r25", price = 3000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Yamaha Zinger", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
    {numeVehicul = "z1000", price = 5000000, speed = 52, acceleration = 42, brakes = 47, hp = 62, numemasina = "Kawasaki", maxspeed= 210, maxspeedbar = 91, tip = 'Motoare'},
},
}
function find(st)
    st = st:lower()
    for k in pairs(vehicles)do
        for i in pairs(vehicles[k])do
            if (tostring(vehicles[k][i].numeVehicul)):lower() == st then
                --print(vehicles[k][i].numemasina)
                return vehicles[k][i].price , vehicles[k][i].numemasina
            end
        end
    end
    return false, false
end



function getp(st)
    st = st:lower()
    for k in pairs(vehicles)do
        for i in pairs(vehicles[k])do
            if (tostring(vehicles[k][i].numeVehicul)):lower() == st then
                --print(vehicles[k][i].numemasina)
                return vehicles[k][i].price
            end
        end
    end
    return false, false
end
--[[
for k in pairs(vehicles)do
    for i in pairs(vehicles[k])do
        print('["'..vehicles[k][i].numeVehicul..'"] = {"'..vehicles[k][i].numemasina..'",'..vehicles[k][i].price..", ''},")
    end
end
]]



























