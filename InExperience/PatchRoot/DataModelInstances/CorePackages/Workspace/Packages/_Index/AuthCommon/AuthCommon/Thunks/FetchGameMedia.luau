local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local getGameMediaModule = require(authCommon.Http.Requests.GetGameMedia)

function FetchGameMedia(p1, p2)
	-- upvalues: getGameMediaModule (ref), promiseModule (ref)
	assert(typeof(p2) == "string", "universeId must be a string")
	assert(#p2 > 0, "universeId must be a non-empty string")
	
	return getGameMediaModule(p1, p2):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		if not p3 or not p3.responseBody then
			return promiseModule.reject()
		end
		local data = p3.responseBody.data
		
		if data == nil then
			return promiseModule.reject()
		end
		local t = {}
		
		for i, v in ipairs(data) do
			table.insert(t, {
				id = v.id,
				assetTypeId = v.assetTypeId,
				imageId = v.imageId
			})
		end
		return promiseModule.resolve(t)
	end)
end

return FetchGameMedia