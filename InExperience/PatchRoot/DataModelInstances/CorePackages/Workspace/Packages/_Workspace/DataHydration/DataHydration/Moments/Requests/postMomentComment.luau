local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local convertApiCommentToCommentModule = require(dataHydration.Moments.Util.convertApiCommentToComment)

local function _(p1)
	return `moment-comments-api/v1/moments/{p1}/comments`
end

return function(p1, p2, p3)
	-- upvalues: constructApiUrlModule (ref), httpClientModule (ref), convertApiCommentToCommentModule (ref)
	local var1, var2 = constructApiUrlModule(`moment-comments-api/v1/moments/{p1}/comments`)
	
	return httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.post-comment",
		url = var1,
		headers = var2,
		body = p2,
		network = p3,
		decode = function(p4)
			-- upvalues: convertApiCommentToCommentModule (copy)
			local var3 = convertApiCommentToCommentModule(p4)
			assert(var3 ~= nil, "postMomentComment: response was not a Comment")
			
			return var3
		end
	})
end