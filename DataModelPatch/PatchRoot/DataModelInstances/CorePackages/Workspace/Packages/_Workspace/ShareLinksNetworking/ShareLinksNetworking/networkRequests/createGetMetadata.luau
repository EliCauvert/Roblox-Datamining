local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.networkingShareLinkTypes)

return function(p1)
	-- upvalues: APIURLModule (copy)
	local GetMetadata = p1.roduxNetworking.POST({ Name = "get-metadata" }, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("sharelinks"):path("v1"):path("get-metadata"):body({ linkType = p2.linkType, linkId = p2.linkId })
	end)
	
	if p1.useMockedResponse then
		GetMetadata.Mock.clear()
		GetMetadata.Mock.reply(function()
			return {
				responseBody = { data = "{ \"universeId\": 123, \"placeId\": 456 }" }
			}
		end)
	end
	return GetMetadata
end