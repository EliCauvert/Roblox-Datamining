local Parent = script:FindFirstAncestor("SplitPane").Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local SplitPaneSlot = require(Parent.AppSplitView).Enums.SplitPaneSlot
local ViewState = require(Parent.Navigation).ViewState
local TempRnSwitchNavigatorName = require(Parent.NavigationRodux).Constants.TempRnSwitchNavigatorName

local function _(p1)
	local DangerouslyGetParentResult = if p1._dangerouslyGetParent then p1._dangerouslyGetParent() else nil
	local Key = if p1.state == nil then nil else p1.state.key
	
	return DangerouslyGetParentResult and Key and DangerouslyGetParentResult.getChildNavigation(Key) or p1
end

local function resolveOptions(p1)
	-- upvalues: TempRnSwitchNavigatorName (copy), RoactNavigationModule (copy)
	local Descriptor = p1.descriptor
	local State = Descriptor.state
	
	if State == nil or State.routeName ~= TempRnSwitchNavigatorName or Descriptor.navigation == nil then
		return Descriptor.options
	else
		local Navigation = Descriptor.navigation
		local DangerouslyGetParentResult = if Navigation._dangerouslyGetParent then Navigation._dangerouslyGetParent() else nil
		local Key = if Navigation.state == nil then nil else Navigation.state.key
		
		return RoactNavigationModule.getActiveChildNavigationOptions(DangerouslyGetParentResult and Key and DangerouslyGetParentResult.getChildNavigation(Key) or Navigation) or {}
	end
end

return function(p1): boolean
	-- upvalues: ViewState (copy), resolveOptions (copy), SplitPaneSlot (copy)
	for i = #p1, 1, -1 do
		local v1 = p1[i]
		local IsViewStateMatch = v1.viewState == ViewState.Closing
		local SplitPaneEligibility = nil
		
		if not IsViewStateMatch then
			local ResolveOptionsResult = resolveOptions(v1)
			SplitPaneEligibility = ResolveOptionsResult.splitPaneEligibility
			IsViewStateMatch = SplitPaneEligibility == nil and (ResolveOptionsResult.transparent or ResolveOptionsResult.overlayEnabled)
		end
		if not IsViewStateMatch then
			if SplitPaneEligibility == SplitPaneSlot.Content then
				return true
			end
			if SplitPaneEligibility == nil then
				return false
			end
		end
	end
	return false
end