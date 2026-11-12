local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(Parent.DataHydration.CreatorCredit)
local _ = require(BuildExperience.Stores.GetBuildModelSelectionStore.createBuildModelSelectionStore)
local ChatConstantsModule = require(script.Parent.chatConstants)

local function _(p1, Id): boolean
	if p1 == nil then
		return Id == "default"
	end
	for _, value in p1.available do
		if value.id == Id then
			return true
		end
	end
	return false
end

local function awaitRefreshedQuota(p2, Tier, IsCurrent)
	-- upvalues: ChatConstantsModule (copy)
	local GetTierQuotaSummarySignalsFunction = p2.getTierQuotaSummarySignals
	local RefreshTierQuotaSummaryFunction = p2.refreshTierQuotaSummary
	
	if GetTierQuotaSummarySignalsFunction == nil or RefreshTierQuotaSummaryFunction == nil then
		return nil
	end
	local DataResult = GetTierQuotaSummarySignalsFunction("PRODUCT_BUILD", Tier).data(false)
	local PRODUCTBUILD = RefreshTierQuotaSummaryFunction("PRODUCT_BUILD", Tier)
	local NewClockTime = os.clock() + ChatConstantsModule.CAS_RPC_TIMEOUT_SECONDS
	local DataResult1 = nil
	while IsCurrent() and os.clock() < NewClockTime do
		local StatusResult = PRODUCTBUILD.status(false)
		
		if StatusResult == "Failed" then
			return nil
		end
		DataResult1 = PRODUCTBUILD.data(false)
		
		if StatusResult == "Ready" and DataResult1 ~= nil and DataResult1 ~= DataResult then
			return DataResult1
		end
		task.wait()
	end
	return nil
end

return function(p3, p4, p5, Enabled)
	-- upvalues: CreatorAgentChatModule (copy), awaitRefreshedQuota (copy)
	if p3 == nil then
		return nil
	end
	local AcquireLockResult = p3.acquireLock()
	
	if AcquireLockResult == nil then
		return nil
	else
		local CaptureSendConfigurationResult = CreatorAgentChatModule.captureSendConfiguration(if Enabled then "default" else assert(p3.getSelection(false)).intendedTier, p5)
		local Flag = false
		local Flag1 = false
		local v1 = nil
		local CasSessionId = nil
		
		local function isCurrent(): boolean
			-- upvalues: Flag (ref), p3 (copy), v1 (ref), CasSessionId (ref)
			return not Flag and (p3.getSelection(false) ~= nil and (v1 == nil or v1.getCasSessionId() == CasSessionId))
		end
		
		return {
			prepare = function(p6)
				-- upvalues: Flag1 (ref), Flag (ref), p3 (copy), v1 (ref), CasSessionId (ref), CaptureSendConfigurationResult (copy), AcquireLockResult (copy), Enabled (copy), awaitRefreshedQuota (upval), p4 (copy), isCurrent (copy), CreatorAgentChatModule (upval)
				assert(not Flag1, "A model send attempt can only prepare once")
				Flag1 = true
				
				if Flag or (p3.getSelection(false) == nil or v1 ~= nil and v1.getCasSessionId() ~= CasSessionId) then
					return nil, nil
				end
				local NoCasSessionId = p6.getCasSessionId() == nil
				
				if NoCasSessionId then
					p3.restoreTier(CaptureSendConfigurationResult.tier)
				end
				local PrepareSessionResult, PrepareSessionResult2 = p6.prepareSession({
					sendConfiguration = CaptureSendConfigurationResult,
					isCancelled = function(): boolean
						-- upvalues: Flag (upval), p3 (upval), v1 (upval), CasSessionId (upval)
						return not (not Flag and (p3.getSelection(false) ~= nil and (v1 == nil or v1.getCasSessionId() == CasSessionId)))
					end
				})
				
				if Flag or (p3.getSelection(false) == nil or v1 ~= nil and v1.getCasSessionId() ~= CasSessionId) then
					return nil, nil
				end
				if PrepareSessionResult == nil and PrepareSessionResult2 == nil then
					if not Flag then
						Flag = true
						p3.releaseLock(AcquireLockResult)
					end
					return nil, nil
				else
					if PrepareSessionResult == nil or p6.getCasSessionId() ~= PrepareSessionResult then
						return nil, {
							kind = "setup",
							errorCode = if PrepareSessionResult2 == nil then nil else PrepareSessionResult2.errorCode,
							reason = if PrepareSessionResult2 == nil then nil else PrepareSessionResult2.fundingReason,
							setupError = PrepareSessionResult2
						}
					end
					v1 = p6
					CasSessionId = PrepareSessionResult
					local Models = p6.getModels(false)
					
					if not NoCasSessionId and Models ~= nil then
						p3.restoreTier(Models.current)
					end
					local Tier = if NoCasSessionId or Enabled == true then CaptureSendConfigurationResult.tier else assert(p3.getSelection(false)).intendedTier
					p3.restoreTier(Tier)
					local IsDefault = nil
					
					if Models == nil then
						IsDefault = Tier == "default"
					else
						IsDefault = false
						
						for _, value in Models.available do
							if value.id == Tier then
								IsDefault = true
								break
							end
						end
					end
					if not IsDefault then
						return nil, { kind = "unavailable" }
					end
					local Frozen = table.freeze({
						tier = Tier,
						experiment = CaptureSendConfigurationResult.experiment,
						sessionId = PrepareSessionResult,
						universeId = p6.universeId,
						placeId = p6.placeId
					})
					local AwaitRefreshedQuotaResult = awaitRefreshedQuota(p4, Frozen.tier, isCurrent)
					
					if Flag or (p3.getSelection(false) == nil or v1 ~= nil and v1.getCasSessionId() ~= CasSessionId) then
						return nil, nil
					end
					if AwaitRefreshedQuotaResult == nil or AwaitRefreshedQuotaResult.allowed == nil then
						return nil, { kind = "quota" }
					end
					if not AwaitRefreshedQuotaResult.allowed then
						return nil, {
							kind = "denied",
							errorCode = CreatorAgentChatModule.ErrorCodes.OutOfCredits,
							reason = AwaitRefreshedQuotaResult.reason
						}
					end
					local Models1 = p6.getModels(false)
					local Tier1 = Frozen.tier
					local IsDefault1 = nil
					
					if Models1 == nil then
						IsDefault1 = Tier1 == "default"
					else
						IsDefault1 = false
						
						for _, value1 in Models1.available do
							if value1.id == Tier1 then
								IsDefault1 = true
								break
							end
						end
					end
					if IsDefault1 then
						return Frozen, nil
					else
						return nil, { kind = "unavailable" }
					end
				end
			end,
			isCurrent = isCurrent,
			release = function()
				-- upvalues: Flag (ref), p3 (copy), AcquireLockResult (copy)
				if not Flag then
					Flag = true
					p3.releaseLock(AcquireLockResult)
				end
			end,
			unlockSelection = function()
				-- upvalues: p3 (copy), AcquireLockResult (copy)
				p3.releaseLock(AcquireLockResult)
			end
		}
	end
end