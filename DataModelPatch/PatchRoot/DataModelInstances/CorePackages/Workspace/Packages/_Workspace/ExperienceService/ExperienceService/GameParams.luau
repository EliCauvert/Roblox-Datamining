local _ = require(script.Parent.GameProtocolTypes)
local GameParamsModule = {
	new = function()
		return { referralPage = "LuaChat" }
	end
}

function GameParamsModule.fromPlaceId(PlaceId, IsTeamTest)
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	NewGameParams.placeId = PlaceId
	NewGameParams.isTeamTest = IsTeamTest
	
	return NewGameParams
end

function GameParamsModule.fromUserId(UserId, PlaceId)
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	NewGameParams.userId = UserId
	NewGameParams.placeId = PlaceId
	
	return NewGameParams
end

function GameParamsModule.fromPlaceInstance(PlaceId, GameInstanceId)
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	NewGameParams.placeId = PlaceId
	NewGameParams.gameInstanceId = GameInstanceId
	
	return NewGameParams
end

function GameParamsModule.fromConversationId(PlaceId, ConversationId)
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	NewGameParams.placeId = PlaceId
	NewGameParams.conversationId = ConversationId
	
	return NewGameParams
end

function GameParamsModule.fromParams(List)
	-- upvalues: GameParamsModule (copy)
	local NewGameParams = GameParamsModule.new()
	
	for i, value in pairs(List) do
		NewGameParams[i] = value
	end
	return NewGameParams
end

return GameParamsModule