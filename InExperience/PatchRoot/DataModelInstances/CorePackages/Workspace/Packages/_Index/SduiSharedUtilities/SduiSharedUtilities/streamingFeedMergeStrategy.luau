local _ = require(script:FindFirstAncestor("SduiSharedUtilities").SduiIntegrationTypes)

return function(a, _, _) --[[ line: 9 | named "streamingFeedMergeStrategy" ]]
	return if #a == 1 and (a[1] == "entry_map" or a[1] == "entry_order") then "merge" else nil
end