local NewResult = require(script:FindFirstAncestor("TimeToInteractiveTracker").Logger):new(script.Name)
local _ = require(script.Parent.Parent.types)
local MergeTTIEventMetadataModule = require(script.Parent.Parent.Parent.Utils.mergeTTIEventMetadata)

return function(Callback) --[[ Line: 14 ]]
	-- upvalues: NewResult (copy), MergeTTIEventMetadataModule (copy)
	return function(p1, p2) --[[ Line: 15 ]]
		-- upvalues: Callback (copy), NewResult (upval), MergeTTIEventMetadataModule (upval)
		Callback(function(Tbl1) --[[ Line: 16 ]]
			-- upvalues: p1 (copy), NewResult (upval), MergeTTIEventMetadataModule (upval), p2 (copy)
			local Tbl = Tbl1[p1]
			
			if Tbl == nil then
				NewResult:warning(`called before trackStart for eventName={p1}`)
				
				return Tbl1
			else
				local Copy = table.clone(Tbl1)
				local Copy1 = table.clone(Tbl)
				Copy1.metadata = MergeTTIEventMetadataModule(Tbl.metadata, p2)
				Copy[p1] = Copy1
				
				return Copy
			end
		end)
	end
end