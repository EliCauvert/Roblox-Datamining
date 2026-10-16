local Success, Result = pcall(function() --[[ Line: 1 ]]
	return game:GetService("StudioService")
end)
local Result1 = if Success then Result else nil
local _ = require(script.Parent.Parent.util.Types)

return function() --[[ Line: 10 | Named "getRestrictedUserTable" ]]
	-- upvalues: Result1 (copy)
	return if Result1 then { { creatorType = "User", id = Result1:GetUserId() } } else {}
end