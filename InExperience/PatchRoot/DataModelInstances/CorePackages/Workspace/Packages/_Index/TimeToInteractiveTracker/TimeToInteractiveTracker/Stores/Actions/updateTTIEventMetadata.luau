local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local fFlagLuaAppPerfTrackerUseLogger = require(timeToInteractiveTracker.Parent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local _ = require(script.Parent.Parent.types)
local mergeTTIEventMetadataModule = require(script.Parent.Parent.Parent.Utils.mergeTTIEventMetadata)

return function(p0) --[[ line: 17 ]]
	-- upvalues: fFlagLuaAppPerfTrackerUseLogger (ref), name (ref), mergeTTIEventMetadataModule (ref)
	return function(p1, p2) --[[ line: 18 ]]
		-- upvalues: p0 (ref), fFlagLuaAppPerfTrackerUseLogger (copy), name (copy), mergeTTIEventMetadataModule (copy)
		p0(function(p3) --[[ line: 19 ]]
			-- upvalues: p1 (ref), fFlagLuaAppPerfTrackerUseLogger (copy), name (copy), mergeTTIEventMetadataModule (copy), p2 (ref)
			local var3 = p3[p1]
			
			if var3 ~= nil then
				local cloned = table.clone(p3)
				local cloned_1 = table.clone(var3)
				cloned_1.metadata = mergeTTIEventMetadataModule(var3.metadata, p2)
				cloned[p1] = cloned_1
				
				return cloned
			elseif fFlagLuaAppPerfTrackerUseLogger then
				name:warning(`called before trackStart for eventName={p1}`)
				
				return p3
			end
			warn(`TimeToInteractiveTracker.updateMetadata called before trackStart for eventName={p1}`)
			
			return p3
		end)
	end
end