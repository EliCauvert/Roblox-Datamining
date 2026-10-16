local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SignalsModule = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local _ = require(Parent.DataHydration.AdCampaignEligibility)
local CanCreateCampaignFunction = require(BuildExperience.Components.Ads.adCampaignEligibilityUtils).canCreateCampaign
local _ = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildAdsNotificationRouting = require(Parent.SharedFlags).FFlagBuildAdsNotificationRouting

return function() --[[ Line: 45 | Named "createAdsCampaignDeepLinkStore" ]]
	-- upvalues: CreateSessionScopedSignalFunction (copy), SignalsModule (copy), FFlagBuildAdsNotificationRouting (copy), CanCreateCampaignFunction (copy)
	local t = {}
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
	local Idle, Idle2 = CreateSessionScopedSignalFunction("idle")
	local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(function() --[[ Line: 51 ]]
		return {}
	end)
	local SessionScopedSignal3, SessionScopedSignal2_2 = CreateSessionScopedSignalFunction(nil)
	
	return {
		getRequest = SessionScopedSignal,
		getStatus = Idle,
		hasVisibleChat = function(UniverseId): boolean --[[ Line: 298 ]]
			-- upvalues: t (copy)
			for i in t do
				local v1 = i(false)
				
				if v1 ~= nil and v1.isPageVisible and v1.universeId == UniverseId then
					return true
				end
			end
			return false
		end,
		begin = function(Id, UniverseId): boolean --[[ Line: 307 ]]
			-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy), Idle2 (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal1(false)
			
			if SessionScopedSignalResult[Id] then
				return false
			else
				local Copy = table.clone(SessionScopedSignalResult)
				Copy[Id] = true
				SessionScopedSignal2_1(Copy)
				Idle2(if UniverseId == nil then "idle" else "pending")
				SessionScopedSignal2(if UniverseId == nil then nil else {
					id = Id,
					universeId = UniverseId,
					expiresAt = os.clock() + 10
				})
				
				return true
			end
		end,
		claim = function(Id): boolean --[[ Line: 57 ]]
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal3 (copy), SessionScopedSignal2_2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			
			if SessionScopedSignalResult == nil or SessionScopedSignalResult.id ~= Id or SessionScopedSignal3(false) == Id then
				return false
			else
				SessionScopedSignal2_2(Id)
				
				return true
			end
		end,
		finish = function(Id) --[[ Line: 66 ]]
			-- upvalues: SessionScopedSignal (copy), Idle (copy), Idle2 (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			
			if SessionScopedSignalResult ~= nil and SessionScopedSignalResult.id == Id then
				local IdleResult = Idle(false)
				
				if IdleResult == "pending" or IdleResult == "refreshing" then
					Idle2("cancelled")
				end
				SessionScopedSignal2(nil)
			end
		end,
		createChat = function() --[[ Line: 77 ]]
			-- upvalues: CreateSessionScopedSignalFunction (upval), SignalsModule (upval), FFlagBuildAdsNotificationRouting (upval), t (copy), SessionScopedSignal (copy), Idle2 (copy), Idle (copy), SessionScopedSignal2 (copy), SessionScopedSignal3 (copy), SessionScopedSignal2_2 (copy), CanCreateCampaignFunction (upval)
			local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(nil)
			local Signal, Signal2 = SignalsModule.createSignal(0)
			local SessionScopedSignal4, SessionScopedSignal2_3 = CreateSessionScopedSignalFunction(nil)
			local SessionScopedSignal5, SessionScopedSignal2_4 = CreateSessionScopedSignalFunction(nil)
			
			return {
				getScopeRevision = Signal,
				updateScope = function(UniverseId, SessionId, IsPageVisible, CanPresent) --[[ Line: 86 ]]
					-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal4 (copy), SessionScopedSignal5 (copy), SessionScopedSignal2_4 (copy), SessionScopedSignal2_3 (copy), Signal2 (copy), SessionScopedSignal2_1 (copy)
					local SessionScopedSignalResult = SessionScopedSignal1(false)
					local config = {
						universeId = UniverseId,
						sessionId = SessionId,
						isPageVisible = IsPageVisible,
						canPresent = CanPresent
					}
					
					if SessionScopedSignalResult ~= nil then
						local IsNotUniverseIdMatch: boolean = SessionScopedSignalResult.universeId ~= UniverseId or SessionScopedSignalResult.sessionId ~= SessionId
						
						if not IsNotUniverseIdMatch and SessionScopedSignalResult.isPageVisible == IsPageVisible and SessionScopedSignalResult.canPresent == CanPresent then return end
						if IsNotUniverseIdMatch then
							if SessionScopedSignalResult.universeId == UniverseId and (if SessionScopedSignalResult.sessionId == nil then SessionId ~= nil and (SessionId ~= "" and SessionScopedSignal4(false) ~= nil) else SessionScopedSignalResult.sessionId == "" and (SessionId ~= nil and (SessionId ~= "" and SessionScopedSignal4(false) ~= nil))) then
								local SessionScopedSignalResult1 = SessionScopedSignal5(false)
								
								if SessionScopedSignalResult1 ~= nil and SessionScopedSignalResult1.universeId == UniverseId and SessionScopedSignalResult1.sessionId == SessionScopedSignalResult.sessionId then
									SessionScopedSignal2_4(config)
								end
							else
								SessionScopedSignal2_3(nil)
								Signal2(function(p1: number): number --[[ Line: 126 ]]
									return p1 + 1
								end)
							end
						end
					end
					SessionScopedSignal2_1(config)
				end,
				connect = function(p1, Callback1, Callback) --[[ Line: 135 ]]
					-- upvalues: FFlagBuildAdsNotificationRouting (upval), t (upval), SessionScopedSignal1 (copy), SessionScopedSignal (upval), Idle2 (upval), Idle (upval), SessionScopedSignal2 (upval), SignalsModule (upval), SessionScopedSignal3 (upval), SessionScopedSignal2_2 (upval), CanCreateCampaignFunction (upval), SessionScopedSignal2_3 (copy)
					if FFlagBuildAdsNotificationRouting then
						t[SessionScopedSignal1] = true
					end
					local v2 = nil
					local v3 = nil
					local v4 = nil
					local IsNotReady = false
					local DelayedThread = nil
					local DeferredThread = nil
					
					local function complete(Outcome: string): boolean --[[ Line: 150 ]]
						-- upvalues: v2 (ref), DeferredThread (ref), DelayedThread (ref), SessionScopedSignal (upval), Idle2 (upval), Idle (upval), SessionScopedSignal2 (upval), Callback1 (copy)
						local v5 = v2
						
						if v5 == nil then
							return false
						end
						v2 = nil
						
						if DeferredThread ~= nil then
							task.cancel(DeferredThread)
							DeferredThread = nil
						end
						if DelayedThread ~= nil then
							task.cancel(DelayedThread)
							DelayedThread = nil
						end
						local SessionScopedSignalResult = SessionScopedSignal(false)
						
						if SessionScopedSignalResult == nil or SessionScopedSignalResult.id ~= v5.id then
							Outcome = "cancelled"
						elseif Outcome == "eligible" and v5.expiresAt <= os.clock() then
							Outcome = "timeout"
						end
						if SessionScopedSignalResult ~= nil and SessionScopedSignalResult.id == v5.id then
							Idle2(Outcome)
							local Id = v5.id
							local SessionScopedSignalResult1 = SessionScopedSignal(false)
							
							if SessionScopedSignalResult1 ~= nil and SessionScopedSignalResult1.id == Id then
								local IdleResult = Idle(false)
								
								if IdleResult == "pending" or IdleResult == "refreshing" then
									Idle2("cancelled")
								end
								SessionScopedSignal2(nil)
							end
						end
						Callback1("AD_CAMPAIGN_DEEP_LINK_ELIGIBILITY", { universeId = v5.universeId }, { requestId = v5.id, outcome = Outcome })
						
						return Outcome == "eligible"
					end
					
					local Effect = SignalsModule.createEffect(function(p2) --[[ Line: 181 ]]
						-- upvalues: SessionScopedSignal (upval), SessionScopedSignal1 (upval), v2 (ref), complete (copy), p1 (copy), SessionScopedSignal3 (upval), SessionScopedSignal2_2 (upval), v3 (ref), v4 (ref), IsNotReady (ref), Idle2 (upval), DelayedThread (ref), FFlagBuildAdsNotificationRouting (upval), DeferredThread (ref), CanCreateCampaignFunction (upval), Callback (copy), SessionScopedSignal2_3 (upval), Callback1 (copy)
						local SessionScopedSignalResult = SessionScopedSignal(p2)
						local SessionScopedSignalResult1 = SessionScopedSignal1(p2)
						local IsUniverseIdMatch: boolean = SessionScopedSignalResult1 ~= nil and (SessionScopedSignalResult1.isPageVisible and (SessionScopedSignalResult ~= nil and SessionScopedSignalResult1.universeId == SessionScopedSignalResult.universeId))
						
						if v2 ~= nil and (not IsUniverseIdMatch or SessionScopedSignalResult == nil or SessionScopedSignalResult.id ~= v2.id) then
							complete("cancelled")
						end
						if not IsUniverseIdMatch or SessionScopedSignalResult == nil then return end
						local Eligibility = p1.getEligibility(SessionScopedSignalResult.universeId)
						local DataResult = Eligibility.data(p2)
						local StatusResult = Eligibility.status(p2)
						
						if v2 == nil then
							local Id = SessionScopedSignalResult.id
							local SessionScopedSignalResult2 = SessionScopedSignal(false)
							local Flag = nil
							
							if SessionScopedSignalResult2 == nil or SessionScopedSignalResult2.id ~= Id or SessionScopedSignal3(false) == Id then
								Flag = false
							else
								SessionScopedSignal2_2(Id)
								Flag = true
							end
							if not Flag then return end
							v2 = SessionScopedSignalResult
							v3 = DataResult
							v4 = StatusResult
							IsNotReady = StatusResult == "NotReady"
							local ExpiresAtDelta = SessionScopedSignalResult.expiresAt - os.clock()
							
							if ExpiresAtDelta <= 0 then
								complete("timeout")
								
								return
							end
							Idle2("refreshing")
							DelayedThread = task.delay(ExpiresAtDelta, function() --[[ Line: 212 ]]
								-- upvalues: DelayedThread (upval), complete (upval)
								DelayedThread = nil
								complete("timeout")
							end)
							
							if FFlagBuildAdsNotificationRouting then
								DeferredThread = task.defer(function() --[[ Line: 218 ]]
									-- upvalues: DeferredThread (upval), v2 (upval), SessionScopedSignalResult (copy), p1 (upval), IsNotReady (upval)
									DeferredThread = nil
									
									if v2 ~= nil and v2.id == SessionScopedSignalResult.id then
										local Eligibility = p1.fetchEligibility(SessionScopedSignalResult.universeId)
										IsNotReady = IsNotReady or Eligibility.status(false) == "NotReady"
										
										return
									end
								end)
								
								return
							else
								local Eligibility1 = p1.fetchEligibility(SessionScopedSignalResult.universeId)
								IsNotReady = IsNotReady or Eligibility1.status(false) == "NotReady"
								
								return
							end
						elseif StatusResult == "NotReady" then
							IsNotReady = true
							
							return
						else
							if StatusResult == "Ready" then
								if v4 == "Ready" and DataResult == v3 then return end
								if FFlagBuildAdsNotificationRouting and SessionScopedSignalResult1 ~= nil and SessionScopedSignalResult1.canPresent == false and CanCreateCampaignFunction(DataResult) then return end
								if complete(if CanCreateCampaignFunction(DataResult) then "eligible" else "ineligible") and Callback(DataResult) then
									SessionScopedSignal2_3(SessionScopedSignalResult.id)
									Callback1("AD_CAMPAIGN_DEEP_LINK_PRESENTED", { universeId = SessionScopedSignalResult.universeId }, { requestId = SessionScopedSignalResult.id })
									
									return
								end
							elseif StatusResult == "Failed" and (v4 ~= "Failed" or IsNotReady) then
								complete("failed")
							end
						end
					end)
					
					return function() --[[ Line: 263 ]]
						-- upvalues: t (upval), SessionScopedSignal1 (upval), Effect (copy), complete (copy)
						t[SessionScopedSignal1] = nil
						Effect()
						complete("cancelled")
					end
				end,
				clearPresentedRequest = function() --[[ Line: 274 ]]
					-- upvalues: SessionScopedSignal2_3 (copy)
					SessionScopedSignal2_3(nil)
				end,
				getPresentedRequestId = function() --[[ Line: 277 ]]
					-- upvalues: SessionScopedSignal4 (copy)
					return SessionScopedSignal4(false)
				end,
				startCreate = function() --[[ Line: 280 ]]
					-- upvalues: SessionScopedSignal2_4 (copy), SessionScopedSignal1 (copy)
					SessionScopedSignal2_4(SessionScopedSignal1(false))
				end,
				finishCreate = function(): boolean --[[ Line: 283 ]]
					-- upvalues: SessionScopedSignal5 (copy), SessionScopedSignal1 (copy), SessionScopedSignal2_4 (copy)
					local SessionScopedSignalResult = SessionScopedSignal5(false)
					local SessionScopedSignalResult1 = SessionScopedSignal1(false)
					SessionScopedSignal2_4(nil)
					
					return SessionScopedSignalResult ~= nil and (SessionScopedSignalResult1 ~= nil and (SessionScopedSignalResult.universeId == SessionScopedSignalResult1.universeId and SessionScopedSignalResult.sessionId == SessionScopedSignalResult1.sessionId))
				end
			}
		end,
		reset = function() --[[ Line: 325 ]]
			-- upvalues: SessionScopedSignal2 (copy), Idle2 (copy), SessionScopedSignal2_1 (copy), SessionScopedSignal2_2 (copy)
			SessionScopedSignal2(nil)
			Idle2("idle")
			SessionScopedSignal2_1({})
			SessionScopedSignal2_2(nil)
		end
	}
end