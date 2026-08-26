local appChat = script:FindFirstAncestor("AppChat")
local populateListFromIds = require(appChat.SocialLibraries).populate.populateListFromIds
local getDeepValueModule = require(appChat.Utils.getDeepValue)

return function(p1, p2)
	-- upvalues: getDeepValueModule (ref), populateListFromIds (ref)
	return populateListFromIds(p2, getDeepValueModule(p1, "Users") or {})
end