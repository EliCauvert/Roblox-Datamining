local networkRequests = script.Parent.networkRequests
local createGetTagsFromUserIdsModule = require(networkRequests.createGetTagsFromUserIds)
local createSetUserTagModule = require(networkRequests.createSetUserTag)
local _ = require(script.Parent.networkingAliasesTypes)

return function(p1)
	-- upvalues: createGetTagsFromUserIdsModule (ref), createSetUserTagModule (ref)
	return {
		GetTagsFromUserIds = createGetTagsFromUserIdsModule(p1),
		SetUserTag = createSetUserTagModule(p1)
	}
end