local name = require(script:FindFirstAncestor("TimeToInteractiveTracker").Logger):new(script.Name)
local _ = require(script.Parent.Parent.types)
local mergeTTIEventMetadataModule = require(script.Parent.Parent.Parent.Utils.mergeTTIEventMetadata)

return function(p1)
	-- upvalues: name (ref), mergeTTIEventMetadataModule (ref)
	return function(p2, p3)
		-- upvalues: p1 (ref), name (copy), mergeTTIEventMetadataModule (copy)
		p1(function(p4)
			-- upvalues: p2 (ref), name (copy), mergeTTIEventMetadataModule (copy), p3 (ref)
			local var1 = p4[p2]
			
			if var1 == nil then
				name:warning(`called before trackStart for eventName={p2}`)
				
				return p4
			end
			local cloned = table.clone(p4)
			local cloned_1 = table.clone(var1)
			cloned_1.metadata = mergeTTIEventMetadataModule(var1.metadata, p3)
			cloned[p2] = cloned_1
			
			return cloned
		end)
	end
end