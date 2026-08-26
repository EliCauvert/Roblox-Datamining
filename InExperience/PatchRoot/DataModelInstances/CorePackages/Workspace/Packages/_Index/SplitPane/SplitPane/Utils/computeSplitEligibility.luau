local parent = script:FindFirstAncestor("SplitPane").Parent
local navigationModule = require(parent.Navigation)
local roactNavigationModule = require(parent.RoactNavigation)
local constants = require(parent.NavigationRodux).Constants
local splitPaneSlot = require(parent.AppSplitView).Enums.SplitPaneSlot
local viewState = navigationModule.ViewState
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName

local function _(p1)
	local var1 = if p1._dangerouslyGetParent then p1._dangerouslyGetParent() else nil
	local var2 = if p1.state ~= nil then nil else p1.state.key
	
	return if var1 and var2 then var1.getChildNavigation(var2) or p1 else p1
end

local function resolveOptions(p1)
	-- upvalues: tempRnSwitchNavigatorName (ref), roactNavigationModule (ref)
	local descriptor = p1.descriptor
	local state = descriptor.state
	
	if state == nil or state.routeName ~= tempRnSwitchNavigatorName or descriptor.navigation == nil then
		return descriptor.options
	end
	local navigation = descriptor.navigation
	local var1 = if navigation._dangerouslyGetParent then navigation._dangerouslyGetParent() else nil
	local var2 = if navigation.state ~= nil then nil else navigation.state.key
	
	return roactNavigationModule.getActiveChildNavigationOptions(if var1 and var2 then var1.getChildNavigation(var2) or navigation else navigation) or {}
end

return function(p1)
	-- upvalues: viewState (ref), resolveOptions (ref), splitPaneSlot (ref)
	for i = #p1, 1, -1 do
		local var1 = p1[i]
		
		if var1.viewState ~= viewState.Closing then
			local var2 = resolveOptions(var1)
			local splitPaneEligibility = var2.splitPaneEligibility
			
			if splitPaneEligibility ~= nil or not var2.transparent and not var2.overlayEnabled then
				if splitPaneEligibility ~= splitPaneSlot.Content then
					if splitPaneEligibility ~= nil then
						continue
					end
					return false
				end
				return true
			end
		end
	end
	return false
end