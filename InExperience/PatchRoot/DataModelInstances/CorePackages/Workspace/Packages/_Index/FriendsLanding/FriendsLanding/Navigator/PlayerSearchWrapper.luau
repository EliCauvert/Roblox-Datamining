local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local roact = dependenciesModule.Roact
local withStyle = dependenciesModule.UIBlox.Style.withStyle
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local playerSearchWrapper = roact.PureComponent:extend("PlayerSearchWrapper")
playerSearchWrapper.defaultProps = { layoutOrder = 1, onActivated = nil, searchText = "" }

function playerSearchWrapper.render(p0) --[[ line: 18 ]]
	-- upvalues: friendsLandingContextModule (ref), withStyle (ref), roact (ref)
	return friendsLandingContextModule.with(function(p1) --[[ line: 19 ]]
		-- upvalues: withStyle (copy), p0 (ref), roact (copy)
		return withStyle(function(p2) --[[ line: 20 ]]
			-- upvalues: p0 (copy), roact (copy), p1 (ref)
			return roact.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = p2.Theme.BackgroundDefault.Color
			}, {
				roact.createElement(p1.playerSearchPage, {
					searchParameters = {
						isKeywordSuggestionEnabled = true,
						searchKeyword = p0.props.navigation.getParam("searchText", nil) or ""
					},
					shouldShowUserSearchLandingPage = p0.props.navigation.getParam("shouldShowUserSearchLandingPage", nil)
				})
			})
		end)
	end)
end

return playerSearchWrapper