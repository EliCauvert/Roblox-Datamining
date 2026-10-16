local Parent = script:FindFirstAncestor("EditProfileBackground").Parent
local ReactModule = require(Parent.React)
local HeaderBar = require(Parent.UIBlox).App.Bar.HeaderBar
local MakeBackButtonFunction = require(Parent.AppHeaderBar).makeBackButton
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local View = require(Parent.Foundation).View

return function(p1) --[[ Line: 22 | Named "EditProfileBackgroundTopBar" ]]
	-- upvalues: UseLastInputModeFunction (copy), UseLocalizationFunction (copy), MakeBackButtonFunction (copy), ReactModule (copy), View (copy), HeaderBar (copy)
	local IsFocus = UseLastInputModeFunction() == "Focus"
	local UseLocalizationResult = UseLocalizationFunction({ EditBackground = "Feature.Profile.Label.EditBackground" })
	local BackButton = MakeBackButtonFunction(p1.onClose)
	
	return ReactModule.createElement(View, {
		tag = "size-full-1200",
		ZIndex = 2,
		LayoutOrder = p1.layoutOrder
	}, {
		headerBar = ReactModule.createElement(HeaderBar, {
			isSecondary = true,
			backgroundTransparency = 1,
			barHeight = 48,
			title = UseLocalizationResult.EditBackground,
			renderLeft = if IsFocus then nil else BackButton
		})
	})
end