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

local function _(p1)
	return if p1 == nil then nil elseif p1:IsA("ScrollingFrame") then p1 else p1:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(p1, p2)
	if p1 ~= nil then
		local var1 = p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y
		
		if p2 > 0 and var1 - 350 <= p1.CanvasPosition.Y then
			p1.CanvasPosition = Vector2.new(0, var1)
			
			return
		elseif p2 < 0 and p1.CanvasPosition.Y <= 350 then
			p1.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		p1.CanvasPosition += Vector2.new(0, p2)
	end
end

function useDefaultAppEventHandlers()
	-- upvalues: useNavigation (ref), useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnumModule (ref), useFocusRegistryEntry (ref), useDescendantHasFocusModule (ref), useSelector (ref), reactFocusNavigationModule (ref), reactModule (ref), focusNavigationEventNameEnumModule (ref), inputHandlersModule (ref), canGoBack (ref)
	local var1 = useNavigation()
	local var2 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var3 = useFocusRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var4 = useFocusRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar)
	local var5 = useDescendantHasFocusModule(useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar))
	local var6 = useSelector(function(p1)
		return p1.TabBarVisible
	end)
	local var7 = reactFocusNavigationModule.useFocusedGuiObject()
	local var8 = if var7 == nil then nil elseif var7:IsA("ScrollingFrame") then var7 else var7:FindFirstAncestorWhichIsA("ScrollingFrame")
	local var9 = var8 ~= nil
	
	return reactModule.useMemo(function()
		-- upvalues: var5 (ref), focusNavigationEventNameEnumModule (copy), inputHandlersModule (copy), canGoBack (copy), var1 (ref), var6 (ref), var4 (ref), var3 (ref), var2 (ref), var9 (ref), var8 (ref)
		local t = {}
		
		if not var5 then
			t[focusNavigationEventNameEnumModule.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: canGoBack (copy), var1 (copy), var6 (copy), var4 (copy)
					if canGoBack(var1) then
						var1.goBack(false)
						
						return
					elseif var6 then
						var4()
					end
				end)
			}
		end
		if var3 and var2 ~= nil then
			t[focusNavigationEventNameEnumModule.Search] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: var3 (copy), var2 (copy)
					var3()
					
					if var2 ~= nil then
						local var10 = if var2:IsA("TextBox") then var2 else var2:FindFirstChildWhichIsA("TextBox", true)
						
						if var10 then
							var10:CaptureFocus()
						end
					end
				end)
			}
		end
		if var9 then
			t[focusNavigationEventNameEnumModule.ScrollDown] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: var8 (copy)
					if var8 ~= nil then
						local var10 = var8.AbsoluteCanvasSize.Y - var8.AbsoluteWindowSize.Y
						
						if var10 - 350 <= var8.CanvasPosition.Y then
							var8.CanvasPosition = Vector2.new(0, var10)
							
							return
						end
						var8.CanvasPosition += Vector2.new(0, 300)
					end
				end)
			}
			t[focusNavigationEventNameEnumModule.ScrollUp] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: var8 (copy)
					if var8 ~= nil then
						local _ = var8.AbsoluteCanvasSize.Y - var8.AbsoluteWindowSize.Y
						
						if var8.CanvasPosition.Y <= 350 then
							var8.CanvasPosition = Vector2.new(0, 0)
							
							return
						end
						var8.CanvasPosition += Vector2.new(0, -300)
					end
				end)
			}
		end
		return t
	end, {
		var1, var2, var3, var4, var5, var6, var9
	})
end

return useDefaultAppEventHandlers