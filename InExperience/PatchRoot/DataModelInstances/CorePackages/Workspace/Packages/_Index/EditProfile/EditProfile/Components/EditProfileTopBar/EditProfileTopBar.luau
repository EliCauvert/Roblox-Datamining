local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local headerBar = require(parent.UIBlox).App.Bar.HeaderBar
local textKeysModule = require(editProfile.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local makeBackButton = require(parent.AppHeaderBar).makeBackButton
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)

return function(p0) --[[ line: 22 | named "EditProfileTopBar" ]]
	-- upvalues: fFlagEditProfileFixFocusNavigationModule (ref), useLastInputMode (ref), useLocalization (ref), textKeysModule (ref), makeBackButton (ref), reactModule (ref), headerBar (ref)
	local isFocus
	if fFlagEditProfileFixFocusNavigationModule then
		isFocus = useLastInputMode() == "Focus"
		isFocus = nil
	else
		isFocus = nil
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 48),
		LayoutOrder = p0.layoutOrder
	}, {
		headerBar = reactModule.createElement(headerBar, {
			isSecondary = true,
			backgroundTransparency = 1,
			barHeight = 48,
			title = useLocalization({ title = textKeysModule.Title }).title,
			renderLeft = if fFlagEditProfileFixFocusNavigationModule and not isFocus or not fFlagEditProfileFixFocusNavigationModule then makeBackButton(p0.onClose) else nil
		})
	})
end