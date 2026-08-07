local _ = require(script.Parent.GameProtocolTypes)
local t = {
	new = function() --[[ line: 9 ]]
		return { referralPage = "LuaChat" }
	end
}

function t.fromPlaceId(p0, p1) --[[ line: 17 ]]
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.placeId = p0
	var1.isTeamTest = p1
	
	return var1
end

function t.fromUserId(p2, p3) --[[ line: 26 ]]
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.userId = p2
	var2.placeId = p3
	
	return var2
end

function t.fromPlaceInstance(p4, p5) --[[ line: 33 ]]
	-- upvalues: t (ref)
	local var3 = t.new()
	var3.placeId = p4
	var3.gameInstanceId = p5
	
	return var3
end

function t.fromConversationId(p6, p7) --[[ line: 42 ]]
	-- upvalues: t (ref)
	local var4 = t.new()
	var4.placeId = p6
	var4.conversationId = p7
	
	return var4
end

function t.fromParams(p8) --[[ line: 51 ]]
	-- upvalues: t (ref)
	local var5 = t.new()
	
	for i, v in pairs(p8) do
		var5[i] = v
	end
	return var5
end

return t