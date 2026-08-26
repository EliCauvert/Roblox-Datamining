local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local t = {}
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local isPrimaryRenderer = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer
local t_1 = {}
local var1 = if reactGlobalsModule.__DEV__ then {} else nil

function t.markSourceAsDirty(p1)
	-- upvalues: t_1 (ref)
	table.insert(t_1, p1)
end

function t.resetWorkInProgressVersions()
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

function t.getWorkInProgressVersion(p1)
	-- upvalues: isPrimaryRenderer (ref)
	return if isPrimaryRenderer then p1._workInProgressVersionPrimary else p1._workInProgressVersionSecondary
end

function t.setWorkInProgressVersion(p1, p2)
	-- upvalues: isPrimaryRenderer (ref), t_1 (ref)
	if isPrimaryRenderer then
		p1._workInProgressVersionPrimary = p2
	else
		p1._workInProgressVersionSecondary = p2
	end
	table.insert(t_1, p1)
end

function t.warnAboutMultipleRenderersDEV(p1)
	-- upvalues: reactGlobalsModule (ref), isPrimaryRenderer (ref), var1 (write), console (ref)
	if reactGlobalsModule.__DEV__ then
		if isPrimaryRenderer then
			if p1._currentPrimaryRenderer == nil then
				p1._currentPrimaryRenderer = var1
				
				return
			elseif p1._currentPrimaryRenderer == var1 then
				return
			else
				console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
				
				return
			end
		elseif p1._currentSecondaryRenderer == nil then
			p1._currentSecondaryRenderer = var1
			
			return
		elseif p1._currentSecondaryRenderer ~= var1 then
			console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
		end
	end
end

function t.registerMutableSourceForHydration(p1, p2)
	local version = p2._getVersion(p2._source)
	
	if p1.mutableSourceEagerHydrationData == nil then
		p1.mutableSourceEagerHydrationData = { p2, version }
		
		return
	end
end

return t