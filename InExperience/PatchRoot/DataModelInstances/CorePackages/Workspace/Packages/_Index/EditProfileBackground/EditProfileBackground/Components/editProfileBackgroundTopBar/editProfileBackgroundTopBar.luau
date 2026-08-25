local parent = script:FindFirstAncestor("EditProfileBackground").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local headerBar = require(parent.UIBlox).App.Bar.HeaderBar
local makeBackButton = require(parent.AppHeaderBar).makeBackButton
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local view = foundationModule.View

return function(value)
	-- upvalues: useLastInputMode (ref), useLocalization (ref), makeBackButton (ref), reactModule (ref), view (ref), headerBar (ref)
	return reactModule.createElement(view, {
		tag = "size-full-1200",
		ZIndex = 2,
		LayoutOrder = value.layoutOrder
	}, {
		headerBar = reactModule.createElement(headerBar, {
			isSecondary = true,
			backgroundTransparency = 1,
			barHeight = 48,
			title = useLocalization({ EditBackground = "Feature.Profile.Label.EditBackground" }).EditBackground,
			renderLeft = if not (useLastInputMode() == "Focus") then makeBackButton(value.onClose) else nil
		})
	})
end