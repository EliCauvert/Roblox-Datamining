local appChatNetworkingModule = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: appChatNetworkingModule (ref), constantsModule (ref)
	return appChatNetworkingModule.http.GetSuggestions(nil, p1, constantsModule.SUGGESTION_TYPES, constantsModule.MAX_SUGGESTIONS):andThen(function(p2)
		local t
		local responseBody = p2 and p2.responseBody
		
		if responseBody then
			t = responseBody.suggestions
			
			return t or {}
		end
		t = {}
	end)
end