local _ = require(script.Parent.GameProtocolTypes)
local t = {
	new = function()
		return { referralPage = "LuaChat" }
	end
}

function t.fromPlaceId(p1, p2)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.placeId = p1
	var1.isTeamTest = p2
	
	return var1
end

function t.fromUserId(p1, p2)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.userId = p1
	var1.placeId = p2
	
	return var1
end

function t.fromPlaceInstance(p1, p2)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.placeId = p1
	var1.gameInstanceId = p2
	
	return var1
end

function t.fromConversationId(p1, p2)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.placeId = p1
	var1.conversationId = p2
	
	return var1
end

function t.fromParams(p1)
	-- upvalues: t (ref)
	local var1 = t.new()
	
	for i, v in pairs(p1) do
		var1[i] = v
	end
	return var1
end

return t