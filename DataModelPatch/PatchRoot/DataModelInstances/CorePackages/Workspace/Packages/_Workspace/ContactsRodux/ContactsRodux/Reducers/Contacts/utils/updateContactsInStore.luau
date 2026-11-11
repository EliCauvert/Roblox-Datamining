local Parent = script.Parent.Parent.Parent.Parent
local Types = Parent.Types
local _ = require(Types.ActionTypes)
local _ = require(Types.ReducerTypes)
local DashModule = require(Parent.Parent.Dash)

return function(p1, p2)
	-- upvalues: DashModule (copy)
	local t = {}
	DashModule.forEach(p2.responseBody.userContactsEntities, function(p3)
		-- upvalues: t (copy)
		t[p3.id] = {
			contactName = p3.name,
			mutualContacts = p3.mutualContacts,
			avatarAssetHashId = p3.avatarAssetHashId,
			headshotThumbnailUrl = p3.headshotThumbnailUrl,
			avatarThumbnailUrl = p3.avatarThumbnailUrl
		}
	end)
	
	return DashModule.join(p1, t)
end