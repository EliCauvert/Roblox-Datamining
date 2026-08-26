local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local getPageMargin = UIBloxModule.App.Container.getPageMargin
local useIsWideModeModule = require(socialCommon.Hooks.useIsWideMode)
local userSearchBarModule = require(socialCommon.Components.UserSearchBar.UserSearchBar)
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagAddFriendsPageCapitalization = require(parent.SharedFlags).FFlagAddFriendsPageCapitalization

return function(p1)
	-- upvalues: useIsWideModeModule (ref), useSelector (ref), getPageMargin (ref), useLocalization (ref), fFlagAddFriendsPageCapitalization (ref), reactModule (ref), imageSetButton (ref), fFlagCreateConnectionsHub (ref), userSearchBarModule (ref)
	local var1 = getPageMargin(useSelector(function(p2)
		return p2.ScreenSize
	end).X)
	
	return reactModule.createElement(imageSetButton, {
		BackgroundTransparency = 1,
		Size = if useIsWideModeModule() then UDim2.fromOffset(400, 48) else UDim2.new(1, if fFlagCreateConnectionsHub then 0 else -2 * var1, 0, 48),
		Position = UDim2.new(0, if fFlagCreateConnectionsHub then 0 else var1, 0, 0),
		[reactModule.Event.Activated] = p1.onActivated
	}, {
		SearchBar = reactModule.createElement(userSearchBarModule, {
			isDisabled = true,
			searchPlaceholderText = useLocalization({
				searchPlaceholderText = if fFlagAddFriendsPageCapitalization then "Feature.AddFriends.Label.InputPlaceholder.SearchForPeopleAltCapitalization" else "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople"
			}).searchPlaceholderText
		})
	})
end