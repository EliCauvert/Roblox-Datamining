local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p0, _, p1, _) --[[ line: 18 | named "SduiJoinCommunityAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), dataHydrationModule (ref), signalsModule (ref), setCurrentToastMessage (ref)
	local var3 = if p0 then p0.actionParams else nil
	
	if var3 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.JoinCommunity
		}, p1.appPage)
		
		return
	end
	local communityId = var3.communityId
	
	if communityId == nil or typeof(communityId) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: communityId",
			propName = "communityId",
			name = sduiActionType.JoinCommunity
		}, p1.appPage)
		
		return
	end
	local var4 = dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).joinCommunity(communityId)
	local dispatch = p1.dependencies.dispatch
	local t = {}
	t.dispose = signalsModule.createEffect(function(p2) --[[ line: 50 ]]
		-- upvalues: var4 (ref), dispatch (ref), setCurrentToastMessage (copy), t (ref)
		local var6 = var4(p2)
		
		if var6 == nil then return end
		if var6.type == "error" then
			dispatch(setCurrentToastMessage({
				toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
			}))
		end
		local dispose = t.dispose
		
		if dispose then
			dispose()
			t.dispose = nil
		end
	end)
end