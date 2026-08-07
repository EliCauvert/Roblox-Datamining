local url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: url (ref)
	return p0(string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p1), "GET"):andThen(function(p2) --[[ line: 8 ]]
		-- upvalues: p1 (ref)
		if p2 and p2.responseBody and p2.responseBody.universeId then
			return p2.responseBody.universeId
		end
		error("Failed to get universeId from placeId: " .. tostring(p1))
	end)
end