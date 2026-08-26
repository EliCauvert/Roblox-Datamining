local parent = script.Parent.Parent
local parent_1 = parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.networkingShareLinkTypes)
local tutilsModule = require(parent_1.tutils)
local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: tutilsModule (ref), API_URLModule (ref), httpService (ref)
	local var1 = p1.roduxNetworking.POST("get-or-create-link", function(p2, p3)
		-- upvalues: tutilsModule (copy), API_URLModule (copy), httpService (copy)
		local var2 = tutilsModule.deepCopy(p3)
		var2.linkType = nil
		
		return p2(API_URLModule):path("sharelinks"):path("v1"):path("get-or-create-link"):body({
			linkType = p3.linkType,
			data = if next(var2) ~= nil then nil else httpService:JSONEncode(var2)
		})
	end)
	
	if p1.useMockedResponse then
		var1.Mock.clear()
		var1.Mock.reply(function()
			return { responseBody = { linkId = "42685" } }
		end)
	end
	return var1
end