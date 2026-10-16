local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local WithLocalizationFunction = DependenciesModule.withLocalization
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local CryoModule = require(Parent.Cryo)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local ShowMoreButton = Roact.PureComponent:extend("ShowMoreButton")

local function OnActivated() --[[ Line: 18 ]] end

ShowMoreButton.defaultProps = {
	layoutOrder = 1,
	buttonHeight = 48,
	onSizeChange = OnActivated,
	onActivated = OnActivated
}
ShowMoreButton.MAX_WIDTH = 640

function ShowMoreButton.init(p1) --[[ Line: 30 ]]
	-- upvalues: ShowMoreButton (copy)
	p1.state = { width = 100 }
	p1.localization = { showMore = "Feature.Friends.Action.ShowMore" }
	
	function p1.onChangeSize(Frame) --[[ Line: 39 ]]
		-- upvalues: p1 (copy), ShowMoreButton (upval)
		p1:setState({
			width = math.min(p1.props.maxWidth or ShowMoreButton.MAX_WIDTH, Frame.AbsoluteSize.X)
		})
		p1.props.onSizeChange(Frame)
	end
end

function ShowMoreButton.render(p1) --[[ Line: 49 ]]
	-- upvalues: WithLocalizationFunction (copy), Roact (copy), Button (copy), ButtonType (copy)
	return WithLocalizationFunction(p1.localization)(function(p2) --[[ Line: 50 ]]
		-- upvalues: p1 (copy), Roact (upval), Button (upval), ButtonType (upval)
		local ButtonHeight: number = p1.props.buttonHeight
		
		return Roact.createFragment({
			showMoreContainer = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder,
				Size = UDim2.new(1, 0, 0, ButtonHeight + 48),
				[Roact.Change.AbsoluteSize] = p1.onChangeSize
			}, {
				layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				showMore = Roact.createElement(Button, {
					buttonType = ButtonType.Secondary,
					onActivated = p1.props.onActivated,
					size = UDim2.new(0, p1.state.width, 0, ButtonHeight),
					text = p2.showMore
				})
			})
		})
	end)
end

return function(p1) --[[ Line: 78 | Named "ShowMoreButtonWrapper" ]]
	-- upvalues: UseDesignTokensFunction (copy), Roact (copy), ShowMoreButton (copy), CryoModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return Roact.createElement(ShowMoreButton, CryoModule.Dictionary.join({
		maxWidth = UseDesignTokensResult.LuaApps.FriendsLanding.ShowMore.ButtonWidth,
		buttonHeight = UseDesignTokensResult.LuaApps.FriendsLanding.ShowMore.ButtonHeight
	}, p1))
end