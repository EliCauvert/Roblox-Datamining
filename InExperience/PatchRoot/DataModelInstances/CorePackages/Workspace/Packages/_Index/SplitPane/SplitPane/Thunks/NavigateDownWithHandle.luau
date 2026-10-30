local Parent = script:FindFirstAncestor("SplitPane").Parent
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local RobloxAppNavigationModule = require(Parent.RobloxAppNavigation)
local NavigationCommands = RobloxAppNavigationModule.NavigationCommands
local AppNavigationRegistry = RobloxAppNavigationModule.AppNavigationRegistry
local CreateNavigationHandleModule = require(script.Parent.Parent.Utils.createNavigationHandle)
local RouteIdentityModule = require(script.Parent.Parent.Utils.routeIdentity)

return function(p1, p2)
	-- upvalues: RouteIdentityModule (copy), FFlagSignalsNavP3Dispatch (copy), CreateNavigationHandleModule (copy), AppNavigationRegistry (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return function(p3)
		-- upvalues: p2 (copy), p1 (copy), RouteIdentityModule (upval), FFlagSignalsNavP3Dispatch (upval), CreateNavigationHandleModule (upval), AppNavigationRegistry (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		local BypassNavigationLock = if p2 == nil then nil else p2.bypassNavigationLock
		
		local function _(p4): boolean
			-- upvalues: p1 (upval)
			if p4.routeName == p1.name then
				local Params = p4.params
				
				return tostring(if Params == nil then nil else Params.detail) == tostring(p1.detail)
			else
				return false
			end
		end
		
		if p2 ~= nil and p2.deduplicate == true then
			local OpenRouteIdentity = RouteIdentityModule.findOpenRouteIdentity(p3, p1)
			
			if OpenRouteIdentity ~= nil then
				local NewCreateNavigationHandle = if FFlagSignalsNavP3Dispatch then CreateNavigationHandleModule.new(AppNavigationRegistry.get().getState, OpenRouteIdentity.key) else CreateNavigationHandleModule.fromRoduxStore(p3, OpenRouteIdentity.key)
				NewCreateNavigationHandle.deduplicated = true
				
				return NewCreateNavigationHandle
			end
		end
		local SnapshotRouteKeysResult = RouteIdentityModule.snapshotRouteKeys(p3)
		
		local function matchesNewPush(p4): boolean
			-- upvalues: p1 (upval), SnapshotRouteKeysResult (copy)
			local IsTextMatch = nil
			if p4.routeName == p1.name then
				local Params = p4.params
				IsTextMatch = tostring(if Params == nil then nil else Params.detail) == tostring(p1.detail)
			else
				IsTextMatch = false
			end
			return IsTextMatch and SnapshotRouteKeysResult[p4.key] == nil
		end
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(p1), BypassNavigationLock)
			
			return if AppNavigationRegistry.isRegistered() then CreateNavigationHandleModule.new(AppNavigationRegistry.get().getState, matchesNewPush) else nil
		else
			p3:dispatch(NavigateDownFunction(p1, BypassNavigationLock))
			
			return CreateNavigationHandleModule.fromRoduxStore(p3, matchesNewPush)
		end
	end
end