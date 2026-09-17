local parent = script:FindFirstAncestor("ShareSheet").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local scrollView = foundationModule.ScrollView
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local visibility = foundationModule.Enums.Visibility
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), scrollView (ref), visibility (ref), stateLayerAffordance (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref)
	local var1 = useTokens()
	local var2 = reactModule.useRef(nil)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var8 (ref)
		local maxValue = math.max(0, p2.AbsoluteCanvasSize.X - p2.AbsoluteWindowSize.X)
		local x = p2.CanvasPosition.X
		var6(x > 1)
		var8(x < maxValue - 1)
	end, {})
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var9 (ref)
		local current = var2.current
		
		if current == nil then
			return
		end
		current.CanvasPosition = Vector2.new(math.clamp(current.CanvasPosition.X + p2 * current.AbsoluteWindowSize.X, 0, math.max(0, current.AbsoluteCanvasSize.X - current.AbsoluteWindowSize.X)), current.CanvasPosition.Y)
		var9(current)
	end, { var9 })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		testId = "share-sheet-row",
		LayoutOrder = p1.LayoutOrder
	}, {
		ScrollView = reactModule.createElement(scrollView, {
			tag = "size-full-0 auto-y",
			testId = "share-sheet-row-scroll-view",
			padding = {
				left = UDim.new(0, var1.Padding.XLarge),
				right = UDim.new(0, var1.Padding.XLarge)
			},
			scrollingFrameRef = var2,
			onCanvasPositionChanged = var9,
			onAbsoluteCanvasSizeChanged = var9,
			onAbsoluteWindowSizeChanged = var9,
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = visibility.None
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var1.Padding.Medium)
			}
		}, p1.children),
		ScrollControls = reactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			[reactModule.Event.MouseEnter] = function()
				-- upvalues: var4 (ref)
				var4(true)
			end,
			[reactModule.Event.MouseLeave] = function()
				-- upvalues: var4 (ref)
				var4(false)
			end,
			[reactModule.Tag] = "data-testid=share-sheet-row-scroll-controls"
		}, {
			Left = reactModule.createElement(view, {
				ZIndex = 11,
				tag = "anchor-center-left size-1000 radius-circle",
				testId = "share-sheet-row-scroll-left",
				Position = UDim2.new(0, var1.Padding.Medium, 0.5, 0),
				Visible = var3 and var5,
				backgroundStyle = var1.DarkMode.OverMedia.OverMedia_100,
				onActivated = function()
					-- upvalues: var10 (ref)
					var10(-1)
				end,
				stateLayer = { affordance = stateLayerAffordance.Background }
			}, {
				Icon = reactModule.createElement(icon, {
					testId = "share-sheet-row-scroll-left--icon",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = iconName.ChevronLargeLeft,
					size = iconSize.Large,
					style = var1.Color.Extended.White.White_100,
					variant = iconVariant.Regular
				})
			}),
			Right = reactModule.createElement(view, {
				ZIndex = 11,
				tag = "anchor-center-right size-1000 radius-circle",
				testId = "share-sheet-row-scroll-right",
				Position = UDim2.new(1, -var1.Padding.Medium, 0.5, 0),
				Visible = var3 and var7,
				backgroundStyle = var1.DarkMode.OverMedia.OverMedia_100,
				onActivated = function()
					-- upvalues: var10 (ref)
					var10(1)
				end,
				stateLayer = { affordance = stateLayerAffordance.Background }
			}, {
				Icon = reactModule.createElement(icon, {
					testId = "share-sheet-row-scroll-right--icon",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = iconName.ChevronLargeRight,
					size = iconSize.Large,
					style = var1.Color.Extended.White.White_100,
					variant = iconVariant.Regular
				})
			})
		})
	})
end