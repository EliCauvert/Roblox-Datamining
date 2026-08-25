local appChatNetworkingModule = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)

return function(p0)
	-- upvalues: appChatNetworkingModule (ref), constantsModule (ref)
	return appChatNetworkingModule.http.GetSuggestions(nil, p0, constantsModule.SUGGESTION_TYPES, constantsModule.MAX_SUGGESTIONS):andThen(function(p1)
		local t
		local responseBody = p1 and p1.responseBody
		
		if responseBody then
			t = responseBody.suggestions
			
			return t or {}
		end
		t = {}
	end)
end