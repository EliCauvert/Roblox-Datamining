local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)

return function(p1)
	return if p1 == nil then nil else p1.responseBody or p1
end