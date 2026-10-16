local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local WithStyleFunction = DependenciesModule.UIBlox.Style.withStyle
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local PlayerSearchWrapper = Roact.PureComponent:extend("PlayerSearchWrapper")
PlayerSearchWrapper.defaultProps = { layoutOrder = 1, onActivated = nil, searchText = "" }

function PlayerSearchWrapper.render(p1) --[[ Line: 18 ]]
	-- upvalues: FriendsLandingContextModule (copy), WithStyleFunction (copy), Roact (copy)
	return FriendsLandingContextModule.with(function(p2) --[[ Line: 19 ]]
		-- upvalues: WithStyleFunction (upval), p1 (copy), Roact (upval)
		return WithStyleFunction(function(p3) --[[ Line: 20 ]]
			-- upvalues: p1 (upval), Roact (upval), p2 (copy)
			return Roact.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = p3.Theme.BackgroundDefault.Color
			}, {
				Roact.createElement(p2.playerSearchPage, {
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

return PlayerSearchWrapper