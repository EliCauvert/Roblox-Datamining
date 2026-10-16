local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local _ = require(Parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local IsPrimaryRenderer = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer
local List = {}
local T = if ReactGlobalsModule.__DEV__ then {} else nil

return {
	markSourceAsDirty = function(p1) --[[ Line: 39 ]]
		-- upvalues: List (copy)
		table.insert(List, p1)
	end,
	resetWorkInProgressVersions = function() --[[ Line: 43 ]]
		-- upvalues: List (copy), IsPrimaryRenderer (copy)
		for _, value in List do
			if IsPrimaryRenderer then
				value._workInProgressVersionPrimary = nil
			else
				value._workInProgressVersionSecondary = nil
			end
		end
		table.clear(List)
	end,
	getWorkInProgressVersion = function(p1) --[[ Line: 54 ]]
		-- upvalues: IsPrimaryRenderer (copy)
		return if IsPrimaryRenderer then p1._workInProgressVersionPrimary else p1._workInProgressVersionSecondary
	end,
	setWorkInProgressVersion = function(p1, _workInProgressVersionPrimary) --[[ Line: 64 ]]
		-- upvalues: IsPrimaryRenderer (copy), List (copy)
		if IsPrimaryRenderer then
			p1._workInProgressVersionPrimary = _workInProgressVersionPrimary
		else
			p1._workInProgressVersionSecondary = _workInProgressVersionPrimary
		end
		table.insert(List, p1)
	end,
	warnAboutMultipleRenderersDEV = function(p1) --[[ Line: 76 ]]
		-- upvalues: ReactGlobalsModule (copy), IsPrimaryRenderer (copy), T (ref), Console (copy)
		if ReactGlobalsModule.__DEV__ then
			if IsPrimaryRenderer then
				if p1._currentPrimaryRenderer == nil then
					p1._currentPrimaryRenderer = T
					
					return
				end
				if p1._currentPrimaryRenderer ~= T then
					Console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
					
					return
				end
			elseif p1._currentSecondaryRenderer == nil then
				p1._currentSecondaryRenderer = T
				
				return
			else
				if p1._currentSecondaryRenderer ~= T then
					Console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
				end
			end
		end
	end,
	registerMutableSourceForHydration = function(p1, p2) --[[ Line: 104 ]]
		local Version = p2._getVersion(p2._source)
		
		if p1.mutableSourceEagerHydrationData == nil then
			p1.mutableSourceEagerHydrationData = { p2, Version }
			
			return
		end
	end
}