local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(script.Parent.ScreenRegion)
local _ = require(script.Parent.ScreenRegionKind)
local RegionPoliciesModule = require(script.Parent.regionPolicies)
local ResolveRegionModule = require(script.Parent.resolveRegion)
local Context = ReactModule.createContext(nil)

local function createManager(RegionPoliciesModule)
	-- upvalues: ResolveRegionModule (copy)
	local t = {}
	local ClaimedAt = 0
	
	local function recompute(p1)
		-- upvalues: t (copy), RegionPoliciesModule (copy), ResolveRegionModule (upval)
		local Entry = t[p1]
		local RegionPoliciesModuleEntry = RegionPoliciesModule[p1]
		
		if Entry == nil or RegionPoliciesModuleEntry == nil then return end
		local List = {}
		
		for _, value in Entry do
			table.insert(List, value)
		end
		local ResolveRegionModuleResult = ResolveRegionModule(List, RegionPoliciesModuleEntry)
		
		for i in ResolveRegionModuleResult.dismissed do
			Entry[i].isDismissed = true
		end
		for i1, State1 in Entry do
			local State = {
				isVisible = ResolveRegionModuleResult.visible[i1] == true,
				isDismissed = State1.isDismissed
			}
			
			if State.isVisible ~= State1.state.isVisible or State.isDismissed ~= State1.state.isDismissed then
				State1.state = State
				State1.onChange(State)
			end
		end
	end
	
	return {
		register = function(Key, Id, Kind, OnChange)
			-- upvalues: t (copy)
			local Entry = t[Key] or {}
			t[Key] = Entry
			Entry[Id] = {
				isOpen = false,
				isMounted = false,
				isDismissed = false,
				id = Id,
				kind = Kind,
				onChange = OnChange,
				state = { isVisible = false, isDismissed = false }
			}
		end,
		update = function(p2, p3, p4)
			-- upvalues: t (copy), ClaimedAt (ref), recompute (copy)
			local Entry = t[p2]
			local Entry1 = if Entry then Entry[p3] else nil
			
			if Entry1 == nil then return end
			if p4.isOpen then
				if not Entry1.isOpen or Entry1.claimKey ~= p4.claimKey then
					ClaimedAt += 1
					Entry1.claimedAt = ClaimedAt
				end
			else
				Entry1.claimedAt = nil
				Entry1.isDismissed = false
			end
			Entry1.isOpen = p4.isOpen
			Entry1.isMounted = p4.isMounted
			Entry1.claimKey = p4.claimKey
			Entry1.priority = p4.priority
			recompute(p2)
		end,
		unregister = function(p2, Key)
			-- upvalues: t (copy), recompute (copy)
			local Entry = t[p2]
			
			if Entry and Entry[Key] then
				Entry[Key] = nil
				recompute(p2)
			end
		end
	}
end

return {
	ScreenRegionProvider = function(p2)
		-- upvalues: ReactModule (copy), createManager (copy), RegionPoliciesModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: createManager (upval), RegionPoliciesModule (upval)
				return (createManager(RegionPoliciesModule))
			end, {})
		}, p2.children)
	end,
	ScreenRegionContext = Context,
	createManager = createManager
}