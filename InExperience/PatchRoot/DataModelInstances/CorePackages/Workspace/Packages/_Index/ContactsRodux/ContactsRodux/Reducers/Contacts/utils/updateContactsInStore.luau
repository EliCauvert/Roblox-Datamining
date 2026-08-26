local parent = script.Parent.Parent.Parent.Parent
local types = parent.Types
local parent_1 = parent.Parent
local _ = require(types.ActionTypes)
local _ = require(types.ReducerTypes)
local dashModule = require(parent_1.Dash)

return function(p1, p2)
	-- upvalues: dashModule (ref)
	local t = {}
	dashModule.forEach(p2.responseBody.userContactsEntities, function(p3)
		-- upvalues: t (ref)
		t[p3.id] = {
			contactName = p3.name,
			mutualContacts = p3.mutualContacts,
			avatarAssetHashId = p3.avatarAssetHashId,
			headshotThumbnailUrl = p3.headshotThumbnailUrl,
			avatarThumbnailUrl = p3.avatarThumbnailUrl
		}
	end)
	
	return dashModule.join(p1, t)
end