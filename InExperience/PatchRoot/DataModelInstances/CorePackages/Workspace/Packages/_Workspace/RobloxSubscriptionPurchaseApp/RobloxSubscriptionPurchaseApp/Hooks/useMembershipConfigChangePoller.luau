local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local RobloxSubscriptionSignalsModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionSignals)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local FinalizeRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local GetRobloxSubscriptionMembershipConfigModule = require(RobloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionMembershipConfig)
local MembershipConfigChangeCheckModule = require(RobloxSubscriptionPurchaseApp.Utils.MembershipConfigChangeCheck)
local FIntPlusUpgradePollingIntervalMsModule = require(RobloxSubscriptionPurchaseApp.Flags.FIntPlusUpgradePollingIntervalMs)

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy), ReactModule (copy), SignalsReactModule (copy), PromptStateModule (copy), FIntPlusUpgradePollingIntervalMsModule (copy), GetRobloxSubscriptionMembershipConfigModule (copy), MembershipConfigChangeCheckModule (copy), RobloxSubscriptionSignalsModule (copy), FinalizeRobloxSubscriptionUpsellFlowModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local UseRefResult = ReactModule.useRef(GetResult)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetResult.getPromptState)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), PromptStateModule (upval), UseRefResult (copy), FIntPlusUpgradePollingIntervalMsModule (upval), GetRobloxSubscriptionMembershipConfigModule (upval), MembershipConfigChangeCheckModule (upval), RobloxSubscriptionSignalsModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval)
		if UseSignalStateResult ~= PromptStateModule.SubscriptionStatusPolling then
			return nil
		end
		local Current = UseRefResult.current
		local MembershipConfigSnapshot = Current.getMembershipConfigSnapshot()
		
		if MembershipConfigSnapshot == nil then
			return nil
		else
			local Flag = false
			
			local function _(): boolean
				-- upvalues: Flag (ref), Current (copy), PromptStateModule (upval)
				return not Flag and Current.getPromptState() == PromptStateModule.SubscriptionStatusPolling
			end
			
			local function scheduleCheck()
				-- upvalues: FIntPlusUpgradePollingIntervalMsModule (upval), Flag (ref), Current (copy), PromptStateModule (upval), GetRobloxSubscriptionMembershipConfigModule (upval), MembershipConfigChangeCheckModule (upval), MembershipConfigSnapshot (copy), RobloxSubscriptionSignalsModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval), scheduleCheck (copy)
				task.delay(FIntPlusUpgradePollingIntervalMsModule / 1000, function()
					-- upvalues: Flag (upval), Current (upval), PromptStateModule (upval), GetRobloxSubscriptionMembershipConfigModule (upval), MembershipConfigChangeCheckModule (upval), MembershipConfigSnapshot (upval), RobloxSubscriptionSignalsModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval), scheduleCheck (upval)
					if not Flag and Current.getPromptState() == PromptStateModule.SubscriptionStatusPolling then
						GetRobloxSubscriptionMembershipConfigModule():andThen(function(Result)
							-- upvalues: Flag (upval), Current (upval), PromptStateModule (upval), MembershipConfigChangeCheckModule (upval), MembershipConfigSnapshot (upval), RobloxSubscriptionSignalsModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval), scheduleCheck (upval)
							if Flag or Current.getPromptState() ~= PromptStateModule.SubscriptionStatusPolling then return end
							if Result == nil or not MembershipConfigChangeCheckModule.isChanged(MembershipConfigSnapshot, Result) then
								scheduleCheck()
								
								return
							end
							local GetResult = RobloxSubscriptionSignalsModule.get()
							GetResult.setHasRobloxSubscriptionUpgradedThisSession(true)
							
							if next(MembershipConfigSnapshot) ~= nil and GetResult.getHasRobloxSubscription() then
								GetResult.setExistingSubscriptionUpgradedThisSession(true)
							end
							FinalizeRobloxSubscriptionUpsellFlowModule(true)
						end)
						
						return
					end
				end)
			end
			
			task.delay(FIntPlusUpgradePollingIntervalMsModule / 1000, function()
				-- upvalues: Flag (ref), Current (copy), PromptStateModule (upval), GetRobloxSubscriptionMembershipConfigModule (upval), MembershipConfigChangeCheckModule (upval), MembershipConfigSnapshot (copy), RobloxSubscriptionSignalsModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval), scheduleCheck (copy)
				if not Flag and Current.getPromptState() == PromptStateModule.SubscriptionStatusPolling then
					GetRobloxSubscriptionMembershipConfigModule():andThen(function(Result)
						-- upvalues: Flag (upval), Current (upval), PromptStateModule (upval), MembershipConfigChangeCheckModule (upval), MembershipConfigSnapshot (upval), RobloxSubscriptionSignalsModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval), scheduleCheck (upval)
						if Flag or Current.getPromptState() ~= PromptStateModule.SubscriptionStatusPolling then return end
						if Result == nil or not MembershipConfigChangeCheckModule.isChanged(MembershipConfigSnapshot, Result) then
							scheduleCheck()
							
							return
						end
						local GetResult = RobloxSubscriptionSignalsModule.get()
						GetResult.setHasRobloxSubscriptionUpgradedThisSession(true)
						
						if next(MembershipConfigSnapshot) ~= nil and GetResult.getHasRobloxSubscription() then
							GetResult.setExistingSubscriptionUpgradedThisSession(true)
						end
						FinalizeRobloxSubscriptionUpsellFlowModule(true)
					end)
					
					return
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		end
	end, { UseSignalStateResult })
end