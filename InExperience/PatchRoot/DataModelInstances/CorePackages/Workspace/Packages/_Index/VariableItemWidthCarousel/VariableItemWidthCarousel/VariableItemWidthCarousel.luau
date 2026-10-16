local VariableItemWidthCarousel1 = script:FindFirstAncestor("VariableItemWidthCarousel")
local Parent = VariableItemWidthCarousel1.Parent
local CollectionViewsModule = require(Parent.CollectionViews)
local ReactModule = require(Parent.React)
local CarouselScrollButtons = CollectionViewsModule.CarouselScrollButtons
local CollectionHeader = CollectionViewsModule.CollectionHeader
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local ResponsiveModule = require(Parent.Responsive)
local UseLastInputFunction = ResponsiveModule.useLastInput
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UseVariableItemWidthScrollHandlersModule = require(VariableItemWidthCarousel1.useVariableItemWidthScrollHandlers)
local FFlagSduiOptionSelectorHeaderComponent = require(Parent.SharedFlags).FFlagSduiOptionSelectorHeaderComponent

local function _(Pointer, Directional, p1, p2) --[[ Line: 49 | Named "areScrollButtonsEnabled" ]]
	-- upvalues: ResponsiveModule (copy)
	return if p1 then Pointer == ResponsiveModule.Input.Pointer and Directional ~= ResponsiveModule.Input.Directional or p2 else false
end

function VariableItemWidthCarousel(Frame, Ref) --[[ Line: 66 ]]
	-- upvalues: UseDesignTokensFunction (copy), UseLastInputFunction (copy), UsePreferredInputFunction (copy), UseIsSpatialFunction (copy), ResponsiveModule (copy), ReactModule (copy), UseVariableItemWidthScrollHandlersModule (copy), FFlagSduiOptionSelectorHeaderComponent (copy), CollectionHeader (copy), CarouselScrollButtons (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLastInputResult = UseLastInputFunction()
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local Items = Frame.items
	local RenderItemFunction = Frame.renderItem
	local ItemPadding = Frame.itemPadding
	local ItemHeight = Frame.itemHeight
	local SideMargin = Frame.sideMargin or 0
	local ScrollingFrameRef = Frame.scrollingFrameRef
	local IsNotTitleMatch: boolean = Frame.title and Frame.title ~= ""
	local IsNotTitleMatch1: boolean = IsNotTitleMatch or (Frame.subtitle ~= nil or Frame.tooltipInfoText ~= nil)
	local IsNotUsePreferredInputResultMatch = Frame.scrollButtonsEnabled and (UseLastInputResult == ResponsiveModule.Input.Pointer and UsePreferredInputResult ~= ResponsiveModule.Input.Directional or UseIsSpatialResult)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: Items (copy), RenderItemFunction (copy)
		local t = {}
		
		for i, item in ipairs(Items) do
			t[i] = RenderItemFunction(item, i)
		end
		return t
	end, { Items, RenderItemFunction })
	local UseVariableItemWidthScrollHandlersModuleResult, UseVariableItemWidthScrollHandlersModuleResult2, UseVariableItemWidthScrollHandlersModuleResult3, UseVariableItemWidthScrollHandlersModuleResult4, UseVariableItemWidthScrollHandlersModuleResult5 = UseVariableItemWidthScrollHandlersModule(Items, ItemPadding, Frame.calculateItemWidth, ScrollingFrameRef, Frame.scrollSpeed)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder,
		ref = Ref
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SideMargin),
			PaddingRight = UDim.new(0, SideMargin)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if IsNotTitleMatch1 or FFlagSduiOptionSelectorHeaderComponent and Frame.headerComponent ~= nil then Frame.headerContentPadding or UseDesignTokensResult.Size.Size_400 else 0)
		}),
		Header = if FFlagSduiOptionSelectorHeaderComponent and Frame.headerComponent then Frame.headerComponent elseif IsNotTitleMatch1 then ReactModule.createElement(CollectionHeader, {
			LayoutOrder = 1,
			title = Frame.title,
			subtitle = Frame.subtitle,
			tooltipInfoText = Frame.tooltipInfoText,
			onActivateInfoIcon = Frame.onActivateInfoIcon,
			tooltipSupportsVR = Frame.tooltipSupportsVR,
			tooltipSupportsTenFootUi = Frame.tooltipSupportsTenFootUi,
			hideButton = #Items < 1 or (Frame.hideHeaderButton or not IsNotTitleMatch),
			onActivate = Frame.onActivateHeader,
			buttonText = Frame.headerButtonText
		}) else nil,
		ContentFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, ItemHeight)
		}, {
			DynamicScrollingFrame = ReactModule.createElement("ScrollingFrame", {
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 1,
				CanvasSize = UDim2.new(0, 0, 0, ItemHeight),
				ClipsDescendants = false,
				ElasticBehavior = Enum.ElasticBehavior.Always,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.X,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, ItemHeight),
				ZIndex = 1,
				ref = ScrollingFrameRef,
				[ReactModule.Change.AbsoluteSize] = UseVariableItemWidthScrollHandlersModuleResult5,
				[ReactModule.Change.CanvasPosition] = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 96 ]]
					-- upvalues: UseVariableItemWidthScrollHandlersModuleResult5 (copy), Frame (copy)
					UseVariableItemWidthScrollHandlersModuleResult5()
					
					if Frame.onCanvasPositionChanged and ScrollFrame then
						Frame.onCanvasPositionChanged(ScrollFrame.CanvasPosition)
					end
				end, {
					UseVariableItemWidthScrollHandlersModuleResult5,
					Frame.onCanvasPositionChanged
				})
			}, {
				ReactModule.createElement(ReactModule.Fragment, nil, {
					ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, ItemPadding),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResult)
				})
			}),
			ScrollButtons = if IsNotUsePreferredInputResultMatch then ReactModule.createElement(CarouselScrollButtons, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				Size = UDim2.new(1, 2 * SideMargin, 0, ItemHeight),
				buttonOffsetFromEdge = UseDesignTokensResult.Size.Size_200,
				handleScrollLeft = UseVariableItemWidthScrollHandlersModuleResult,
				handleScrollRight = UseVariableItemWidthScrollHandlersModuleResult2,
				leftScrollingEnabled = UseVariableItemWidthScrollHandlersModuleResult3,
				rightScrollingEnabled = UseVariableItemWidthScrollHandlersModuleResult4
			}) else nil
		})
	})
end

return ReactModule.forwardRef(VariableItemWidthCarousel)