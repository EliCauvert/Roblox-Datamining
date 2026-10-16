local GetFFlagGetHumanoidDescriptionUpdatesModule = require(script:FindFirstAncestor("AbuseReportMenu").Flags.GetFFlagGetHumanoidDescriptionUpdates)
local GetHumanoidDescriptionUpdatesV2A = game:DefineFastFlag("GetHumanoidDescriptionUpdatesV2A", false)
local GetFFlagGetHumanoidDescriptionUpdatesV2EFunction = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local Players = game:GetService("Players")

local function v3(List) --[[ Line: 67 ]]
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

local function v4(p1, List) --[[ Line: 81 ]]
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

local function v5(p2) --[[ Line: 95 ]]
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

return {
	getHumanoidDescription = function(UserId) --[[ Line: 110 ]]
		-- upvalues: Players (copy), GetFFlagGetHumanoidDescriptionUpdatesModule (copy), v3 (copy), GetHumanoidDescriptionUpdatesV2A (copy), v4 (copy), GetFFlagGetHumanoidDescriptionUpdatesV2EFunction (copy), v5 (copy)
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
		local Result = nil
		
		if GetFFlagGetHumanoidDescriptionUpdatesModule() then
			local Success
			Success, Result = pcall(function() --[[ Line: 171 ]]
				-- upvalues: Humanoid (copy)
				return (Humanoid:GetAppliedDescription())
			end)
			
			if not Success then
				return config, "ERR_RA_HUMOBJ"
			end
		else
			Result = Humanoid:GetAppliedDescription()
		end
		if not Result then
			return config, "ERR_RA_HUMDESC"
		end
		local Count = 0
		
		if GetFFlagGetHumanoidDescriptionUpdatesModule() then
			local function v19(Key) --[[ Line: 188 ]]
				-- upvalues: Result (ref), config (copy)
				if typeof(Result[Key]) == "Color3" then
					config[Key] = { Result[Key].R, Result[Key].G, Result[Key].B }
					
					return
				else
					config[Key] = Result[Key]
				end
			end
			
			for i, _ in pairs(config) do
				if not pcall(v19, i) then
					Count += 1
				end
			end
			local Success1, Result1 = pcall(Result.GetAccessories, Result, false)
			
			if Success1 then
				local Success2, Result2 = pcall(v3, Result1)
				
				if Success2 then
					config.AccessoryBlob = Result2
				else
					Count += 1
				end
			else
				Count += 1
			end
			if GetHumanoidDescriptionUpdatesV2A then
				local Success3, Result3 = pcall(Result.GetEmotes, Result)
				
				if Success3 then
					config.Emotes = Result3
				else
					Count += 1
				end
			end
			local Success4, Result4 = pcall(Result.GetEquippedEmotes, Result)
			local Success5, Result5 = pcall(Result.GetEmotes, Result)
			
			if Success4 and Success5 then
				local Success6, Result6 = pcall(v4, Result5, Result4)
				
				if Success6 then
					config.Emotes = Result6
					
					if GetFFlagGetHumanoidDescriptionUpdatesV2EFunction() then
						local Success7, Result7 = pcall(v5, Humanoid)
						
						if Success7 then
							config.CurrentlyPlayingAnimationIds = Result7
						else
							Count += 1
						end
					end
				end
			else
				Count += 1
			end
			config.FieldErrorCount = Count
		else
			pcall(function() --[[ Line: 255 ]]
				-- upvalues: config (copy), Result (ref)
				for i, _ in pairs(config) do
					if typeof(Result[i]) == "Color3" then
						config[i] = { Result[i].R, Result[i].G, Result[i].B }
					else
						config[i] = Result[i]
					end
				end
			end)
		end
		return config, "OK"
	end
}