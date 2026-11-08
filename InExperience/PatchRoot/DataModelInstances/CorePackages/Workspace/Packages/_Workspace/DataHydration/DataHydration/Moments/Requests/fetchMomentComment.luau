local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local ConvertApiCommentToCommentModule = require(DataHydration.Moments.Util.convertApiCommentToComment)

local function _(p1, p2): string
	return `moment-comments-api/v1/moments/{p1}/comments/{p2}`
end

return function(p1, p2, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy), ConvertApiCommentToCommentModule (copy)
	local ConstructApiUrlModuleResult, ConstructApiUrlModuleResult2 = ConstructApiUrlModule(`moment-comments-api/v1/moments/{p1}/comments/{p2}`)
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-comment",
		url = ConstructApiUrlModuleResult,
		headers = ConstructApiUrlModuleResult2,
		network = Network,
		decode = function(p3)
			-- upvalues: ConvertApiCommentToCommentModule (upval)
			return ConvertApiCommentToCommentModule(p3)
		end
	})
end