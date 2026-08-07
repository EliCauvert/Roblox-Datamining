local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local withLocalization = dependenciesModule.withLocalization
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local cryoModule = require(parent.Cryo)
local useDesignTokens = require(parent.Style).useDesignTokens
local showMoreButton = roact.PureComponent:extend("ShowMoreButton")

local var4 = function() --[[ line: 18 ]] end

showMoreButton.defaultProps = {
	layoutOrder = 1,
	buttonHeight = 48,
	onSizeChange = var4,
	onActivated = var4
}
showMoreButton.MAX_WIDTH = 640

function showMoreButton.init(p0) --[[ line: 30 ]]
	-- upvalues: showMoreButton (ref)
	p0.state = { width = 100 }
	p0.localization = { showMore = "Feature.Friends.Action.ShowMore" }
	
	function p0.onChangeSize(p1) --[[ line: 39 ]]
		-- upvalues: p0 (ref), showMoreButton (copy)
		p0:setState({
			width = math.min(p0.props.maxWidth or showMoreButton.MAX_WIDTH, p1.AbsoluteSize.X)
		})
		p0.props.onSizeChange(p1)
	end
end

function showMoreButton.render(p2) --[[ line: 49 ]]
	-- upvalues: withLocalization (ref), roact (ref), button (ref), buttonType (ref)
	return withLocalization(p2.localization)(function(p3) --[[ line: 50 ]]
		-- upvalues: p2 (ref), roact (copy), button (copy), buttonType (copy)
		local buttonHeight = p2.props.buttonHeight
		
		return roact.createFragment({
			showMoreContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = p2.props.layoutOrder,
				Size = UDim2.new(1, 0, 0, buttonHeight + 48),
				[roact.Change.AbsoluteSize] = p2.onChangeSize
			}, {
				layout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				showMore = roact.createElement(button, {
					buttonType = buttonType.Secondary,
					onActivated = p2.props.onActivated,
					size = UDim2.new(0, p2.state.width, 0, buttonHeight),
					text = p3.showMore
				})
			})
		})
	end)
end

return function(p4) --[[ line: 78 | named "ShowMoreButtonWrapper" ]]
	-- upvalues: useDesignTokens (ref), roact (ref), showMoreButton (ref), cryoModule (ref)
	local var5 = useDesignTokens()
	
	return roact.createElement(showMoreButton, cryoModule.Dictionary.join({
		maxWidth = var5.LuaApps.FriendsLanding.ShowMore.ButtonWidth,
		buttonHeight = var5.LuaApps.FriendsLanding.ShowMore.ButtonHeight
	}, p4))
end