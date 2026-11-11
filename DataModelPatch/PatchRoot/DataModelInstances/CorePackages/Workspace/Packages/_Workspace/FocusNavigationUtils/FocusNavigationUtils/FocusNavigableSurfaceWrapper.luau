local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local Parent = FocusNavigationUtils.Parent

if require(Parent.SharedFlags).FFlagAppFocusWrapperRefactor then
	return (require(FocusNavigationUtils.AppFocusRoot))
else
	local ReactModule = require(Parent.React)
	local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
	local CryoModule = require(Parent.Cryo)
	local NavigationModule = require(Parent.Navigation)
	local _ = require(FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
	local UseFocusNavigableSurfaceRegistryConnectionModule = require(FocusNavigationUtils.useFocusNavigableSurfaceRegistryConnection)
	local UseDefaultFocusNavigationBindingsModule = require(FocusNavigationUtils.useDefaultFocusNavigationBindings)
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
		-- upvalues: ReactModule (copy), CryoModule (copy), config1 (copy), config (copy)
		return ReactModule.useMemo(function()
			-- upvalues: p2 (copy), p1 (copy), CryoModule (upval), config1 (upval), config (upval), Ref (copy)
			local JoinResult = p2 or {}
			
			if p1 then
				JoinResult = CryoModule.Dictionary.join(config1, JoinResult)
			end
			return CryoModule.Dictionary.join(config, JoinResult, { ref = Ref })
		end, { p1, p2, Ref })
	end
	
	return function(p1)
		-- upvalues: t (copy), ReactModule (copy), ReactFocusNavigationModule (copy), UseDefaultFocusNavigationBindingsModule (copy), NavigationModule (copy), UseFocusNavigableSurfaceRegistryConnectionModule (copy), CryoModule (copy), config1 (copy), config (copy)
		local CustomEventHandlers = p1.customEventHandlers or t
		local UseStateResult, UseStateResult2 = ReactModule.useState(if p1.frameProps and p1.frameProps.ref then p1.frameProps.ref.current else nil)
		local UseDefaultFocusNavigationBindingsModuleResult = UseDefaultFocusNavigationBindingsModule((ReactFocusNavigationModule.useEventHandlerMap(CustomEventHandlers, UseStateResult2)))
		local IsFocusable = p1.isFocusable
		local UseNavigationFocusResult = NavigationModule.useNavigationFocus()
		local NoUseNavigationFocusResult = (IsFocusable == nil or IsFocusable) and (UseNavigationFocusResult == nil or UseNavigationFocusResult)
		local Ref = UseDefaultFocusNavigationBindingsModuleResult
		local UseMostRecentFocusBehaviorResult = ReactFocusNavigationModule.useMostRecentFocusBehavior(UseDefaultFocusNavigationBindingsModuleResult)
		
		if p1.shouldRestoreFocus == nil or p1.shouldRestoreFocus then
			Ref = UseMostRecentFocusBehaviorResult
		end
		UseFocusNavigableSurfaceRegistryConnectionModule(UseStateResult, p1.surfaceIdentifier, NoUseNavigationFocusResult)
		local IsIsolated = p1.isIsolated
		local FrameProps = p1.frameProps
		
		return ReactModule.createElement("Frame", ReactModule.useMemo(function()
			-- upvalues: FrameProps (copy), IsIsolated (copy), CryoModule (upval), config1 (upval), config (upval), Ref (copy)
			local JoinResult = FrameProps or {}
			
			if IsIsolated then
				JoinResult = CryoModule.Dictionary.join(config1, JoinResult)
			end
			return CryoModule.Dictionary.join(config, JoinResult, { ref = Ref })
		end, { IsIsolated, FrameProps, Ref }), p1.children)
	end
end