local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local PopForcePickerModelModule = require(script.Parent.PopForcePickerModel)
local PopForcePickerStoreModule = require(script.Parent.PopForcePickerStore)
local PopForcePickerViewModule = require(script.Parent.PopForcePickerView)
local NavigateBack = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
local EventMap = {
	[Enum.KeyCode.ButtonB] = NavigateBack,
	[Enum.KeyCode.Escape] = NavigateBack
}

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), PopForcePickerStoreModule (copy), SignalsReactModule (copy), FoundationModule (copy), NavigateBack (copy), InputHandlersModule (copy), FocusNavigationUtilsModule (copy), EventMap (copy), PopForcePickerModelModule (copy), PopForcePickerViewModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), PopForcePickerStoreModule (upval)
		local Store = Frame.store
		
		if not Store then
			if Frame.getService then
				return (PopForcePickerStoreModule.createStore(Frame.getService))
			end
			Store = PopForcePickerStoreModule.getStore(false)
		end
		return Store
	end, { Frame.store, Frame.getService })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.getSelection)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.getSupported)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(Vector2.new(1024, 768))
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseStateResult2_5 (copy)
		UseStateResult2_5(ScrollFrame.AbsoluteCanvasSize.Y)
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseOverlayResult (copy), UseStateResult (copy), UseStateResult2_4 (copy)
		if UseOverlayResult and UseStateResult then
			local function updateSize()
				-- upvalues: UseStateResult2_4 (upval), UseOverlayResult (upval)
				UseStateResult2_4(UseOverlayResult.AbsoluteSize)
			end
			
			UseStateResult2_4(UseOverlayResult.AbsoluteSize)
			local Connection = UseOverlayResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSize)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		else
			return nil
		end
	end, { UseOverlayResult, UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.refresh()
	end, { UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseFocusRootResult = FocusNavigationUtilsModule.useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = UseStateResult and UseSignalStateResult1,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: NavigateBack (upval), InputHandlersModule (upval), UseResult1 (copy)
			return {
				[NavigateBack] = {
					phase = "Bubble",
					handler = InputHandlersModule.onRelease(function(p1)
						-- upvalues: UseResult1 (upval)
						UseResult1()
						p1:cancel()
					end)
				}
			}
		end, { UseResult1 })
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseResult1 (copy), UseMemoResult (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy), UseStateResult2 (copy)
		if UseStateResult then
			UseResult1()
			
			return
		else
			UseMemoResult.refresh()
			UseStateResult2_2(UseMemoResult.getSnapshot() or {})
			UseStateResult2_1(false)
			UseStateResult2_3(nil)
			UseStateResult2(true)
		end
	end, { UseStateResult, UseResult1, UseMemoResult })
	local UseResult3 = ReactModule.useCallback(function(p1)
		-- upvalues: UseMemoResult (copy), UseResult1 (copy), UseStateResult2_3 (copy)
		if UseMemoResult.select(p1) then
			UseResult1()
			
			return
		else
			UseStateResult2_3("Could not save this location. Try again.")
		end
	end, { UseMemoResult, UseResult1 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(function(p1): boolean
			return not p1
		end)
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: PopForcePickerModelModule (upval), UseStateResult3 (copy), UseSignalStateResult (copy)
		return PopForcePickerModelModule.buildRoster(UseStateResult3, UseSignalStateResult)
	end, { UseStateResult3, UseSignalStateResult })
	local VisibleRoster = PopForcePickerModelModule.getVisibleRoster(UseMemoResult1, UseSignalStateResult, UseStateResult1)
	
	return if UseSignalStateResult1 then ReactModule.createElement(PopForcePickerViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		compact = Frame.compact,
		forcedPop = UseSignalStateResult,
		rows = VisibleRoster,
		hasMore = #UseMemoResult1 > 5,
		showAll = UseStateResult1,
		isOpen = UseStateResult,
		errorText = UseStateResult4,
		tokens = UseTokensResult,
		anchorRef = UseRefResult,
		menuSize = Vector2.new(math.min(UseTokensResult.Size.Size_1200 * 7, (math.max(1, UseStateResult5.X - UseTokensResult.Margin.Medium * 2))), (math.min(UseStateResult6, (math.max(1, UseStateResult5.Y - UseTokensResult.Margin.Medium * 2))))),
		onCanvasSizeChanged = UseResult,
		focusRef = UseFocusRootResult,
		onToggleMenu = UseResult2,
		onClose = UseResult1,
		onSelect = UseResult3,
		onToggleShowAll = UseResult4
	}) else nil
end)