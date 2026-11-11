local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local TModule = require(CorePackages.Packages.t)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ApiFetchGameIsFavoriteModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGameIsFavorite)
local ApiFetchGameFollowingStatusModule = require(Modules.LuaApp.Thunks.ApiFetchGameFollowingStatus)
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local ReturnFromGameReceiver = require(CorePackages.Packages.Roact).PureComponent:extend("ReturnFromGameReceiver")

function ReturnFromGameReceiver.init(p1)
	-- upvalues: MessageBus (copy), TModule (copy)
	p1.launchedUniverseId = nil
	
	function p1.reloadFavoriteAndFollowing()
		-- upvalues: p1 (copy)
		return p1.props.fetchFavoriteAndFollowingData(p1.props.networking, p1.launchedUniverseId)
	end
	
	function p1.returnedFromGame()
		-- upvalues: p1 (copy)
		if p1.props.onGameReturned then
			p1.props.onGameReturned(p1.launchedUniverseId)
		end
		p1:reloadFavoriteAndFollowing()
	end
	
	p1.subscriber = MessageBus.Subscriber.new()
	p1.subscriber:subscribe({
		mid = MessageBus.getMessageId("Game", "onGameLeave"),
		validateParams = TModule.table
	}, function(p2)
		-- upvalues: p1 (copy)
		p1.launchedUniverseId = nil
		
		if p1.props.games then
			for i, _game in pairs(p1.props.games) do
				if _game.placeId == tostring(p2.placeId) then
					p1.launchedUniverseId = tostring(i)
				end
			end
		end
		if p1.launchedUniverseId then
			p1:returnedFromGame()
			p1.launchedUniverseId = nil
		end
	end)
end

function ReturnFromGameReceiver:render() end

return RoactRoduxModule.connect(function(p2)
	-- upvalues: GameInfosReducer (copy)
	return {
		games = p2.Personalization[GameInfosReducer.key],
		gameDetails = p2.GameDetails
	}
end, function(Callback)
	-- upvalues: ApiFetchGameIsFavoriteModule (copy), ApiFetchGameFollowingStatusModule (copy)
	return {
		fetchFavoriteAndFollowingData = function(p2, p3)
			-- upvalues: Callback (copy), ApiFetchGameIsFavoriteModule (upval), ApiFetchGameFollowingStatusModule (upval)
			Callback(ApiFetchGameIsFavoriteModule(p2, p3))
			Callback(ApiFetchGameFollowingStatusModule(p2, p3))
		end
	}
end)((RoactServices.connect({ networking = RoactNetworkingModule })(ReturnFromGameReceiver)))