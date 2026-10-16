local _ = require(script.Parent.FollowingStoreTypes)
local FollowingUpdateErrorTypeEnumModule = require(script.Parent.FollowingUpdateErrorTypeEnum)
local config = {
	[2] = FollowingUpdateErrorTypeEnumModule.Blocked,
	[3] = FollowingUpdateErrorTypeEnumModule.Blocked,
	[8] = FollowingUpdateErrorTypeEnumModule.SelfFollow,
	[9] = FollowingUpdateErrorTypeEnumModule.FloodLimit,
	[14] = FollowingUpdateErrorTypeEnumModule.Captcha,
	[429] = FollowingUpdateErrorTypeEnumModule.FloodLimit,
	[503] = FollowingUpdateErrorTypeEnumModule.Unavailable
}

return function(p1) --[[ Line: 19 | Named "classifyFollowingError" ]]
	-- upvalues: config (copy), FollowingUpdateErrorTypeEnumModule (copy)
	local ResponseCode = if type(p1) == "table" then p1.responseCode else nil
	local Entry = if type(ResponseCode) == "number" then config[ResponseCode] else nil
	
	return {
		type = "error",
		errorType = if Entry == nil then FollowingUpdateErrorTypeEnumModule.NetworkError else Entry,
		responseCode = ResponseCode
	}
end