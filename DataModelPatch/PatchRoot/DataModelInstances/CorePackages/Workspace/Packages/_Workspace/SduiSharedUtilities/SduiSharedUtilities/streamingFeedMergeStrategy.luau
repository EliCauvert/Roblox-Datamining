local _ = require(script:FindFirstAncestor("SduiSharedUtilities").SduiIntegrationTypes)

return function(Entry, _, _)
	return if #Entry == 1 and (Entry[1] == "entry_map" or Entry[1] == "entry_order") then "merge" else nil
end