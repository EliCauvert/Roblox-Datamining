local GetConversationMessageStoreModule = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.GetConversationMessageStore)

local function _(p1)
	local CreatedAt = if p1 then p1.created_at else nil
	
	if CreatedAt == nil then
		return 1e999
	end
	local _DateTime = DateTime.fromIsoDate(CreatedAt)
	
	if _DateTime then
		return _DateTime.UnixTimestampMillis
	else
		local Number: number? = tonumber(CreatedAt)
		
		return if Number then Number * 1000 else 1e999
	end
end

return function(p1)
	-- upvalues: GetConversationMessageStoreModule (copy)
	local t = {}
	local Now = if p1 == nil then nil else p1.now
	
	return function(Key, p2)
		-- upvalues: t (copy), GetConversationMessageStoreModule (upval), Now (copy)
		local Entry = t[Key]
		
		if Entry ~= nil then
			return Entry
		end
		local Message = GetConversationMessageStoreModule(p2).getMessage(Key, p2)
		
		if Message == nil then
			return 1e999
		end
		local CreatedAt = if Message then Message.created_at else nil
		local UnixTimestampMillis = nil
		
		if CreatedAt == nil then
			UnixTimestampMillis = 1e999
		else
			local _DateTime = DateTime.fromIsoDate(CreatedAt)
			
			if _DateTime then
				UnixTimestampMillis = _DateTime.UnixTimestampMillis
			else
				local Number: number? = tonumber(CreatedAt)
				UnixTimestampMillis = if Number then Number * 1000 else 1e999
			end
		end
		if UnixTimestampMillis == 1e999 and Now ~= nil then
			UnixTimestampMillis = Now()
		end
		t[Key] = UnixTimestampMillis
		
		return UnixTimestampMillis
	end
end