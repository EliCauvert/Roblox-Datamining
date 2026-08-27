local _ = require(script.Parent.FollowingStoreTypes)
local t = {
	[2] = "Blocked",
	[3] = "Blocked",
	[8] = "SelfFollow",
	[9] = "FloodLimit",
	[14] = "Captcha",
	[429] = "FloodLimit",
	[503] = "Unavailable"
}

return function(p1)
	-- upvalues: t (ref)
	local var1 = if type(p1) == "table" then p1.responseCode else nil
	local var2 = if type(var1) == "number" then t[var1] else nil
	
	return {
		type = "error",
		errorType = if var2 ~= nil then "NetworkError" else var2,
		responseCode = var1
	}
end