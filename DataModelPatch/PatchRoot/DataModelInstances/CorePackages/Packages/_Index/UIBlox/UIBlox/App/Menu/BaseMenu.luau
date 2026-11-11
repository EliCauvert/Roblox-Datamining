local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactGamepadModule = require(Parent2.RoactGamepad)
local RoactModule = require(Parent2.Roact)
local ReactModule = require(Parent2.React)
local CryoModule = require(Parent2.Cryo)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local VerticalScrollViewModule = require(Parent.Container.VerticalScrollView)
local WithSelectionCursorProviderModule = require(Parent.SelectionImage.withSelectionCursorProvider)
local CursorKindModule = require(Parent.SelectionImage.CursorKind)
local SetDefaultModule = require(Parent1.Utility.setDefault)
local CellModule = require(script.Parent.Cell)
local RoundedFrameModule = require(script.Parent.RoundedFrame)
local StyleDefaultsModule = require(script.Parent.StyleDefaults)
local ComponentAssetsDropshadow178 = require(Parent.ImageSet.Images)["component_assets/dropshadow_17_8"]
local BaseMenu = RoactModule.PureComponent:extend("BaseMenu")
BaseMenu.validateProps = TModule.strictInterface({
	buttonProps = require(script.Parent.validateButtonProps),
	width = TModule.optional(TModule.UDim),
	position = TModule.optional(TModule.union(TModule.UDim2, TModule.table)),
	anchorPoint = TModule.optional(TModule.Vector2),
	layoutOrder = TModule.optional(TModule.number),
	topElementRounded = TModule.optional(TModule.boolean),
	bottomElementRounded = TModule.optional(TModule.boolean),
	setFirstItemRef = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	setFrameRef = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	stayOnActivated = TModule.optional(TModule.boolean),
	maxHeight = TModule.optional(TModule.number),
	showDropShadow = TModule.optional(TModule.boolean),
	fixedListHeight = TModule.optional(TModule.number),
	isElementBackgroundVisible = TModule.optional(TModule.boolean),
	isElementDividerVisible = TModule.optional(TModule.boolean),
	elementHeight = TModule.optional(TModule.number),
	borderCornerRadius = TModule.optional(TModule.integer),
	background = TModule.optional((require(Parent1.Core.Style.Validator.validateColorInfo))),
	enableTokenOverride = TModule.optional(TModule.boolean),
	renderHeader = TModule.optional(TModule.callback),
	headerHeight = TModule.optional(TModule.number),
	selectionOrder = TModule.optional(TModule.number),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
BaseMenu.defaultProps = {
	topElementRounded = true,
	bottomElementRounded = true,
	showDropShadow = false,
	fixedListHeight = nil,
	isElementBackgroundVisible = true,
	isElementDividerVisible = true,
	elementHeight = 56,
	borderCornerRadius = 4,
	enableTokenOverride = true,
	headerHeight = 0,
	isRoactGamepadEnabled = true,
	width = UDim.new(1, 0),
	position = UDim2.new(0, 0, 0, 0)
}

function BaseMenu.init(p1)
	-- upvalues: RoactGamepadModule (copy)
	p1.gamepadRefs = p1.props.isRoactGamepadEnabled and RoactGamepadModule.createRefCache() or {}
end

function BaseMenu:renderFixedHeightMenu(DefaultProps, p1, p2)
	-- upvalues: SetDefaultModule (copy), RoactModule (copy), ImageSetComponentModule (copy), ComponentAssetsDropshadow178 (copy), VerticalScrollViewModule (copy)
	local FixedListHeight = DefaultProps.fixedListHeight
	local SetDefaultModuleResult = SetDefaultModule(DefaultProps.borderCornerRadius, 8)
	local BackgroundUIDefault = p1.Theme.BackgroundUIDefault
	local SetDefaultModuleResult1 = SetDefaultModule(DefaultProps.background, {
		Color = BackgroundUIDefault.Color,
		Transparency = BackgroundUIDefault.Transparency
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = DefaultProps.anchorPoint,
		LayoutOrder = DefaultProps.layoutOrder,
		Size = UDim2.new(DefaultProps.width.Scale, DefaultProps.width.Offset, 0, FixedListHeight),
		Position = DefaultProps.position
	}, {
		DropShadow = DefaultProps.showDropShadow and RoactModule.createElement(ImageSetComponentModule.Label, {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 16, 1, 16),
			Image = ComponentAssetsDropshadow178,
			ImageColor3 = p1.Theme.DropShadow.Color,
			ImageTransparency = p1.Theme.DropShadow.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(16, 16, 16, 16)
		}) or nil,
		ContentFrame = RoactModule.createElement("Frame", {
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundColor3 = SetDefaultModuleResult1.Color,
			BackgroundTransparency = SetDefaultModuleResult1.Transparency
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, SetDefaultModuleResult) }),
			ClippingFrame = RoactModule.createElement("Frame", {
				ZIndex = 4,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 1, -SetDefaultModuleResult * 2),
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				ScrollingFrame = RoactModule.createElement(VerticalScrollViewModule, {
					selectable = false,
					canvasSizeY = UDim.new(0, #DefaultProps.buttonProps * DefaultProps.elementHeight)
				}, p2)
			})
		})
	})
end

function BaseMenu.render(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy), CursorKindModule (copy), WithSelectionCursorProviderModule (copy), RoactGamepadModule (copy), CellModule (copy), WithStyleModule (copy), SetDefaultModule (copy), ImageSetComponentModule (copy), ComponentAssetsDropshadow178 (copy), RoundedFrameModule (copy)
	local HeaderHeight = p1.props.headerHeight
	local NewElementHeight = p1.props.elementHeight * 7.5 + HeaderHeight
	local NewElementHeight1 = #p1.props.buttonProps * p1.props.elementHeight + HeaderHeight
	local Flag = false
	
	if NewElementHeight <= NewElementHeight1 then
		NewElementHeight1 = NewElementHeight
		Flag = true
	end
	local MaxHeight: number = p1.props.maxHeight
	
	if MaxHeight and MaxHeight > 0 and MaxHeight < NewElementHeight1 then
		NewElementHeight1 = (math.max(math.floor((MaxHeight - p1.props.elementHeight * 0.5 - HeaderHeight) / p1.props.elementHeight), 1) + 0.5) * p1.props.elementHeight + HeaderHeight
		Flag = true
	end
	local t = {}
	
	for LayoutOrder, buttonProp in ipairs(p1.props.buttonProps) do
		local JoinResult = CryoModule.Dictionary.join(buttonProp, {
			elementHeight = p1.props.elementHeight,
			hasRoundTop = p1.props.topElementRounded and (LayoutOrder == 1 and not Flag),
			hasRoundBottom = p1.props.bottomElementRounded and (LayoutOrder == #p1.props.buttonProps and not Flag),
			hasDivider = if p1.props.isElementDividerVisible then LayoutOrder < #p1.props.buttonProps else false,
			layoutOrder = LayoutOrder,
			inputBindingKey = CryoModule.None,
			setButtonRef = LayoutOrder == 1 and p1.props.setFirstItemRef or nil,
			isElementBackgroundVisible = p1.props.isElementBackgroundVisible,
			borderCornerRadius = p1.props.borderCornerRadius,
			background = p1.props.background
		})
		
		if not p1.props.isRoactGamepadEnabled then
			p1.gamepadRefs[LayoutOrder] = p1.gamepadRefs[LayoutOrder] or RoactModule.createRef()
		end
		local RoundedRectNoInset = nil
		RoundedRectNoInset = if JoinResult.hasRoundBottom and JoinResult.hasRoundTop then CursorKindModule.RoundedRectNoInset elseif JoinResult.hasRoundBottom then CursorKindModule.BulletDown elseif JoinResult.hasRoundTop then CursorKindModule.BulletUp else CursorKindModule.Square
		local JoinResult1 = CryoModule.Dictionary.join(JoinResult, {
			cursorKind = RoundedRectNoInset,
			selectionOrder = p1.props.selectionOrder
		})
		t["cell " .. LayoutOrder] = WithSelectionCursorProviderModule(function(Callback)
			-- upvalues: RoactModule (upval), p1 (copy), RoactGamepadModule (upval), LayoutOrder (copy), buttonProp (copy), RoundedRectNoInset (ref), CellModule (upval), JoinResult1 (ref)
			return RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable.Frame else "Frame", {
				Size = UDim2.new(p1.props.width, UDim.new(0, p1.props.elementHeight)),
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				[RoactModule.Ref] = p1.gamepadRefs[LayoutOrder],
				NextSelectionUp = LayoutOrder > 1 and p1.gamepadRefs[LayoutOrder - 1] or nil,
				NextSelectionDown = LayoutOrder < #p1.props.buttonProps and p1.gamepadRefs[LayoutOrder + 1] or nil,
				inputBindings = if p1.props.isRoactGamepadEnabled then {
					Activated = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, buttonProp.onActivated, { key = buttonProp.inputBindingKey })
				} else nil,
				SelectionImageObject = Callback(RoundedRectNoInset)
			}, {
				Cell = RoactModule.createElement(CellModule, JoinResult1)
			})
		end)
	end
	t.layout = RoactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return WithStyleModule(function(p2)
		-- upvalues: SetDefaultModule (upval), p1 (copy), Flag (ref), t (copy), RoactModule (upval), NewElementHeight1 (ref), ImageSetComponentModule (upval), ComponentAssetsDropshadow178 (upval), RoundedFrameModule (upval), HeaderHeight (copy)
		local Theme = p2.Theme
		local BackgroundUIDefault = Theme.BackgroundUIDefault
		local SetDefaultModuleResult = SetDefaultModule(p1.props.background, {
			Color = BackgroundUIDefault.Color,
			Transparency = BackgroundUIDefault.Transparency
		})
		local IsElementBackgroundVisible = p1.props.isElementBackgroundVisible
		local IsElementBackgroundVisible1 = Flag and (p1.props.topElementRounded and IsElementBackgroundVisible)
		local IsElementBackgroundVisible2 = Flag and (p1.props.bottomElementRounded and IsElementBackgroundVisible)
		local v1 = (if IsElementBackgroundVisible1 then 1 else 0) + (if IsElementBackgroundVisible2 then 1 else 0)
		local RenderHeaderFunction = p1.props.renderHeader
		local RenderHeaderFunction1 = not IsElementBackgroundVisible1 and RenderHeaderFunction
		
		return if p1.props.fixedListHeight then p1:renderFixedHeightMenu(p1.props, p2, t) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.props.anchorPoint,
			LayoutOrder = p1.props.layoutOrder,
			Size = UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, NewElementHeight1),
			Position = p1.props.position
		}, {
			DropShadow = p1.props.showDropShadow and RoactModule.createElement(ImageSetComponentModule.Label, {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 16, 1, 16),
				Image = ComponentAssetsDropshadow178,
				ImageColor3 = p2.Theme.DropShadow.Color,
				ImageTransparency = p2.Theme.DropShadow.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(16, 16, 16, 16)
			}) or nil,
			Background = if IsElementBackgroundVisible1 or IsElementBackgroundVisible2 then RoactModule.createElement(RoundedFrameModule, {
				zIndex = -1,
				background = SetDefaultModuleResult,
				topCornerRadius = if IsElementBackgroundVisible1 then UDim.new(0, p1.props.borderCornerRadius) else nil,
				bottomCornerRadius = if IsElementBackgroundVisible2 then UDim.new(0, p1.props.borderCornerRadius) else nil
			}) else nil,
			ClippingFrame = RoactModule.createElement("Frame", {
				ZIndex = 3,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 1, -(p1.props.borderCornerRadius * v1)),
				Position = UDim2.fromScale(0, if IsElementBackgroundVisible1 then 0.5 else 0),
				AnchorPoint = Vector2.new(0, if IsElementBackgroundVisible1 then 0.5 else 0)
			}, {
				HeaderFrame = if RenderHeaderFunction1 then RoactModule.createElement("Frame", {
					Selectable = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, HeaderHeight),
					Position = UDim2.fromOffset(0, 0),
					AnchorPoint = Vector2.new(0, 0)
				}, { Header = RenderHeaderFunction() }) else nil,
				ScrollingFrame = RoactModule.createElement("ScrollingFrame", {
					[RoactModule.Ref] = p1.props.setFrameRef,
					Selectable = false,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, if IsElementBackgroundVisible1 then -4 else 0, 1, if RenderHeaderFunction1 then -HeaderHeight else 0),
					Position = if RenderHeaderFunction1 then UDim2.fromOffset(0, HeaderHeight) else nil,
					BorderSizePixel = 0,
					ScrollBarThickness = if Flag then 4 else 0,
					ScrollBarImageColor3 = Theme.UIEmphasis.Color,
					ScrollBarImageTransparency = Theme.UIEmphasis.Transparency,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					CanvasSize = UDim2.new(1, 0, 0, #p1.props.buttonProps * p1.props.elementHeight),
					ClipsDescendants = RenderHeaderFunction1
				}, t)
			})
		})
	end)
end

return function(JoinResult)
	-- upvalues: UseStyleModule (copy), CryoModule (copy), StyleDefaultsModule (copy), ReactModule (copy), BaseMenu (copy)
	local JoinResult1 = JoinResult
	
	if JoinResult.enableTokenOverride then
		local UseStyleModuleResult = UseStyleModule()
		local ButtonProps = {}
		
		for i, buttonProp in ipairs(JoinResult.buttonProps) do
			ButtonProps[i] = CryoModule.Dictionary.join(buttonProp, StyleDefaultsModule.getCellDefaultTokens(UseStyleModuleResult))
		end
		JoinResult1 = CryoModule.Dictionary.join(JoinResult1, StyleDefaultsModule.getBaseMenuDefaultTokens(UseStyleModuleResult), { buttonProps = ButtonProps })
	end
	return ReactModule.createElement(BaseMenu, JoinResult1)
end