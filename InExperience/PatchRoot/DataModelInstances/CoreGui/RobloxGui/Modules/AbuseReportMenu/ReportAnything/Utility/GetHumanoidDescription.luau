local getFFlagGetHumanoidDescriptionUpdatesModule = require(script:FindFirstAncestor("AbuseReportMenu").Flags.GetFFlagGetHumanoidDescriptionUpdates)
local getHumanoidDescriptionUpdatesV2A = game:DefineFastFlag("GetHumanoidDescriptionUpdatesV2A", false)
local getFFlagGetHumanoidDescriptionUpdatesV2E = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local playersService = game:GetService("Players")
local _ = {
	ERR_RA_CHARACTER = "ERR_RA_CHARACTER",
	ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER",
	ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ",
	ERR_RA_HUMDESC = "ERR_RA_HUMDESC",
	OK = "OK"
}

local var3 = function(p0) --[[ line: 67 ]]
	local t = {}
	
	for i, v in ipairs(p0) do
		table.insert(t, {
			AccessoryType = v.AccessoryType.Value,
			AssetId = v.AssetId,
			IsLayered = v.IsLayered,
			Order = v.Order,
			Puffiness = v.Puffiness
		})
	end
	return t
end

local var4 = function(p1, p2) --[[ line: 81 ]]
	local t = {}
	
	for i, v in ipairs(p2) do
		local name = p1[v.Name]
		
		if name then
			for i_1 = 1, math.min(8, #name) do
				table.insert(t, name[i_1])
			end
		end
	end
	return t
end

local var5 = function(p3) --[[ line: 95 ]]
	local t = {}
	
	for i, v in p3:GetPlayingAnimationTracks() do
		local match = string.match(v.Animation.AnimationId, "(%d+)$")
		
		if match then
			table.insert(t, match)
		end
		if #t >= 8 then break end
	end
	return t
end

return {
	getHumanoidDescription = function(p4) --[[ line: 110 ]]
		-- upvalues: playersService (ref), getFFlagGetHumanoidDescriptionUpdatesModule (ref), var3 (ref), getHumanoidDescriptionUpdatesV2A (ref), var4 (ref), getFFlagGetHumanoidDescriptionUpdatesV2E (ref), var5 (ref)
		local var10 = playersService:GetPlayerByUserId(p4)
		local t = {
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
		
		if not var10 then
			return t, "ERR_RA_HUMPLAYER"
		end
		local character = var10.Character
		
		if not character then
			return t, "ERR_RA_CHARACTER"
		end
		local humanoid = character:WaitForChild("Humanoid", 1)
		
		if not humanoid then
			return t, "ERR_RA_HUMOBJ"
		end
		local var13
		local _ = nil
		
		if getFFlagGetHumanoidDescriptionUpdatesModule() then
			local _ = nil
			local ok, status = pcall(function() --[[ line: 171 ]]
				-- upvalues: humanoid (ref)
				return humanoid:GetAppliedDescription()
			end)
			var13 = status
			
			if not ok then
				return t, "ERR_RA_HUMOBJ"
			elseif not var13 then
				return t, "ERR_RA_HUMDESC"
			end
			local var14 = 0
			
			if getFFlagGetHumanoidDescriptionUpdatesModule() then
				local var15 = function(p5) --[[ line: 188 ]]
					-- upvalues: var13 (write), t (ref)
					if typeof(var13[p5]) == "Color3" then
						t[p5] = { var13[p5].R, var13[p5].G, var13[p5].B }
						
						return
					end
					t[p5] = var13[p5]
				end
				
				for i, v in pairs(t) do
					if not pcall(var15, i) then
						var14 += 1
					end
				end
				local ok, status = pcall(var13.GetAccessories, var13, false)
				
				if ok then
					local ok_1, status_1 = pcall(var3, status)
					
					if ok_1 then
						t.AccessoryBlob = status_1
					else
						var14 += 1
					end
				else
					var14 += 1
				end
				if getHumanoidDescriptionUpdatesV2A then
					local ok_1, status_1 = pcall(var13.GetEmotes, var13)
					
					if ok_1 then
						t.Emotes = status_1
					else
						var14 += 1
					end
				end
				local ok_1, status_1 = pcall(var13.GetEquippedEmotes, var13)
				local ok_2, status_2 = pcall(var13.GetEmotes, var13)
				
				if ok_1 and ok_2 then
					local ok_3, status_3 = pcall(var4, status_2, status_1)
					
					if ok_3 then
						t.Emotes = status_3
						
						if getFFlagGetHumanoidDescriptionUpdatesV2E() then
							local ok_4, status_4 = pcall(var5, humanoid)
							
							if ok_4 then
								t.CurrentlyPlayingAnimationIds = status_4
							else
								var14 += 1
							end
						end
					end
				else
					var14 += 1
				end
				t.FieldErrorCount = var14
			else
				pcall(function() --[[ line: 255 ]]
					-- upvalues: t (ref), var13 (write)
					for i, v in pairs(t) do
						if typeof(var13[i]) == "Color3" then
							t[i] = { var13[i].R, var13[i].G, var13[i].B }
						else
							t[i] = var13[i]
						end
					end
				end)
			end
			return t, "OK"
		else
			var13 = humanoid:GetAppliedDescription()
		end
	end
}