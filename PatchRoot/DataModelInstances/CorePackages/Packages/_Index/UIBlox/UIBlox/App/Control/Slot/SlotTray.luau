-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:53 2026 Pacific Standard Time.

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
local var10 = tModule.strictInterface({
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

local function useScrollingFrameMotor(p0, p1) --[[ line: 117 ]]
	-- upvalues: reactModule (ref), otterModule (ref)
	local var12 = reactModule.useRef(nil)
	
	if var12.current == nil then
		var12.current = otterModule.createSingleMotor(p1 or 0)
	end
	local current = var12.current
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: current (ref), p0 (ref)
		current:onStep(function(p2) --[[ line: 124 ]]
			-- upvalues: p0 (copy)
			if p0.current ~= nil then
				p0.current.CanvasPosition = Vector2.new(p2, 0)
			end
		end)
		
		return function() --[[ line: 130 ]]
			-- upvalues: current (copy)
			current:destroy()
		end
	end, {})
	
	return current
end

return function(p3) --[[ line: 138 | named "SlotTray" ]]
	-- upvalues: reactModule (ref), roactGamepadModule (ref), useScrollingFrameMotor (ref), otterModule (ref), t (ref), useStyleModule (ref), useSelectionCursorModule (ref), cursorKindModule (ref), var10 (ref), cryoModule (ref), focusable (ref), tileSlotModule (ref)
	local var13 = p3.isRoactGamepadEnabled ~= nil or p3.isRoactGamepadEnabled
	local var14 = if var13 then roactGamepadModule.useRefCache() else reactModule.useRef({}).current
	local var15 = if p3.scrollingFrameRef then p3.scrollingFrameRef else reactModule.useRef(nil)
	local width = p3.width or 360
	local var17 = useScrollingFrameMotor(var15, 0)
	local var18, var19 = reactModule.useState(p3.defaultSelectedSlotIndex or 1)
	reactModule.useEffect(function() --[[ line: 155 ]]
		-- upvalues: var15 (write), var18 (ref), var14 (ref), width (ref), var17 (ref), otterModule (copy), t (copy)
		local current = var15.current
		
		if var18 == 0 or not current then return end
		local current_1 = var14[var18] and var14[var18].current
		
		if not current_1 then return end
		local x = current.CanvasPosition.X
		local x_1 = current.AbsolutePosition.X
		local x_2 = current_1.AbsolutePosition.X
		local var26 = x + (x_2 + 48 + 24 - (x_1 + width))
		local var27 = x + (x_2 - 24 - x_1)
		
		if x < var26 then
			var17:setGoal(otterModule.spring(var26, t))
			
			return
		elseif var27 < x then
			var17:setGoal(otterModule.spring(var27, t))
		end
	end, {
		var18,
		width,
		var14,
		var15,
		var17
	})
	local var20 = reactModule.useCallback(function(p4) --[[ line: 187 ]]
		-- upvalues: var19 (ref), p3 (ref)
		var19(p4)
		p3.onChange(p4)
	end, { p3.onChange })
	local var21 = #p3.slots * 48 + (#p3.slots - 1) * 12 + 48
	local var22 = useStyleModule()
	local var23 = useSelectionCursorModule(cursorKindModule.RoundedSlot)
	assert(var10(p3))
	local theme = var22.Theme
	local var24 = cryoModule.List.map(p3.slots, function(p5, p6) --[[ line: 200 ]]
		-- upvalues: var13 (ref), var14 (ref), reactModule (copy), focusable (copy), p3 (ref), var20 (ref), var23 (ref), tileSlotModule (copy), var18 (ref)
		if not var13 then
			var14[p6] = var14[p6] or reactModule.createRef()
		end
		return reactModule.createElement(if var13 then focusable.Frame else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 2,
			key = "Slot" .. tostring(p6),
			LayoutOrder = p6,
			Size = UDim2.fromOffset(48, 48),
			ref = var14[p6],
			NextSelectionRight = if p6 < #p3.slots then var14[p6 + 1] else nil,
			NextSelectionLeft = if p6 > 1 then var14[p6 - 1] else nil,
			onFocusGained = if var13 then function() --[[ line: 215 ]]
				-- upvalues: var20 (copy), p6 (ref)
				var20(p6)
			end else nil,
			SelectionImageObject = var23
		}, {
			Slot = reactModule.createElement(tileSlotModule, {
				isSelected = var18 == p6,
				displayText = p5.displayText,
				thumbnail = p5.thumbnail,
				isLoading = p5.isLoading,
				isDisabled = p5.isDisabled,
				index = p6,
				onActivated = var20
			})
		})
	end)
	table.insert(var24, reactModule.createElement("UIListLayout", {
		key = "Layout",
		VerticalAlignment = Enum.VerticalAlignment.Center,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 12)
	}))
	
	return reactModule.createElement(if var13 then focusable.ScrollingFrame else "ScrollingFrame", {
		Size = UDim2.fromOffset(width, 72),
		CanvasSize = UDim2.new(0, var21, 0, 72),
		BackgroundTransparency = 1,
		ScrollBarImageColor3 = theme.PlaceHolder.Color,
		ScrollBarImageTransparency = theme.PlaceHolder.Transparency,
		ScrollBarThickness = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ref = var15,
		[reactModule.Event.InputBegan] = p3.onInputBegan,
		[reactModule.Event.InputEnded] = p3.onInputEnded,
		onFocusChanged = if var13 then p3.onFocusChanged else nil,
		inputBindings = if var13 then p3.inputBindings else nil,
		NextSelectionDown = p3.NextSelectionDown,
		NextSelectionUp = p3.NextSelectionUp,
		NextSelectionLeft = p3.NextSelectionLeft,
		NextSelectionRight = p3.NextSelectionRight,
		defaultChild = if var13 then var14[1] else nil,
		restorePreviousChildFocus = if var13 then true else nil
	}, {
		SlotContainer = reactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if p3.darken then theme.Overlay.Color else theme.PlaceHolder.Color,
			BackgroundTransparency = if p3.darken then theme.Overlay.Transparency else theme.PlaceHolder.Transparency
		}, var24)
	})
end