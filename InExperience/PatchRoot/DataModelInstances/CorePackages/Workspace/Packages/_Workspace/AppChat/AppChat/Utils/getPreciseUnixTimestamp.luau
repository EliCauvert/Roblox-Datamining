local ParseIsoDateUnixMillisModule = require(script:FindFirstAncestor("AppChat").Utils.parseIsoDateUnixMillis)

return function(p1)
	-- upvalues: ParseIsoDateUnixMillisModule (copy)
	if typeof(p1) == "DateTime" then
		return p1.UnixTimestampMillis / 1000
	elseif type(p1) == "string" then
		local ParseIsoDateUnixMillisModuleResult: number = ParseIsoDateUnixMillisModule(p1)
		
		return if ParseIsoDateUnixMillisModuleResult == nil then nil else ParseIsoDateUnixMillisModuleResult / 1000
	else
		return if type(p1) == "table" and p1.GetUnixTimestamp ~= nil then p1:GetUnixTimestamp() else nil
	end
end