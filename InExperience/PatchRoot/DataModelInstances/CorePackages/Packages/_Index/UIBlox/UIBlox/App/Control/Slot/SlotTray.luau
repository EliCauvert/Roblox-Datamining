local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local TModule = require(Parent2.t)
local OtterModule = require(Parent2.Otter)
local CryoModule = require(Parent2.Cryo)
local RoactGamepadModule = require(Parent2.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local TileSlotModule = require(script.Parent.TileSlot)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local CursorKindModule = require(Parent.SelectionImage.CursorKind)
local UseSelectionCursorModule = require(Parent.SelectionImage.useSelectionCursor)
local config = { dampingRatio = 1, frequency = 10 }
local StrictInterfaceResult = TModule.strictInterface({
	slots = TModule.array((TModule.strictInterface({
		displayText = TModule.optional(TModule.string),
		thumbnail = TModule.optional(TModule.string),
		isDisabled = TModule.optional(TModule.boolean),
		isLoading = TModule.optional(TModule.boolean)
	}))),
	defaultSelectedSlotIndex = TModule.optional(TModule.integer),
	onChange = TModule.callback,
	width = TModule.optional(TModule.integer),
	darken = TModule.optional(TModule.boolean),
	onInputBegan = TModule.optional(TModule.callback),
	onInputEnded = TModule.optional(TModule.callback),
	scrollingFrameRef = TModule.optional(TModule.table),
	onFocusChanged = TModule.optional(TModule.callback),
	inputBindings = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})

local function useScrollingFrameMotor(ScrollingFrameRef, p1) --[[ Line: 117 ]]
	-- upvalues: ReactModule (copy), OtterModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = OtterModule.createSingleMotor(p1 or 0)
	end
	local Current = UseRefResult.current
	ReactModule.useEffect(function() --[[ Line: 123 ]]
		-- upvalues: Current (copy), ScrollingFrameRef (copy)
		Current:onStep(function(X) --[[ Line: 124 ]]
			-- upvalues: ScrollingFrameRef (upval)
			if ScrollingFrameRef.current ~= nil then
				ScrollingFrameRef.current.CanvasPosition = Vector2.new(X, 0)
			end
		end)
		
		return function() --[[ Line: 130 ]]
			-- upvalues: Current (upval)
			Current:destroy()
		end
	end, {})
	
	return Current
end

return function(Gui) --[[ Line: 138 | Named "SlotTray" ]]
	-- upvalues: ReactModule (copy), RoactGamepadModule (copy), useScrollingFrameMotor (copy), OtterModule (copy), config (copy), UseStyleModule (copy), UseSelectionCursorModule (copy), CursorKindModule (copy), StrictInterfaceResult (copy), CryoModule (copy), Focusable (copy), TileSlotModule (copy)
	local NoIsRoactGamepadEnabled = Gui.isRoactGamepadEnabled == nil or Gui.isRoactGamepadEnabled
	local UseRefResult = ReactModule.useRef({})
	local UseRefCacheResult = if NoIsRoactGamepadEnabled then RoactGamepadModule.useRefCache() else UseRefResult.current
	local ScrollingFrameRef = if Gui.scrollingFrameRef then Gui.scrollingFrameRef else ReactModule.useRef(nil)
	local Width = Gui.width or 360
	local UseScrollingFrameMotorResult = useScrollingFrameMotor(ScrollingFrameRef, 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Gui.defaultSelectedSlotIndex or 1)
	ReactModule.useEffect(function() --[[ Line: 155 ]]
		-- upvalues: ScrollingFrameRef (ref), UseStateResult (copy), UseRefCacheResult (copy), Width (copy), UseScrollingFrameMotorResult (copy), OtterModule (upval), config (upval)
		local Current = ScrollingFrameRef.current
		
		if UseStateResult == 0 or not Current then return end
		local Current1 = UseRefCacheResult[UseStateResult] and UseRefCacheResult[UseStateResult].current
		
		if not Current1 then return end
		local X = Current.CanvasPosition.X
		local X1 = Current.AbsolutePosition.X
		local X2: number = Current1.AbsolutePosition.X
		local NewX = X + (X2 + 48 + 24 - (X1 + Width))
		local NewX1 = X + (X2 - 24 - X1)
		
		if X < NewX then
			UseScrollingFrameMotorResult:setGoal(OtterModule.spring(NewX, config))
			
			return
		end
		if NewX1 < X then
			UseScrollingFrameMotorResult:setGoal(OtterModule.spring(NewX1, config))
		end
	end, {
		UseStateResult,
		Width,
		UseRefCacheResult,
		ScrollingFrameRef,
		UseScrollingFrameMotorResult
	})
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 187 ]]
		-- upvalues: UseStateResult2 (copy), Gui (copy)
		UseStateResult2(p1)
		Gui.onChange(p1)
	end, { Gui.onChange })
	local XOffset = #Gui.slots * 48 + (#Gui.slots - 1) * 12 + 48
	local UseStyleModuleResult = UseStyleModule()
	local UseSelectionCursorModuleResult = UseSelectionCursorModule(CursorKindModule.RoundedSlot)
	assert(StrictInterfaceResult(Gui))
	local Theme = UseStyleModuleResult.Theme
	local MapResult = CryoModule.List.map(Gui.slots, function(p1, Index: number) --[[ Line: 200 ]]
		-- upvalues: NoIsRoactGamepadEnabled (copy), UseRefCacheResult (copy), ReactModule (upval), Focusable (upval), Gui (copy), UseResult (copy), UseSelectionCursorModuleResult (copy), TileSlotModule (upval), UseStateResult (copy)
		if not NoIsRoactGamepadEnabled then
			UseRefCacheResult[Index] = UseRefCacheResult[Index] or ReactModule.createRef()
		end
		return ReactModule.createElement(if NoIsRoactGamepadEnabled then Focusable.Frame else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 2,
			key = "Slot" .. tostring(Index),
			LayoutOrder = Index,
			Size = UDim2.fromOffset(48, 48),
			ref = UseRefCacheResult[Index],
			NextSelectionRight = Index < #Gui.slots and UseRefCacheResult[Index + 1] or nil,
			NextSelectionLeft = Index > 1 and UseRefCacheResult[Index - 1] or nil,
			onFocusGained = if NoIsRoactGamepadEnabled then function() --[[ Line: 215 ]]
				-- upvalues: UseResult (upval), Index (copy)
				UseResult(Index)
			end else nil,
			SelectionImageObject = UseSelectionCursorModuleResult
		}, {
			Slot = ReactModule.createElement(TileSlotModule, {
				isSelected = UseStateResult == Index,
				displayText = p1.displayText,
				thumbnail = p1.thumbnail,
				isLoading = p1.isLoading,
				isDisabled = p1.isDisabled,
				index = Index,
				onActivated = UseResult
			})
		})
	end)
	table.insert(MapResult, (ReactModule.createElement("UIListLayout", {
		key = "Layout",
		VerticalAlignment = Enum.VerticalAlignment.Center,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 12)
	})))
	
	return ReactModule.createElement(if NoIsRoactGamepadEnabled then Focusable.ScrollingFrame else "ScrollingFrame", {
		Size = UDim2.fromOffset(Width, 72),
		CanvasSize = UDim2.new(0, XOffset, 0, 72),
		BackgroundTransparency = 1,
		ScrollBarImageColor3 = Theme.PlaceHolder.Color,
		ScrollBarImageTransparency = Theme.PlaceHolder.Transparency,
		ScrollBarThickness = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ref = ScrollingFrameRef,
		[ReactModule.Event.InputBegan] = Gui.onInputBegan,
		[ReactModule.Event.InputEnded] = Gui.onInputEnded,
		onFocusChanged = if NoIsRoactGamepadEnabled then Gui.onFocusChanged else nil,
		inputBindings = if NoIsRoactGamepadEnabled then Gui.inputBindings else nil,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionLeft = Gui.NextSelectionLeft,
		NextSelectionRight = Gui.NextSelectionRight,
		defaultChild = if NoIsRoactGamepadEnabled then UseRefCacheResult[1] else nil,
		restorePreviousChildFocus = if NoIsRoactGamepadEnabled then true else nil
	}, {
		SlotContainer = ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = if Gui.darken then Theme.Overlay.Color else Theme.PlaceHolder.Color,
			BackgroundTransparency = if Gui.darken then Theme.Overlay.Transparency else Theme.PlaceHolder.Transparency
		}, MapResult)
	})
end