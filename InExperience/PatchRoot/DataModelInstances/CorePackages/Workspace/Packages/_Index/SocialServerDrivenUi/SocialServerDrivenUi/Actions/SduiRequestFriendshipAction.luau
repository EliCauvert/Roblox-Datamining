local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local friendsStore = require(parent.DataHydration).Friends.FriendsStore
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local enums = require(parent.FriendsNetworking).Enums
local firePlayerFriendAddTelemetryModule = require(socialServerDrivenUi.Analytics.firePlayerFriendAddTelemetry)
local fFlagSduiSearchPeoplePlayerTileTelemetry = require(parent.SharedFlags).FFlagSduiSearchPeoplePlayerTileTelemetry
local var3 = enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return function(p0, p1, p2) --[[ line: 24 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), var3 (ref), friendsStore (ref), setCurrentToastMessage (ref), fFlagSduiSearchPeoplePlayerTileTelemetry (ref), firePlayerFriendAddTelemetryModule (ref)
	local var4 = if p0 then p0.actionParams else nil
	
	if var4 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RequestFriendship
		}, p2.appPage)
		
		return
	end
	local targetUserId = var4.targetUserId
	
	if targetUserId == nil or targetUserId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: targetUserId",
			propName = "targetUserId",
			name = sduiActionType.RequestFriendship
		}, p2.appPage)
		
		return
	end
	local source = var4.source
	friendsStore.get().RequestFriendship(targetUserId, if typeof(source) == "string" and source ~= "" then source else var3):andThen(function() --[[ line: 53 ]]
		-- upvalues: p2 (ref), setCurrentToastMessage (copy)
		p2.dependencies.dispatch(setCurrentToastMessage({
			toastMessage = "Feature.Friends.Action.FriendRequestSent",
			isLocalized = false
		}))
	end):catch(function() --[[ line: 59 ]]
		-- upvalues: p2 (ref), setCurrentToastMessage (copy)
		p2.dependencies.dispatch(setCurrentToastMessage({
			toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
			isLocalized = false
		}))
	end)
	
	if fFlagSduiSearchPeoplePlayerTileTelemetry then
		firePlayerFriendAddTelemetryModule(targetUserId, p1, p2)
	end
end