local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorCreditModule = require(Parent.DataHydration.CreatorCredit)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local SignalsModule = require(Parent.Signals)
local CreatorCreditConfigModule = require(BuildExperience.CreatorCreditConfig)

return function(p1)
	-- upvalues: CreatorCreditModule (copy), LocalUserIdStore (copy), CreatorCreditConfigModule (copy), SignalsModule (copy)
	local P0 = p1 or {}
	local GetCreditStore = P0.getCreditStore or function()
		-- upvalues: CreatorCreditModule (upval)
		return CreatorCreditModule.getCreatorCreditStore(false)
	end
	local GetUserId = P0.getUserId or LocalUserIdStore.getCurrentUserId
	local OnUnhide = P0.onUnhide or game:GetService("AppLifecycleObserverService").OnUnhide
	local Now = P0.now or function()
		return DateTime.now().UnixTimestamp
	end
	local Count = 0
	local Callback = nil
	local DeferredThread = nil
	local DelayedThread = nil
	local DelayedThread1 = nil
	local t = {}
	
	local function _()
		-- upvalues: DeferredThread (ref), DelayedThread (ref), DelayedThread1 (ref)
		if DeferredThread then
			task.cancel(DeferredThread)
			DeferredThread = nil
		end
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		if DelayedThread1 then
			task.cancel(DelayedThread1)
			DelayedThread1 = nil
		end
	end
	
	local function refresh()
		-- upvalues: DeferredThread (ref), GetUserId (copy), GetCreditStore (copy)
		if not DeferredThread then
			local UserId = GetUserId(false)
			local CreditStore = GetCreditStore()
			DeferredThread = task.defer(function()
				-- upvalues: DeferredThread (upval), UserId (copy), GetUserId (upval), CreditStore (copy), GetCreditStore (upval)
				DeferredThread = nil
				
				if UserId == GetUserId(false) and CreditStore == GetCreditStore() then
					CreditStore.refreshQuotaSummary():catch(function() end)
					local ModelPickerRequiresTierQuotas: (any, any) -> () = assert(CreditStore.refreshTierQuotaSummary, "Model picker requires tier quotas")
					ModelPickerRequiresTierQuotas("PRODUCT_BUILD", "default")
					ModelPickerRequiresTierQuotas("PRODUCT_BUILD", "advanced")
					
					return
				end
			end)
			
			return
		end
	end
	
	return {
		acquire = function()
			-- upvalues: Count (ref), GetCreditStore (copy), SignalsModule (upval), GetUserId (copy), DeferredThread (ref), DelayedThread (ref), DelayedThread1 (ref), t (ref), Now (copy), CreatorCreditConfigModule (upval), OnUnhide (copy), refresh (copy), Callback (ref)
			Count += 1
			
			if Count == 1 then
				local CreditStore = GetCreditStore()
				local v1 = nil
				local Effect = SignalsModule.createEffect(function(p2)
					-- upvalues: GetUserId (upval), v1 (ref), DeferredThread (upval), DelayedThread (upval), DelayedThread1 (upval), t (upval), CreditStore (copy), Now (upval), CreatorCreditConfigModule (upval), GetCreditStore (upval)
					local UserId = GetUserId(p2)
					
					if UserId ~= v1 then
						if DeferredThread then
							task.cancel(DeferredThread)
							DeferredThread = nil
						end
						if DelayedThread then
							task.cancel(DelayedThread)
							DelayedThread = nil
						end
						if DelayedThread1 then
							task.cancel(DelayedThread1)
							DelayedThread1 = nil
						end
						t = {}
						v1 = UserId
					end
					if DelayedThread1 then
						task.cancel(DelayedThread1)
						DelayedThread1 = nil
					end
					local UnixTimestamps = {}
					
					for _, value in { "default", "advanced" } do
						local DataResult = assert(CreditStore.getTierQuotaSummarySignals, "Model picker requires tier quotas")("PRODUCT_BUILD", value).data(p2)
						local NextResetEligibleTime = if DataResult then DataResult.nextResetEligibleTime else nil
						
						if typeof(NextResetEligibleTime) == "string" and NextResetEligibleTime ~= "" then
							local _DateTime = DateTime.fromIsoDate(NextResetEligibleTime)
							
							if _DateTime then
								UnixTimestamps[NextResetEligibleTime] = _DateTime.UnixTimestamp
							end
						end
					end
					local function scheduleReset()
						-- upvalues: UnixTimestamps (copy), t (upval), DelayedThread1 (upval), Now (upval), CreatorCreditConfigModule (upval), scheduleReset (copy), DeferredThread (upval), GetUserId (upval), GetCreditStore (upval)
						local v2 = nil
						local v3 = nil
						
						for i, unixTimestamp in UnixTimestamps do
							if not t[i] and (v2 == nil or unixTimestamp < v2) then
								v2 = unixTimestamp
								v3 = i
							end
						end
						if v2 and v3 then
							DelayedThread1 = task.delay(math.max(1, v2 - Now() + CreatorCreditConfigModule.FIntResetRefreshBufferSeconds), function()
								-- upvalues: DelayedThread1 (upval), t (upval), v3 (copy), scheduleReset (upval), DeferredThread (upval), GetUserId (upval), GetCreditStore (upval)
								DelayedThread1 = nil
								t[v3] = true
								scheduleReset()
								
								if not DeferredThread then
									local UserId = GetUserId(false)
									local CreditStore = GetCreditStore()
									DeferredThread = task.defer(function()
										-- upvalues: DeferredThread (upval), UserId (copy), GetUserId (upval), CreditStore (copy), GetCreditStore (upval)
										DeferredThread = nil
										
										if UserId == GetUserId(false) and CreditStore == GetCreditStore() then
											CreditStore.refreshQuotaSummary():catch(function() end)
											local ModelPickerRequiresTierQuotas: (any, any) -> () = assert(CreditStore.refreshTierQuotaSummary, "Model picker requires tier quotas")
											ModelPickerRequiresTierQuotas("PRODUCT_BUILD", "default")
											ModelPickerRequiresTierQuotas("PRODUCT_BUILD", "advanced")
											
											return
										end
									end)
									
									return
								end
							end)
						end
					end
					
					scheduleReset()
				end)
				local Connection = OnUnhide:Connect(refresh)
				
				Callback = function()
					-- upvalues: Connection (copy), Effect (copy), DeferredThread (upval), DelayedThread (upval), DelayedThread1 (upval)
					Connection:Disconnect()
					Effect()
					
					if DeferredThread then
						task.cancel(DeferredThread)
						DeferredThread = nil
					end
					if DelayedThread then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					if DelayedThread1 then
						task.cancel(DelayedThread1)
						DelayedThread1 = nil
					end
				end
			end
			local Flag = false
			
			return function()
				-- upvalues: Flag (ref), Count (upval), Callback (upval)
				if Flag then return end
				Flag = true
				Count -= 1
				
				if Count == 0 and Callback then
					Callback()
					Callback = nil
				end
			end
		end,
		refresh = refresh,
		settled = function()
			-- upvalues: DelayedThread (ref), GetUserId (copy), CreatorCreditConfigModule (upval), DeferredThread (ref), GetCreditStore (copy)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
			local UserId = GetUserId(false)
			DelayedThread = task.delay(CreatorCreditConfigModule.FIntPostTurnRefreshDelaySeconds, function()
				-- upvalues: DelayedThread (upval), UserId (copy), GetUserId (upval), DeferredThread (upval), GetCreditStore (upval)
				DelayedThread = nil
				
				if UserId == GetUserId(false) then
					if DeferredThread then return end
					local UserId1 = GetUserId(false)
					local CreditStore = GetCreditStore()
					DeferredThread = task.defer(function()
						-- upvalues: DeferredThread (upval), UserId1 (copy), GetUserId (upval), CreditStore (copy), GetCreditStore (upval)
						DeferredThread = nil
						
						if UserId1 == GetUserId(false) and CreditStore == GetCreditStore() then
							CreditStore.refreshQuotaSummary():catch(function() end)
							local ModelPickerRequiresTierQuotas: (any, any) -> () = assert(CreditStore.refreshTierQuotaSummary, "Model picker requires tier quotas")
							ModelPickerRequiresTierQuotas("PRODUCT_BUILD", "default")
							ModelPickerRequiresTierQuotas("PRODUCT_BUILD", "advanced")
							
							return
						end
					end)
				end
			end)
		end
	}
end