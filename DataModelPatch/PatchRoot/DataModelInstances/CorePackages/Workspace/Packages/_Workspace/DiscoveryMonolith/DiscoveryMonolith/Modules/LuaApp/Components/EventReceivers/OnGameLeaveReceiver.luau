local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactServices = require(Parent.RoactServices).RoactServices
local MessageBus = require(Parent.MessageBus).MessageBus
local TModule = require(Parent.t)
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local AppOmniRecommendationsRequest = require(Parent.RoactServiceTags).AppOmniRecommendationsRequest
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FetchDataOnGameExitModule = require(DiscoveryMonolith.Modules.LuaApp.Thunks.Games.FetchDataOnGameExit)
local OnGameLeaveReceiver = require(Parent.Roact).PureComponent:extend("OnGameLeaveReceiver")

function OnGameLeaveReceiver.init(p1)
	-- upvalues: MessageBus (copy), TModule (copy)
	function p1.returnedFromGame()
		-- upvalues: p1 (copy)
		p1.props.fetchDataOnGameExit(p1.props.networking, p1.props.omniRecommendationsRequest, p1.props.loggingProtocol)
	end
	
	p1.subscriber = MessageBus.Subscriber.new()
	p1.subscriber:subscribe({
		mid = MessageBus.getMessageId("Game", "onGameLeave"),
		validateParams = TModule.table
	}, function(_)
		-- upvalues: p1 (copy)
		p1.returnedFromGame()
	end)
end

function OnGameLeaveReceiver:render() end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: FetchDataOnGameExitModule (copy)
	return {
		fetchDataOnGameExit = function(p1, p2, p3)
			-- upvalues: Callback (copy), FetchDataOnGameExitModule (upval)
			Callback(FetchDataOnGameExitModule(p1, p2, p3))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworking,
	omniRecommendationsRequest = AppOmniRecommendationsRequest,
	loggingProtocol = AppLogging
})(OnGameLeaveReceiver)))