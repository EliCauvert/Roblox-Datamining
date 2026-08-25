local playersService = game:GetService("Players")
local _ = {
	ERR_RA_CHARACTER = "ERR_RA_CHARACTER",
	ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER",
	ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ",
	ERR_RA_HUMDESC = "ERR_RA_HUMDESC",
	OK = "OK"
}

return {
	getHumanoidDescription = function(p0)
		-- upvalues: playersService (ref)
		local var1 = playersService:GetPlayerByUserId(p0)
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
		
		if not var1 then
			return t, "ERR_RA_HUMPLAYER"
		end
		local character = var1.Character
		
		if not character then
			return t, "ERR_RA_CHARACTER"
		end
		local humanoid = character:WaitForChild("Humanoid", 1)
		
		if not humanoid then
			return t, "ERR_RA_HUMOBJ"
		end
		local appliedDescription = humanoid:GetAppliedDescription()
		
		if not appliedDescription then
			return t, "ERR_RA_HUMDESC"
		end
		pcall(function()
			-- upvalues: t (ref), appliedDescription (ref)
			for i, v in pairs(t) do
				if typeof(appliedDescription[i]) == "Color3" then
					t[i] = {
						appliedDescription[i].R,
						appliedDescription[i].G,
						appliedDescription[i].B
					}
				else
					t[i] = appliedDescription[i]
				end
			end
		end)
		return t, "OK"
	end
}