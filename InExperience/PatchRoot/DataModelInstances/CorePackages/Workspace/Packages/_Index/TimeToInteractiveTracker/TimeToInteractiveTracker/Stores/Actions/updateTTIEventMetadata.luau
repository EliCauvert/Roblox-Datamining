local name = require(script:FindFirstAncestor("TimeToInteractiveTracker").Logger):new(script.Name)
local _ = require(script.Parent.Parent.types)
local mergeTTIEventMetadataModule = require(script.Parent.Parent.Parent.Utils.mergeTTIEventMetadata)

return function(p0) --[[ line: 14 ]]
	-- upvalues: name (ref), mergeTTIEventMetadataModule (ref)
	return function(p1, p2) --[[ line: 15 ]]
		-- upvalues: p0 (ref), name (copy), mergeTTIEventMetadataModule (copy)
		p0(function(p3) --[[ line: 16 ]]
			-- upvalues: p1 (ref), name (copy), mergeTTIEventMetadataModule (copy), p2 (ref)
			local var2 = p3[p1]
			
			if var2 == nil then
				name:warning(`called before trackStart for eventName={p1}`)
				
				return p3
			end
			local cloned = table.clone(p3)
			local cloned_1 = table.clone(var2)
			cloned_1.metadata = mergeTTIEventMetadataModule(var2.metadata, p2)
			cloned[p1] = cloned_1
			
			return cloned
		end)
	end
end