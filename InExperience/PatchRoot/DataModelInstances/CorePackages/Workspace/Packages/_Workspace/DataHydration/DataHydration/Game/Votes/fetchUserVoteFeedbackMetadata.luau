local parent = script:FindFirstAncestor("DataHydration").Parent
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.Http)
local userVoteFeedbackMetdataUrlBuilderModule = require(script.Parent.UserVoteFeedbackMetdataUrlBuilder)

return function(p1)
	-- upvalues: userVoteFeedbackMetdataUrlBuilderModule (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(userVoteFeedbackMetdataUrlBuilderModule.buildUserVoteFeedbackMetadataUrl(p1), "GET")
end