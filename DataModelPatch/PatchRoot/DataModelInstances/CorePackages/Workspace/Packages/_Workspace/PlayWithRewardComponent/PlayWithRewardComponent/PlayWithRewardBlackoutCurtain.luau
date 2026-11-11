local CoreGui = game:GetService("CoreGui")
local Object = nil

return {
	show = function()
		-- upvalues: Object (ref), CoreGui (copy)
		if not Object or not Object.Parent then
			local PlayWithRewardBlackoutCurtain = Instance.new("ScreenGui")
			PlayWithRewardBlackoutCurtain.Name = "PlayWithRewardBlackoutCurtain"
			PlayWithRewardBlackoutCurtain.DisplayOrder = 99
			PlayWithRewardBlackoutCurtain.IgnoreGuiInset = true
			local BlackoutCurtainFrame = Instance.new("Frame")
			BlackoutCurtainFrame.Name = "BlackoutCurtainFrame"
			BlackoutCurtainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			BlackoutCurtainFrame.BackgroundTransparency = 0
			BlackoutCurtainFrame.Size = UDim2.fromScale(1, 1)
			BlackoutCurtainFrame.Active = true
			BlackoutCurtainFrame.Parent = PlayWithRewardBlackoutCurtain
			PlayWithRewardBlackoutCurtain.Parent = CoreGui
			Object = PlayWithRewardBlackoutCurtain
			
			return
		end
	end,
	hide = function()
		-- upvalues: Object (ref)
		if Object then
			Object:Destroy()
			Object = nil
		end
	end
}