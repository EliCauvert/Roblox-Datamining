local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local GetPageMarginFunction = UIBloxModule.App.Container.getPageMargin
local UseIsWideModeModule = require(SocialCommon.Hooks.useIsWideMode)
local UserSearchBarModule = require(SocialCommon.Components.UserSearchBar.UserSearchBar)
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub

return function(p1) --[[ Line: 31 ]]
	-- upvalues: UseIsWideModeModule (copy), UseSelectorFunction (copy), GetPageMarginFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), ImageSetButton (copy), FFlagCreateConnectionsHub (copy), UserSearchBarModule (copy)
	local UseIsWideModeModuleResult = UseIsWideModeModule()
	local PageMargin: number = GetPageMarginFunction(UseSelectorFunction(function(p2) --[[ Line: 35 ]]
		return p2.ScreenSize
	end).X)
	
	return ReactModule.createElement(ImageSetButton, {
		BackgroundTransparency = 1,
		Size = if UseIsWideModeModuleResult then UDim2.fromOffset(400, 48) else UDim2.new(1, if FFlagCreateConnectionsHub then 0 else -2 * PageMargin, 0, 48),
		Position = UDim2.new(0, if FFlagCreateConnectionsHub then 0 else PageMargin, 0, 0),
		[ReactModule.Event.Activated] = p1.onActivated
	}, {
		SearchBar = ReactModule.createElement(UserSearchBarModule, {
			isDisabled = true,
			searchPlaceholderText = UseLocalizationFunction({
				searchPlaceholderText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeopleAltCapitalization"
			}).searchPlaceholderText
		})
	})
end