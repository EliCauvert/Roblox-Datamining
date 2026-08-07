-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:56 2026 Pacific Standard Time.

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

function baseMenu.init(p0) --[[ line: 98 ]]
	-- upvalues: roactGamepadModule (ref)
	p0.gamepadRefs = p0.props.isRoactGamepadEnabled and roactGamepadModule.createRefCache() or {}
end

function baseMenu.renderFixedHeightMenu(_, p1, p2, p3) --[[ line: 102 ]]
	-- upvalues: setDefaultModule (ref), roactModule (ref), imageSetComponentModule (ref), dropshadow178 (ref), verticalScrollViewModule (ref)
	local fixedListHeight = p1.fixedListHeight
	local var19 = setDefaultModule(p1.borderCornerRadius, 8)
	local backgroundUIDefault = p2.Theme.BackgroundUIDefault
	local var20 = setDefaultModule(p1.background, {
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
			BackgroundColor3 = var20.Color,
			BackgroundTransparency = var20.Transparency
		}, {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var19) }),
			ClippingFrame = roactModule.createElement("Frame", {
				ZIndex = 4,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 1, -var19 * 2),
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

function baseMenu.render(p4) --[[ line: 157 ]]
	-- upvalues: cryoModule (ref), roactModule (ref), cursorKindModule (ref), withSelectionCursorProviderModule (ref), roactGamepadModule (ref), cellModule (ref), withStyleModule (ref), setDefaultModule (ref), imageSetComponentModule (ref), dropshadow178 (ref), roundedFrameModule (ref)
	local headerHeight = p4.props.headerHeight
	local var21 = p4.props.elementHeight * 7.5 + headerHeight
	local var22 = #p4.props.buttonProps * p4.props.elementHeight + headerHeight
	local var23 = false
	
	if var21 <= var22 then
		var22 = var21
		var23 = true
	end
	local maxHeight = p4.props.maxHeight
	
	if maxHeight and maxHeight > 0 and maxHeight < var22 then
		var22 = (math.max(math.floor((maxHeight - p4.props.elementHeight * 0.5 - headerHeight) / p4.props.elementHeight), 1) + 0.5) * p4.props.elementHeight + headerHeight
		var23 = true
	end
	local t = {}
	
	for i, v in ipairs(p4.props.buttonProps) do
		local var27
		local join = cryoModule.Dictionary.join
		local var25 = v
		local t_1 = {
			elementHeight = p4.props.elementHeight,
			hasRoundTop = p4.props.topElementRounded and (i == 1 and not var23),
			hasRoundBottom = p4.props.bottomElementRounded and (i == #p4.props.buttonProps and not var23)
		}
		
		if p4.props.isElementDividerVisible then
			var27 = i < #p4.props.buttonProps
			var27 = nil
		else
			var27 = false
		end
		t_1.hasDivider = var27
		t_1.layoutOrder = i
		t_1.inputBindingKey = cryoModule.None
		t_1.setButtonRef = if i == 1 then p4.props.setFirstItemRef else nil
		t_1.isElementBackgroundVisible = p4.props.isElementBackgroundVisible
		t_1.borderCornerRadius = p4.props.borderCornerRadius
		t_1.background = p4.props.background
		join = join(var25, t_1)
		
		if not p4.props.isRoactGamepadEnabled then
			p4.gamepadRefs[i] = p4.gamepadRefs[i] or roactModule.createRef()
		end
		local _ = nil
		local var28 = if join.hasRoundBottom and join.hasRoundTop then cursorKindModule.RoundedRectNoInset elseif join.hasRoundBottom then cursorKindModule.BulletDown elseif join.hasRoundTop then cursorKindModule.BulletUp else cursorKindModule.Square
		join = cryoModule.Dictionary.join(join, {
			cursorKind = var28,
			selectionOrder = p4.props.selectionOrder
		})
		t["cell " .. i] = withSelectionCursorProviderModule(function(p5) --[[ line: 212 ]]
			-- upvalues: roactModule (copy), p4 (ref), roactGamepadModule (copy), i (ref), v (ref), var28 (write), cellModule (copy), join (write)
			return roactModule.createElement(if p4.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
				Size = UDim2.new(p4.props.width, UDim.new(0, p4.props.elementHeight)),
				BackgroundTransparency = 1,
				LayoutOrder = i,
				[roactModule.Ref] = p4.gamepadRefs[i],
				NextSelectionUp = if i > 1 then p4.gamepadRefs[i - 1] else nil,
				NextSelectionDown = if i < #p4.props.buttonProps then p4.gamepadRefs[i + 1] else nil,
				inputBindings = if p4.props.isRoactGamepadEnabled then {
					Activated = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, v.onActivated, { key = v.inputBindingKey })
				} else nil,
				SelectionImageObject = p5(var28)
			}, { Cell = roactModule.createElement(cellModule, join) })
		end)
	end
	t.layout = roactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return withStyleModule(function(p6) --[[ line: 245 ]]
		-- upvalues: setDefaultModule (copy), p4 (ref), var23 (write), t (ref), roactModule (copy), var22 (write), imageSetComponentModule (copy), dropshadow178 (copy), roundedFrameModule (copy), headerHeight (ref)
		local theme = p6.Theme
		local backgroundUIDefault = theme.BackgroundUIDefault
		local var29 = setDefaultModule(p4.props.background, {
			Color = backgroundUIDefault.Color,
			Transparency = backgroundUIDefault.Transparency
		})
		local isElementBackgroundVisible = p4.props.isElementBackgroundVisible
		local isElementBackgroundVisible_1 = var23 and (p4.props.topElementRounded and isElementBackgroundVisible)
		local isElementBackgroundVisible_2 = var23 and (p4.props.bottomElementRounded and isElementBackgroundVisible)
		local var32 = (if isElementBackgroundVisible_1 then 1 else 0) + (if isElementBackgroundVisible_2 then 1 else 0)
		local renderHeader = p4.props.renderHeader
		local var33 = if isElementBackgroundVisible_1 or not renderHeader then false else true
		
		return if p4.props.fixedListHeight then p4:renderFixedHeightMenu(p4.props, p6, t) else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p4.props.anchorPoint,
			LayoutOrder = p4.props.layoutOrder,
			Size = UDim2.new(p4.props.width.Scale, p4.props.width.Offset, 0, var22),
			Position = p4.props.position
		}, {
			DropShadow = p4.props.showDropShadow and roactModule.createElement(imageSetComponentModule.Label, {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 16, 1, 16),
				Image = dropshadow178,
				ImageColor3 = p6.Theme.DropShadow.Color,
				ImageTransparency = p6.Theme.DropShadow.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(16, 16, 16, 16)
			}) or nil,
			Background = if isElementBackgroundVisible_1 or isElementBackgroundVisible_2 then roactModule.createElement(roundedFrameModule, {
				zIndex = -1,
				background = var29,
				topCornerRadius = if isElementBackgroundVisible_1 then UDim.new(0, p4.props.borderCornerRadius) else nil,
				bottomCornerRadius = if isElementBackgroundVisible_2 then UDim.new(0, p4.props.borderCornerRadius) else nil
			}) else nil,
			ClippingFrame = roactModule.createElement("Frame", {
				ZIndex = 3,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 1, -(p4.props.borderCornerRadius * var32)),
				Position = UDim2.fromScale(0, if isElementBackgroundVisible_1 then 0.5 else 0),
				AnchorPoint = Vector2.new(0, if isElementBackgroundVisible_1 then 0.5 else 0)
			}, {
				HeaderFrame = if var33 then roactModule.createElement("Frame", {
					Selectable = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, headerHeight),
					Position = UDim2.fromOffset(0, 0),
					AnchorPoint = Vector2.new(0, 0)
				}, { Header = renderHeader() }) else nil,
				ScrollingFrame = roactModule.createElement("ScrollingFrame", {
					[roactModule.Ref] = p4.props.setFrameRef,
					Selectable = false,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, if isElementBackgroundVisible_1 then -4 else 0, 1, if var33 then -headerHeight else 0),
					Position = if var33 then UDim2.fromOffset(0, headerHeight) else nil,
					BorderSizePixel = 0,
					ScrollBarThickness = if var23 then 4 else 0,
					ScrollBarImageColor3 = theme.UIEmphasis.Color,
					ScrollBarImageTransparency = theme.UIEmphasis.Transparency,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					CanvasSize = UDim2.new(1, 0, 0, #p4.props.buttonProps * p4.props.elementHeight),
					ClipsDescendants = var33
				}, t)
			})
		})
	end)
end

return function(p7) --[[ line: 341 | named "BaseMenuFn" ]]
	-- upvalues: useStyleModule (ref), cryoModule (ref), styleDefaultsModule (ref), reactModule (ref), baseMenu (ref)
	local var34 = p7
	
	if p7.enableTokenOverride then
		local var35 = useStyleModule()
		local t = {}
		
		for i, v in ipairs(p7.buttonProps) do
			t[i] = cryoModule.Dictionary.join(v, styleDefaultsModule.getCellDefaultTokens(var35))
		end
		var34 = cryoModule.Dictionary.join(var34, styleDefaultsModule.getBaseMenuDefaultTokens(var35), { buttonProps = t })
	end
	return reactModule.createElement(baseMenu, var34)
end