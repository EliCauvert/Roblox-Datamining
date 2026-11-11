local Players = game:GetService("Players")
local GetHumanoidDescriptionUpdatesV2B = game:DefineFastFlag("GetHumanoidDescriptionUpdatesV2B", false)
local GetFFlagGetHumanoidDescriptionUpdatesV2EFunction = require(script:FindFirstAncestor("GetHumanoidDescription").Parent.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E

local function v2(List)
	local List1 = {}
	
	for _, value in ipairs(List) do
		table.insert(List1, {
			AccessoryType = value.AccessoryType.Value,
			AssetId = value.AssetId,
			IsLayered = value.IsLayered,
			Order = value.Order,
			Puffiness = value.Puffiness
		})
	end
	return List1
end

local function v3(p1, List)
	local List1 = {}
	
	for _, value in ipairs(List) do
		local v1 = p1[value.Name]
		
		if v1 then
			for i = 1, math.min(8, #v1) do
				table.insert(List1, v1[i])
			end
		end
	end
	return List1
end

local function v4(p2)
	local List = {}
	
	for _, playingAnimationTrack in p2:GetPlayingAnimationTracks() do
		local Match: string? = string.match(playingAnimationTrack.Animation.AnimationId, "(%d+)$")
		
		if Match then
			table.insert(List, Match)
		end
		if #List >= 8 then break end
	end
	return List
end

return function(UserId)
	-- upvalues: Players (copy), v2 (copy), GetHumanoidDescriptionUpdatesV2B (copy), v3 (copy), GetFFlagGetHumanoidDescriptionUpdatesV2EFunction (copy), v4 (copy)
	local Player = Players:GetPlayerByUserId(UserId)
	local config = {
		BackAccessory = "",
		BodyTypeScale = 0,
		ClimbAnimation = 0,
		DepthScale = 0,
		Face = 0,
		FaceAccessory = "",
		FallAnimation = 0,
		FrontAccessory = "",
		GraphicTShirt = 0,
		HairAccessory = "",
		HatAccessory = "",
		Head = 0,
		HeadColor = { 0, 0, 0 },
		HeadScale = 0,
		HeightScale = 0,
		IdleAnimation = 0,
		JumpAnimation = 0,
		LeftArm = 0,
		LeftArmColor = { 0, 0, 0 },
		LeftLeg = 0,
		LeftLegColor = { 0, 0, 0 },
		MoodAnimation = 0,
		NeckAccessory = "",
		Pants = 0,
		ProportionScale = 0,
		RightArm = 0,
		RightArmColor = { 0, 0, 0 },
		RightLeg = 0,
		RightLegColor = { 0, 0, 0 },
		RunAnimation = 0,
		Shirt = 0,
		ShouldersAccessory = "",
		SwimAnimation = 0,
		Torso = 0,
		TorsoColor = { 0, 0, 0 },
		WaistAccessory = "",
		WalkAnimation = 0,
		WidthScale = 0
	}
	
	if not Player then
		return config, "ERR_RA_HUMPLAYER"
	end
	local Character = Player.Character
	
	if not Character then
		return config, "ERR_RA_CHARACTER"
	end
	local Humanoid = Character:WaitForChild("Humanoid", 1)
	
	if not Humanoid then
		return config, "ERR_RA_HUMOBJ"
	end
	local Result1 = nil
	local Success1
	Success1, Result1 = pcall(function()
		-- upvalues: Humanoid (copy)
		return (Humanoid:GetAppliedDescription())
	end)
	
	if not Success1 then
		return config, "ERR_RA_HUMOBJ"
	end
	if not Result1 then
		return config, "ERR_RA_HUMDESC"
	end
	local Count = 0
	
	local function v20(Key)
		-- upvalues: Result1 (ref), config (copy)
		if typeof(Result1[Key]) == "Color3" then
			config[Key] = { Result1[Key].R, Result1[Key].G, Result1[Key].B }
			
			return
		else
			config[Key] = Result1[Key]
		end
	end
	
	for i, _ in pairs(config) do
		if not pcall(v20, i) then
			Count += 1
		end
	end
	local Success2, Result2 = pcall(Result1.GetAccessories, Result1, false)
	
	if Success2 then
		local Success3, Result3 = pcall(v2, Result2)
		
		if Success3 then
			config.AccessoryBlob = Result3
		else
			Count += 1
		end
	else
		Count += 1
	end
	if GetHumanoidDescriptionUpdatesV2B then
		local Success5, Result5 = pcall(Result1.GetEmotes, Result1)
		
		if Success5 then
			config.Emotes = Result5
		else
			Count += 1
		end
	end
	local Success6, Result6 = pcall(Result1.GetEquippedEmotes, Result1)
	local Success7, Result7 = pcall(Result1.GetEmotes, Result1)
	
	if Success6 and Success7 then
		local Success, Result = pcall(v3, Result7, Result6)
		
		if Success then
			config.Emotes = Result
			
			if GetFFlagGetHumanoidDescriptionUpdatesV2EFunction() then
				local Success4, Result4 = pcall(v4, Humanoid)
				
				if Success4 then
					config.CurrentlyPlayingAnimationIds = Result4
				else
					Count += 1
				end
			end
		end
	else
		Count += 1
	end
	config.FieldErrorCount = Count
	return config, "OK"
end