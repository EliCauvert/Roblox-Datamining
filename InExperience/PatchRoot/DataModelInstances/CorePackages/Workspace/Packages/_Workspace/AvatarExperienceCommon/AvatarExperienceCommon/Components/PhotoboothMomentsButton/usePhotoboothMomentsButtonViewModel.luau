local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useNavigation = require(parent.Navigation).useNavigation
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local fFlagAXPhotoboothMomentsPage = require(parent.AvatarExperienceFlags).FFlagAXPhotoboothMomentsPage
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local _ = require(script.Parent.PhotoboothMomentsButtonView)

return function(p1)
	-- upvalues: foundationModule (ref), fFlagAXPhotoboothMomentsPage (ref), useNavigation (ref), reactModule (ref), avatarScreen (ref), iconName (ref), iconSize (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = if fFlagAXPhotoboothMomentsPage then useNavigation() else nil
	
	return {
		size = UDim2.fromOffset(var1.Size.Size_1100, var1.Size.Size_1100),
		backgroundStyle = var1.Color.Surface.Surface_100,
		iconName = iconName.FrameVideoCamera,
		iconSize = iconSize.Medium,
		iconStyle = var1.Color.Content.Emphasis,
		onActivated = reactModule.useCallback(function()
			-- upvalues: fFlagAXPhotoboothMomentsPage (copy), var2 (ref), avatarScreen (copy)
			if fFlagAXPhotoboothMomentsPage then
				var2.navigate(avatarScreen.PhotoboothMomentsPage)
			end
		end, { if fFlagAXPhotoboothMomentsPage then var2 else nil }),
		LayoutOrder = p1.LayoutOrder
	}
end