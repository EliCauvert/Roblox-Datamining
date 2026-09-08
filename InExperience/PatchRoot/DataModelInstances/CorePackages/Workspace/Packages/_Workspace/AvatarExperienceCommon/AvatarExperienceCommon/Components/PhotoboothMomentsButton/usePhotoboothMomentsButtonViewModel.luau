local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local _ = require(script.Parent.PhotoboothMomentsButtonView)

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), iconName (ref), iconSize (ref)
	local var1 = foundationModule.Hooks.useTokens()
	
	return {
		size = UDim2.fromOffset(var1.Size.Size_1100, var1.Size.Size_1100),
		backgroundStyle = var1.Color.Surface.Surface_100,
		iconName = iconName.FrameVideoCamera,
		iconSize = iconSize.Medium,
		iconStyle = var1.Color.Content.Emphasis,
		onActivated = reactModule.useCallback(function() end, {}),
		LayoutOrder = p1.LayoutOrder
	}
end