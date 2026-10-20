local Url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(Callback, p1)
	-- upvalues: Url (copy)
	return Callback(string.format("%suniverses/v1/places/%d/universe", Url.APIS_URL, p1), "GET"):andThen(function(Result)
		-- upvalues: p1 (copy)
		if Result and Result.responseBody and Result.responseBody.universeId then
			return Result.responseBody.universeId
		else
			error("Failed to get universeId from placeId: " .. tostring(p1))
		end
	end)
end