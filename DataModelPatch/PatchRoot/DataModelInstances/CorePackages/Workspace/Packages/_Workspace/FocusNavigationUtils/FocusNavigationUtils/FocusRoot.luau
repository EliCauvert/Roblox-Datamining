local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local Parent = FocusNavigationUtils.Parent
local GuiService = game:GetService("GuiService")
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseFocusRootModule = require(script.Parent.useFocusRoot)
local BaseFocusRootModule = require(FocusNavigationUtils.BaseFocusRoot)
local FFlagFocusRootUseHooksModule = require(script.Parent.FFlagFocusRootUseHooks)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local _ = require(FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local UseFocusNavigableSurfaceRegistryConnectionModule = require(FocusNavigationUtils.useFocusNavigableSurfaceRegistryConnection)
local UseAutoFocusModule = require(FocusNavigationUtils.useAutoFocus)
local UseDescendantHasFocusModule = require(FocusNavigationUtils.useDescendantHasFocus)
local UseLastInputModeModule = require(FocusNavigationUtils.useLastInputMode)
local config = {
	BackgroundTransparency = 1,
	SelectionGroup = true,
	Size = UDim2.fromScale(1, 1)
}
local t = {}
local config1 = {
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop
}

local function _(p1, p2, Ref)
	-- upvalues: ReactModule (copy), t (copy), CryoModule (copy), config1 (copy), config (copy)
	return ReactModule.useMemo(function()
		-- upvalues: p2 (copy), t (upval), p1 (copy), CryoModule (upval), config1 (upval), config (upval), Ref (copy)
		local JoinResult = p2 or t
		
		if p1 then
			JoinResult = CryoModule.Dictionary.join(config1, JoinResult)
		end
		return CryoModule.Dictionary.join(config, JoinResult, { ref = Ref })
	end, { p1, p2, Ref })
end

return function(p1)
	-- upvalues: FFlagFocusRootUseHooksModule (copy), UseFocusRootModule (copy), ReactModule (copy), BaseFocusRootModule (copy), t (copy), ReactFocusNavigationModule (copy), UseFocusNavigableSurfaceRegistryConnectionModule (copy), UseDescendantHasFocusModule (copy), UseAutoFocusModule (copy), UseLastInputModeModule (copy), GuiService (copy), CryoModule (copy), config1 (copy), config (copy)
	if FFlagFocusRootUseHooksModule then
		return ReactModule.createElement(BaseFocusRootModule, {
			ref = UseFocusRootModule(p1),
			isIsolated = p1.isIsolated,
			frameProps = p1.frameProps
		}, p1.children)
	else
		local UseStateResult = nil
		local UseStateResult2
		UseStateResult, UseStateResult2 = ReactModule.useState(if p1.frameProps and p1.frameProps.ref then p1.frameProps.ref.current else nil)
		local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(p1.eventHandlers or t, (ReactFocusNavigationModule.useEventMap(p1.eventMap or t, UseStateResult2)))
		local NoIsFocusable = p1.isFocusable == nil or p1.isFocusable
		local NoShouldRestoreFocus = p1.shouldRestoreFocus == nil or p1.shouldRestoreFocus
		local UseMostRecentFocusBehaviorResult = ReactFocusNavigationModule.useMostRecentFocusBehavior(UseEventHandlerMapResult)
		local UseMostRecentFocusBehaviorResult1 = if NoShouldRestoreFocus then UseMostRecentFocusBehaviorResult else UseEventHandlerMapResult
		UseFocusNavigableSurfaceRegistryConnectionModule(UseStateResult, p1.surfaceIdentifier, NoIsFocusable)
		local UseDescendantHasFocusModuleResult = UseDescendantHasFocusModule(UseStateResult)
		local UseAutoFocusModuleResult = UseAutoFocusModule({ UseStateResult }, 0.1)
		local IsFocus = UseLastInputModeModule() == "Focus"
		local NoUseDescendantHasFocusModuleResult: boolean = p1.isAutoFocusRoot and (NoIsFocusable and (IsFocus and (UseStateResult and not UseDescendantHasFocusModuleResult)))
		ReactModule.useEffect(function()
			-- upvalues: NoUseDescendantHasFocusModuleResult (copy), UseAutoFocusModuleResult (copy)
			local UseAutoFocusModuleResultResult = if NoUseDescendantHasFocusModuleResult then UseAutoFocusModuleResult() else nil
			
			return function()
				-- upvalues: UseAutoFocusModuleResultResult (ref)
				if UseAutoFocusModuleResultResult then
					UseAutoFocusModuleResultResult.cancel()
				end
			end
		end, {
			NoUseDescendantHasFocusModuleResult,
			UseAutoFocusModuleResult
		})
		local UseRefResult = ReactModule.useRef(UseStateResult)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (ref), UseRefResult (copy)
			if UseStateResult then
				UseRefResult.current = UseStateResult
			end
		end, { UseStateResult })
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), GuiService (upval)
			return function()
				-- upvalues: UseRefResult (upval), GuiService (upval)
				if not UseRefResult.current then return end
				local SelectedCoreObject = GuiService.SelectedCoreObject
				
				if not SelectedCoreObject then return end
				if SelectedCoreObject:IsDescendantOf(UseRefResult.current) or not SelectedCoreObject:IsDescendantOf(game) then
					GuiService.SelectedCoreObject = nil
				end
			end
		end, {})
		local IsIsolated = p1.isIsolated
		local FrameProps = p1.frameProps
		
		return ReactModule.createElement("Frame", ReactModule.useMemo(function()
			-- upvalues: FrameProps (copy), t (upval), IsIsolated (copy), CryoModule (upval), config1 (upval), config (upval), UseMostRecentFocusBehaviorResult1 (copy)
			local JoinResult = FrameProps or t
			
			if IsIsolated then
				JoinResult = CryoModule.Dictionary.join(config1, JoinResult)
			end
			return CryoModule.Dictionary.join(config, JoinResult, { ref = UseMostRecentFocusBehaviorResult1 })
		end, {
			IsIsolated,
			FrameProps,
			UseMostRecentFocusBehaviorResult1
		}), p1.children)
	end
end