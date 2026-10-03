local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local signalsModule = require(parent.Signals)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local chatTypesModule = require(buildExperience.Chat.chatTypes)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local getAdUpsellEligibilityModule = require(buildExperience.Components.Ads.getAdUpsellEligibility)
local observeAdUpsellEligibilityModule = require(buildExperience.Components.Ads.observeAdUpsellEligibility)
local fIntBuildAdUpsellCompletedTurnGapModule = require(buildExperience.Flags.FIntBuildAdUpsellCompletedTurnGap)
local fIntBuildAdUpsellPublishIntervalModule = require(buildExperience.Flags.FIntBuildAdUpsellPublishInterval)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var1 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
local _ = require(buildExperience.Storage.createAdCampaignCardStorage)

local function defaultDependencies()
	-- upvalues: buildAppStorageKeyEngineFeature (ref), fFlagBuildAgentAdCampaignCardModule (ref), var1 (ref), universeConfigurationModule (ref), gameConfigurationLabelsModule (ref), getAdUpsellEligibilityModule (ref), observeAdUpsellEligibilityModule (ref)
	return if buildAppStorageKeyEngineFeature then {
		getAdCampaignCardStorage = if fFlagBuildAgentAdCampaignCardModule then var1.getAdCampaignCardStorage else nil,
		recordCompletedTurn = var1.recordAdUpsellCompletedTurn,
		recordPublish = var1.recordAdUpsellPublish,
		attachPendingMilestones = var1.attachPendingAdUpsellMilestones,
		pruneAnchors = var1.pruneAdUpsellAnchors,
		markAnchorImpressed = var1.markAdUpsellAnchorImpressed,
		dismissPermanently = var1.markAdUpsellDismissedPermanently,
		isDismissedPermanently = function(p1)
			-- upvalues: var1 (copy)
			local adUpsellState = var1.getAdUpsellState(p1, nil)
			
			return adUpsellState.isAvailable and adUpsellState.dismissedPermanently
		end,
		retryStorageRead = var1.retryAdUpsellRead,
		refreshSummary = function(p1)
			-- upvalues: universeConfigurationModule (copy)
			return universeConfigurationModule.getUniverseConfigurationStore().refreshSummary(p1)
		end,
		getAudience = function(p1)
			-- upvalues: gameConfigurationLabelsModule (copy)
			return gameConfigurationLabelsModule.getAudience(p1)
		end,
		publicAudience = universeConfigurationModule.PrivacyType.Public,
		getEligibility = getAdUpsellEligibilityModule,
		observeEligibility = observeAdUpsellEligibilityModule,
		scheduleRetry = function(p1, p2)
			return task.delay(p1, p2)
		end,
		cancelRetry = function(p1)
			task.cancel(p1)
		end
	} else nil
end

local function _(p1)
	-- upvalues: creatorAgentChatModule (ref)
	return creatorAgentChatModule.PublishToolUtils.getLatestSuccessfulResult(p1, { parseDirectText = true }) ~= nil
end

return function(p1)
	-- upvalues: defaultDependencies (ref), signalsModule (ref), fIntBuildAdUpsellCompletedTurnGapModule (ref), fIntBuildAdUpsellPublishIntervalModule (ref), chatTypesModule (ref), creatorAgentChatModule (ref), fFlagBuildAgentAdCampaignCardModule (ref)
	p1 = p1 or defaultDependencies()
	local var2, var3 = signalsModule.createSignal(0)
	local var4, var5 = signalsModule.createSignal(0)
	local t = {}
	local t_1 = {}
	local var6 = nil
	local t_2 = {}
	local var7 = 0
	local var8 = nil
	local _ = nil
	
	local function _()
		-- upvalues: var3 (ref)
		var3(function(p2)
			return p2 + 1
		end)
	end
	
	local _ = function()
		-- upvalues: p1 (ref)
		return if p1 == nil then nil else p1.getAdCampaignCardStorage()
	end
	
	local _ = function()
		-- upvalues: var5 (ref), var3 (ref)
		var5(function(p2)
			return p2 + 1
		end)
		var3(function(p2)
			return p2 + 1
		end)
	end
	
	local function recordCardMutation(p2, p3, p4)
		-- upvalues: var5 (ref), var3 (ref)
		if p3 or p2 and p4 then
			var5(function(p5)
				return p5 + 1
			end)
			var3(function(p5)
				return p5 + 1
			end)
		end
		return p2, p3
	end
	
	local _ = function(p2)
		-- upvalues: t_2 (ref)
		local var9 = t_2[p2]
		
		if var9 == nil then
			return
		end
		t_2[p2] = nil
		var9()
	end
	
	local _ = function(p2)
		-- upvalues: t (ref), t_2 (ref), t_1 (ref)
		if t[p2] == nil then return end
		local var9 = t_2[p2]
		
		if var9 ~= nil then
			t_2[p2] = nil
			var9()
		end
		t[p2] = nil
		local index = table.find(t_1, p2)
		
		if index ~= nil then
			table.remove(t_1, index)
		end
	end
	
	local function retainPending(p2)
		-- upvalues: t (ref), t_1 (ref), t_2 (ref)
		local id = t[p2.id]
		
		if id ~= nil then
			return id
		end
		t[p2.id] = p2
		table.insert(t_1, p2.id)
		while #t_1 > 50 do
			local removed = table.remove(t_1, 1)
			
			if removed == nil then continue end
			local var9 = t_2[removed]
			
			if var9 ~= nil then
				t_2[removed] = nil
				var9()
			end
			t[removed] = nil
		end
		return p2
	end
	
	local _ = function(p3)
		return if p3.isAwaitingEligibility then false elseif p3.requiresAudienceVerification and p3.isEligiblePublish == nil then not p3.isVerifyingAudience and p3.audienceVerificationAttempts < 3 else p3.storagePersistenceAttempts < 3
	end
	
	local _ = function()
		-- upvalues: t_1 (ref), t (ref)
		for i, v in t_1 do
			local var10 = t[v]
			
			if var10 ~= nil then
				local var11
				if var10.isAwaitingEligibility then
					var11 = false
				elseif var10.requiresAudienceVerification and var10.isEligiblePublish == nil then
					var11 = not var10.isVerifyingAudience
					
					if var11 then
						var11 = var10.audienceVerificationAttempts < 3
						var11 = nil
					end
				else
					var11 = var10.storagePersistenceAttempts < 3
				end
				if var11 then
					return true
				end
			end
		end
		return false
	end
	
	local var12 = function()
		-- upvalues: p1 (ref), var6 (write), t_1 (ref), t (ref), var7 (write), var8 (write), var12 (write)
		if p1 ~= nil and var6 == nil then
			local var13
			for i, v in t_1 do
				local var14 = t[v]
				
				if var14 ~= nil then
					local var15
					if var14.isAwaitingEligibility then
						var15 = false
					elseif var14.requiresAudienceVerification and var14.isEligiblePublish == nil then
						var15 = not var14.isVerifyingAudience
						
						if var15 then
							var15 = var14.audienceVerificationAttempts < 3
							var15 = nil
						end
					else
						var15 = var14.storagePersistenceAttempts < 3
					end
					if var15 then
						var13 = true
						if var13 then
							var6 = p1.scheduleRetry(1, function()
								-- upvalues: var6 (copy), var7 (copy), var7 (ref), t_1 (copy), t (copy), var8 (copy), var12 (copy)
								var6 = nil
								
								if var7 ~= var7 then return end
								local v_1
								for i, v in table.clone(t_1) do
									v_1 = t[v]
									
									if v_1 ~= nil then
										local var16
										if v_1.isAwaitingEligibility then
											var16 = false
										elseif v_1.requiresAudienceVerification and v_1.isEligiblePublish == nil then
											var16 = not v_1.isVerifyingAudience
											
											if var16 then
												var16 = v_1.audienceVerificationAttempts < 3
												var16 = nil
											end
										else
											var16 = v_1.storagePersistenceAttempts < 3
										end
										if var16 then
											var8(v_1)
										end
									end
								end
								local var17
								for i_1, v_1 in t_1 do
									local var18 = t[v_1]
									
									if var18 ~= nil then
										local var19
										if var18.isAwaitingEligibility then
											var19 = false
										elseif var18.requiresAudienceVerification and var18.isEligiblePublish == nil then
											var19 = not var18.isVerifyingAudience
											
											if var19 then
												var19 = var18.audienceVerificationAttempts < 3
												var19 = nil
											end
										else
											var19 = var18.storagePersistenceAttempts < 3
										end
										if var19 then
											var17 = true
											if var17 then
												var12()
											end
											return
										end
									end
								end
								var17 = false
							end)
							
							return
						end
					end
				end
			end
			var13 = false
		end
	end
	
	local function persistEvent(p3)
		-- upvalues: p1 (ref), fIntBuildAdUpsellCompletedTurnGapModule (copy), fIntBuildAdUpsellPublishIntervalModule (copy), var3 (ref), t (ref), t_2 (ref), t_1 (ref), var12 (write)
		if p1 == nil then return end
		local var16, var17
		local t_3 = {
			universeId = p3.universeId,
			sessionId = p3.sessionId,
			eventId = p3.id,
			afterMessageKey = p3.afterMessageKey,
			isEligiblePublish = p3.isEligiblePublish == true,
			completedTurnGap = fIntBuildAdUpsellCompletedTurnGapModule,
			publishInterval = fIntBuildAdUpsellPublishIntervalModule
		}
		local _ = nil
		local _ = nil
		
		if p3.isCompletedTurn then
			local var18, var19 = p1.recordCompletedTurn(t_3)
			var16 = var18
			var17 = var19
		else
			local var20, var21 = p1.recordPublish(t_3)
			var16 = var20
			var17 = var21
		end
		if var17 then
			var3(function(p4)
				return p4 + 1
			end)
		end
		if var16 or var17 then
			local id = p3.id
			
			if t[id] == nil then return end
			local var22 = t_2[id]
			
			if var22 ~= nil then
				t_2[id] = nil
				var22()
			end
			t[id] = nil
			local index = table.find(t_1, id)
			
			if index == nil then
				return
			else
				table.remove(t_1, index)
				
				return
			end
		else
			p3.storagePersistenceAttempts += 1
			
			if p3.storagePersistenceAttempts < 3 then
				var12()
			end
		end
	end
	
	local _ = function(p3)
		-- upvalues: var12 (write)
		p3.isVerifyingAudience = false
		p3.audienceVerificationAttempts += 1
		
		if p3.audienceVerificationAttempts < 3 then
			var12()
		end
	end
	
	local function awaitEligibility(p3, p4)
		-- upvalues: p1 (ref), var7 (write), t (ref), t_2 (ref), persistEvent (ref)
		if p1 == nil then return end
		p3.isVerifyingAudience = false
		
		if p3.isAwaitingEligibility then return end
		p3.isAwaitingEligibility = true
		local var16 = nil
		local var17 = false
		local var18 = p1.observeEligibility(p3.universeId, function()
			-- upvalues: var7 (copy), var7 (ref), t (copy), p3 (ref), p1 (copy), var16 (write), t_2 (copy), var17 (write), p4 (ref), persistEvent (copy)
			if var7 ~= var7 or t[p3.id] ~= p3 then return end
			local eligibility = p1.getEligibility(p3.universeId)
			
			if not eligibility.isResolved then return end
			p3.isAwaitingEligibility = false
			
			if var16 == nil then
				var17 = true
			else
				local id = p3.id
				local var19 = t_2[id]
				
				if var19 ~= nil then
					t_2[id] = nil
					var19()
				end
			end
			p3.isEligiblePublish = p1.getAudience(p4) == p1.publicAudience and (eligibility.isEligible and eligibility.freePromotionsRemaining > 0)
			persistEvent(p3)
		end)
		var16 = var18
		t_2[p3.id] = var18
	end
	
	var8 = function(p3)
		-- upvalues: p1 (ref), t (ref), persistEvent (ref), var12 (write), var7 (write), awaitEligibility (ref)
		if p1 == nil or t[p3.id] ~= p3 then return end
		if not p3.requiresAudienceVerification or p3.isEligiblePublish ~= nil then
			persistEvent(p3)
			
			return
		elseif p3.isVerifyingAudience or p3.isAwaitingEligibility then return end
		p3.isVerifyingAudience = true
		local ok, status = pcall(p1.refreshSummary, p3.universeId)
		
		if ok and status ~= nil then
			status:andThen(function(p4)
				-- upvalues: var7 (copy), var7 (ref), t (copy), p3 (ref), p1 (copy), awaitEligibility (copy), persistEvent (copy)
				if var7 ~= var7 or t[p3.id] ~= p3 then return end
				local eligibility = p1.getEligibility(p3.universeId)
				
				if eligibility.isResolved then
					p3.isVerifyingAudience = false
					p3.isEligiblePublish = p1.getAudience(p4) == p1.publicAudience and (eligibility.isEligible and eligibility.freePromotionsRemaining > 0)
					persistEvent(p3)
					
					return
				end
				awaitEligibility(p3, p4)
			end, function()
				-- upvalues: var7 (copy), var7 (ref), t (copy), p3 (ref), var12 (copy)
				if var7 ~= var7 or t[p3.id] ~= p3 then return end
				p3.isVerifyingAudience = false
				p3.audienceVerificationAttempts += 1
				
				if p3.audienceVerificationAttempts < 3 then
					var12()
				end
			end)
			
			return
		end
		p3.isVerifyingAudience = false
		p3.audienceVerificationAttempts += 1
		
		if p3.audienceVerificationAttempts < 3 then
			var12()
		end
	end
	
	local function disposeAllEligibilitySubscriptions()
		-- upvalues: t_2 (ref)
		local t = {}
		
		for i in t_2 do
			table.insert(t, i)
		end
		for i_1, v in t do
			local var16 = t_2[v]
			
			if var16 ~= nil then
				t_2[v] = nil
				var16()
			end
		end
	end
	
	return {
		getAdCampaignCard = if fFlagBuildAgentAdCampaignCardModule then function(p3, p4)
			-- upvalues: p1 (ref)
			local var17 = if p1 ~= nil then nil else p1.getAdCampaignCardStorage()
			
			return if var17 == nil then { isAvailable = false, isPersisted = false } else var17.get(p3, p4)
		end else nil,
		listAdCampaignCards = if fFlagBuildAgentAdCampaignCardModule then function(p3)
			-- upvalues: p1 (ref)
			local var17 = if p1 ~= nil then nil else p1.getAdCampaignCardStorage()
			
			return if var17 == nil then { isAvailable = false, records = {} } else var17.list(p3)
		end else nil,
		recordAdCampaignCreatedReceipt = if fFlagBuildAgentAdCampaignCardModule then function(p3)
			-- upvalues: p1 (ref), recordCardMutation (ref)
			local var17 = if p1 ~= nil then nil else p1.getAdCampaignCardStorage()
			
			if var17 == nil then
				return false, false
			end
			local var18 = var17.hasPendingWrites()
			local var19, var20 = var17.confirm(p3)
			
			return recordCardMutation(var19, var20, var18)
		end else nil,
		retryAdCampaignCardWrites = if fFlagBuildAgentAdCampaignCardModule then function()
			-- upvalues: p1 (ref), var5 (ref), var3 (ref)
			local var17 = if p1 ~= nil then nil else p1.getAdCampaignCardStorage()
			
			if var17 == nil then
				return false
			end
			local var18 = var17.hasPendingWrites()
			
			if not var17.retryWrites() then
				return false
			elseif var18 then
				var5(function(p3)
					return p3 + 1
				end)
				var3(function(p3)
					return p3 + 1
				end)
			end
			return true
		end else nil,
		pruneAdCampaignCards = if fFlagBuildAgentAdCampaignCardModule then function(p3)
			-- upvalues: p1 (ref), var5 (ref), var3 (ref)
			local var17 = if p1 ~= nil then nil else p1.getAdCampaignCardStorage()
			
			if var17 == nil then
				return false, false
			end
			local var18, var19 = var17.prune(p3)
			
			if var19 then
				var5(function(p4)
					return p4 + 1
				end)
				var3(function(p4)
					return p4 + 1
				end)
			end
			return var18, var19
		end else nil,
		getRevision = var2,
		getAdCampaignRevision = var4,
		reportAssistantTurnCompleted = function(p3)
			-- upvalues: p1 (ref), chatTypesModule (copy), creatorAgentChatModule (copy), retainPending (ref), var8 (write)
			if p1 == nil or p3.universeId == 0 or p1.isDismissedPermanently(p3.universeId) then return end
			local var17 = chatTypesModule.makeAssistantTurnAnchorKey(p3.sessionId, p3.latestSequenceId)
			
			if var17 == nil then
				return
			end
			local var18 = creatorAgentChatModule.PublishToolUtils.getLatestSuccessfulResult(p3.turnState, { parseDirectText = true }) ~= nil
			var8(retainPending({
				isCompletedTurn = true,
				isVerifyingAudience = false,
				isAwaitingEligibility = false,
				audienceVerificationAttempts = 0,
				storagePersistenceAttempts = 0,
				id = `chat:{p3.universeId}:{var17}`,
				universeId = p3.universeId,
				sessionId = if p3.sessionId == "" then nil else p3.sessionId,
				afterMessageKey = var17,
				isEligiblePublish = if var18 then nil else false,
				requiresAudienceVerification = var18
			}))
		end,
		reportMenuPublish = function(p3, p4, p5, p6)
			-- upvalues: p1 (ref), retainPending (ref), var8 (write)
			if p1 == nil or p3 == 0 or (p5 == "" or p1.isDismissedPermanently(p3)) then
				return
			end
			local eligibility = p1.getEligibility(p3)
			local var17 = p6 and not eligibility.isResolved
			var8(retainPending({
				afterMessageKey = nil,
				isCompletedTurn = false,
				isVerifyingAudience = false,
				isAwaitingEligibility = false,
				audienceVerificationAttempts = 0,
				storagePersistenceAttempts = 0,
				id = `menu:{p3}:{p5}`,
				universeId = p3,
				sessionId = if p4 == "" then nil else p4,
				isEligiblePublish = if var17 then nil else p6 and (eligibility.isEligible and eligibility.freePromotionsRemaining > 0),
				requiresAudienceVerification = var17
			}))
		end,
		retryStorageRead = function()
			-- upvalues: fFlagBuildAgentAdCampaignCardModule (copy), p1 (ref), var5 (ref), var3 (ref), t_1 (ref), t (ref), var8 (write)
			if fFlagBuildAgentAdCampaignCardModule then
				local var17 = if p1 ~= nil then nil else p1.getAdCampaignCardStorage()
				
				if var17 ~= nil and var17.hasPendingWrites() and var17.retryWrites() then
					var5(function(p3)
						return p3 + 1
					end)
					var3(function(p3)
						return p3 + 1
					end)
				end
			end
			if p1 ~= nil and p1.retryStorageRead() then
				if fFlagBuildAgentAdCampaignCardModule then
					var5(function(p3)
						return p3 + 1
					end)
					var3(function(p3)
						return p3 + 1
					end)
				else
					var3(function(p3)
						return p3 + 1
					end)
				end
				for i, v in table.clone(t_1) do
					local var18 = t[v]
					
					if var18 ~= nil then
						var18.storagePersistenceAttempts = 0
						var8(var18)
					end
				end
			end
		end,
		attachPendingMilestones = function(p3, p4, p5)
			-- upvalues: p1 (ref), var3 (ref)
			if p1 ~= nil then
				p1.attachPendingMilestones(p3, p4, p5)
				var3(function(p6)
					return p6 + 1
				end)
			end
		end,
		pruneAnchors = function(p3, p4, p5)
			-- upvalues: p1 (ref), var3 (ref)
			if p1 == nil then
				return false
			end
			local var19, var20 = p1.pruneAnchors(p3, p4, p5)
			
			if var20 then
				var3(function(p6)
					return p6 + 1
				end)
			end
			return var19
		end,
		markAnchorImpressed = function(p3, p4, p5)
			-- upvalues: p1 (ref), var3 (ref)
			if p1 == nil then
				return false
			end
			local var19 = p1.markAnchorImpressed(p3, p4, p5)
			
			if var19 then
				var3(function(p6)
					return p6 + 1
				end)
			end
			return var19
		end,
		dismissPermanently = function()
			-- upvalues: p1 (ref), var7 (write), var6 (write), disposeAllEligibilitySubscriptions (ref), t (ref), t_1 (ref), var3 (ref)
			if p1 ~= nil then
				var7 += 1
				
				if var6 ~= nil then
					p1.cancelRetry(var6)
					var6 = nil
				end
				disposeAllEligibilitySubscriptions()
				table.clear(t)
				table.clear(t_1)
				p1.dismissPermanently()
				var3(function(p3)
					return p3 + 1
				end)
			end
		end,
		reset = function()
			-- upvalues: var7 (write), p1 (ref), var6 (write), disposeAllEligibilitySubscriptions (ref), t (ref), t_1 (ref), var3 (ref), var5 (ref)
			var7 += 1
			
			if p1 ~= nil and var6 ~= nil then
				p1.cancelRetry(var6)
			end
			var6 = nil
			disposeAllEligibilitySubscriptions()
			table.clear(t)
			table.clear(t_1)
			var3(0)
			var5(0)
		end
	}
end