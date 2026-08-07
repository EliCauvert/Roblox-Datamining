local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local t = {}
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local isPrimaryRenderer = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer
local t_1 = {}
local var3 = if reactGlobalsModule.__DEV__ then {} else nil

function t.markSourceAsDirty(p0) --[[ line: 39 ]]
	-- upvalues: t_1 (ref)
	table.insert(t_1, p0)
end

function t.resetWorkInProgressVersions() --[[ line: 43 ]]
	-- upvalues: t_1 (ref), isPrimaryRenderer (ref)
	for i, v in t_1 do
		if isPrimaryRenderer then
			v._workInProgressVersionPrimary = nil
		else
			v._workInProgressVersionSecondary = nil
		end
	end
	table.clear(t_1)
end

function t.getWorkInProgressVersion(p1) --[[ line: 54 ]]
	-- upvalues: isPrimaryRenderer (ref)
	return if isPrimaryRenderer then p1._workInProgressVersionPrimary else p1._workInProgressVersionSecondary
end

function t.setWorkInProgressVersion(p2, p3) --[[ line: 64 ]]
	-- upvalues: isPrimaryRenderer (ref), t_1 (ref)
	if isPrimaryRenderer then
		p2._workInProgressVersionPrimary = p3
	else
		p2._workInProgressVersionSecondary = p3
	end
	table.insert(t_1, p2)
end

function t.warnAboutMultipleRenderersDEV(p4) --[[ line: 76 ]]
	-- upvalues: reactGlobalsModule (ref), isPrimaryRenderer (ref), var3 (write), console (ref)
	if reactGlobalsModule.__DEV__ then
		if isPrimaryRenderer then
			if p4._currentPrimaryRenderer == nil then
				p4._currentPrimaryRenderer = var3
				
				return
			elseif p4._currentPrimaryRenderer == var3 then
				return
			else
				console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
				
				return
			end
		elseif p4._currentSecondaryRenderer == nil then
			p4._currentSecondaryRenderer = var3
			
			return
		elseif p4._currentSecondaryRenderer ~= var3 then
			console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
		end
	end
end

function t.registerMutableSourceForHydration(p5, p6) --[[ line: 104 ]]
	local version = p6._getVersion(p6._source)
	
	if p5.mutableSourceEagerHydrationData == nil then
		p5.mutableSourceEagerHydrationData = { p6, version }
		
		return
	end
end

return t