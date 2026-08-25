local parent = script.Parent.Parent.Parent.Parent
local types = parent.Types
local parent_1 = parent.Parent
local _ = require(types.ActionTypes)
local _ = require(types.ReducerTypes)
local dashModule = require(parent_1.Dash)

return function(p0, p1)
	-- upvalues: dashModule (ref)
	local t = {}
	dashModule.forEach(p1.responseBody.userContactsEntities, function(p2)
		-- upvalues: t (ref)
		t[p2.id] = {
			contactName = p2.name,
			mutualContacts = p2.mutualContacts,
			avatarAssetHashId = p2.avatarAssetHashId,
			headshotThumbnailUrl = p2.headshotThumbnailUrl,
			avatarThumbnailUrl = p2.avatarThumbnailUrl
		}
	end)
	
	return dashModule.join(p0, t)
end