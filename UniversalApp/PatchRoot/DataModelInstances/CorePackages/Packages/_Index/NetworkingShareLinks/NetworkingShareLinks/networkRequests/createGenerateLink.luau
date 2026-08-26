local SHARELINKS_URLModule = require(script.Parent.Parent.SHARELINKS_URL)
local _ = require(script.Parent.Parent.networkingShareLinkTypes)
local tutilsModule = require(script:FindFirstAncestor("Packages").tutils)
local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: tutilsModule (ref), SHARELINKS_URLModule (ref), httpService (ref)
	local var1 = p1.roduxNetworking.POST({ Name = "create-link" }, function(p2, p3)
		-- upvalues: tutilsModule (copy), SHARELINKS_URLModule (copy), httpService (copy)
		local var2 = tutilsModule.deepCopy(p3)
		var2.linkType = nil
		
		return p2(SHARELINKS_URLModule):path("v1"):path("create-link"):body({
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