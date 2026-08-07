local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local responsiveModule = require(parent.Responsive)
local configureTopBarWithNavigationOptionsModule = require(appChat.configureTopBarWithNavigationOptions)

local function _(p0) --[[ line: 14 | named "wrapInOverlay" ]]
	-- upvalues: responsiveModule (ref), useStyle (ref), reactModule (ref), configureTopBarWithNavigationOptionsModule (ref)
	return function(p1) --[[ line: 15 ]]
		-- upvalues: responsiveModule (copy), useStyle (copy), reactModule (copy), configureTopBarWithNavigationOptionsModule (copy), p0 (ref)
		return reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Image = "rbxasset://textures/ui/LuaChat/9-slice/modal.png",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then -24 else -360, 1, if responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.Small) then -24 else -72),
			ImageColor3 = useStyle().Theme.BackgroundUIDefault.Color,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(5, 5), Vector2.new(6, 6))
		}, {
			sizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1000, 800),
				MinSize = Vector2.new(0, 0)
			}),
			padding = reactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 2.5),
				PaddingLeft = UDim.new(0, 2.5),
				PaddingRight = UDim.new(0, 2.5),
				PaddingTop = UDim.new(0, 2.5)
			}),
			layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			topBar = configureTopBarWithNavigationOptionsModule(p1.navigation),
			overlayContent = reactModule.createElement(p0, p1)
		})
	end
end

return function(p2) --[[ line: 54 ]]
	-- upvalues: roactNavigationModule (ref), reactModule (ref), responsiveModule (ref), useStyle (ref), configureTopBarWithNavigationOptionsModule (ref)
	local var5 = roactNavigationModule.createRobloxStackNavigator(p2)
	local overlayNavigatorConnector = reactModule.PureComponent:extend("OverlayNavigatorConnector")
	overlayNavigatorConnector.router = var5.router
	
	local var7 = function(p3) --[[ line: 15 ]]
		-- upvalues: responsiveModule (copy), useStyle (copy), reactModule (copy), configureTopBarWithNavigationOptionsModule (copy), var5 (ref)
		return reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Image = "rbxasset://textures/ui/LuaChat/9-slice/modal.png",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, if responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small) then -24 else -360, 1, if responsiveModule.useBreakpointYOrSmaller(responsiveModule.Keys.Small) then -24 else -72),
			ImageColor3 = useStyle().Theme.BackgroundUIDefault.Color,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(5, 5), Vector2.new(6, 6))
		}, {
			sizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1000, 800),
				MinSize = Vector2.new(0, 0)
			}),
			padding = reactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 2.5),
				PaddingLeft = UDim.new(0, 2.5),
				PaddingRight = UDim.new(0, 2.5),
				PaddingTop = UDim.new(0, 2.5)
			}),
			layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			topBar = configureTopBarWithNavigationOptionsModule(p3.navigation),
			overlayContent = reactModule.createElement(var5, p3)
		})
	end
	
	function overlayNavigatorConnector.render(p4) --[[ line: 61 ]]
		-- upvalues: reactModule (copy), var7 (ref)
		return reactModule.createElement(var7, p4.props)
	end
	
	return overlayNavigatorConnector
end