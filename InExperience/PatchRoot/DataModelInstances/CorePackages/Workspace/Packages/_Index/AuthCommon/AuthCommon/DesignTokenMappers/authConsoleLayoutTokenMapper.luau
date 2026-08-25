local parent = script:FindFirstAncestor("AuthCommon").Parent
local _ = require(parent.RobloxAppHooks)
local _ = require(parent.Style)

return function(_, p0)
	return {
		robloxLogoTextImageUrl = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png",
		containerWidth = 846,
		containerHeight = 300,
		dividerWidth = 640,
		dividerHeight = 60,
		dividerPadding = 3,
		robloxLogoTextImageSize = UDim2.new(0, 476, 0, 88),
		robloxLogoTextImagePosition = UDim2.new(0.5, 0, 0.28, 0),
		buttonContainerPosition = UDim2.new(0.5, 0, 0.58, 0),
		buttonPadding = p0.Size.Size_150
	}
end