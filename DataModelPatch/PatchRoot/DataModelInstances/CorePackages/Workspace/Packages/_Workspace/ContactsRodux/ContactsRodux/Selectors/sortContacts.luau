local GetDeepValueFunction = require(script.Parent.Parent.Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue

return function(p1)
	-- upvalues: GetDeepValueFunction (copy)
	local KeyPath = p1.keyPath
	
	return function(p2)
		-- upvalues: GetDeepValueFunction (upval), KeyPath (copy)
		local List = {}
		
		for ContactId, value in pairs(GetDeepValueFunction(p2, KeyPath .. ".byContactId") or {}) do
			table.insert(List, {
				contactId = ContactId,
				contactName = value.contactName,
				headshotThumbnailUrl = value.headshotThumbnailUrl,
				avatarThumbnailUrl = value.avatarThumbnailUrl
			})
		end
		table.sort(List, function(A, B): boolean
			return if A.contactName and B.contactName and A.contactName ~= B.contactName then A.contactName < B.contactName else A.contactId < B.contactId
		end)
		
		return List
	end
end