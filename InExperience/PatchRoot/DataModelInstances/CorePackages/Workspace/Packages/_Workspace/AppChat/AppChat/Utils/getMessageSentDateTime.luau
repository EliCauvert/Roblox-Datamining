local AppChat = script:FindFirstAncestor("AppChat")
local _ = AppChat.Parent
local ParseIsoDateUnixMillisModule = require(AppChat.Utils.parseIsoDateUnixMillis)

local function _(p1)
	-- upvalues: ParseIsoDateUnixMillisModule (copy)
	if type(p1) == "string" then
		local ParseIsoDateUnixMillisModuleResult = ParseIsoDateUnixMillisModule(p1)
		
		return if ParseIsoDateUnixMillisModuleResult == nil then nil else DateTime.fromUnixTimestampMillis(ParseIsoDateUnixMillisModuleResult)
	else
		return nil
	end
end

return function(p1)
	-- upvalues: ParseIsoDateUnixMillisModule (copy)
	local Sent = p1.sent
	
	if Sent == nil then
		local CreatedAt = p1.created_at or p1.createdAt
		
		if type(CreatedAt) == "string" then
			local ParseIsoDateUnixMillisModuleResult = ParseIsoDateUnixMillisModule(CreatedAt)
			
			return if ParseIsoDateUnixMillisModuleResult == nil then nil else DateTime.fromUnixTimestampMillis(ParseIsoDateUnixMillisModuleResult)
		else
			return nil
		end
	elseif type(Sent) ~= "string" then
		return Sent
	elseif type(Sent) == "string" then
		local ParseIsoDateUnixMillisModuleResult = ParseIsoDateUnixMillisModule(Sent)
		
		return if ParseIsoDateUnixMillisModuleResult == nil then nil else DateTime.fromUnixTimestampMillis(ParseIsoDateUnixMillisModuleResult)
	else
		return nil
	end
end