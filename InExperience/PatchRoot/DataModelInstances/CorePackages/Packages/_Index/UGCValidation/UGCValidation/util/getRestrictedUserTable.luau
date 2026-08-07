local ok, status = pcall(function() --[[ line: 1 ]]
	return game:GetService("StudioService")
end)
local var0 = if ok then status else nil
local _ = require(script.Parent.Parent.util.Types)

return function() --[[ line: 10 | named "getRestrictedUserTable" ]]
	-- upvalues: var0 (ref)
	return if var0 then { { creatorType = "User", id = var0:GetUserId() } } else {}
end