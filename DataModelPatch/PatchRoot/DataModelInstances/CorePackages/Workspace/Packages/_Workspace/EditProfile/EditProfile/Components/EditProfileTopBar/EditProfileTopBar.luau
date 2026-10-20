local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local HeaderBar = require(Parent.UIBlox).App.Bar.HeaderBar
local TextKeysModule = require(EditProfile.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MakeBackButtonFunction = require(Parent.AppHeaderBar).makeBackButton
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)

return function(p1)
	-- upvalues: FFlagEditProfileFixFocusNavigationModule (copy), UseLastInputModeFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), MakeBackButtonFunction (copy), ReactModule (copy), HeaderBar (copy)
	local IsFocus = if FFlagEditProfileFixFocusNavigationModule then UseLastInputModeFunction() == "Focus" else nil
	local UseLocalizationResult = UseLocalizationFunction({ title = TextKeysModule.Title })
	local BackButton = MakeBackButtonFunction(p1.onClose)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 48),
		LayoutOrder = p1.layoutOrder
	}, {
		headerBar = ReactModule.createElement(HeaderBar, {
			isSecondary = true,
			backgroundTransparency = 1,
			barHeight = 48,
			title = UseLocalizationResult.title,
			renderLeft = if FFlagEditProfileFixFocusNavigationModule and not IsFocus then BackButton elseif FFlagEditProfileFixFocusNavigationModule then nil else BackButton
		})
	})
end