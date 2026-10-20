local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("GameTile").Parent
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetOverflowMenuSignalStoreFunction = require(Parent.AppBlox).getOverflowMenuSignalStore
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local FFlagLuaAppFixExplicitFeedbackConsoleTelemetry = SharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry
local FFlagLuaAppGameTileOverflowMenuFocusTransferFix = SharedFlagsModule.FFlagLuaAppGameTileOverflowMenuFocusTransferFix
local config = {
	[Enum.KeyCode.ButtonStart] = FocusNavigationEventNameEnum.OpenQuickMenu
}
local config1 = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1, Current, p2, Callback)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), GetOverflowMenuSignalStoreFunction (copy), FFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), ReactFocusNavigationModule (copy), config (copy), config1 (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy), GuiService (copy), FFlagLuaAppGameTileOverflowMenuFocusTransferFix (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(false)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), GetOverflowMenuSignalStoreFunction (upval), p1 (copy), FFlagLuaAppFixExplicitFeedbackConsoleTelemetry (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.OpenQuickMenu] = {
				handler = InputHandlersModule.onRelease(function()
					-- upvalues: GetOverflowMenuSignalStoreFunction (upval), p1 (upval), FFlagLuaAppFixExplicitFeedbackConsoleTelemetry (upval), Callback (upval)
					GetOverflowMenuSignalStoreFunction().openMenu(p1)
					
					if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry and Callback then
						Callback(false)
					end
				end)
			}
		}, {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function()
					-- upvalues: GetOverflowMenuSignalStoreFunction (upval), p1 (upval), FFlagLuaAppFixExplicitFeedbackConsoleTelemetry (upval), Callback (upval)
					GetOverflowMenuSignalStoreFunction().closeMenu(p1)
					
					if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry and Callback then
						Callback(true)
					end
				end)
			}
		}
	end, {
		p1,
		if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then Callback else nil
	})
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(UseMemoResult, (ReactFocusNavigationModule.useEventMap(config)))
	local UseEventHandlerMapResult1 = ReactFocusNavigationModule.useEventHandlerMap(UseMemoResult2, (ReactFocusNavigationModule.useEventMap(config1)))
	ReactModule.useEffect(function()
		-- upvalues: UseEventHandlerMapResult (copy), p2 (copy)
		if UseEventHandlerMapResult and p2 then
			UseEventHandlerMapResult(p2.current)
		end
	end, { UseEventHandlerMapResult, p2 })
	ReactModule.useEffect(function()
		-- upvalues: UseEventHandlerMapResult1 (copy), UseStateResult (copy)
		if UseEventHandlerMapResult1 then
			UseEventHandlerMapResult1(UseStateResult)
		end
	end, { UseEventHandlerMapResult1, UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: GetInputModeStoreFunction (upval), ResponsiveModule (upval), Current (copy), UseStateResult (copy), GuiService (upval)
		if GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Directional and Current and UseStateResult then
			GuiService:Select(UseStateResult)
		end
	end, { UseStateResult })
	local UseRefResult1 = ReactModule.useRef(Current)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), Current (copy), UseRefResult (copy), GetOverflowMenuSignalStoreFunction (upval), p1 (copy), GuiService (upval), FFlagLuaAppGameTileOverflowMenuFocusTransferFix (upval), UseStateResult (copy), p2 (copy)
		if UseRefResult1.current ~= Current then
			UseRefResult1.current = Current
			
			if not Current and not UseRefResult.current then
				local OverflowMenuSignalStore = GetOverflowMenuSignalStoreFunction()
				
				if not OverflowMenuSignalStore.getIsMenuOpen(p1) then
					OverflowMenuSignalStore.closeMenu(p1)
					
					return
				end
				local SelectedCoreObject = GuiService.SelectedCoreObject
				local IsDescendantOf = FFlagLuaAppGameTileOverflowMenuFocusTransferFix and (UseStateResult and (SelectedCoreObject and SelectedCoreObject:IsDescendantOf(UseStateResult)))
				
				if p2 and p2.current and SelectedCoreObject and not SelectedCoreObject:IsDescendantOf(p2.current) and (not FFlagLuaAppGameTileOverflowMenuFocusTransferFix or not IsDescendantOf) then
					OverflowMenuSignalStore.closeMenu(p1)
				end
			end
		end
	end, {
		Current,
		p1,
		p2,
		if FFlagLuaAppGameTileOverflowMenuFocusTransferFix then UseStateResult else nil
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), GuiService (upval), UseRefResult (copy), GetOverflowMenuSignalStoreFunction (upval), p1 (copy)
		if UseStateResult and GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(UseStateResult) then
			UseRefResult.current = true
			
			return
		end
		if UseRefResult.current ~= false then
			UseRefResult.current = false
			GetOverflowMenuSignalStoreFunction().closeMenu(p1)
		end
	end, { UseStateResult, p1 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: GuiService (upval), UseResult (copy)
		local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(UseResult)
		UseResult()
		
		return function()
			-- upvalues: Connection (copy)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseResult })
	
	return UseStateResult2
end