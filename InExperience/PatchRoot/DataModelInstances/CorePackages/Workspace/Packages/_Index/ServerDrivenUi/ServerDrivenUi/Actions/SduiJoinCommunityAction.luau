local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), dataHydrationModule (ref), signalsModule (ref), setCurrentToastMessage (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.JoinCommunity
		}, p2.appPage)
		
		return
	end
	local communityId = var1.communityId
	
	if communityId == nil or typeof(communityId) ~= "string" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: communityId",
			propName = "communityId",
			name = sduiActionType.JoinCommunity
		}, p2.appPage)
		
		return
	end
	local var2 = dataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).joinCommunity(communityId)
	local dispatch = p2.dependencies.dispatch
	local t = {}
	t.dispose = signalsModule.createEffect(function(p3)
		-- upvalues: var2 (ref), dispatch (ref), setCurrentToastMessage (copy), t (ref)
		local var3 = var2(p3)
		
		if var3 == nil then return end
		if var3.type == "error" then
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