local _ = require(script.Parent.FollowingStoreTypes)
local followingUpdateErrorTypeEnumModule = require(script.Parent.FollowingUpdateErrorTypeEnum)
local t = {
	[2] = followingUpdateErrorTypeEnumModule.Blocked,
	[3] = followingUpdateErrorTypeEnumModule.Blocked,
	[8] = followingUpdateErrorTypeEnumModule.SelfFollow,
	[9] = followingUpdateErrorTypeEnumModule.FloodLimit,
	[14] = followingUpdateErrorTypeEnumModule.Captcha,
	[429] = followingUpdateErrorTypeEnumModule.FloodLimit,
	[503] = followingUpdateErrorTypeEnumModule.Unavailable
}

return function(p1)
	-- upvalues: t (ref), followingUpdateErrorTypeEnumModule (ref)
	local var1 = if type(p1) == "table" then p1.responseCode else nil
	local var2 = if type(var1) == "number" then t[var1] else nil
	
	return {
		type = "error",
		errorType = if var2 ~= nil then followingUpdateErrorTypeEnumModule.NetworkError else var2,
		responseCode = var1
	}
end