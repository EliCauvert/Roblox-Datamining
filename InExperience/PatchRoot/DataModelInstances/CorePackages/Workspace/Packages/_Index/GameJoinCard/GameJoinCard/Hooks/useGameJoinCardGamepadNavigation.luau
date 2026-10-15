local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusOnMount = focusNavigationUtilsModule.useFocusOnMount
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local useMostRecentOrDefaultFocusBehavior = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior
local _ = require(gameJoinCard.Components.Actions.Types)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return {
	useGameJoinCardGamepadNavigation = function(p1, p2)
		-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useMostRecentOrDefaultFocusBehavior (ref), useFocusOnMount (ref)
		local var1, var2 = useMostRecentOrDefaultFocusBehavior(useFocusRoot({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = t,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p1 (ref)
				return {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p3)
							-- upvalues: p1 (copy)
							p1()
							p3:cancel()
						end)
					}
				}
			end, { p1 }),
			isFocusable = p2
		}))
		
		return {
			rootRef = var2,
			primaryButtonFocusRef = if p2 then useFocusOnMount(var1) else var1
		}
	end,
	assignPrimaryFocusRef = function(value, p1)
		if value == nil or p1 == nil or value[1] == nil then
			return value
		end
		local cloned = table.clone(value)
		local cloned_1 = table.clone(value[1])
		cloned_1.focusRef = p1
		cloned[1] = cloned_1
		
		return cloned
	end
}