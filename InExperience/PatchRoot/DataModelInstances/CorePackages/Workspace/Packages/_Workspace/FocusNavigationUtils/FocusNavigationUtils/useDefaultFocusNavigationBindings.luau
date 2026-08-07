local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local useNavigation = require(parent.Navigation).useNavigation
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local canGoBack = require(parent.Navigation).canGoBack
local focusNavigationEventNameEnumModule = require(focusNavigationUtils.FocusNavigationEventNameEnum)
local useFocusRegistryEntry = require(focusNavigationUtils.FocusNavigableSurfaceRegistry).useFocusRegistryEntry
local focusNavigableSurfaceIdentifierEnumModule = require(focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local useDescendantHasFocusModule = require(focusNavigationUtils.useDescendantHasFocus)
local useRegistryEntry = require(focusNavigationUtils.FocusNavigableSurfaceRegistry).useRegistryEntry
local focusNavigationDefaultEventMapModule = require(focusNavigationUtils.FocusNavigationDefaultEventMap)

local function _(p0) --[[ line: 23 | named "getScrollableAncestor" ]]
	return if p0 == nil then nil elseif p0:IsA("ScrollingFrame") then p0 else p0:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(p1, p2) --[[ line: 34 | named "scrollTo" ]]
	if p1 ~= nil then
		local var8 = p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y
		
		if p2 > 0 and var8 - 350 <= p1.CanvasPosition.Y then
			p1.CanvasPosition = Vector2.new(0, var8)
			
			return
		elseif p2 < 0 and p1.CanvasPosition.Y <= 350 then
			p1.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		p1.CanvasPosition += Vector2.new(0, p2)
	end
end

function useDefaultFocusNavigationBindings(p3) --[[ line: 53 ]]
	-- upvalues: useNavigation (ref), useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnumModule (ref), useFocusRegistryEntry (ref), useDescendantHasFocusModule (ref), useSelector (ref), reactFocusNavigationModule (ref), focusNavigationDefaultEventMapModule (ref), reactModule (ref), focusNavigationEventNameEnumModule (ref), inputHandlersModule (ref), canGoBack (ref)
	local var9 = useNavigation()
	local var10 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var11 = useFocusRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var12 = useFocusRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar)
	local var13 = useDescendantHasFocusModule(useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar))
	local var14 = useSelector(function(p4) --[[ line: 60 ]]
		return p4.TabBarVisible
	end)
	local var15 = reactFocusNavigationModule.useFocusedGuiObject()
	local var16 = if var15 == nil then nil elseif var15:IsA("ScrollingFrame") then var15 else var15:FindFirstAncestorWhichIsA("ScrollingFrame")
	local var17 = var16 ~= nil
	
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: var13 (ref), focusNavigationEventNameEnumModule (copy), inputHandlersModule (copy), canGoBack (copy), var9 (ref), var14 (ref), var12 (ref), var11 (ref), var10 (ref), var17 (ref), var16 (ref)
		local t = {}
		
		if not var13 then
			t[focusNavigationEventNameEnumModule.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(_) --[[ line: 74 ]]
					-- upvalues: canGoBack (copy), var9 (copy), var14 (copy), var12 (copy)
					if canGoBack(var9) then
						var9.goBack(false)
						
						return
					elseif var14 then
						var12()
					end
				end)
			}
		end
		if var11 and var10 ~= nil then
			t[focusNavigationEventNameEnumModule.Search] = {
				handler = inputHandlersModule.onRelease(function(_) --[[ line: 86 ]]
					-- upvalues: var11 (copy), var10 (copy)
					var11()
					
					if var10 ~= nil then
						local var19 = if var10:IsA("TextBox") then var10 else var10:FindFirstChildWhichIsA("TextBox", true)
						
						if var19 then
							var19:CaptureFocus()
						end
					end
				end)
			}
		end
		if var17 then
			t[focusNavigationEventNameEnumModule.ScrollDown] = {
				handler = inputHandlersModule.onRelease(function(_) --[[ line: 103 ]]
					-- upvalues: var16 (copy)
					if var16 ~= nil then
						local var20 = var16.AbsoluteCanvasSize.Y - var16.AbsoluteWindowSize.Y
						
						if var20 - 350 <= var16.CanvasPosition.Y then
							var16.CanvasPosition = Vector2.new(0, var20)
							
							return
						end
						var16.CanvasPosition += Vector2.new(0, 300)
					end
				end)
			}
			t[focusNavigationEventNameEnumModule.ScrollUp] = {
				handler = inputHandlersModule.onRelease(function(_) --[[ line: 108 ]]
					-- upvalues: var16 (copy)
					if var16 ~= nil then
						local _ = var16.AbsoluteCanvasSize.Y - var16.AbsoluteWindowSize.Y
						
						if var16.CanvasPosition.Y <= 350 then
							var16.CanvasPosition = Vector2.new(0, 0)
							
							return
						end
						var16.CanvasPosition += Vector2.new(0, -300)
					end
				end)
			}
		end
		return t
	end, {
		var9, var10, var11, var12, var13, var14, var17
	}), reactFocusNavigationModule.useEventMap(focusNavigationDefaultEventMapModule, p3))
end

return useDefaultFocusNavigationBindings