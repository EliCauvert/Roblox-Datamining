local parent = script:FindFirstAncestor("SplitPane").Parent
local navigationModule = require(parent.Navigation)
local roactNavigationModule = require(parent.RoactNavigation)
local constants = require(parent.NavigationRodux).Constants
local splitPaneSlot = require(parent.AppSplitView).Enums.SplitPaneSlot
local viewState = navigationModule.ViewState
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName

local function _(p0) --[[ line: 15 | named "getUpdatedNavigation" ]]
	local var3 = if p0._dangerouslyGetParent then p0._dangerouslyGetParent() else nil
	local var4 = if p0.state ~= nil then nil else p0.state.key
	
	return if var3 and var4 then var3.getChildNavigation(var4) or p0 else p0
end

local function resolveOptions(p1) --[[ line: 24 ]]
	-- upvalues: tempRnSwitchNavigatorName (ref), roactNavigationModule (ref)
	local descriptor = p1.descriptor
	local state = descriptor.state
	
	if state == nil or state.routeName ~= tempRnSwitchNavigatorName or descriptor.navigation == nil then
		return descriptor.options
	end
	local navigation = descriptor.navigation
	local var5 = if navigation._dangerouslyGetParent then navigation._dangerouslyGetParent() else nil
	local var6 = if navigation.state ~= nil then nil else navigation.state.key
	
	return roactNavigationModule.getActiveChildNavigationOptions(if var5 and var6 then var5.getChildNavigation(var6) or navigation else navigation) or {}
end

return function(p2) --[[ line: 34 | named "computeSplitEligibility" ]]
	-- upvalues: viewState (ref), resolveOptions (ref), splitPaneSlot (ref)
	for i = #p2, 1, -1 do
		local var7 = p2[i]
		
		if var7.viewState ~= viewState.Closing then
			local var8 = resolveOptions(var7)
			local splitPaneEligibility = var8.splitPaneEligibility
			
			if splitPaneEligibility ~= nil or not var8.transparent and not var8.overlayEnabled then
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