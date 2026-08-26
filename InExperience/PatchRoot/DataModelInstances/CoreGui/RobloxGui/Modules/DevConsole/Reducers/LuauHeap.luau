local immutableModule = require(script.Parent.Parent.Immutable)
local actions = script.Parent.Parent.Actions
local setLuauHeapStateModule = require(actions.SetLuauHeapState)
local setLuauHeapProfileTargetModule = require(actions.SetLuauHeapProfileTarget)
local setLuauHeapActiveSnapshotModule = require(actions.SetLuauHeapActiveSnapshot)
local setLuauHeapCompareSnapshotModule = require(actions.SetLuauHeapCompareSnapshot)
local _ = require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes)
local t = {
	isClientView = true,
	client = { active = 0, compare = 0, snapshots = {} },
	server = { active = 0, compare = 0, snapshots = {} }
}

return function(p1, p2)
	-- upvalues: t (ref), setLuauHeapStateModule (ref), immutableModule (ref), setLuauHeapProfileTargetModule (ref), setLuauHeapActiveSnapshotModule (ref), setLuauHeapCompareSnapshotModule (ref)
	p1 = p1 or t
	
	if p2.type == setLuauHeapStateModule.name then
		return immutableModule.JoinDictionaries(p1, if p2.isClientState then { client = p2.sessionState } else { server = p2.sessionState })
	elseif p2.type == setLuauHeapProfileTargetModule.name then
		return immutableModule.JoinDictionaries(p1, { isClientView = p2.isClientView })
	elseif p2.type == setLuauHeapActiveSnapshotModule.name then
		if p1.isClientView then
			local cloned = table.clone(p1.client)
			cloned.active = p2.active
			
			return immutableModule.JoinDictionaries(p1, { client = cloned })
		end
		local cloned = table.clone(p1.server)
		cloned.active = p2.active
		
		return immutableModule.JoinDictionaries(p1, { server = cloned })
	elseif p2.type ~= setLuauHeapCompareSnapshotModule.name then
		return p1
	elseif p1.isClientView then
		local cloned = table.clone(p1.client)
		cloned.compare = p2.compare
		
		return immutableModule.JoinDictionaries(p1, { client = cloned })
	end
	local cloned = table.clone(p1.server)
	cloned.compare = p2.compare
	
	return immutableModule.JoinDictionaries(p1, { server = cloned })
end