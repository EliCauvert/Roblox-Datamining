local parent = script.Parent.Parent
local parent_1 = parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.networkingShareLinkTypes)
local tutilsModule = require(parent_1.tutils)
local httpService = game:GetService("HttpService")

return function(p0)
	-- upvalues: tutilsModule (ref), API_URLModule (ref), httpService (ref)
	local var3 = p0.roduxNetworking.POST("create-link", function(p1, p2)
		-- upvalues: tutilsModule (copy), API_URLModule (copy), httpService (copy)
		local var4 = tutilsModule.deepCopy(p2)
		var4.linkType = nil
		
		return p1(API_URLModule):path("sharelinks"):path("v1"):path("create-link"):body({
			linkType = p2.linkType,
			data = if next(var4) ~= nil then nil else httpService:JSONEncode(var4)
		})
	end)
	
	if p0.useMockedResponse then
		var3.Mock.clear()
		var3.Mock.reply(function()
			return { responseBody = { linkId = "42685" } }
		end)
	end
	return var3
end