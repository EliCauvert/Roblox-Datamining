local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local HeaderBar = require(Parent.UIBlox).App.Bar.HeaderBar
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagAFPConnectionsChannelsHeader = require(Parent.SharedFlags).FFlagAFPConnectionsChannelsHeader

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), UseNavigationFunction (copy), ReactModule (copy), AppHeaderBarModule (copy), FFlagAFPConnectionsChannelsHeader (copy), HeaderBar (copy)
	local TopBarHeight = p1.topBarHeight
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = if FFlagConnectionsToFriendsRename then "Feature.Friends.Feature.Friends.Heading.AddFriends" else "CommonUI.Features.Label.AddConnections"
	})
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, TopBarHeight),
		LayoutOrder = FFlagAFPConnectionsChannelsHeader and p1.layoutOrder or -1
	}, {
		headerBar = ReactModule.createElement(HeaderBar, {
			isSecondary = true,
			title = UseLocalizationResult.titleText,
			barHeight = TopBarHeight,
			renderLeft = ReactModule.useMemo(function()
				-- upvalues: AppHeaderBarModule (upval), UseNavigationResult (copy)
				return AppHeaderBarModule.makeBackButton(function()
					-- upvalues: UseNavigationResult (upval)
					UseNavigationResult.pop()
				end)
			end, { UseNavigationResult }),
			paddingTop = UDim.new(0, 0),
			paddingBottom = UDim.new(0, 0)
		})
	})
end