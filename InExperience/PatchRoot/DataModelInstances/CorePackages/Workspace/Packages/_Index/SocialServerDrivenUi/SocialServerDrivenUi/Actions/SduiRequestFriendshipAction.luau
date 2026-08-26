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
local var1 = enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return function(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), var1 (ref), friendsStore (ref), setCurrentToastMessage (ref), fFlagSduiSearchPeoplePlayerTileTelemetry (ref), firePlayerFriendAddTelemetryModule (ref)
	local var2 = if p1 then p1.actionParams else nil
	
	if var2 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RequestFriendship
		}, p3.appPage)
		
		return
	end
	local targetUserId = var2.targetUserId
	
	if targetUserId == nil or targetUserId == "" then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: targetUserId",
			propName = "targetUserId",
			name = sduiActionType.RequestFriendship
		}, p3.appPage)
		
		return
	end
	local source = var2.source
	friendsStore.get().RequestFriendship(targetUserId, if typeof(source) == "string" and source ~= "" then source else var1):andThen(function()
		-- upvalues: p3 (ref), setCurrentToastMessage (copy)
		p3.dependencies.dispatch(setCurrentToastMessage({
			toastMessage = "Feature.Friends.Action.FriendRequestSent",
			isLocalized = false
		}))
	end):catch(function()
		-- upvalues: p3 (ref), setCurrentToastMessage (copy)
		p3.dependencies.dispatch(setCurrentToastMessage({
			toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
			isLocalized = false
		}))
	end)
	
	if fFlagSduiSearchPeoplePlayerTileTelemetry then
		firePlayerFriendAddTelemetryModule(targetUserId, p2, p3)
	end
end