local getDeepValueModule = require(script.Parent.Parent.getDeepValue)

return function(p0) --[[ line: 4 ]]
	-- upvalues: getDeepValueModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1) --[[ line: 6 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref)
		local t = {}
		
		for i, v in pairs(getDeepValueModule(p1, keyPath .. ".byContactId") or {}) do
			table.insert(t, { contactId = i, contactName = v.contactName })
		end
		table.sort(t, function(p2, p3) --[[ line: 13 ]]
			return if p2.contactName and p3.contactName and p2.contactName ~= p3.contactName then p2.contactName < p3.contactName else p2.contactId < p3.contactId
		end)
		
		return t
	end
end