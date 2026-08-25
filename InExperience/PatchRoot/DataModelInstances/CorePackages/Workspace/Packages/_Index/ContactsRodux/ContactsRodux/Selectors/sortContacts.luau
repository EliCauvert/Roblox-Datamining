local getDeepValue = require(script.Parent.Parent.Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue

return function(p0)
	-- upvalues: getDeepValue (ref)
	local keyPath = p0.keyPath
	
	return function(p1)
		-- upvalues: getDeepValue (copy), keyPath (ref)
		local t = {}
		
		for i, v in pairs(getDeepValue(p1, keyPath .. ".byContactId") or {}) do
			table.insert(t, {
				contactId = i,
				contactName = v.contactName,
				headshotThumbnailUrl = v.headshotThumbnailUrl,
				avatarThumbnailUrl = v.avatarThumbnailUrl
			})
		end
		table.sort(t, function(p2, p3)
			return if p2.contactName and p3.contactName and p2.contactName ~= p3.contactName then p2.contactName < p3.contactName else p2.contactId < p3.contactId
		end)
		
		return t
	end
end