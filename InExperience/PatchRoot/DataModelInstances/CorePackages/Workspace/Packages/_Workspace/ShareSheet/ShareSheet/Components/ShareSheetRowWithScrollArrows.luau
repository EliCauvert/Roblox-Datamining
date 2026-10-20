local Parent = script:FindFirstAncestor("ShareSheet").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local ScrollView = FoundationModule.ScrollView
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local Visibility = FoundationModule.Enums.Visibility
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), ScrollView (copy), Visibility (copy), StateLayerAffordance (copy), Icon (copy), IconName (copy), IconSize (copy), IconVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local Largest = math.max(0, ScrollFrame.AbsoluteCanvasSize.X - ScrollFrame.AbsoluteWindowSize.X)
		local X: number = ScrollFrame.CanvasPosition.X
		UseStateResult2_1(X > 1)
		UseStateResult2_2(X < Largest - 1)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), UseResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.CanvasPosition = Vector2.new(math.clamp(Current.CanvasPosition.X + p1 * Current.AbsoluteWindowSize.X, 0, (math.max(0, Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X))), Current.CanvasPosition.Y)
			UseResult(Current)
			
			return
		end
	end, { UseResult })
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		testId = "share-sheet-row",
		LayoutOrder = Frame.LayoutOrder
	}, {
		ScrollView = ReactModule.createElement(ScrollView, {
			tag = "size-full-0 auto-y",
			testId = "share-sheet-row-scroll-view",
			padding = {
				left = UDim.new(0, UseTokensResult.Padding.XLarge),
				right = UDim.new(0, UseTokensResult.Padding.XLarge)
			},
			scrollingFrameRef = UseRefResult,
			onCanvasPositionChanged = UseResult,
			onAbsoluteCanvasSizeChanged = UseResult,
			onAbsoluteWindowSizeChanged = UseResult,
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = Visibility.None
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, UseTokensResult.Padding.Medium)
			}
		}, Frame.children),
		ScrollControls = ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			[ReactModule.Event.MouseEnter] = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(true)
			end,
			[ReactModule.Event.MouseLeave] = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end,
			[ReactModule.Tag] = "data-testid=share-sheet-row-scroll-controls"
		}, {
			Left = ReactModule.createElement(View, {
				ZIndex = 11,
				tag = "anchor-center-left size-1000 radius-circle",
				testId = "share-sheet-row-scroll-left",
				Position = UDim2.new(0, UseTokensResult.Padding.Medium, 0.5, 0),
				Visible = UseStateResult and UseStateResult1,
				backgroundStyle = UseTokensResult.DarkMode.OverMedia.OverMedia_100,
				onActivated = function()
					-- upvalues: UseResult1 (copy)
					UseResult1(-1)
				end,
				stateLayer = { affordance = StateLayerAffordance.Background }
			}, {
				Icon = ReactModule.createElement(Icon, {
					testId = "share-sheet-row-scroll-left--icon",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = IconName.ChevronLargeLeft,
					size = IconSize.Large,
					style = UseTokensResult.Color.Extended.White.White_100,
					variant = IconVariant.Regular
				})
			}),
			Right = ReactModule.createElement(View, {
				ZIndex = 11,
				tag = "anchor-center-right size-1000 radius-circle",
				testId = "share-sheet-row-scroll-right",
				Position = UDim2.new(1, -UseTokensResult.Padding.Medium, 0.5, 0),
				Visible = UseStateResult and UseStateResult3,
				backgroundStyle = UseTokensResult.DarkMode.OverMedia.OverMedia_100,
				onActivated = function()
					-- upvalues: UseResult1 (copy)
					UseResult1(1)
				end,
				stateLayer = { affordance = StateLayerAffordance.Background }
			}, {
				Icon = ReactModule.createElement(Icon, {
					testId = "share-sheet-row-scroll-right--icon",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = IconName.ChevronLargeRight,
					size = IconSize.Large,
					style = UseTokensResult.Color.Extended.White.White_100,
					variant = IconVariant.Regular
				})
			})
		})
	})
end