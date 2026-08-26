local url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	return p1(string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p2), "GET"):andThen(function(p3)
		-- upvalues: p2 (ref)
		if p3 and p3.responseBody and p3.responseBody.universeId then
			return p3.responseBody.universeId
		end
		error("Failed to get universeId from placeId: " .. tostring(p2))
	end)
end