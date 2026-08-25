local SHARELINKS_URLModule = require(script.Parent.Parent.SHARELINKS_URL)
local _ = require(script.Parent.Parent.networkingShareLinkTypes)
local tutilsModule = require(script:FindFirstAncestor("Packages").tutils)
local httpService = game:GetService("HttpService")

return function(p0)
	-- upvalues: tutilsModule (ref), SHARELINKS_URLModule (ref), httpService (ref)
	local var3 = p0.roduxNetworking.POST({ Name = "get-or-create-link" }, function(p1, p2)
		-- upvalues: tutilsModule (copy), SHARELINKS_URLModule (copy), httpService (copy)
		local var4 = tutilsModule.deepCopy(p2)
		var4.linkType = nil
		
		return p1(SHARELINKS_URLModule):path("v1"):path("get-or-create-link"):body({
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