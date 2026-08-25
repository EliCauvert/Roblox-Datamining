local playersService = game:GetService("Players")
local getHumanoidDescriptionUpdatesV2B = game:DefineFastFlag("GetHumanoidDescriptionUpdatesV2B", false)
local getFFlagGetHumanoidDescriptionUpdatesV2E = require(script:FindFirstAncestor("GetHumanoidDescription").Parent.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local _ = {
	ERR_RA_CHARACTER = "ERR_RA_CHARACTER",
	ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER",
	ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ",
	ERR_RA_HUMDESC = "ERR_RA_HUMDESC",
	OK = "OK"
}

local var2 = function(p0)
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

local var3 = function(p1, p2)
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

local var4 = function(p3)
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

return function(p4)
	-- upvalues: playersService (ref), var2 (ref), getHumanoidDescriptionUpdatesV2B (ref), var3 (ref), getFFlagGetHumanoidDescriptionUpdatesV2E (ref), var4 (ref)
	local var9 = playersService:GetPlayerByUserId(p4)
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
	
	if not var9 then
		return t, "ERR_RA_HUMPLAYER"
	end
	local character = var9.Character
	
	if not character then
		return t, "ERR_RA_CHARACTER"
	end
	local humanoid = character:WaitForChild("Humanoid", 1)
	
	if not humanoid then
		return t, "ERR_RA_HUMOBJ"
	end
	local _ = nil
	local _ = nil
	local ok, status = pcall(function()
		-- upvalues: humanoid (ref)
		return humanoid:GetAppliedDescription()
	end)
	local var12 = status
	
	if not ok then
		return t, "ERR_RA_HUMOBJ"
	elseif not var12 then
		return t, "ERR_RA_HUMDESC"
	end
	local var13 = 0
	
	local var14 = function(p5)
		-- upvalues: var12 (write), t (ref)
		if typeof(var12[p5]) == "Color3" then
			t[p5] = { var12[p5].R, var12[p5].G, var12[p5].B }
			
			return
		end
		t[p5] = var12[p5]
	end
	
	for i, v in pairs(t) do
		if not pcall(var14, i) then
			var13 += 1
		end
	end
	local ok_1, status_1 = pcall(var12.GetAccessories, var12, false)
	
	if ok_1 then
		local ok_2, status_2 = pcall(var2, status_1)
		
		if ok_2 then
			t.AccessoryBlob = status_2
		else
			var13 += 1
		end
	else
		var13 += 1
	end
	if getHumanoidDescriptionUpdatesV2B then
		local ok_2, status_2 = pcall(var12.GetEmotes, var12)
		
		if ok_2 then
			t.Emotes = status_2
		else
			var13 += 1
		end
	end
	local ok_2, status_2 = pcall(var12.GetEquippedEmotes, var12)
	local ok_3, status_3 = pcall(var12.GetEmotes, var12)
	
	if ok_2 and ok_3 then
		local ok_4, status_4 = pcall(var3, status_3, status_2)
		
		if ok_4 then
			t.Emotes = status_4
			
			if getFFlagGetHumanoidDescriptionUpdatesV2E() then
				local ok_5, status_5 = pcall(var4, humanoid)
				
				if ok_5 then
					t.CurrentlyPlayingAnimationIds = status_5
				else
					var13 += 1
				end
			end
		end
	else
		var13 += 1
	end
	t.FieldErrorCount = var13
	return t, "OK"
end