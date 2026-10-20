local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local ConvertApiCommentToCommentModule = require(DataHydration.Moments.Util.convertApiCommentToComment)

local function _(p1): string
	return `moment-comments-api/v1/moments/{p1}/comments`
end

return function(p1, Body, Network, StatusCodeActions)
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy), ConvertApiCommentToCommentModule (copy)
	local ConstructApiUrlModuleResult, ConstructApiUrlModuleResult2 = ConstructApiUrlModule(`moment-comments-api/v1/moments/{p1}/comments`)
	
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.post-comment",
		url = ConstructApiUrlModuleResult,
		headers = ConstructApiUrlModuleResult2,
		body = Body,
		network = Network,
		statusCodeActions = StatusCodeActions,
		decode = function(p2)
			-- upvalues: ConvertApiCommentToCommentModule (upval)
			local ConvertApiCommentToCommentModuleResult = ConvertApiCommentToCommentModule(p2)
			assert(ConvertApiCommentToCommentModuleResult ~= nil, "postMomentComment: response was not a Comment")
			
			return ConvertApiCommentToCommentModuleResult
		end
	})
end