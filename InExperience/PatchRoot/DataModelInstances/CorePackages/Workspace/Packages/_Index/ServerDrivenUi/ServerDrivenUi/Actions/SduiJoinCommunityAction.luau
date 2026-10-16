local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _) --[[ Line: 18 | Named "SduiJoinCommunityAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), DataHydrationModule (copy), SignalsModule (copy), SetCurrentToastMessageFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = SduiActionType.JoinCommunity
		}, p2.appPage)
		
		return
	end
	local CommunityId = ActionParams.communityId
	
	if CommunityId == nil or typeof(CommunityId) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: communityId",
			propName = "communityId",
			name = SduiActionType.JoinCommunity
		}, p2.appPage)
		
		return
	else
		local JoinCommunityResult = DataHydrationModule.CommunityUserMembership.getCommunityUserMembershipStore(false).joinCommunity(CommunityId)
		local DispatchFunction = p2.dependencies.dispatch
		local t = {}
		t.dispose = SignalsModule.createEffect(function(p3) --[[ Line: 50 ]]
			-- upvalues: JoinCommunityResult (copy), DispatchFunction (copy), SetCurrentToastMessageFunction (upval), t (copy)
			local JoinCommunityResultResult = JoinCommunityResult(p3)
			
			if JoinCommunityResultResult == nil then return end
			if JoinCommunityResultResult.type == "error" then
				DispatchFunction(SetCurrentToastMessageFunction({
					toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
				}))
			end
			local DisposeFunction: () -> () = t.dispose
			
			if DisposeFunction then
				DisposeFunction()
				t.dispose = nil
			end
		end)
	end
end