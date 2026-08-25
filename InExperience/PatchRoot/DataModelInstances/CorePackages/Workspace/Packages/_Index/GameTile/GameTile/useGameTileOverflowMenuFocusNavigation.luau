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

return function(p0, p1, p2, p3)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (ref), reactFocusNavigationModule (ref), t (ref), t_1 (ref), getInputModeStore (ref), responsiveModule (ref), guiService (ref), luaAppGameTileOverflowMenuSelectionCloseFix (ref)
	local var11, var12 = reactModule.useState(nil)
	local var13 = reactModule.useRef(false)
	local var14, var15 = reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), getOverflowMenuSignalStore (copy), p0 (ref), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), p3 (ref)
		return {
			[focusNavigationEventNameEnum.OpenQuickMenu] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: getOverflowMenuSignalStore (copy), p0 (copy), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), p3 (copy)
					getOverflowMenuSignalStore().openMenu(p0)
					
					if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry and p3 then
						p3(false)
					end
				end)
			}
		}, {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: getOverflowMenuSignalStore (copy), p0 (copy), fFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), p3 (copy)
					getOverflowMenuSignalStore().closeMenu(p0)
					
					if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry and p3 then
						p3(true)
					end
				end)
			}
		}
	end, {
		p0,
		if fFlagLuaAppFixExplicitFeedbackConsoleTelemetry then p3 else nil
	})
	local var16 = reactFocusNavigationModule.useEventHandlerMap(var14, reactFocusNavigationModule.useEventMap(t))
	local var17 = reactFocusNavigationModule.useEventHandlerMap(var15, reactFocusNavigationModule.useEventMap(t_1))
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), p2 (ref)
		if var16 and p2 then
			var16(p2.current)
		end
	end, { var16, p2 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var11 (ref)
		if var17 then
			var17(var11)
		end
	end, { var17, var11 })
	reactModule.useEffect(function()
		-- upvalues: getInputModeStore (copy), responsiveModule (copy), p1 (ref), var11 (ref), guiService (copy)
		if getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional and p1 and var11 then
			guiService:Select(var11)
		end
	end, { var11 })
	local var18 = reactModule.useRef(p1)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), p1 (ref), var13 (ref), luaAppGameTileOverflowMenuSelectionCloseFix (copy), getOverflowMenuSignalStore (copy), p0 (ref), guiService (copy), p2 (ref)
		if var18.current ~= p1 then
			var18.current = p1
			
			if not p1 and not var13.current then
				if luaAppGameTileOverflowMenuSelectionCloseFix then
					local var20 = getOverflowMenuSignalStore()
					
					if not var20.getIsMenuOpen(p0) then
						var20.closeMenu(p0)
						
						return
					end
					local selectedCoreObject = guiService.SelectedCoreObject
					
					if p2 and p2.current and (selectedCoreObject and not selectedCoreObject:IsDescendantOf(p2.current)) then
						var20.closeMenu(p0)
						
						return
					end
				else
					getOverflowMenuSignalStore().closeMenu(p0)
				end
			end
		end
	end, {
		p1,
		if luaAppGameTileOverflowMenuSelectionCloseFix then p0 else nil,
		if luaAppGameTileOverflowMenuSelectionCloseFix then p2 else nil
	})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), guiService (copy), var13 (ref), getOverflowMenuSignalStore (copy), p0 (ref)
		if var11 and guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var11) then
			var13.current = true
			
			return
		elseif var13.current ~= false then
			var13.current = false
			getOverflowMenuSignalStore().closeMenu(p0)
		end
	end, { var11, p0 })
	reactModule.useLayoutEffect(function()
		-- upvalues: guiService (copy), var19 (ref)
		local var21 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(var19)
		var19()
		
		return function()
			-- upvalues: var21 (ref)
			if var21 then
				var21:Disconnect()
			end
		end
	end, { var19 })
	
	return var12
end