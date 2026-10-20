local Parent = script:FindFirstAncestor("AddFriends").Parent
local LlamaModule = require(Parent.llama)
local TModule = require(Parent.t)

return function(p1)
	-- upvalues: TModule (copy), LlamaModule (copy)
	assert(TModule.table(p1))
	
	return LlamaModule.List.sort(p1, function(p2, p3): boolean
		local UnixTimestampMillis = p2.sentAt and p2.sentAt.UnixTimestampMillis or 0
		local UnixTimestampMillis1 = p3.sentAt and p3.sentAt.UnixTimestampMillis or 0
		
		return if UnixTimestampMillis == UnixTimestampMillis1 then p2.displayName and not p3.displayName or (p2.displayName or not p3.displayName) and (if p2.displayName and p3.displayName and string.lower(p2.displayName) ~= string.lower(p3.displayName) then string.lower(p2.displayName) < string.lower(p3.displayName) elseif p2.username and p3.username then string.lower(p2.username) < string.lower(p3.username) else p2.username and not p3.username or false) else UnixTimestampMillis1 < UnixTimestampMillis
	end)
end