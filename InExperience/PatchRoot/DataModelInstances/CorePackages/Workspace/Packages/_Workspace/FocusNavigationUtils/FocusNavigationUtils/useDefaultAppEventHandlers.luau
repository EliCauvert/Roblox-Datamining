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

local function _(p0)
	return if p0 == nil then nil elseif p0:IsA("ScrollingFrame") then p0 else p0:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(p1, p2)
	if p1 ~= nil then
		local var7 = p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y
		
		if p2 > 0 and var7 - 350 <= p1.CanvasPosition.Y then
			p1.CanvasPosition = Vector2.new(0, var7)
			
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
	local var8 = useNavigation()
	local var9 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var10 = useFocusRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var11 = useFocusRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar)
	local var12 = useDescendantHasFocusModule(useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar))
	local var13 = useSelector(function(p3)
		return p3.TabBarVisible
	end)
	local var14 = reactFocusNavigationModule.useFocusedGuiObject()
	local var15 = if var14 == nil then nil elseif var14:IsA("ScrollingFrame") then var14 else var14:FindFirstAncestorWhichIsA("ScrollingFrame")
	local var16 = var15 ~= nil
	
	return reactModule.useMemo(function()
		-- upvalues: var12 (ref), focusNavigationEventNameEnumModule (copy), inputHandlersModule (copy), canGoBack (copy), var8 (ref), var13 (ref), var11 (ref), var10 (ref), var9 (ref), var16 (ref), var15 (ref)
		local t = {}
		
		if not var12 then
			t[focusNavigationEventNameEnumModule.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: canGoBack (copy), var8 (copy), var13 (copy), var11 (copy)
					if canGoBack(var8) then
						var8.goBack(false)
						
						return
					elseif var13 then
						var11()
					end
				end)
			}
		end
		if var10 and var9 ~= nil then
			t[focusNavigationEventNameEnumModule.Search] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: var10 (copy), var9 (copy)
					var10()
					
					if var9 ~= nil then
						local var18 = if var9:IsA("TextBox") then var9 else var9:FindFirstChildWhichIsA("TextBox", true)
						
						if var18 then
							var18:CaptureFocus()
						end
					end
				end)
			}
		end
		if var16 then
			t[focusNavigationEventNameEnumModule.ScrollDown] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: var15 (copy)
					if var15 ~= nil then
						local var19 = var15.AbsoluteCanvasSize.Y - var15.AbsoluteWindowSize.Y
						
						if var19 - 350 <= var15.CanvasPosition.Y then
							var15.CanvasPosition = Vector2.new(0, var19)
							
							return
						end
						var15.CanvasPosition += Vector2.new(0, 300)
					end
				end)
			}
			t[focusNavigationEventNameEnumModule.ScrollUp] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: var15 (copy)
					if var15 ~= nil then
						local _ = var15.AbsoluteCanvasSize.Y - var15.AbsoluteWindowSize.Y
						
						if var15.CanvasPosition.Y <= 350 then
							var15.CanvasPosition = Vector2.new(0, 0)
							
							return
						end
						var15.CanvasPosition += Vector2.new(0, -300)
					end
				end)
			}
		end
		return t
	end, {
		var8, var9, var10, var11, var12, var13, var16
	})
end

return useDefaultAppEventHandlers