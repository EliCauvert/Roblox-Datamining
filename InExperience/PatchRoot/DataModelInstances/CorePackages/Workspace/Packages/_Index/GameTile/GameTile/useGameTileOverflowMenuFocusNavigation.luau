local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("GameTile").Parent
local appBloxModule = require(parent.AppBlox)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local sharedFlagsModule = require(parent.SharedFlags)
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local getInputModeStore = responsiveModule.GetInputModeStore
local fFlagLuaAppFixExplicitFeedbackConsoleTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry
local luaAppGameTileOverflowMenuSelectionCloseFix = game:DefineFastFlag("LuaAppGameTileOverflowMenuSelectionCloseFix", false)
local t = {
	[Enum.KeyCode.ButtonStart] = focusNavigationEventNameEnum.OpenQuickMenu
}
local t_1 = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (ref), reactFocusNavigationModule (ref), t (ref), t_1 (ref), getInputModeStore (ref), responsiveModule (ref), guiService (ref), luaAppGameTileOverflowMenuSelectionCloseFix (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(false)
	local var4, var5 = reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), getOverflowMenuSignalStore (copy), p1 (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), p4 (ref)
		return {
			[focusNavigationEventNameEnum.OpenQuickMenu] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: getOverflowMenuSignalStore (copy), p1 (copy), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), p4 (copy)
					getOverflowMenuSignalStore().openMenu(p1)
					
					if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry and p4 then
						p4(false)
					end
				end)
			}
		}, {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: getOverflowMenuSignalStore (copy), p1 (copy), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), p4 (copy)
					getOverflowMenuSignalStore().closeMenu(p1)
					
					if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry and p4 then
						p4(true)
					end
				end)
			}
		}
	end, {
		p1,
		if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then p4 else nil
	})
	local var6 = reactFocusNavigationModule.useEventHandlerMap(var4, reactFocusNavigationModule.useEventMap(t))
	local var7 = reactFocusNavigationModule.useEventHandlerMap(var5, reactFocusNavigationModule.useEventMap(t_1))
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), p3 (ref)
		if var6 and p3 then
			var6(p3.current)
		end
	end, { var6, p3 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var1 (ref)
		if var7 then
			var7(var1)
		end
	end, { var7, var1 })
	reactModule.useEffect(function()
		-- upvalues: getInputModeStore (copy), responsiveModule (copy), p2 (ref), var1 (ref), guiService (copy)
		if getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional and p2 and var1 then
			guiService:Select(var1)
		end
	end, { var1 })
	local var8 = reactModule.useRef(p2)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), p2 (ref), var3 (ref), luaAppGameTileOverflowMenuSelectionCloseFix (copy), getOverflowMenuSignalStore (copy), p1 (ref), guiService (copy), p3 (ref)
		if var8.current ~= p2 then
			var8.current = p2
			
			if not p2 and not var3.current then
				if luaAppGameTileOverflowMenuSelectionCloseFix then
					local var9 = getOverflowMenuSignalStore()
					
					if not var9.getIsMenuOpen(p1) then
						var9.closeMenu(p1)
						
						return
					end
					local selectedCoreObject = guiService.SelectedCoreObject
					
					if p3 and p3.current and (selectedCoreObject and not selectedCoreObject:IsDescendantOf(p3.current)) then
						var9.closeMenu(p1)
						
						return
					end
				else
					getOverflowMenuSignalStore().closeMenu(p1)
				end
			end
		end
	end, {
		p2,
		if luaAppGameTileOverflowMenuSelectionCloseFix then p1 else nil,
		if luaAppGameTileOverflowMenuSelectionCloseFix then p3 else nil
	})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), guiService (copy), var3 (ref), getOverflowMenuSignalStore (copy), p1 (ref)
		if var1 and guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var1) then
			var3.current = true
			
			return
		elseif var3.current ~= false then
			var3.current = false
			getOverflowMenuSignalStore().closeMenu(p1)
		end
	end, { var1, p1 })
	reactModule.useLayoutEffect(function()
		-- upvalues: guiService (copy), var9 (ref)
		local var10 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(var9)
		var9()
		
		return function()
			-- upvalues: var10 (ref)
			if var10 then
				var10:Disconnect()
			end
		end
	end, { var9 })
	
	return var2
end