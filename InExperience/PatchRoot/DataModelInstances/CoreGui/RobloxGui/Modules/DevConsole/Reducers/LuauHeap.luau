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

return function(p0, p1)
	-- upvalues: t (ref), setLuauHeapStateModule (ref), immutableModule (ref), setLuauHeapProfileTargetModule (ref), setLuauHeapActiveSnapshotModule (ref), setLuauHeapCompareSnapshotModule (ref)
	p0 = p0 or t
	
	if p1.type == setLuauHeapStateModule.name then
		return immutableModule.JoinDictionaries(p0, if p1.isClientState then { client = p1.sessionState } else { server = p1.sessionState })
	elseif p1.type == setLuauHeapProfileTargetModule.name then
		return immutableModule.JoinDictionaries(p0, { isClientView = p1.isClientView })
	elseif p1.type == setLuauHeapActiveSnapshotModule.name then
		if p0.isClientView then
			local cloned = table.clone(p0.client)
			cloned.active = p1.active
			
			return immutableModule.JoinDictionaries(p0, { client = cloned })
		end
		local cloned = table.clone(p0.server)
		cloned.active = p1.active
		
		return immutableModule.JoinDictionaries(p0, { server = cloned })
	elseif p1.type ~= setLuauHeapCompareSnapshotModule.name then
		return p0
	elseif p0.isClientView then
		local cloned = table.clone(p0.client)
		cloned.compare = p1.compare
		
		return immutableModule.JoinDictionaries(p0, { client = cloned })
	end
	local cloned = table.clone(p0.server)
	cloned.compare = p1.compare
	
	return immutableModule.JoinDictionaries(p0, { server = cloned })
end