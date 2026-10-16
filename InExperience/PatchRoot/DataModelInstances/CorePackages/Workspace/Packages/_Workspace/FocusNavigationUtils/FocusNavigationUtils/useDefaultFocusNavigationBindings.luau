local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local Parent = FocusNavigationUtils.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local FFlagFixDoubleBackNav = require(Parent.SharedFlags).FFlagFixDoubleBackNav
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CanGoBackFunction = require(Parent.Navigation).canGoBack
local FocusNavigationEventNameEnumModule = require(FocusNavigationUtils.FocusNavigationEventNameEnum)
local UseFocusRegistryEntryFunction = require(FocusNavigationUtils.FocusNavigableSurfaceRegistry).useFocusRegistryEntry
local FocusNavigableSurfaceIdentifierEnumModule = require(FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local UseDescendantHasFocusModule = require(FocusNavigationUtils.useDescendantHasFocus)
local UseRegistryEntryFunction = require(FocusNavigationUtils.FocusNavigableSurfaceRegistry).useRegistryEntry
local FocusNavigationDefaultEventMapModule = require(FocusNavigationUtils.FocusNavigationDefaultEventMap)

local function _(ScrollingFrame) --[[ Line: 24 | Named "getScrollableAncestor" ]]
	return if ScrollingFrame == nil then nil elseif ScrollingFrame:IsA("ScrollingFrame") then ScrollingFrame else ScrollingFrame:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(ScrollFrame, Y: number) --[[ Line: 35 | Named "scrollTo" ]]
	if ScrollFrame ~= nil then
		local YDelta = ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y
		
		if Y > 0 and YDelta - 350 <= ScrollFrame.CanvasPosition.Y then
			ScrollFrame.CanvasPosition = Vector2.new(0, YDelta)
			
			return
		end
		if Y < 0 and ScrollFrame.CanvasPosition.Y <= 350 then
			ScrollFrame.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		ScrollFrame.CanvasPosition += Vector2.new(0, Y)
	end
end

function useDefaultFocusNavigationBindings(p1) --[[ Line: 54 ]]
	-- upvalues: UseNavigationFunction (copy), UseRegistryEntryFunction (copy), FocusNavigableSurfaceIdentifierEnumModule (copy), UseFocusRegistryEntryFunction (copy), UseDescendantHasFocusModule (copy), UseSelectorFunction (copy), ReactFocusNavigationModule (copy), FocusNavigationDefaultEventMapModule (copy), ReactModule (copy), FocusNavigationEventNameEnumModule (copy), InputHandlersModule (copy), CanGoBackFunction (copy), FFlagFixDoubleBackNav (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseRegistryEntryResult = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local UseFocusRegistryEntryResult = UseFocusRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local UseFocusRegistryEntryResult1 = UseFocusRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.NavBar)
	local UseDescendantHasFocusModuleResult = UseDescendantHasFocusModule((UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.NavBar)))
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 61 ]]
		return p2.TabBarVisible
	end)
	local UseFocusedGuiObjectResult = ReactFocusNavigationModule.useFocusedGuiObject()
	local UseFocusedGuiObjectResult1 = if UseFocusedGuiObjectResult == nil then nil elseif UseFocusedGuiObjectResult:IsA("ScrollingFrame") then UseFocusedGuiObjectResult else UseFocusedGuiObjectResult:FindFirstAncestorWhichIsA("ScrollingFrame")
	local HasUseFocusedGuiObjectResult = UseFocusedGuiObjectResult1 ~= nil
	
	return (ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 71 ]]
		-- upvalues: UseDescendantHasFocusModuleResult (copy), FocusNavigationEventNameEnumModule (upval), InputHandlersModule (upval), CanGoBackFunction (upval), UseNavigationResult (copy), UseSelectorResult (copy), UseFocusRegistryEntryResult1 (copy), FFlagFixDoubleBackNav (upval), UseFocusRegistryEntryResult (copy), UseRegistryEntryResult (copy), HasUseFocusedGuiObjectResult (copy), UseFocusedGuiObjectResult1 (copy)
		local t = {}
		
		if not UseDescendantHasFocusModuleResult then
			t[FocusNavigationEventNameEnumModule.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 75 ]]
					-- upvalues: CanGoBackFunction (upval), UseNavigationResult (upval), UseSelectorResult (upval), UseFocusRegistryEntryResult1 (upval), FFlagFixDoubleBackNav (upval)
					if CanGoBackFunction(UseNavigationResult) then
						UseNavigationResult.goBack(false)
					else
						if not UseSelectorResult then return end
						UseFocusRegistryEntryResult1()
					end
					if FFlagFixDoubleBackNav then
						p2.cancelled = true
					end
				end)
			}
		end
		if UseFocusRegistryEntryResult and UseRegistryEntryResult ~= nil then
			t[FocusNavigationEventNameEnumModule.Search] = {
				handler = InputHandlersModule.onRelease(function(_) --[[ Line: 92 ]]
					-- upvalues: UseFocusRegistryEntryResult (upval), UseRegistryEntryResult (upval)
					UseFocusRegistryEntryResult()
					
					if UseRegistryEntryResult ~= nil then
						local UseRegistryEntryResult1 = if UseRegistryEntryResult:IsA("TextBox") then UseRegistryEntryResult else UseRegistryEntryResult:FindFirstChildWhichIsA("TextBox", true)
						
						if UseRegistryEntryResult1 then
							UseRegistryEntryResult1:CaptureFocus()
						end
					end
				end)
			}
		end
		if HasUseFocusedGuiObjectResult then
			t[FocusNavigationEventNameEnumModule.ScrollDown] = {
				handler = InputHandlersModule.onRelease(function(_) --[[ Line: 109 ]]
					-- upvalues: UseFocusedGuiObjectResult1 (upval)
					if UseFocusedGuiObjectResult1 ~= nil then
						local YDelta = UseFocusedGuiObjectResult1.AbsoluteCanvasSize.Y - UseFocusedGuiObjectResult1.AbsoluteWindowSize.Y
						
						if YDelta - 350 <= UseFocusedGuiObjectResult1.CanvasPosition.Y then
							UseFocusedGuiObjectResult1.CanvasPosition = Vector2.new(0, YDelta)
							
							return
						end
						UseFocusedGuiObjectResult1.CanvasPosition += Vector2.new(0, 300)
					end
				end)
			}
			t[FocusNavigationEventNameEnumModule.ScrollUp] = {
				handler = InputHandlersModule.onRelease(function(_) --[[ Line: 114 ]]
					-- upvalues: UseFocusedGuiObjectResult1 (upval)
					if UseFocusedGuiObjectResult1 ~= nil then
						local _ = UseFocusedGuiObjectResult1.AbsoluteCanvasSize.Y - UseFocusedGuiObjectResult1.AbsoluteWindowSize.Y
						
						if UseFocusedGuiObjectResult1.CanvasPosition.Y <= 350 then
							UseFocusedGuiObjectResult1.CanvasPosition = Vector2.new(0, 0)
							
							return
						end
						UseFocusedGuiObjectResult1.CanvasPosition += Vector2.new(0, -300)
					end
				end)
			}
		end
		return t
	end, {
		UseNavigationResult, UseRegistryEntryResult, UseFocusRegistryEntryResult,
		UseFocusRegistryEntryResult1, UseDescendantHasFocusModuleResult,
		UseSelectorResult, HasUseFocusedGuiObjectResult
	}), (ReactFocusNavigationModule.useEventMap(FocusNavigationDefaultEventMapModule, p1))))
end

return useDefaultFocusNavigationBindings