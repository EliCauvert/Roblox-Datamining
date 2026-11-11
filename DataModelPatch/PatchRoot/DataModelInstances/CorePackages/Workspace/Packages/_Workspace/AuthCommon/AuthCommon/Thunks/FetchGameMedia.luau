local AuthCommon = script:FindFirstAncestor("AuthCommon")
local PromiseModule = require(AuthCommon.Parent.Promise)
local GetGameMediaModule = require(AuthCommon.Http.Requests.GetGameMedia)

function FetchGameMedia(p1, p2)
	-- upvalues: GetGameMediaModule (copy), PromiseModule (copy)
	assert(typeof(p2) == "string", "universeId must be a string")
	assert(#p2 > 0, "universeId must be a non-empty string")
	
	return GetGameMediaModule(p1, p2):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		if not Result or not Result.responseBody then
			return PromiseModule.reject()
		end
		local Data = Result.responseBody.data
		
		if Data == nil then
			return PromiseModule.reject()
		end
		local List = {}
		
		for _, entry in ipairs(Data) do
			table.insert(List, {
				id = entry.id,
				assetTypeId = entry.assetTypeId,
				imageId = entry.imageId
			})
		end
		return PromiseModule.resolve(List)
	end)
end

return FetchGameMedia