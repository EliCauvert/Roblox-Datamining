local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local getGameMediaModule = require(authCommon.Http.Requests.GetGameMedia)

function FetchGameMedia(p0, p1) --[[ line: 8 ]]
	-- upvalues: getGameMediaModule (ref), promiseModule (ref)
	assert(typeof(p1) == "string", "universeId must be a string")
	assert(#p1 > 0, "universeId must be a non-empty string")
	
	return getGameMediaModule(p0, p1):andThen(function(p2) --[[ line: 12 ]]
		-- upvalues: promiseModule (copy)
		if not p2 or not p2.responseBody then
			return promiseModule.reject()
		end
		local data = p2.responseBody.data
		
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