local AppChatNetworkingModule = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: AppChatNetworkingModule (copy), ConstantsModule (copy)
	return AppChatNetworkingModule.http.GetSuggestions(nil, p1, ConstantsModule.SUGGESTION_TYPES, ConstantsModule.MAX_SUGGESTIONS):andThen(function(Result)
		local ResponseBody = Result and Result.responseBody
		local Suggestions = nil
		
		if ResponseBody then
			Suggestions = ResponseBody.suggestions
			
			if not Suggestions then
				return {}
			end
		else
			Suggestions = {}
		end
		return Suggestions
	end)
end