local AppChat = script:FindFirstAncestor("AppChat")
local PopulateListFromIdsFunction = require(AppChat.SocialLibraries).populate.populateListFromIds
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)

return function(p1, p2)
	-- upvalues: GetDeepValueModule (copy), PopulateListFromIdsFunction (copy)
	return PopulateListFromIdsFunction(p2, GetDeepValueModule(p1, "Users") or {})
end