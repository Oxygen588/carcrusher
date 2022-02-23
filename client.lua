local display = false
local trecut = false
local cam1 = nil
local cam = nil
local gameplaycam = nil
incarcrusher = false
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","oxy_remat")
vRPccS = Tunnel.getInterface("oxy_remat","oxy_remat")

local x, y, z = -421.03393554688, -1710.8310546875, 19.439516067504
local x2, y2, z2 = -467.8773803711, -1676.1942138672, 19.052968978882
local x3, y3, z3 = -461.22750854492,-1705.0541992188,18.815143585206

vehiclePrice = 0
vehicleName = ""
vehModel = ""
vtypes = ""
incircle = false
incircle2 = false
crusherBlip = nil
cevaVariabila = false

function crusher_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

function DrawText3D(x,y,z, text, scl, font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function createRematBlip(x, y, z)
	if (crusherBlip == nil) then
		vRP.setNamedBlip({"Crusher", x, y, z, 380, 49, "Crusher"})
		crusherBlip = true
	end
end
local function f(n)
	return (n + 0.00001)
end
local function LocalPed()
	return GetPlayerPed(-1)
end
local function EndFade()
	Citizen.CreateThread(function()
		ShutdownLoadingScreen()

        DoScreenFadeIn(500)

        while IsScreenFadingIn() do
            Citizen.Wait(0)
        end
	end)
end

local function SetupInsideCam()
	local ped = LocalPed()
	local coords = -429.62112426758,-1704.9049072266,28.688987731934
	cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true,2)
	SetCamCoord(cam, -429.62112426758,-1704.9049072266,28.688987731934 + 1.0)
	coords = -429.62112426758,-1704.9049072266,28.688987731934
	PointCamAtCoord(cam, -429.62112426758,-1704.9049072266,28.688987731934)
	--PointCamAtEntity(cam, GetVehiclePedIsUsing(ped), p2, p3, p4, 1)
	SetCamActive(cam, true)
	RenderScriptCams( 1, 0, cam, 0, 0)
end
veh = ""
vehiclePrice = nil
vehicleName = nil
vehModel = nil
function job_DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
Citizen.CreateThread(function()
	
	while true do
		
		tick = 500
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		local ped = GetPlayerPed(-1)

		if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) < 40.0)then
			tick = 0
			DrawText3D(x,y,z+0.3, "~g~Remat", 2.0, 1)
			DrawMarker(36, x, y, z-0.5, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 168, 104, 40, 255, true, 0, 0, true)
			if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) < 7)then
				incircle = true
				if (incircle == true) then
					veh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
					if(GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1))then

						local ok, vtype, name = vRP.getNearestOwnedVehicle({7})
		
						vtypes = vtype
						if ok then
							createRematBlip(x2, y2, z2)
							vehModel = name
							
								
							print(vehiclePrice)
							job_DisplayHelpText("Apasa E pentru a intra cu masina la Remat!")
							if IsControlJustPressed(0, 38)  then
								vRPccS.getVehiclesPrices({name}, function(thePrice, name)
									vehiclePrice = tonumber(thePrice)
									vehicleName = name
								end)
								if vehiclePrice ~= nil and vehicleName ~= nil then
								incarcrusher = true
								Citizen.CreateThread(function()
									--NetworkSetEntityVisibleToNetwork(entity, toggle)

									--SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(veh), false)
									--SetEntityLocallyVisible(veh,true)
									--SetEntityLocallyInvisible(veh,false)
									SetEntityCoordsNoOffset(-423.65194702148,-1685.5889892578,19.029062271118)
									
									gameplaycam = GetRenderingCam()
									SetupInsideCam()
									Citizen.Wait(50)
									
									TaskVehicleDriveToCoord(ped, veh, -433.72171020508,-1703.8232421875,18.986978530884, f(3), f(1), GetEntityModel(veh), 16777216, f(0.1), true)
									while (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true).x, GetEntityCoords(GetPlayerPed(-1), true).y, GetEntityCoords(GetPlayerPed(-1), true).z, -433.72171020508,-1703.8232421875,18.986978530884) < 5.0) == false do Wait(1)  end

									TaskVehicleDriveToCoord(ped, veh, -425.82760620117,-1688.2719726562,19.029088973999, f(3), f(1), GetEntityModel(veh), 16777216, f(0.1), true)
									EndFade()Citizen.Wait(3000)
												Wait(3000)
								local pretoriginal = vehiclePrice*2
								SetDisplay(true, vehModel," "..vehiclePrice,pretoriginal)
								cam1 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -424.10159301758,-1684.8889160156,19.029083251953+1.0, -30.00, 00.00, 150.00, 80.00, 0, 0)
								SetCamActive(cam1, true)
								RenderScriptCams(true, false, 100, true, true)
									
									local c = 0
									while not IsVehicleStopped(veh) do
										Citizen.Wait(0)
										c = c + 1
										if c > 5000 then
											ClearPedTasks(ped)
											break
										end
									end
									Citizen.Wait(100)

									
									--If vehicle is damaged then it will open repair menu
									
								end)
							else
								notify("Aceasta masina nu poate fi data la remat")
							end
								

							end
						end
					end
				end
			elseif(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) > 7)then
				incircle = false
			end
		end
		Citizen.Wait(tick)
	end
end)



RegisterNetEvent('iesic')
AddEventHandler('iesic', function()
	incarcrusher = false
	local ped = GetPlayerPed(-1)
	Wait(1000)
	SetEntityCoords(ped, -406.97512817383,-1706.8889160156,19.013692855835,false, false, false, false)


	SetCamCoord(cam,GetGameplayCamCoords())
	SetCamRot(cam, GetGameplayCamRot(2), 2)
	RenderScriptCams( 1, 1, 0, 0, 0)
	RenderScriptCams( 0, 1, 1000, 0, 0)
	SetCamActive(gameplaycam, true)
	EnableGameplayCam(true)
	SetCamActive(cam, false)
	DestroyCam(cam1, false)
    SetCamActive(cam1, false)
    RenderScriptCams(0, false, 100, false, false)
end)






RegisterNetEvent('iesi')
AddEventHandler('iesi', function()
	incarcrusher = false
	local ped = GetPlayerPed(-1)
	local pos = GetEntityCoords(GetPlayerPed(-1), true)
	veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	
	TaskVehicleDriveToCoord(ped, veh, -431.63537597656,-1703.4189453125,18.192628860474, f(3), f(1), GetEntityModel(veh), 16777216, f(0.1), true)
	while (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true).x, GetEntityCoords(GetPlayerPed(-1), true).y, GetEntityCoords(GetPlayerPed(-1), true).z, -431.63537597656,-1703.4189453125,18.192628860474) < 5.0) == false do Wait(1)  end
	SetCamCoord(cam,GetGameplayCamCoords())
	SetCamRot(cam, GetGameplayCamRot(2), 2)
	RenderScriptCams( 1, 1, 0, 0, 0)
	RenderScriptCams( 0, 1, 1000, 0, 0)
	SetCamActive(gameplaycam, true)
	EnableGameplayCam(true)
	SetCamActive(cam, false)
	DestroyCam(cam1, false)
    SetCamActive(cam1, false)
    RenderScriptCams(0, false, 100, false, false)
	TaskVehicleDriveToCoord(ped, veh, -421.0625,-1712.7121582031,19.459955215454, f(3), f(1), GetEntityModel(veh), 16777216, f(0.1), true)
end)



















RegisterNetEvent("asd")
AddEventHandler("asd", function()


SetVehicleHasBeenOwnedByPlayer(veh,false)
Citizen.InvokeNative(0xAD738C3085FE7E11, veh, false, true) -- set not as mission entity
SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(veh))
Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

end)












--very important cb 
RegisterNUICallback("exit", function(data)
	TriggerEvent("iesi")
    SetDisplay(false)
end)


RegisterNUICallback("vinde", function(data)
	TriggerServerEvent("crushVehicle",vtypes,vehModel,vehiclePrice)
	TriggerEvent("iesic")
    SetDisplay(false)
end)

-- this cb is used as the main route to transfer data back 
-- and also where we hanld the data sent from js
RegisterNUICallback("main", function(data)
    chat(data.text, {0,255,0})
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    chat(data.error, {255,0,0})
    SetDisplay(false)
end)

function SetDisplay(bool, masina1,pret1,prettt)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        masini = masina1,
        pret = pret1,
		pretoriginal = prettt,
		numemasina = vehicleName,
    })

end












function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end
function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end