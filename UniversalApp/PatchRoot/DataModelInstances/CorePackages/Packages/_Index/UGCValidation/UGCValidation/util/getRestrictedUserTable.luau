local ok, status = pcall(function()
	return game:GetService("StudioService")
end)
local var0 = if ok then status else nil
local _ = require(script.Parent.Parent.util.Types)

return function()
	-- upvalues: var0 (ref)
	return if var0 then { { creatorType = "User", id = var0:GetUserId() } } else {}
end