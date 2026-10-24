local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local Sheet = require(Parent.Foundation).Sheet
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), Sheet (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { p1.isOpen })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(true)
		
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	local NoUseStateResult: boolean = p1.isOpen ~= false and not UseStateResult
	
	return ReactModule.createElement(Sheet.Root, {
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			isFocusable = NoUseStateResult,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2)
							-- upvalues: UseResult (upval)
							UseResult()
							p2:cancel()
						end)
					}
				}
			end, { UseResult })
		}),
		isOpen = NoUseStateResult,
		preferCenterSheet = p1.preferCenterSheet,
		size = p1.size,
		onClose = UseResult,
		centerSheetHeight = p1.centerSheetHeight,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		onSnapPointChanged = if p1.onSnapPointChanged then function(SnapPoint, SnapPointIndex)
			-- upvalues: p1 (copy)
			p1.onSnapPointChanged(nil, nil, { snapPoint = SnapPoint, snapPointIndex = SnapPointIndex })
		end else nil,
		testId = p1.testId
	}, {
		Header = if p1.headerComponent then ReactModule.createElement(Sheet.Header, { hasCloseAffordance = p1.headerHasCloseAffordance == true }, { Content = p1.headerComponent }) else nil,
		FullBleed = if p1.fullBleedComponent then ReactModule.createElement(Sheet.FullBleed, nil, { Content = p1.fullBleedComponent }) else nil,
		Content = if p1.contentComponents then ReactModule.createElement(Sheet.Content, {
			isContentFullBleed = p1.contentIsFullBleed,
			isReversed = p1.contentIsReversed
		}, p1.contentComponents) else nil,
		Actions = if p1.actionComponents then ReactModule.createElement(Sheet.Actions, nil, p1.actionComponents) else nil
	})
end)