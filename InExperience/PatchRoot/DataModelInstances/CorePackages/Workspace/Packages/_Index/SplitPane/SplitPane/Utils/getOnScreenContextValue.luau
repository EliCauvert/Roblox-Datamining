local Parent = script:FindFirstAncestor("SplitPane").Parent
local _ = require(script.Parent.Parent.Hooks.useSplitLayoutStatus)
local GetCurrentNavigationStateFunction = require(Parent.Navigation).getCurrentNavigationState
local SupportPaneMode = require(Parent.AppSplitView).Enums.SupportPaneMode
local TempRnSwitchNavigatorName = require(Parent.NavigationRodux).Constants.TempRnSwitchNavigatorName
local config = { isOnScreen = false }

local function _(p1)
	-- upvalues: TempRnSwitchNavigatorName (copy), GetCurrentNavigationStateFunction (copy)
	local Descriptor = p1.descriptor
	local State = Descriptor.state
	
	if State == nil or State.routeName ~= TempRnSwitchNavigatorName then
		return Descriptor.key
	else
		local CurrentNavigationState = GetCurrentNavigationStateFunction(State)
		
		return if CurrentNavigationState == nil or CurrentNavigationState.key == nil then Descriptor.key else CurrentNavigationState.key
	end
end

return function(p1, ContentTopCandidate, p2)
	-- upvalues: SupportPaneMode (copy), config (copy), TempRnSwitchNavigatorName (copy), GetCurrentNavigationStateFunction (copy)
	local v1 = false
	local ContentTopCandidate1 = nil
	local PaneIndice = nil
	local SupportPaneMode1 = nil
	
	if p1 ~= nil then
		SupportPaneMode1 = p1.supportPaneMode
		
		if p1.isRootAppStack and p1.isSplitEnabled then
			ContentTopCandidate1 = p1.contentTopCandidate or p1.splitPrimaryIndex
			
			if p1.isRouteActiveOnPane then
				PaneIndice = p1.paneIndices[#p1.paneIndices]
			end
			v1 = ContentTopCandidate1 ~= nil or PaneIndice ~= nil
		end
	end
	if not v1 then
		return nil
	end
	if ContentTopCandidate ~= PaneIndice and (ContentTopCandidate ~= ContentTopCandidate1 or SupportPaneMode1 == SupportPaneMode.Expanded) then
		return config
	end
	local config1 = { isOnScreen = true }
	local Descriptor = p2.descriptor
	local State = Descriptor.state
	local Key = nil
	
	if State == nil or State.routeName ~= TempRnSwitchNavigatorName then
		Key = Descriptor.key
	else
		local CurrentNavigationState = GetCurrentNavigationStateFunction(State)
		Key = if CurrentNavigationState == nil or CurrentNavigationState.key == nil then Descriptor.key else CurrentNavigationState.key
	end
	config1.currentRouteKey = Key
	
	return config1
end