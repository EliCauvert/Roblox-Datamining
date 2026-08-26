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

return function(p5)
	-- upvalues: playersService (ref), var1 (ref), getHumanoidDescriptionUpdatesV2B (ref), var2 (ref), getFFlagGetHumanoidDescriptionUpdatesV2E (ref), var3 (ref)
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
	local _ = nil
	local _ = nil
	local ok, status = pcall(function()
		-- upvalues: humanoid (ref)
		return humanoid:GetAppliedDescription()
	end)
	local var5 = status
	
	if not ok then
		return t, "ERR_RA_HUMOBJ"
	elseif not var5 then
		return t, "ERR_RA_HUMDESC"
	end
	local var6 = 0
	
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
	local ok_1, status_1 = pcall(var5.GetAccessories, var5, false)
	
	if ok_1 then
		local ok_2, status_2 = pcall(var1, status_1)
		
		if ok_2 then
			t.AccessoryBlob = status_2
		else
			var6 += 1
		end
	else
		var6 += 1
	end
	if getHumanoidDescriptionUpdatesV2B then
		local ok_2, status_2 = pcall(var5.GetEmotes, var5)
		
		if ok_2 then
			t.Emotes = status_2
		else
			var6 += 1
		end
	end
	local ok_2, status_2 = pcall(var5.GetEquippedEmotes, var5)
	local ok_3, status_3 = pcall(var5.GetEmotes, var5)
	
	if ok_2 and ok_3 then
		local ok_4, status_4 = pcall(var2, status_3, status_2)
		
		if ok_4 then
			t.Emotes = status_4
			
			if getFFlagGetHumanoidDescriptionUpdatesV2E() then
				local ok_5, status_5 = pcall(var3, humanoid)
				
				if ok_5 then
					t.CurrentlyPlayingAnimationIds = status_5
				else
					var6 += 1
				end
			end
		end
	else
		var6 += 1
	end
	t.FieldErrorCount = var6
	return t, "OK"
end