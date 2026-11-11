local NetworkRequests = script.Parent.networkRequests
local CreateGetTagsFromUserIdsModule = require(NetworkRequests.createGetTagsFromUserIds)
local CreateSetUserTagModule = require(NetworkRequests.createSetUserTag)
local _ = require(script.Parent.networkingAliasesTypes)

return function(p1)
	-- upvalues: CreateGetTagsFromUserIdsModule (copy), CreateSetUserTagModule (copy)
	return {
		GetTagsFromUserIds = CreateGetTagsFromUserIdsModule(p1),
		SetUserTag = CreateSetUserTagModule(p1)
	}
end