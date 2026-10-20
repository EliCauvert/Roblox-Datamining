local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusOnMountFunction = FocusNavigationUtilsModule.useFocusOnMount
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseMostRecentOrDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useMostRecentOrDefaultFocusBehavior
local _ = require(GameJoinCard.Components.Actions.Types)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return {
	useGameJoinCardGamepadNavigation = function(Callback, IsFocusable)
		-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseMostRecentOrDefaultFocusBehaviorFunction (copy), UseFocusOnMountFunction (copy)
		local UseMostRecentOrDefaultFocusBehaviorResult, UseMostRecentOrDefaultFocusBehaviorResult2 = UseMostRecentOrDefaultFocusBehaviorFunction((UseFocusRootFunction({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p1)
							-- upvalues: Callback (upval)
							Callback()
							p1:cancel()
						end)
					}
				}
			end, { Callback }),
			isFocusable = IsFocusable
		})))
		local UseFocusOnMountResult = UseFocusOnMountFunction(UseMostRecentOrDefaultFocusBehaviorResult)
		
		return {
			rootRef = UseMostRecentOrDefaultFocusBehaviorResult2,
			primaryButtonFocusRef = if IsFocusable then UseFocusOnMountResult else UseMostRecentOrDefaultFocusBehaviorResult
		}
	end,
	assignPrimaryFocusRef = function(Entry, FocusRef)
		if Entry == nil or FocusRef == nil or Entry[1] == nil then
			return Entry
		else
			local Copy = table.clone(Entry)
			local Copy1 = table.clone(Entry[1])
			Copy1.focusRef = FocusRef
			Copy[1] = Copy1
			
			return Copy
		end
	end
}