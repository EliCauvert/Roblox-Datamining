local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local _ = require(Parent.Http)
local UserVoteFeedbackMetdataUrlBuilderModule = require(script.Parent.UserVoteFeedbackMetdataUrlBuilder)

return function(p1) --[[ Line: 13 | Named "fetchUserVoteFeedbackMetadata" ]]
	-- upvalues: UserVoteFeedbackMetdataUrlBuilderModule (copy), HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ Line: 17 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(UserVoteFeedbackMetdataUrlBuilderModule.buildUserVoteFeedbackMetadataUrl(p1), "GET")
end