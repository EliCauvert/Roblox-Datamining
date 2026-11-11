local Players = game:GetService("Players")

return {
	getHumanoidDescription = function(UserId)
		-- upvalues: Players (copy)
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
		local AppliedDescription = Humanoid:GetAppliedDescription()
		
		if not AppliedDescription then
			return config, "ERR_RA_HUMDESC"
		end
		pcall(function()
			-- upvalues: config (copy), AppliedDescription (copy)
			for i, _ in pairs(config) do
				if typeof(AppliedDescription[i]) == "Color3" then
					config[i] = {
						AppliedDescription[i].R,
						AppliedDescription[i].G,
						AppliedDescription[i].B
					}
				else
					config[i] = AppliedDescription[i]
				end
			end
		end)
		return config, "OK"
	end
}