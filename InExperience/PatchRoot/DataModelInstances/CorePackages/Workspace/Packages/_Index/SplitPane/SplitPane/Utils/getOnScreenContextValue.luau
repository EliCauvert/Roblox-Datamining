local parent = script:FindFirstAncestor("SplitPane").Parent
local appSplitViewModule = require(parent.AppSplitView)
local navigationModule = require(parent.Navigation)
local constants = require(parent.NavigationRodux).Constants
local _ = require(script.Parent.Parent.Hooks.useSplitLayoutStatus)
local getCurrentNavigationState = navigationModule.getCurrentNavigationState
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName
local t = { isOnScreen = false }

local function _(p1)
	-- upvalues: tempRnSwitchNavigatorName (ref), getCurrentNavigationState (ref)
	local descriptor = p1.descriptor
	local state = descriptor.state
	
	if state == nil or state.routeName ~= tempRnSwitchNavigatorName then
		return descriptor.key
	end
	local var1 = getCurrentNavigationState(state)
	
	return if var1 == nil or var1.key == nil then descriptor.key else var1.key
end

return function(p1, p2, p3)
	-- upvalues: supportPaneMode (ref), t (ref), tempRnSwitchNavigatorName (ref), getCurrentNavigationState (ref)
	local var1 = false
	local contentTopCandidate = nil
	local var2 = nil
	local supportPaneMode_1 = nil
	
	if p1 ~= nil then
		supportPaneMode_1 = p1.supportPaneMode
		
		if p1.isRootAppStack and p1.isSplitEnabled then
			contentTopCandidate = p1.contentTopCandidate or p1.splitPrimaryIndex
			
			if p1.isRouteActiveOnPane then
				var2 = p1.paneIndices[#p1.paneIndices]
			end
			var1 = if contentTopCandidate == nil then var2 ~= nil else true
		end
	end
	if not var1 then
		return nil
	elseif not (if p2 ~= var2 then p2 == contentTopCandidate and supportPaneMode_1 ~= supportPaneMode.Expanded else true) then
		return t
	end
	local var3
	local t_1 = { isOnScreen = true }
	local descriptor = p3.descriptor
	local state = descriptor.state
	
	if state == nil or state.routeName ~= tempRnSwitchNavigatorName then
		var3 = descriptor.key
	else
		local var4 = getCurrentNavigationState(state)
		var3 = if var4 == nil or var4.key == nil then descriptor.key else var4.key
	end
	t_1.currentRouteKey = var3
	
	return t_1
end