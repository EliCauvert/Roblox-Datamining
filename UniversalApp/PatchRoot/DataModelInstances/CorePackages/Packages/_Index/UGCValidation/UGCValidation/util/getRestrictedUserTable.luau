local ok, status = pcall(function()
	return game:GetService("StudioService")
end)
local var1 = if ok then status else nil
local _ = require(script.Parent.Parent.util.Types)

return function()
	-- upvalues: var1 (ref)
	return if var1 then { { creatorType = "User", id = var1:GetUserId() } } else {}
end