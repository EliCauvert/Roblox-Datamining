local coreGuiService = game:GetService("CoreGui")
local t = {}
local var2 = nil

function t.show()
	-- upvalues: var2 (write), coreGuiService (ref)
	if var2 and var2.Parent then
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
	var2 = playWithRewardBlackoutCurtain
end

function t.hide()
	-- upvalues: var2 (write)
	if var2 then
		var2:Destroy()
		var2 = nil
	end
end

return t