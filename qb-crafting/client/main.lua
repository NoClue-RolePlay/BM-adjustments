QBCore = nil
local itemInfos = {}

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(200)
	end
	ItemsToItemInfo()
end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local maxDistance = 1.25

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
		local craftObject = GetClosestObjectOfType(pos, 2.0, 306579620, false, false, false)
		if craftObject ~= 0 then
			local objectPos = GetEntityCoords(craftObject)
			if #(pos - objectPos) < 2.0 then
				awayFromObject = false
				DrawText3D(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~E~w~ - Craft")
				if IsControlJustReleased(0, 38) then
					local crafting = {}
					crafting.label = "Crafting"
					crafting.items = GetThresholdItems()
					TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99), crafting)
				end
			end
		end

		if awayFromObject then
			Citizen.Wait(1000)
		end
	end
end)
--change item hash
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
		local craftObject = GetClosestObjectOfType(pos, 2.0, 1824078756, false, false, false)
		if craftObject ~= 0 then
			local objectPos = GetEntityCoords(craftObject)
			if #(pos - objectPos) < 2.0 then
				awayFromObject = false
				DrawText3D(objectPos.x - 0.6, objectPos.y + 1.0, objectPos.z + 1.0, "~g~E~w~ - Craft")
				if IsControlJustReleased(0, 38) then
					local crafting = {}
					crafting.label = "Crafting"
					crafting.items = GetThresholdItems()
					TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99), crafting)
				end
			end
		end

		if awayFromObject then
			Citizen.Wait(1000)
		end
	end
end)
--change item hash
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
		local craftObject = GetClosestObjectOfType(pos, 2.0, 904554844, false, false, false)
		if craftObject ~= 0 then
			local objectPos = GetEntityCoords(craftObject)
			if #(pos - objectPos) < 1.5 then
				awayFromObject = false
				DrawText3D(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~E~w~ - Craft")
				if IsControlJustReleased(0, 38) then
					local crafting = {}
					crafting.label = "Crafting"
					crafting.items = GetThresholdItems()
					TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99), crafting)
				end
			end
		end

		if awayFromObject then
			Citizen.Wait(1000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(PlayerPedId())
		local inRange = false
		local distance = #(pos - vector3(Config.AttachmentCrafting["location"].x, Config.AttachmentCrafting["location"].y, Config.AttachmentCrafting["location"].z))

		if distance < 10 then
			inRange = true
			if distance < 1.5 then
				DrawText3D(Config.AttachmentCrafting["location"].x, Config.AttachmentCrafting["location"].y, Config.AttachmentCrafting["location"].z, "~g~E~w~ - Craft")
				if IsControlJustPressed(0, 38) then
					local crafting = {}
					crafting.label = "Attachment Crafting"
					crafting.items = GetAttachmentThresholdItems()
					TriggerServerEvent("inventory:server:OpenInventory", "attachment_crafting", math.random(1, 99), crafting)
				end
			end
		end

		if not inRange then
			Citizen.Wait(1000)
		end

		Citizen.Wait(3)
	end
end)

function GetThresholdItems()
	local items = {}
	for k, item in pairs(Config.CraftingItems) do
		if QBCore.Functions.GetPlayerData().metadata["craftingrep"] >= Config.CraftingItems[k].threshold then
			items[k] = Config.CraftingItems[k]
		end
	end
	return items
end

function SetupAttachmentItemsInfo()
	itemInfos = {
		[1] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["rubber"]["label"] .. ": 5x."},
		[2] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[3] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[4] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[5] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[6] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[7] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[8] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[9] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[10] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[11] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[12] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[13] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[14] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[15] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[16] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[17] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 5x."},
		[18] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 40x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 40x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 40x."},
		[19] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 35x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 35x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 35x."},
		[20] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 30x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 30x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 30x."},
		[21] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 35x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 35x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 35x."},
		[22] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 45x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 45x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 45x."},
		[23] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 30x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 30x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 30x."},
		[24] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 35x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 35x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 35x."},
		[25] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 45x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 45x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 45x."},
		[26] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 30x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 30x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 30x."},
		[27] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 35x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 35x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 35x."},
		[28] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 50x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 50x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 50x."},
		[29] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 50x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 50x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 50x."},
		[30] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 45x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 45x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 45x."},
		[31] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 50x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 50x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 50x."},
		[32] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 50x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 50x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 50x."},
		[33] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 50x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 50x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 50x."},
		[34] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 45x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 45x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 45x."},
		[35] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 50x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 50x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 50x."},
		[36] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 75x."},
		[37] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 75x."},
		[38] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 75x."},
		[39] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 75x."},
		[40] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 75x."},
		[41] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 75x."},
		[42] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 75x."},
		[43] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 75x."},
		[44] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 75x."},
		[45] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 75x."},
		[46] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 75x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 75x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 75x."},
		[47] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[48] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[49] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[50] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[51] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[52] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[53] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[54] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[55] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 125x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 125x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 125x."},
		[56] = {costs = QBCore.Shared.Items["glass"]["label"] .. ": 10x, " ..QBCore.Shared.Items["teflon"]["label"] .. ": 10x, " ..QBCore.Shared.Items["lighter"]["label"] ..": 1x."},
		[57] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 3x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 3x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 3x."},
		[58] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 8x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 8x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 8x."},
		[59] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 5x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 5x."},
		[60] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 10x."},
		[61] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 12x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 12x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 12x."},
		[62] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 15x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 15x, " ..QBCore.Shared.Items["rubber"]["label"] ..": 15x."},
		[63] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 20x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 20x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 20x."},
		[64] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[65] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 10x."},
		[66] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[67] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 10x."},
		[68] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[69] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 25x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 25x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 25x."},
		[70] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 20x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 20x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 20x."},
		[71] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 25x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 25x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 25x."},
		[72] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 15x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 15x, " ..QBCore.Shared.Items["rubber"]["label"] ..": 15x."},
		[73] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[74] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[75] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[76] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 15x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 15x, " ..QBCore.Shared.Items["rubber"]["label"] ..": 15x."},
		[77] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[78] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[79] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[80] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 30x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 30x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 30x."},
		[81] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 15x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 15x, " ..QBCore.Shared.Items["rubber"]["label"] ..": 15x."},
		[82] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 25x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 25x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 25x."},
		[83] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[84] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 20x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 20x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 20x."},
		[85] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[86] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[87] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 15x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 15x, " ..QBCore.Shared.Items["rubber"]["label"] ..": 15x."},
		[88] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[89] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 20x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 20x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 20x."},
		[90] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[91] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 15x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 15x, " ..QBCore.Shared.Items["rubber"]["label"] ..": 15x."},
		[92] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 10x."},
		[93] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 15x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 15x, " ..QBCore.Shared.Items["rubber"]["label"] ..": 15x."},
		[94] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 25x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 25x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 25x."},
		[95] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[96] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 20x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 20x, " ..QBCore.Shared.Items["aluminum"]["label"] ..": 20x."},
		[97] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[98] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 15x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 15x, " ..QBCore.Shared.Items["rubber"]["label"] ..": 15x."},
		[99] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[100] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
		[101] = {costs = QBCore.Shared.Items["steel"]["label"] .. ": 10x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 10x, " ..QBCore.Shared.Items["wires"]["label"] ..": 10x."},
	}

	local items = {}
	for k, item in pairs(Config.AttachmentCrafting["items"]) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = itemInfos[item.slot],
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.AttachmentCrafting["items"] = items
end

function GetAttachmentThresholdItems()
	SetupAttachmentItemsInfo()
	local items = {}
	for k, item in pairs(Config.AttachmentCrafting["items"]) do
		if QBCore.Functions.GetPlayerData().metadata["attachmentcraftingrep"] >= Config.AttachmentCrafting["items"][k].threshold then
			items[k] = Config.AttachmentCrafting["items"][k]
		end
	end
	return items
end

function ItemsToItemInfo()
	itemInfos = {
		[1] = {costs = QBCore.Shared.Items["plastic"]["label"] .. ": 200x, " ..QBCore.Shared.Items["glass"]["label"] .. ": 200x, "..QBCore.Shared.Items["electronickit"]["label"] .. ": 1x ,"..QBCore.Shared.Items["wires"]["label"] .. ":20x."},
		[2] = {costs = QBCore.Shared.Items["aluminumoxide"]["label"] .. ": 100x, " ..QBCore.Shared.Items["ironoxide"]["label"] .. ": 100x, "..QBCore.Shared.Items["ceramicbowl"]["label"] .. ":1x."},
		[3] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 200x, " ..QBCore.Shared.Items["iron"]["label"] .. ": 200x, "..QBCore.Shared.Items["electronickit"]["label"] .. ": 1x, "..QBCore.Shared.Items["ducttape"]["label"] .. ":10x."},
		[4] = {costs = QBCore.Shared.Items["teflon"]["label"] .. ": 250x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 200x, "..QBCore.Shared.Items["sewingkit"]["label"] .. ": 1x."},
	}

	local items = {}
	for k, item in pairs(Config.CraftingItems) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = itemInfos[item.slot],
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.CraftingItems = items
end