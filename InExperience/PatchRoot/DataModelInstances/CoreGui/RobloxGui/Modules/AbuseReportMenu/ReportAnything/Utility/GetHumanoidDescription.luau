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

local var1 = function(p1)
	local t = {}
	
	for i, v in ipairs(p1) do
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

local var2 = function(p2, p3)
	local t = {}
	
	for i, v in ipairs(p3) do
		local name = p2[v.Name]
		
		if name then
			for i_1 = 1, math.min(8, #name) do
				table.insert(t, name[i_1])
			end
		end
	end
	return t
end

local var3 = function(p4)
	local t = {}
	
	for i, v in p4:GetPlayingAnimationTracks() do
		local match = string.match(v.Animation.AnimationId, "(%d+)$")
		
		if match then
			table.insert(t, match)
		end
		if #t >= 8 then break end
	end
	return t
end

return {
	getHumanoidDescription = function(p5)
		-- upvalues: playersService (ref), getFFlagGetHumanoidDescriptionUpdatesModule (ref), var1 (ref), getHumanoidDescriptionUpdatesV2A (ref), var2 (ref), getFFlagGetHumanoidDescriptionUpdatesV2E (ref), var3 (ref)
		local var4 = playersService:GetPlayerByUserId(p5)
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
		
		if not var4 then
			return t, "ERR_RA_HUMPLAYER"
		end
		local character = var4.Character
		
		if not character then
			return t, "ERR_RA_CHARACTER"
		end
		local humanoid = character:WaitForChild("Humanoid", 1)
		
		if not humanoid then
			return t, "ERR_RA_HUMOBJ"
		end
		local var5
		local _ = nil
		
		if getFFlagGetHumanoidDescriptionUpdatesModule() then
			local _ = nil
			local ok, status = pcall(function()
				-- upvalues: humanoid (ref)
				return humanoid:GetAppliedDescription()
			end)
			var5 = status
			
			if not ok then
				return t, "ERR_RA_HUMOBJ"
			elseif not var5 then
				return t, "ERR_RA_HUMDESC"
			end
			local var6 = 0
			
			if getFFlagGetHumanoidDescriptionUpdatesModule() then
				local var7 = function(p6)
					-- upvalues: var5 (write), t (ref)
					if typeof(var5[p6]) == "Color3" then
						t[p6] = { var5[p6].R, var5[p6].G, var5[p6].B }
						
						return
					end
					t[p6] = var5[p6]
				end
				
				for i, v in pairs(t) do
					if not pcall(var7, i) then
						var6 += 1
					end
				end
				local ok, status = pcall(var5.GetAccessories, var5, false)
				
				if ok then
					local ok_1, status_1 = pcall(var1, status)
					
					if ok_1 then
						t.AccessoryBlob = status_1
					else
						var6 += 1
					end
				else
					var6 += 1
				end
				if getHumanoidDescriptionUpdatesV2A then
					local ok_1, status_1 = pcall(var5.GetEmotes, var5)
					
					if ok_1 then
						t.Emotes = status_1
					else
						var6 += 1
					end
				end
				local ok_1, status_1 = pcall(var5.GetEquippedEmotes, var5)
				local ok_2, status_2 = pcall(var5.GetEmotes, var5)
				
				if ok_1 and ok_2 then
					local ok_3, status_3 = pcall(var2, status_2, status_1)
					
					if ok_3 then
						t.Emotes = status_3
						
						if getFFlagGetHumanoidDescriptionUpdatesV2E() then
							local ok_4, status_4 = pcall(var3, humanoid)
							
							if ok_4 then
								t.CurrentlyPlayingAnimationIds = status_4
							else
								var6 += 1
							end
						end
					end
				else
					var6 += 1
				end
				t.FieldErrorCount = var6
			else
				pcall(function()
					-- upvalues: t (ref), var5 (write)
					for i, v in pairs(t) do
						if typeof(var5[i]) == "Color3" then
							t[i] = { var5[i].R, var5[i].G, var5[i].B }
						else
							t[i] = var5[i]
						end
					end
				end)
			end
			return t, "OK"
		else
			var5 = humanoid:GetAppliedDescription()
		end
	end
}