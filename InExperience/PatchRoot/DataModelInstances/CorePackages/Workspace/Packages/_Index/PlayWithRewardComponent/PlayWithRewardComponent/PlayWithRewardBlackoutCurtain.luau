local coreGuiService = game:GetService("CoreGui")
local t = {}
local var1 = nil

function t.show()
	-- upvalues: var1 (write), coreGuiService (ref)
	if var1 and var1.Parent then
		return
	end
	local playWithRewardBlackoutCurtain = Instance.new("ScreenGui")
	playWithRewardBlackoutCurtain.Name = "PlayWithRewardBlackoutCurtain"
	playWithRewardBlackoutCurtain.DisplayOrder = 99
	playWithRewardBlackoutCurtain.IgnoreGuiInset = true
	local blackoutCurtainFrame = Instance.new("Frame")
	blackoutCurtainFrame.Name = "BlackoutCurtainFrame"
	blackoutCurtainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	blackoutCurtainFrame.BackgroundTransparency = 0
	blackoutCurtainFrame.Size = UDim2.fromScale(1, 1)
	blackoutCurtainFrame.Active = true
	blackoutCurtainFrame.Parent = playWithRewardBlackoutCurtain
	playWithRewardBlackoutCurtain.Parent = coreGuiService
	var1 = playWithRewardBlackoutCurtain
end

function t.hide()
	-- upvalues: var1 (write)
	if var1 then
		var1:Destroy()
		var1 = nil
	end
end

return t