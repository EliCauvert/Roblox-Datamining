local _ = require(script:FindFirstAncestor("AvatarWorkshop").Stores.AvatarStateTypes)

local function getLayeredClothingKey(Humanoid: Humanoid): string
	local List = {}
	
	for _, accessory in Humanoid:GetAccessories(false) do
		table.insert(List, `{accessory.AssetId}:{accessory.Order or 0}:{accessory.Puffiness or 1}`)
	end
	for _, MakeupDescription in Humanoid:GetChildren() do
		if MakeupDescription:IsA("MakeupDescription") then
			table.insert(List, `makeup:{MakeupDescription.MakeupType.Name}:{MakeupDescription.AssetId}:{MakeupDescription.Order}`)
		end
	end
	table.sort(List)
	
	return table.concat(List, ",")
end

local function _(Character): string
	return `{Character.Head},{Character.Torso},{Character.LeftArm},{Character.RightArm},{Character.LeftLeg},{Character.RightLeg},` .. `{Character.BodyTypeScale},{Character.DepthScale},{Character.HeadScale},{Character.HeightScale},{Character.ProportionScale},{Character.WidthScale}`
end

return {
	needsClusterComposition = function(p1, Character): boolean
		-- upvalues: getLayeredClothingKey (copy)
		if p1.rigType == Enum.HumanoidRigType.R15 then
			local HumanoidDescription = p1.humanoidDescription
			local LayeredClothingKey = getLayeredClothingKey(HumanoidDescription)
			
			return LayeredClothingKey ~= "" and (Character == nil or (getLayeredClothingKey(Character) ~= LayeredClothingKey or `{Character.Head},{Character.Torso},{Character.LeftArm},{Character.RightArm},{Character.LeftLeg},{Character.RightLeg},` .. `{Character.BodyTypeScale},{Character.DepthScale},{Character.HeadScale},{Character.HeightScale},{Character.ProportionScale},{Character.WidthScale}` ~= `{HumanoidDescription.Head},{HumanoidDescription.Torso},{HumanoidDescription.LeftArm},{HumanoidDescription.RightArm},{HumanoidDescription.LeftLeg},{HumanoidDescription.RightLeg},` .. `{HumanoidDescription.BodyTypeScale},{HumanoidDescription.DepthScale},{HumanoidDescription.HeadScale},{HumanoidDescription.HeightScale},{HumanoidDescription.ProportionScale},{HumanoidDescription.WidthScale}`))
		else
			return false
		end
	end,
	disableChromeWindowDrag = function(p1)
		local ScreenGui = p1:FindFirstAncestorOfClass("ScreenGui")
		local InputWrapper = ScreenGui and ScreenGui:FindFirstChild("InputWrapper", true)
		
		if InputWrapper and InputWrapper:IsA("Frame") and InputWrapper.Interactable then
			InputWrapper.Interactable = false
			
			return InputWrapper
		else
			return nil
		end
	end,
	playIdleAnimation = function(Object)
		local Humanoid = Object:FindFirstChildOfClass("Humanoid")
		local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
		
		if not Animator then
			return nil
		end
		for _, playingAnimationTrack in Animator:GetPlayingAnimationTracks() do
			playingAnimationTrack:Stop(0)
			
			if playingAnimationTrack.Name == "AvatarPreviewIdle" then
				playingAnimationTrack:Destroy()
			end
		end
		local Animate = Object:FindFirstChild("Animate")
		local Idle = Animate and Animate:FindFirstChild("idle")
		local Animation = Idle and Idle:FindFirstChildOfClass("Animation")
		
		if Animation then
			local AvatarPreviewIdle = Animator:LoadAnimation(Animation)
			AvatarPreviewIdle.Name = "AvatarPreviewIdle"
			AvatarPreviewIdle.Looped = true
			AvatarPreviewIdle:Play()
			
			return AvatarPreviewIdle
		else
			return nil
		end
	end
}