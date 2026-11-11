local SHARELINKSURLModule = require(script.Parent.Parent.SHARELINKS_URL)
local _ = require(script.Parent.Parent.networkingShareLinkTypes)
local TutilsModule = require(script:FindFirstAncestor("Packages").tutils)
local HttpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: TutilsModule (copy), SHARELINKSURLModule (copy), HttpService (copy)
	local GetOrCreateLink = p1.roduxNetworking.POST({ Name = "get-or-create-link" }, function(Callback, p2)
		-- upvalues: TutilsModule (upval), SHARELINKSURLModule (upval), HttpService (upval)
		local DeepCopyResult = TutilsModule.deepCopy(p2)
		DeepCopyResult.linkType = nil
		
		return Callback(SHARELINKSURLModule):path("v1"):path("get-or-create-link"):body({
			linkType = p2.linkType,
			data = if next(DeepCopyResult) == nil then nil else HttpService:JSONEncode(DeepCopyResult)
		})
	end)
	
	if p1.useMockedResponse then
		GetOrCreateLink.Mock.clear()
		GetOrCreateLink.Mock.reply(function()
			return { responseBody = { linkId = "42685" } }
		end)
	end
	return GetOrCreateLink
end