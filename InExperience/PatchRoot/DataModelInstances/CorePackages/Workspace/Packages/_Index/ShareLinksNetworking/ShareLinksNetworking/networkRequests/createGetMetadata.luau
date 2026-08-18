local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.networkingShareLinkTypes)

return function(p0) --[[ line: 6 ]]
	-- upvalues: API_URLModule (ref)
	local var1 = p0.roduxNetworking.POST("get-metadata", function(p1, p2) --[[ line: 11 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("sharelinks"):path("v1"):path("get-metadata"):body({ linkType = p2.linkType, linkId = p2.linkId })
	end)
	
	if p0.useMockedResponse then
		var1.Mock.clear()
		var1.Mock.reply(function() --[[ line: 21 ]]
			return {
				responseBody = { data = "{ \"universeId\": 123, \"placeId\": 456 }" }
			}
		end)
	end
	return var1
end