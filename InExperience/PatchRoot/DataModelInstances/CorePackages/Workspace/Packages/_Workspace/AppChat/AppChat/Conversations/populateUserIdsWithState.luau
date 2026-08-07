local appChat = script:FindFirstAncestor("AppChat")
local populateListFromIds = require(appChat.SocialLibraries).populate.populateListFromIds
local getDeepValueModule = require(appChat.Utils.getDeepValue)

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: getDeepValueModule (ref), populateListFromIds (ref)
	return populateListFromIds(p1, getDeepValueModule(p0, "Users") or {})
end