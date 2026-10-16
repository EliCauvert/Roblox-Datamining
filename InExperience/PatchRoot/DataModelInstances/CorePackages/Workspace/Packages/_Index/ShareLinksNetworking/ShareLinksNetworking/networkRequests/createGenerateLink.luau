local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.networkingShareLinkTypes)
local TutilsModule = require(Parent.Parent.tutils)
local HttpService = game:GetService("HttpService")

return function(p1) --[[ Line: 10 ]]
	-- upvalues: TutilsModule (copy), APIURLModule (copy), HttpService (copy)
	local CreateLink = p1.roduxNetworking.POST("create-link", function(Callback, p2) --[[ Line: 15 ]]
		-- upvalues: TutilsModule (upval), APIURLModule (upval), HttpService (upval)
		local DeepCopyResult = TutilsModule.deepCopy(p2)
		DeepCopyResult.linkType = nil
		
		return Callback(APIURLModule):path("sharelinks"):path("v1"):path("create-link"):body({
			linkType = p2.linkType,
			data = if next(DeepCopyResult) == nil then nil else HttpService:JSONEncode(DeepCopyResult)
		})
	end)
	
	if p1.useMockedResponse then
		CreateLink.Mock.clear()
		CreateLink.Mock.reply(function() --[[ Line: 28 ]]
			return { responseBody = { linkId = "42685" } }
		end)
	end
	return CreateLink
end