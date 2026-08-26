local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local core = parent_1.Core
local reactModule = require(parent_2.React)
local tModule = require(parent_2.t)
local otterModule = require(parent_2.Otter)
local cryoModule = require(parent_2.Cryo)
local roactGamepadModule = require(parent_2.RoactGamepad)
local focusable = roactGamepadModule.Focusable
local tileSlotModule = require(script.Parent.TileSlot)
local useStyleModule = require(core.Style.useStyle)
local cursorKindModule = require(parent.SelectionImage.CursorKind)
local useSelectionCursorModule = require(parent.SelectionImage.useSelectionCursor)
local t = { dampingRatio = 1, frequency = 10 }
local var1 = tModule.strictInterface({
	slots = tModule.array(tModule.strictInterface({
		displayText = tModule.optional(tModule.string),
		thumbnail = tModule.optional(tModule.string),
		isDisabled = tModule.optional(tModule.boolean),
		isLoading = tModule.optional(tModule.boolean)
	})),
	defaultSelectedSlotIndex = tModule.optional(tModule.integer),
	onChange = tModule.callback,
	width = tModule.optional(tModule.integer),
	darken = tModule.optional(tModule.boolean),
	onInputBegan = tModule.optional(tModule.callback),
	onInputEnded = tModule.optional(tModule.callback),
	scrollingFrameRef = tModule.optional(tModule.table),
	onFocusChanged = tModule.optional(tModule.callback),
	inputBindings = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})

local function useScrollingFrameMotor(p1, p2)
	-- upvalues: reactModule (ref), otterModule (ref)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var2.current = otterModule.createSingleMotor(p2 or 0)
	end
	local current = var2.current
	reactModule.useEffect(function()
		-- upvalues: current (ref), p1 (ref)
		current:onStep(function(p3)
			-- upvalues: p1 (copy)
			if p1.current ~= nil then
				p1.current.CanvasPosition = Vector2.new(p3, 0)
			end
		end)
		
		return function()
			-- upvalues: current (copy)
			current:destroy()
		end
	end, {})
	
	return current
end

return function(p1)
	-- upvalues: reactModule (ref), roactGamepadModule (ref), useScrollingFrameMotor (ref), otterModule (ref), t (ref), useStyleModule (ref), useSelectionCursorModule (ref), cursorKindModule (ref), var1 (ref), cryoModule (ref), focusable (ref), tileSlotModule (ref)
	local var2 = p1.isRoactGamepadEnabled ~= nil or p1.isRoactGamepadEnabled
	local var3 = if var2 then roactGamepadModule.useRefCache() else reactModule.useRef({}).current
	local var4 = if p1.scrollingFrameRef then p1.scrollingFrameRef else reactModule.useRef(nil)
	local width = p1.width or 360
	local var5 = useScrollingFrameMotor(var4, 0)
	local var6, var7 = reactModule.useState(p1.defaultSelectedSlotIndex or 1)
	reactModule.useEffect(function()
		-- upvalues: var4 (write), var6 (ref), var3 (ref), width (ref), var5 (ref), otterModule (copy), t (copy)
		local current = var4.current
		
		if var6 == 0 or not current then return end
		local current_1 = var3[var6] and var3[var6].current
		
		if not current_1 then return end
		local x = current.CanvasPosition.X
		local x_1 = current.AbsolutePosition.X
		local x_2 = current_1.AbsolutePosition.X
		local var8 = x + (x_2 + 48 + 24 - (x_1 + width))
		local var9 = x + (x_2 - 24 - x_1)
		
		if x < var8 then
			var5:setGoal(otterModule.spring(var8, t))
			
			return
		elseif var9 < x then
			var5:setGoal(otterModule.spring(var9, t))
		end
	end, {
		var6,
		width,
		var3,
		var4,
		var5
	})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), p1 (ref)
		var7(p2)
		p1.onChange(p2)
	end, { p1.onChange })
	local var9 = #p1.slots * 48 + (#p1.slots - 1) * 12 + 48
	local var10 = useStyleModule()
	local var11 = useSelectionCursorModule(cursorKindModule.RoundedSlot)
	assert(var1(p1))
	local theme = var10.Theme
	local var12 = cryoModule.List.map(p1.slots, function(p2, p3)
		-- upvalues: var2 (ref), var3 (ref), reactModule (copy), focusable (copy), p1 (ref), var8 (ref), var11 (ref), tileSlotModule (copy), var6 (ref)
		if not var2 then
			var3[p3] = var3[p3] or reactModule.createRef()
		end
		return reactModule.createElement(if var2 then focusable.Frame else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 2,
			key = "Slot" .. tostring(p3),
			LayoutOrder = p3,
			Size = UDim2.fromOffset(48, 48),
			ref = var3[p3],
			NextSelectionRight = if p3 < #p1.slots then var3[p3 + 1] else nil,
			NextSelectionLeft = if p3 > 1 then var3[p3 - 1] else nil,
			onFocusGained = if var2 then function()
				-- upvalues: var8 (copy), p3 (ref)
				var8(p3)
			end else nil,
			SelectionImageObject = var11
		}, {
			Slot = reactModule.createElement(tileSlotModule, {
				isSelected = var6 == p3,
				displayText = p2.displayText,
				thumbnail = p2.thumbnail,
				isLoading = p2.isLoading,
				isDisabled = p2.isDisabled,
				index = p3,
				onActivated = var8
			})
		})
	end)
	table.insert(var12, reactModule.createElement("UIListLayout", {
		key = "Layout",
		VerticalAlignment = Enum.VerticalAlignment.Center,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 12)
	}))
	
	return reactModule.createElement(if var2 then focusable.ScrollingFrame else "ScrollingFrame", {
		Size = UDim2.fromOffset(width, 72),
		CanvasSize = UDim2.new(0, var9, 0, 72),
		BackgroundTransparency = 1,
		ScrollBarImageColor3 = theme.PlaceHolder.Color,
		ScrollBarImageTransparency = theme.PlaceHolder.Transparency,
		ScrollBarThickness = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ref = var4,
		[reactModule.Event.InputBegan] = p1.onInputBegan,
		[reactModule.Event.InputEnded] = p1.onInputEnded,
		onFocusChanged = if var2 then p1.onFocusChanged else nil,
		inputBindings = if var2 then p1.inputBindings else nil,
		NextSelectionDown = p1.NextSelectionDown,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionLeft = p1.NextSelectionLeft,
		NextSelectionRight = p1.NextSelectionRight,
		defaultChild = if var2 then var3[1] else nil,
		restorePreviousChildFocus = if var2 then true else nil
	}, {
		SlotContainer = reactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if p1.darken then theme.Overlay.Color else theme.PlaceHolder.Color,
			BackgroundTransparency = if p1.darken then theme.Overlay.Transparency else theme.PlaceHolder.Transparency
		}, var12)
	})
end