local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local roact = dependenciesModule.Roact
local withStyle = dependenciesModule.UIBlox.Style.withStyle
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local playerSearchWrapper = roact.PureComponent:extend("PlayerSearchWrapper")
playerSearchWrapper.defaultProps = { layoutOrder = 1, onActivated = nil, searchText = "" }

function playerSearchWrapper.render(p1)
	-- upvalues: friendsLandingContextModule (ref), withStyle (ref), roact (ref)
	return friendsLandingContextModule.with(function(p2)
		-- upvalues: withStyle (copy), p1 (ref), roact (copy)
		return withStyle(function(p3)
			-- upvalues: p1 (copy), roact (copy), p2 (ref)
			return roact.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color
			}, {
				roact.createElement(p2.playerSearchPage, {
					searchParameters = {
						isKeywordSuggestionEnabled = true,
						searchKeyword = p1.props.navigation.getParam("searchText", nil) or ""
					},
					shouldShowUserSearchLandingPage = p1.props.navigation.getParam("shouldShowUserSearchLandingPage", nil)
				})
			})
		end)
	end)
end

return playerSearchWrapper