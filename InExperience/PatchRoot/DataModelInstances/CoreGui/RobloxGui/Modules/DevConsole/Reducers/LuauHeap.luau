local ImmutableModule = require(script.Parent.Parent.Immutable)
local Actions = script.Parent.Parent.Actions
local SetLuauHeapStateModule = require(Actions.SetLuauHeapState)
local SetLuauHeapProfileTargetModule = require(Actions.SetLuauHeapProfileTarget)
local SetLuauHeapActiveSnapshotModule = require(Actions.SetLuauHeapActiveSnapshot)
local SetLuauHeapCompareSnapshotModule = require(Actions.SetLuauHeapCompareSnapshot)
local _ = require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes)
local config = {
	isClientView = true,
	client = { active = 0, compare = 0, snapshots = {} },
	server = { active = 0, compare = 0, snapshots = {} }
}

return function(p1, p2) --[[ Line: 33 ]]
	-- upvalues: config (copy), SetLuauHeapStateModule (copy), ImmutableModule (copy), SetLuauHeapProfileTargetModule (copy), SetLuauHeapActiveSnapshotModule (copy), SetLuauHeapCompareSnapshotModule (copy)
	local P0 = p1 or config
	
	if p2.type == SetLuauHeapStateModule.name then
		return (ImmutableModule.JoinDictionaries(P0, if p2.isClientState then { client = p2.sessionState } else { server = p2.sessionState }))
	elseif p2.type == SetLuauHeapProfileTargetModule.name then
		return ImmutableModule.JoinDictionaries(P0, { isClientView = p2.isClientView })
	elseif p2.type == SetLuauHeapActiveSnapshotModule.name then
		if P0.isClientView then
			local Copy = table.clone(P0.client)
			Copy.active = p2.active
			
			return ImmutableModule.JoinDictionaries(P0, { client = Copy })
		else
			local Copy = table.clone(P0.server)
			Copy.active = p2.active
			
			return ImmutableModule.JoinDictionaries(P0, { server = Copy })
		end
	elseif p2.type ~= SetLuauHeapCompareSnapshotModule.name then
		return P0
	elseif P0.isClientView then
		local Copy = table.clone(P0.client)
		Copy.compare = p2.compare
		
		return ImmutableModule.JoinDictionaries(P0, { client = Copy })
	else
		local Copy = table.clone(P0.server)
		Copy.compare = p2.compare
		
		return ImmutableModule.JoinDictionaries(P0, { server = Copy })
	end
end