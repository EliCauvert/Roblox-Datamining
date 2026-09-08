local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local signalsModule = require(parent.Signals)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local chatTypesModule = require(buildExperience.Chat.chatTypes)
local getAdUpsellEligibilityModule = require(buildExperience.Components.Ads.getAdUpsellEligibility)
local observeAdUpsellEligibilityModule = require(buildExperience.Components.Ads.observeAdUpsellEligibility)
local fIntBuildAdUpsellCompletedTurnGapModule = require(buildExperience.Flags.FIntBuildAdUpsellCompletedTurnGap)
local fIntBuildAdUpsellPublishIntervalModule = require(buildExperience.Flags.FIntBuildAdUpsellPublishInterval)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var1 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil

local function defaultDependencies()
	-- upvalues: buildAppStorageKeyEngineFeature (ref), var1 (ref), universeConfigurationModule (ref), gameConfigurationLabelsModule (ref), getAdUpsellEligibilityModule (ref), observeAdUpsellEligibilityModule (ref)
	return if buildAppStorageKeyEngineFeature then {
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
	-- upvalues: defaultDependencies (ref), signalsModule (ref), fIntBuildAdUpsellCompletedTurnGapModule (ref), fIntBuildAdUpsellPublishIntervalModule (ref), chatTypesModule (ref), creatorAgentChatModule (ref)
	p1 = p1 or defaultDependencies()
	local var2, var3 = signalsModule.createSignal(0)
	local t = {}
	local t_1 = {}
	local var4 = nil
	local t_2 = {}
	local var5 = 0
	local var6 = nil
	local _ = nil
	
	local function _()
		-- upvalues: var3 (ref)
		var3(function(p2)
			return p2 + 1
		end)
	end
	
	local _ = function(p2)
		-- upvalues: t_2 (ref)
		local var7 = t_2[p2]
		
		if var7 == nil then
			return
		end
		t_2[p2] = nil
		var7()
	end
	
	local _ = function(p2)
		-- upvalues: t (ref), t_2 (ref), t_1 (ref)
		if t[p2] == nil then return end
		local var7 = t_2[p2]
		
		if var7 ~= nil then
			t_2[p2] = nil
			var7()
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
			local var7 = t_2[removed]
			
			if var7 ~= nil then
				t_2[removed] = nil
				var7()
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
			local var8 = t[v]
			
			if var8 ~= nil then
				local var9
				if var8.isAwaitingEligibility then
					var9 = false
				elseif var8.requiresAudienceVerification and var8.isEligiblePublish == nil then
					var9 = not var8.isVerifyingAudience
					
					if var9 then
						var9 = var8.audienceVerificationAttempts < 3
						var9 = nil
					end
				else
					var9 = var8.storagePersistenceAttempts < 3
				end
				if var9 then
					return true
				end
			end
		end
		return false
	end
	
	local var10 = function()
		-- upvalues: p1 (ref), var4 (write), t_1 (ref), t (ref), var5 (write), var6 (write), var10 (write)
		if p1 ~= nil and var4 == nil then
			local var11
			for i, v in t_1 do
				local var12 = t[v]
				
				if var12 ~= nil then
					local var13
					if var12.isAwaitingEligibility then
						var13 = false
					elseif var12.requiresAudienceVerification and var12.isEligiblePublish == nil then
						var13 = not var12.isVerifyingAudience
						
						if var13 then
							var13 = var12.audienceVerificationAttempts < 3
							var13 = nil
						end
					else
						var13 = var12.storagePersistenceAttempts < 3
					end
					if var13 then
						var11 = true
						if var11 then
							var4 = p1.scheduleRetry(1, function()
								-- upvalues: var4 (copy), var5 (copy), var5 (ref), t_1 (copy), t (copy), var6 (copy), var10 (copy)
								var4 = nil
								
								if var5 ~= var5 then return end
								local v_1
								for i, v in table.clone(t_1) do
									v_1 = t[v]
									
									if v_1 ~= nil then
										local var14
										if v_1.isAwaitingEligibility then
											var14 = false
										elseif v_1.requiresAudienceVerification and v_1.isEligiblePublish == nil then
											var14 = not v_1.isVerifyingAudience
											
											if var14 then
												var14 = v_1.audienceVerificationAttempts < 3
												var14 = nil
											end
										else
											var14 = v_1.storagePersistenceAttempts < 3
										end
										if var14 then
											var6(v_1)
										end
									end
								end
								local var15
								for i_1, v_1 in t_1 do
									local var16 = t[v_1]
									
									if var16 ~= nil then
										local var17
										if var16.isAwaitingEligibility then
											var17 = false
										elseif var16.requiresAudienceVerification and var16.isEligiblePublish == nil then
											var17 = not var16.isVerifyingAudience
											
											if var17 then
												var17 = var16.audienceVerificationAttempts < 3
												var17 = nil
											end
										else
											var17 = var16.storagePersistenceAttempts < 3
										end
										if var17 then
											var15 = true
											if var15 then
												var10()
											end
											return
										end
									end
								end
								var15 = false
							end)
							
							return
						end
					end
				end
			end
			var11 = false
		end
	end
	
	local function persistEvent(p3)
		-- upvalues: p1 (ref), fIntBuildAdUpsellCompletedTurnGapModule (copy), fIntBuildAdUpsellPublishIntervalModule (copy), var3 (ref), t (ref), t_2 (ref), t_1 (ref), var10 (write)
		if p1 == nil then return end
		local var14, var15
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
			local var16, var17 = p1.recordCompletedTurn(t_3)
			var14 = var16
			var15 = var17
		else
			local var18, var19 = p1.recordPublish(t_3)
			var14 = var18
			var15 = var19
		end
		if var15 then
			var3(function(p4)
				return p4 + 1
			end)
		end
		if var14 or var15 then
			local id = p3.id
			
			if t[id] == nil then return end
			local var20 = t_2[id]
			
			if var20 ~= nil then
				t_2[id] = nil
				var20()
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
				var10()
			end
		end
	end
	
	local _ = function(p3)
		-- upvalues: var10 (write)
		p3.isVerifyingAudience = false
		p3.audienceVerificationAttempts += 1
		
		if p3.audienceVerificationAttempts < 3 then
			var10()
		end
	end
	
	local function awaitEligibility(p3, p4)
		-- upvalues: p1 (ref), var5 (write), t (ref), t_2 (ref), persistEvent (ref)
		if p1 == nil then return end
		p3.isVerifyingAudience = false
		
		if p3.isAwaitingEligibility then return end
		p3.isAwaitingEligibility = true
		local var14 = nil
		local var15 = false
		local var16 = p1.observeEligibility(p3.universeId, function()
			-- upvalues: var5 (copy), var5 (ref), t (copy), p3 (ref), p1 (copy), var14 (write), t_2 (copy), var15 (write), p4 (ref), persistEvent (copy)
			if var5 ~= var5 or t[p3.id] ~= p3 then return end
			local eligibility = p1.getEligibility(p3.universeId)
			
			if not eligibility.isResolved then return end
			p3.isAwaitingEligibility = false
			
			if var14 == nil then
				var15 = true
			else
				local id = p3.id
				local var17 = t_2[id]
				
				if var17 ~= nil then
					t_2[id] = nil
					var17()
				end
			end
			p3.isEligiblePublish = p1.getAudience(p4) == p1.publicAudience and (eligibility.isEligible and eligibility.freePromotionsRemaining > 0)
			persistEvent(p3)
		end)
		var14 = var16
		t_2[p3.id] = var16
	end
	
	var6 = function(p3)
		-- upvalues: p1 (ref), t (ref), persistEvent (ref), var10 (write), var5 (write), awaitEligibility (ref)
		if p1 == nil or t[p3.id] ~= p3 then return end
		if not p3.requiresAudienceVerification or p3.isEligiblePublish ~= nil then
			persistEvent(p3)
			
			return
		elseif p3.isVerifyingAudience or p3.isAwaitingEligibility then return end
		p3.isVerifyingAudience = true
		local ok, status = pcall(p1.refreshSummary, p3.universeId)
		
		if ok and status ~= nil then
			status:andThen(function(p4)
				-- upvalues: var5 (copy), var5 (ref), t (copy), p3 (ref), p1 (copy), awaitEligibility (copy), persistEvent (copy)
				if var5 ~= var5 or t[p3.id] ~= p3 then return end
				local eligibility = p1.getEligibility(p3.universeId)
				
				if eligibility.isResolved then
					p3.isVerifyingAudience = false
					p3.isEligiblePublish = p1.getAudience(p4) == p1.publicAudience and (eligibility.isEligible and eligibility.freePromotionsRemaining > 0)
					persistEvent(p3)
					
					return
				end
				awaitEligibility(p3, p4)
			end, function()
				-- upvalues: var5 (copy), var5 (ref), t (copy), p3 (ref), var10 (copy)
				if var5 ~= var5 or t[p3.id] ~= p3 then return end
				p3.isVerifyingAudience = false
				p3.audienceVerificationAttempts += 1
				
				if p3.audienceVerificationAttempts < 3 then
					var10()
				end
			end)
			
			return
		end
		p3.isVerifyingAudience = false
		p3.audienceVerificationAttempts += 1
		
		if p3.audienceVerificationAttempts < 3 then
			var10()
		end
	end
	
	local function disposeAllEligibilitySubscriptions()
		-- upvalues: t_2 (ref)
		local t = {}
		
		for i in t_2 do
			table.insert(t, i)
		end
		for i_1, v in t do
			local var14 = t_2[v]
			
			if var14 ~= nil then
				t_2[v] = nil
				var14()
			end
		end
	end
	
	return {
		getRevision = var2,
		reportAssistantTurnCompleted = function(p3)
			-- upvalues: p1 (ref), chatTypesModule (copy), creatorAgentChatModule (copy), retainPending (ref), var6 (write)
			if p1 == nil or p3.universeId == 0 or p1.isDismissedPermanently(p3.universeId) then return end
			local var15 = chatTypesModule.makeAssistantTurnAnchorKey(p3.sessionId, p3.latestSequenceId)
			
			if var15 == nil then
				return
			end
			local var16 = creatorAgentChatModule.PublishToolUtils.getLatestSuccessfulResult(p3.turnState, { parseDirectText = true }) ~= nil
			var6(retainPending({
				isCompletedTurn = true,
				isVerifyingAudience = false,
				isAwaitingEligibility = false,
				audienceVerificationAttempts = 0,
				storagePersistenceAttempts = 0,
				id = `chat:{p3.universeId}:{var15}`,
				universeId = p3.universeId,
				sessionId = if p3.sessionId == "" then nil else p3.sessionId,
				afterMessageKey = var15,
				isEligiblePublish = if var16 then nil else false,
				requiresAudienceVerification = var16
			}))
		end,
		reportMenuPublish = function(p3, p4, p5, p6)
			-- upvalues: p1 (ref), retainPending (ref), var6 (write)
			if p1 == nil or p3 == 0 or (p5 == "" or p1.isDismissedPermanently(p3)) then
				return
			end
			local eligibility = p1.getEligibility(p3)
			local var15 = p6 and not eligibility.isResolved
			var6(retainPending({
				afterMessageKey = nil,
				isCompletedTurn = false,
				isVerifyingAudience = false,
				isAwaitingEligibility = false,
				audienceVerificationAttempts = 0,
				storagePersistenceAttempts = 0,
				id = `menu:{p3}:{p5}`,
				universeId = p3,
				sessionId = if p4 == "" then nil else p4,
				isEligiblePublish = if var15 then nil else p6 and (eligibility.isEligible and eligibility.freePromotionsRemaining > 0),
				requiresAudienceVerification = var15
			}))
		end,
		retryStorageRead = function()
			-- upvalues: p1 (ref), var3 (ref), t_1 (ref), t (ref), var6 (write)
			if p1 ~= nil and p1.retryStorageRead() then
				var3(function(p3)
					return p3 + 1
				end)
				
				for i, v in table.clone(t_1) do
					local var15 = t[v]
					
					if var15 ~= nil then
						var15.storagePersistenceAttempts = 0
						var6(var15)
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
			local var16, var17 = p1.pruneAnchors(p3, p4, p5)
			
			if var17 then
				var3(function(p6)
					return p6 + 1
				end)
			end
			return var16
		end,
		markAnchorImpressed = function(p3, p4, p5)
			-- upvalues: p1 (ref), var3 (ref)
			if p1 == nil then
				return false
			end
			local var16 = p1.markAnchorImpressed(p3, p4, p5)
			
			if var16 then
				var3(function(p6)
					return p6 + 1
				end)
			end
			return var16
		end,
		dismissPermanently = function()
			-- upvalues: p1 (ref), var5 (write), var4 (write), disposeAllEligibilitySubscriptions (ref), t (ref), t_1 (ref), var3 (ref)
			if p1 ~= nil then
				var5 += 1
				
				if var4 ~= nil then
					p1.cancelRetry(var4)
					var4 = nil
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
			-- upvalues: var5 (write), p1 (ref), var4 (write), disposeAllEligibilitySubscriptions (ref), t (ref), t_1 (ref), var3 (ref)
			var5 += 1
			
			if p1 ~= nil and var4 ~= nil then
				p1.cancelRetry(var4)
			end
			var4 = nil
			disposeAllEligibilitySubscriptions()
			table.clear(t)
			table.clear(t_1)
			var3(0)
		end
	}
end