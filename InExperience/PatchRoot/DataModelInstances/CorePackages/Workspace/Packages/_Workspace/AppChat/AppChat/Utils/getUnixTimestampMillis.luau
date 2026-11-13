local AppChat = script:FindFirstAncestor("AppChat")
local _ = AppChat.Parent
local ParseIsoDateUnixMillisModule = require(AppChat.Utils.parseIsoDateUnixMillis)

return function(p1)
	-- upvalues: ParseIsoDateUnixMillisModule (copy)
	return if typeof(p1) == "DateTime" then p1.UnixTimestampMillis elseif type(p1) == "string" then ParseIsoDateUnixMillisModule(p1) elseif type(p1) == "table" and p1.GetUnixTimestamp ~= nil then math.round(p1:GetUnixTimestamp() * 1000) else nil
end