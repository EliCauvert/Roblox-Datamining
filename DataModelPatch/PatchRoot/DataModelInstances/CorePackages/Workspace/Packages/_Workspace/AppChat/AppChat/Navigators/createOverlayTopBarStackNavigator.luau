local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local ResponsiveModule = require(Parent.Responsive)
local ConfigureTopBarWithNavigationOptionsModule = require(AppChat.configureTopBarWithNavigationOptions)

local function _(p1)
	-- upvalues: ResponsiveModule (copy), UseStyleFunction (copy), ReactModule (copy), ConfigureTopBarWithNavigationOptionsModule (copy)
	return function(p2)
		-- upvalues: ResponsiveModule (upval), UseStyleFunction (upval), ReactModule (upval), ConfigureTopBarWithNavigationOptionsModule (upval), p1 (copy)
		local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small)
		local UseBreakpointYOrSmallerResult = ResponsiveModule.useBreakpointYOrSmaller(ResponsiveModule.Keys.Small)
		
		return ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Image = "rbxasset://textures/ui/LuaChat/9-slice/modal.png",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, if UseBreakpointXOrSmallerResult then -24 else -360, 1, if UseBreakpointYOrSmallerResult then -24 else -72),
			ImageColor3 = UseStyleFunction().Theme.BackgroundUIDefault.Color,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(5, 5), Vector2.new(6, 6))
		}, {
			sizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1000, 800),
				MinSize = Vector2.new(0, 0)
			}),
			padding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 2.5),
				PaddingLeft = UDim.new(0, 2.5),
				PaddingRight = UDim.new(0, 2.5),
				PaddingTop = UDim.new(0, 2.5)
			}),
			layout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			topBar = ConfigureTopBarWithNavigationOptionsModule(p2.navigation),
			overlayContent = ReactModule.createElement(p1, p2)
		})
	end
end

return function(p1)
	-- upvalues: RoactNavigationModule (copy), ReactModule (copy), ResponsiveModule (copy), UseStyleFunction (copy), ConfigureTopBarWithNavigationOptionsModule (copy)
	local RobloxStackNavigator = RoactNavigationModule.createRobloxStackNavigator(p1)
	local OverlayNavigatorConnector = ReactModule.PureComponent:extend("OverlayNavigatorConnector")
	OverlayNavigatorConnector.router = RobloxStackNavigator.router
	
	local function v11(p2)
		-- upvalues: ResponsiveModule (upval), UseStyleFunction (upval), ReactModule (upval), ConfigureTopBarWithNavigationOptionsModule (upval), RobloxStackNavigator (copy)
		local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small)
		local UseBreakpointYOrSmallerResult = ResponsiveModule.useBreakpointYOrSmaller(ResponsiveModule.Keys.Small)
		
		return ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Image = "rbxasset://textures/ui/LuaChat/9-slice/modal.png",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, if UseBreakpointXOrSmallerResult then -24 else -360, 1, if UseBreakpointYOrSmallerResult then -24 else -72),
			ImageColor3 = UseStyleFunction().Theme.BackgroundUIDefault.Color,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(5, 5), Vector2.new(6, 6))
		}, {
			sizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1000, 800),
				MinSize = Vector2.new(0, 0)
			}),
			padding = ReactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 2.5),
				PaddingLeft = UDim.new(0, 2.5),
				PaddingRight = UDim.new(0, 2.5),
				PaddingTop = UDim.new(0, 2.5)
			}),
			layout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			topBar = ConfigureTopBarWithNavigationOptionsModule(p2.navigation),
			overlayContent = ReactModule.createElement(RobloxStackNavigator, p2)
		})
	end
	
	function OverlayNavigatorConnector.render(p2)
		-- upvalues: ReactModule (upval), v11 (copy)
		return ReactModule.createElement(v11, p2.props)
	end
	
	return OverlayNavigatorConnector
end