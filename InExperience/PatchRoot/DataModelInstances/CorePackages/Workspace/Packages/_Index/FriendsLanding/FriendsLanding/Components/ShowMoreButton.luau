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

local var1 = function() end

showMoreButton.defaultProps = {
	layoutOrder = 1,
	buttonHeight = 48,
	onSizeChange = var1,
	onActivated = var1
}
showMoreButton.MAX_WIDTH = 640

function showMoreButton.init(p1)
	-- upvalues: showMoreButton (ref)
	p1.state = { width = 100 }
	p1.localization = { showMore = "Feature.Friends.Action.ShowMore" }
	
	function p0.onChangeSize(p2)
		-- upvalues: p1 (ref), showMoreButton (copy)
		p1:setState({
			width = math.min(p1.props.maxWidth or showMoreButton.MAX_WIDTH, p2.AbsoluteSize.X)
		})
		p1.props.onSizeChange(p2)
	end
end

function showMoreButton.render(p1)
	-- upvalues: withLocalization (ref), roact (ref), button (ref), buttonType (ref)
	return withLocalization(p1.localization)(function(p2)
		-- upvalues: p1 (ref), roact (copy), button (copy), buttonType (copy)
		local buttonHeight = p1.props.buttonHeight
		
		return roact.createFragment({
			showMoreContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder,
				Size = UDim2.new(1, 0, 0, buttonHeight + 48),
				[roact.Change.AbsoluteSize] = p1.onChangeSize
			}, {
				layout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				showMore = roact.createElement(button, {
					buttonType = buttonType.Secondary,
					onActivated = p1.props.onActivated,
					size = UDim2.new(0, p1.state.width, 0, buttonHeight),
					text = p2.showMore
				})
			})
		})
	end)
end

return function(p1)
	-- upvalues: useDesignTokens (ref), roact (ref), showMoreButton (ref), cryoModule (ref)
	local var2 = useDesignTokens()
	
	return roact.createElement(showMoreButton, cryoModule.Dictionary.join({
		maxWidth = var2.LuaApps.FriendsLanding.ShowMore.ButtonWidth,
		buttonHeight = var2.LuaApps.FriendsLanding.ShowMore.ButtonHeight
	}, p1))
end