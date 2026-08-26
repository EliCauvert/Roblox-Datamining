local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactGamepadModule = require(parent_2.RoactGamepad)
local roactModule = require(parent_2.Roact)
local reactModule = require(parent_2.React)
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local validateColorInfoModule = require(parent_1.Core.Style.Validator.validateColorInfo)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local validateButtonPropsModule = require(script.Parent.validateButtonProps)
local verticalScrollViewModule = require(parent.Container.VerticalScrollView)
local imagesModule = require(parent.ImageSet.Images)
local withSelectionCursorProviderModule = require(parent.SelectionImage.withSelectionCursorProvider)
local cursorKindModule = require(parent.SelectionImage.CursorKind)
local setDefaultModule = require(parent_1.Utility.setDefault)
local cellModule = require(script.Parent.Cell)
local roundedFrameModule = require(script.Parent.RoundedFrame)
local styleDefaultsModule = require(script.Parent.StyleDefaults)
local dropshadow178 = imagesModule["component_assets/dropshadow_17_8"]
local baseMenu = roactModule.PureComponent:extend("BaseMenu")
baseMenu.validateProps = tModule.strictInterface({
	buttonProps = validateButtonPropsModule,
	width = tModule.optional(tModule.UDim),
	position = tModule.optional(tModule.union(tModule.UDim2, tModule.table)),
	anchorPoint = tModule.optional(tModule.Vector2),
	layoutOrder = tModule.optional(tModule.number),
	topElementRounded = tModule.optional(tModule.boolean),
	bottomElementRounded = tModule.optional(tModule.boolean),
	setFirstItemRef = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	setFrameRef = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	stayOnActivated = tModule.optional(tModule.boolean),
	maxHeight = tModule.optional(tModule.number),
	showDropShadow = tModule.optional(tModule.boolean),
	fixedListHeight = tModule.optional(tModule.number),
	isElementBackgroundVisible = tModule.optional(tModule.boolean),
	isElementDividerVisible = tModule.optional(tModule.boolean),
	elementHeight = tModule.optional(tModule.number),
	borderCornerRadius = tModule.optional(tModule.integer),
	background = tModule.optional(validateColorInfoModule),
	enableTokenOverride = tModule.optional(tModule.boolean),
	renderHeader = tModule.optional(tModule.callback),
	headerHeight = tModule.optional(tModule.number),
	selectionOrder = tModule.optional(tModule.number),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
baseMenu.defaultProps = {
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

function baseMenu.init(p1)
	-- upvalues: roactGamepadModule (ref)
	p1.gamepadRefs = p1.props.isRoactGamepadEnabled and roactGamepadModule.createRefCache() or {}
end

function baseMenu.renderFixedHeightMenu(_, p1, p2, p3)
	-- upvalues: setDefaultModule (ref), roactModule (ref), imageSetComponentModule (ref), dropshadow178 (ref), verticalScrollViewModule (ref)
	local fixedListHeight = p1.fixedListHeight
	local var1 = setDefaultModule(p1.borderCornerRadius, 8)
	local backgroundUIDefault = p2.Theme.BackgroundUIDefault
	local var2 = setDefaultModule(p1.background, {
		Color = backgroundUIDefault.Color,
		Transparency = backgroundUIDefault.Transparency
	})
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(p1.width.Scale, p1.width.Offset, 0, fixedListHeight),
		Position = p1.position
	}, {
		DropShadow = p1.showDropShadow and roactModule.createElement(imageSetComponentModule.Label, {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 16, 1, 16),
			Image = dropshadow178,
			ImageColor3 = p2.Theme.DropShadow.Color,
			ImageTransparency = p2.Theme.DropShadow.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(16, 16, 16, 16)
		}) or nil,
		ContentFrame = roactModule.createElement("Frame", {
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundColor3 = var2.Color,
			BackgroundTransparency = var2.Transparency
		}, {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1) }),
			ClippingFrame = roactModule.createElement("Frame", {
				ZIndex = 4,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 1, -var1 * 2),
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				ScrollingFrame = roactModule.createElement(verticalScrollViewModule, {
					selectable = false,
					canvasSizeY = UDim.new(0, #p1.buttonProps * p1.elementHeight)
				}, p3)
			})
		})
	})
end

function baseMenu.render(p1)
	-- upvalues: cryoModule (ref), roactModule (ref), cursorKindModule (ref), withSelectionCursorProviderModule (ref), roactGamepadModule (ref), cellModule (ref), withStyleModule (ref), setDefaultModule (ref), imageSetComponentModule (ref), dropshadow178 (ref), roundedFrameModule (ref)
	local headerHeight = p1.props.headerHeight
	local var1 = p1.props.elementHeight * 7.5 + headerHeight
	local var2 = #p1.props.buttonProps * p1.props.elementHeight + headerHeight
	local var3 = false
	
	if var1 <= var2 then
		var2 = var1
		var3 = true
	end
	local maxHeight = p1.props.maxHeight
	
	if maxHeight and maxHeight > 0 and maxHeight < var2 then
		var2 = (math.max(math.floor((maxHeight - p1.props.elementHeight * 0.5 - headerHeight) / p1.props.elementHeight), 1) + 0.5) * p1.props.elementHeight + headerHeight
		var3 = true
	end
	local t = {}
	
	for i, v in ipairs(p1.props.buttonProps) do
		local var4
		local join = cryoModule.Dictionary.join
		local var5 = v
		local t_1 = {
			elementHeight = p1.props.elementHeight,
			hasRoundTop = p1.props.topElementRounded and (i == 1 and not var3),
			hasRoundBottom = p1.props.bottomElementRounded and (i == #p1.props.buttonProps and not var3)
		}
		
		if p1.props.isElementDividerVisible then
			var4 = i < #p1.props.buttonProps
			var4 = nil
		else
			var4 = false
		end
		t_1.hasDivider = var4
		t_1.layoutOrder = i
		t_1.inputBindingKey = cryoModule.None
		t_1.setButtonRef = if i == 1 then p1.props.setFirstItemRef else nil
		t_1.isElementBackgroundVisible = p1.props.isElementBackgroundVisible
		t_1.borderCornerRadius = p1.props.borderCornerRadius
		t_1.background = p1.props.background
		join = join(var5, t_1)
		
		if not p1.props.isRoactGamepadEnabled then
			p1.gamepadRefs[i] = p1.gamepadRefs[i] or roactModule.createRef()
		end
		local _ = nil
		local var6 = if join.hasRoundBottom and join.hasRoundTop then cursorKindModule.RoundedRectNoInset elseif join.hasRoundBottom then cursorKindModule.BulletDown elseif join.hasRoundTop then cursorKindModule.BulletUp else cursorKindModule.Square
		join = cryoModule.Dictionary.join(join, {
			cursorKind = var6,
			selectionOrder = p1.props.selectionOrder
		})
		t["cell " .. i] = withSelectionCursorProviderModule(function(p2)
			-- upvalues: roactModule (copy), p1 (ref), roactGamepadModule (copy), i (ref), v (ref), var6 (write), cellModule (copy), join (write)
			return roactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
				Size = UDim2.new(p1.props.width, UDim.new(0, p1.props.elementHeight)),
				BackgroundTransparency = 1,
				LayoutOrder = i,
				[roactModule.Ref] = p1.gamepadRefs[i],
				NextSelectionUp = if i > 1 then p1.gamepadRefs[i - 1] else nil,
				NextSelectionDown = if i < #p1.props.buttonProps then p1.gamepadRefs[i + 1] else nil,
				inputBindings = if p1.props.isRoactGamepadEnabled then {
					Activated = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, v.onActivated, { key = v.inputBindingKey })
				} else nil,
				SelectionImageObject = p2(var6)
			}, { Cell = roactModule.createElement(cellModule, join) })
		end)
	end
	t.layout = roactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return withStyleModule(function(p2)
		-- upvalues: setDefaultModule (copy), p1 (ref), var3 (write), t (ref), roactModule (copy), var2 (write), imageSetComponentModule (copy), dropshadow178 (copy), roundedFrameModule (copy), headerHeight (ref)
		local theme = p2.Theme
		local backgroundUIDefault = theme.BackgroundUIDefault
		local var7 = setDefaultModule(p1.props.background, {
			Color = backgroundUIDefault.Color,
			Transparency = backgroundUIDefault.Transparency
		})
		local isElementBackgroundVisible = p1.props.isElementBackgroundVisible
		local isElementBackgroundVisible_1 = var3 and (p1.props.topElementRounded and isElementBackgroundVisible)
		local isElementBackgroundVisible_2 = var3 and (p1.props.bottomElementRounded and isElementBackgroundVisible)
		local var8 = (if isElementBackgroundVisible_1 then 1 else 0) + (if isElementBackgroundVisible_2 then 1 else 0)
		local renderHeader = p1.props.renderHeader
		local var9 = if isElementBackgroundVisible_1 or not renderHeader then false else true
		
		return if p1.props.fixedListHeight then p1:renderFixedHeightMenu(p1.props, p2, t) else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.props.anchorPoint,
			LayoutOrder = p1.props.layoutOrder,
			Size = UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, var2),
			Position = p1.props.position
		}, {
			DropShadow = p1.props.showDropShadow and roactModule.createElement(imageSetComponentModule.Label, {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 16, 1, 16),
				Image = dropshadow178,
				ImageColor3 = p2.Theme.DropShadow.Color,
				ImageTransparency = p2.Theme.DropShadow.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(16, 16, 16, 16)
			}) or nil,
			Background = if isElementBackgroundVisible_1 or isElementBackgroundVisible_2 then roactModule.createElement(roundedFrameModule, {
				zIndex = -1,
				background = var7,
				topCornerRadius = if isElementBackgroundVisible_1 then UDim.new(0, p1.props.borderCornerRadius) else nil,
				bottomCornerRadius = if isElementBackgroundVisible_2 then UDim.new(0, p1.props.borderCornerRadius) else nil
			}) else nil,
			ClippingFrame = roactModule.createElement("Frame", {
				ZIndex = 3,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 1, -(p1.props.borderCornerRadius * var8)),
				Position = UDim2.fromScale(0, if isElementBackgroundVisible_1 then 0.5 else 0),
				AnchorPoint = Vector2.new(0, if isElementBackgroundVisible_1 then 0.5 else 0)
			}, {
				HeaderFrame = if var9 then roactModule.createElement("Frame", {
					Selectable = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, headerHeight),
					Position = UDim2.fromOffset(0, 0),
					AnchorPoint = Vector2.new(0, 0)
				}, { Header = renderHeader() }) else nil,
				ScrollingFrame = roactModule.createElement("ScrollingFrame", {
					[roactModule.Ref] = p1.props.setFrameRef,
					Selectable = false,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, if isElementBackgroundVisible_1 then -4 else 0, 1, if var9 then -headerHeight else 0),
					Position = if var9 then UDim2.fromOffset(0, headerHeight) else nil,
					BorderSizePixel = 0,
					ScrollBarThickness = if var3 then 4 else 0,
					ScrollBarImageColor3 = theme.UIEmphasis.Color,
					ScrollBarImageTransparency = theme.UIEmphasis.Transparency,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					CanvasSize = UDim2.new(1, 0, 0, #p1.props.buttonProps * p1.props.elementHeight),
					ClipsDescendants = var9
				}, t)
			})
		})
	end)
end

return function(p2)
	-- upvalues: useStyleModule (ref), cryoModule (ref), styleDefaultsModule (ref), reactModule (ref), baseMenu (ref)
	local var7 = p2
	
	if p2.enableTokenOverride then
		local var8 = useStyleModule()
		local t = {}
		
		for i, v in ipairs(p2.buttonProps) do
			t[i] = cryoModule.Dictionary.join(v, styleDefaultsModule.getCellDefaultTokens(var8))
		end
		var7 = cryoModule.Dictionary.join(var7, styleDefaultsModule.getBaseMenuDefaultTokens(var8), { buttonProps = t })
	end
	return reactModule.createElement(baseMenu, var7)
end