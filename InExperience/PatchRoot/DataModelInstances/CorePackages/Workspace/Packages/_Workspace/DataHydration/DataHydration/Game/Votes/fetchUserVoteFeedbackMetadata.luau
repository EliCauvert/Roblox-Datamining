local parent = script:FindFirstAncestor("DataHydration").Parent
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.Http)
local userVoteFeedbackMetdataUrlBuilderModule = require(script.Parent.UserVoteFeedbackMetdataUrlBuilder)

return function(p0) --[[ line: 13 | named "fetchUserVoteFeedbackMetadata" ]]
	-- upvalues: userVoteFeedbackMetdataUrlBuilderModule (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ line: 17 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(userVoteFeedbackMetdataUrlBuilderModule.buildUserVoteFeedbackMetadataUrl(p0), "GET")
end