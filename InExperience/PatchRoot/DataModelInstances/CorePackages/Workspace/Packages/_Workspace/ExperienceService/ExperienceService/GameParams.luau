local _ = require(script.Parent.GameProtocolTypes)
local GameParamsModule = {
	new = function() --[[ Line: 9 ]]
		return { referralPage = "LuaChat" }
	end
}

function GameParamsModule.fromPlaceId(PlaceId, IsTeamTest) --[[ Line: 17 ]]
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	NewGameParams.placeId = PlaceId
	NewGameParams.isTeamTest = IsTeamTest
	
	return NewGameParams
end

function GameParamsModule.fromUserId(UserId, PlaceId) --[[ Line: 26 ]]
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	NewGameParams.userId = UserId
	NewGameParams.placeId = PlaceId
	
	return NewGameParams
end

function GameParamsModule.fromPlaceInstance(PlaceId, GameInstanceId) --[[ Line: 33 ]]
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	NewGameParams.placeId = PlaceId
	NewGameParams.gameInstanceId = GameInstanceId
	
	return NewGameParams
end

function GameParamsModule.fromConversationId(PlaceId, ConversationId) --[[ Line: 42 ]]
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	NewGameParams.placeId = PlaceId
	NewGameParams.conversationId = ConversationId
	
	return NewGameParams
end

function GameParamsModule.fromParams(List) --[[ Line: 51 ]]
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	
	for i, value in pairs(List) do
		NewGameParams[i] = value
	end
	return NewGameParams
end

return GameParamsModule