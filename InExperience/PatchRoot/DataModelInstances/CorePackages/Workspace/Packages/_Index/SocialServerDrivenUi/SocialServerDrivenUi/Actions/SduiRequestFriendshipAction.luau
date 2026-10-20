local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local FriendsStore = require(Parent.DataHydration).Friends.FriendsStore
local FriendsStoreChallengeNetworkModule = require(SocialServerDrivenUi.Networking.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local FirePlayerFriendAddTelemetryModule = require(SocialServerDrivenUi.Analytics.firePlayerFriendAddTelemetry)
local FFlagSduiSearchPeoplePlayerTileTelemetry = require(Parent.SharedFlags).FFlagSduiSearchPeoplePlayerTileTelemetry
local RawValueResult = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return function(p1, p2, p3)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), RawValueResult (copy), FriendsStore (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), SetCurrentToastMessageFunction (copy), FFlagSduiSearchPeoplePlayerTileTelemetry (copy), FirePlayerFriendAddTelemetryModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.RequestFriendship
		}, p3.appPage)
		
		return
	end
	local TargetUserId = ActionParams.targetUserId
	
	if TargetUserId == nil or TargetUserId == "" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: targetUserId",
			propName = "targetUserId",
			name = SduiActionType.RequestFriendship
		}, p3.appPage)
		
		return
	end
	local Source = ActionParams.source
	FriendsStore.get().RequestFriendship(TargetUserId, if typeof(Source) == "string" and Source ~= "" then Source else RawValueResult, nil, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil):andThen(function()
		-- upvalues: p3 (copy), SetCurrentToastMessageFunction (upval)
		p3.dependencies.dispatch(SetCurrentToastMessageFunction({
			toastMessage = "Feature.Friends.Action.FriendRequestSent",
			isLocalized = false
		}))
	end):catch(function()
		-- upvalues: p3 (copy), SetCurrentToastMessageFunction (upval)
		p3.dependencies.dispatch(SetCurrentToastMessageFunction({
			toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
			isLocalized = false
		}))
	end)
	
	if FFlagSduiSearchPeoplePlayerTileTelemetry then
		FirePlayerFriendAddTelemetryModule(TargetUserId, p2, p3)
	end
end