local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local popForcePickerModelModule = require(script.Parent.PopForcePickerModel)
local popForcePickerStoreModule = require(script.Parent.PopForcePickerStore)
local popForcePickerViewModule = require(script.Parent.PopForcePickerView)
local navigateBack = focusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
local t = {
	[Enum.KeyCode.ButtonB] = navigateBack,
	[Enum.KeyCode.Escape] = navigateBack
}

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), popForcePickerStoreModule (ref), signalsReactModule (ref), foundationModule (ref), navigateBack (ref), inputHandlersModule (ref), focusNavigationUtilsModule (ref), t (ref), popForcePickerModelModule (ref), popForcePickerViewModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), popForcePickerStoreModule (copy)
		local store = p1.store
		
		if not store then
			if p1.getService then
				return popForcePickerStoreModule.createStore(p1.getService)
			end
			store = popForcePickerStoreModule.getStore(false)
		end
		return store
	end, { p1.store, p1.getService })
	local var2 = signalsReactModule.useSignalState(var1.getSelection)
	local var3 = signalsReactModule.useSignalState(var1.getSupported)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState({})
	local var11, var12 = reactModule.useState(nil)
	local var13 = foundationModule.Hooks.useTokens()
	local var14 = foundationModule.Hooks.useOverlay()
	local var15, var16 = reactModule.useState(Vector2.new(1024, 768))
	local var17, var18 = reactModule.useState(0)
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref)
		var18(p2.AbsoluteCanvasSize.Y)
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: var14 (ref), var5 (ref), var16 (ref)
		if var14 and var5 then
			local function updateSize()
				-- upvalues: var16 (copy), var14 (copy)
				var16(var14.AbsoluteSize)
			end
			
			var16(var14.AbsoluteSize)
			local var20 = var14:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSize)
			
			return function()
				-- upvalues: var20 (ref)
				var20:Disconnect()
			end
		end
		return nil
	end, { var14, var5 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.refresh()
	end, { var1 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(false)
	end, {})
	local var21 = reactModule.useMemo(function()
		-- upvalues: popForcePickerModelModule (copy), var9 (ref), var2 (ref)
		return popForcePickerModelModule.buildRoster(var9, var2)
	end, { var9, var2 })
	
	return if var3 then reactModule.createElement(popForcePickerViewModule, {
		LayoutOrder = p1.LayoutOrder,
		compact = p1.compact,
		forcedPop = var2,
		rows = popForcePickerModelModule.getVisibleRoster(var21, var2, var7),
		hasMore = #var21 > 5,
		showAll = var7,
		isOpen = var5,
		errorText = var11,
		tokens = var13,
		anchorRef = var4,
		menuSize = Vector2.new(math.min(var13.Size.Size_1200 * 7, math.max(1, var15.X - var13.Margin.Medium * 2)), math.min(var17, math.max(1, var15.Y - var13.Margin.Medium * 2))),
		onCanvasSizeChanged = var19,
		focusRef = focusNavigationUtilsModule.useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = var5 and var3,
			eventMap = t,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: navigateBack (copy), inputHandlersModule (copy), var20 (ref)
				return {
					[navigateBack] = {
						phase = "Bubble",
						handler = inputHandlersModule.onRelease(function(p2)
							-- upvalues: var20 (copy)
							var20()
							p2:cancel()
						end)
					}
				}
			end, { var20 })
		}),
		onToggleMenu = reactModule.useCallback(function()
			-- upvalues: var5 (ref), var20 (ref), var1 (ref), var10 (ref), var8 (ref), var12 (ref), var6 (ref)
			if var5 then
				var20()
				
				return
			end
			var1.refresh()
			var10(var1.getSnapshot() or {})
			var8(false)
			var12(nil)
			var6(true)
		end, { var5, var20, var1 }),
		onClose = var20,
		onSelect = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), var20 (ref), var12 (ref)
			if var1.select(p2) then
				var20()
				
				return
			end
			var12("Could not save this location. Try again.")
		end, { var1, var20 }),
		onToggleShowAll = reactModule.useCallback(function()
			-- upvalues: var8 (ref)
			var8(function(p2)
				return not p2
			end)
		end, {})
	}) else nil
end)