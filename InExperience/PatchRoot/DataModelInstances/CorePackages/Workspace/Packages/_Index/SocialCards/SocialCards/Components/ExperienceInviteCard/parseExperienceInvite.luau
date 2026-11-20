local _ = require(script.Parent.InviteTypes)

local function toId(Value)
	return if typeof(Value) == "number" then if Value > 0 and Value == math.floor(Value) and Value < 9007199254740992 then string.format("%d", Value) else nil elseif typeof(Value) == "string" and string.match(Value, "^[1-9]%d*$") then Value else nil
end

return function(p1)
	-- upvalues: toId (copy)
	local Id = toId(p1.universe_id)
	local Id1 = toId(p1.inviter_user_id)
	
	return if Id == nil or Id1 == nil then nil else { universeId = Id, actorId = Id1 }
end