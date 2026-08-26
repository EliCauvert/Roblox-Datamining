local getDeepValue = require(script.Parent.Parent.Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue

return function(p1)
	-- upvalues: getDeepValue (ref)
	local keyPath = p1.keyPath
	
	return function(p2)
		-- upvalues: getDeepValue (copy), keyPath (ref)
		local t = {}
		
		for i, v in pairs(getDeepValue(p2, keyPath .. ".byContactId") or {}) do
			table.insert(t, {
				contactId = i,
				contactName = v.contactName,
				headshotThumbnailUrl = v.headshotThumbnailUrl,
				avatarThumbnailUrl = v.avatarThumbnailUrl
			})
		end
		table.sort(t, function(p3, p4)
			return if p3.contactName and p4.contactName and p3.contactName ~= p4.contactName then p3.contactName < p4.contactName else p3.contactId < p4.contactId
		end)
		
		return t
	end
end