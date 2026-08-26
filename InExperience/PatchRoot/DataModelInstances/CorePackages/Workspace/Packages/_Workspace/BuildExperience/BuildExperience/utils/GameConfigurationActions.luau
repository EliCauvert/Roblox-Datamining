local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local universeSearchModule = require(parent.DataHydration.UniverseSearch)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local getBuildExperienceRefreshStoreModule = require(buildExperience.Stores.GetBuildExperienceRefreshStore)
local rehydrateGameMetadataModule = require(buildExperience.utils.rehydrateGameMetadata)
local buildExperienceSetAudiencesMaxRetries = game:DefineFastInt("BuildExperienceSetAudiencesMaxRetries", 3)
local buildExperienceSetAudiencesRetryDelayMs = game:DefineFastInt("BuildExperienceSetAudiencesRetryDelayMs", 3000)
local buildExperienceSecondActivateAfterSetAudiences = game:DefineFastFlag("BuildExperienceSecondActivateAfterSetAudiences", false)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local debug = creatorAgentChatModule.debug
local var1 = urlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/configure")
local var2 = urlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/experience-questionnaire")

local function getCreatorHubConfigureUrl(p1)
	-- upvalues: var1 (ref)
	return var1({ universeId = p1 })
end

local function getExperienceQuestionnaireUrl(p1)
	-- upvalues: var2 (ref)
	return var2({ universeId = p1 })
end

local function saveAndPublishPlace(p1)
	-- upvalues: debug (ref), creatorAgentChatModule (ref), httpClientModule (ref)
	debug.log("info", "GameConfigurationActions save_and_publish started", { placeId = p1.placeId })
	
	return httpClientModule.asPromise(creatorAgentChatModule.getCreatorAgentChatStore().sessionSaveAndPublish(p1))
end

local function archiveGame(p1)
	-- upvalues: debug (ref), universeConfigurationModule (ref), universeSearchModule (ref), getBuildExperienceRefreshStoreModule (ref)
	debug.log("info", "GameConfigurationActions archive started", { universeId = p1 })
	
	return universeConfigurationModule.getUniverseConfigurationStore().patchConfiguration(p1, { isArchived = true }):andThen(function()
		-- upvalues: debug (copy), p1 (ref), universeSearchModule (copy), getBuildExperienceRefreshStoreModule (copy)
		debug.log("info", "GameConfigurationActions archive succeeded", { universeId = p1 })
		universeSearchModule.getUniverseSearchStore().invalidateAll()
		getBuildExperienceRefreshStoreModule().bumpRefreshTick()
	end):catch(function(p2)
		-- upvalues: debug (copy), p1 (ref)
		debug.log("warn", "GameConfigurationActions archive failed", { error = tostring(p2), universeId = p1 })
	end)
end

local function updateTitleDescription(p1, p2, p3)
	-- upvalues: debug (ref), universeConfigurationModule (ref), universeSearchModule (ref), dataHydrationModule (ref)
	debug.log("info", "GameConfigurationActions title and description update started", { universeId = p1 })
	
	return universeConfigurationModule.getUniverseConfigurationStore().patchConfiguration(p1, { name = p2, description = p3 }):andThen(function(p4)
		-- upvalues: universeSearchModule (copy), p1 (ref), p2 (ref), p3 (ref), dataHydrationModule (copy), debug (copy)
		universeSearchModule.getUniverseSearchStore().updateSearchItem(p1, { name = p2, description = p3 })
		local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
		
		if gameInfoStore.updateGameInfo == nil then
			debug.log("warn", "GameConfigurationActions updateGameInfo unavailable", { source = "updateTitleDescription", universeId = p1 })
			
			return p4
		end
		gameInfoStore.updateGameInfo(tostring(p1), { name = p2, description = p3 })
		
		return p4
	end)
end

local function _(p1, p2, p3)
	-- upvalues: universeConfigurationModule (ref)
	universeConfigurationModule.getUniverseConfigurationStore().updateSummary(p1, { isActive = true, privacyType = p3, audiences = p2 })
end

local function buildPublicAudiences(p1)
	-- upvalues: universeActivationModule (ref)
	local t = {}
	
	for i, v in p1 do
		if v ~= universeActivationModule.Audience.Public and v ~= universeActivationModule.Audience.Friends then
			table.insert(t, v)
		end
	end
	table.insert(t, universeActivationModule.Audience.Public)
	
	return t
end

local function updateCachedAudience(p2, p3, p4)
	-- upvalues: universeConfigurationModule (ref)
	local privacyTypeForAudiences = universeConfigurationModule.getPrivacyTypeForAudiences(p3)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	universeConfigurationStore.updateConfiguration(p2, { privacyType = privacyTypeForAudiences, audiences = p3 })
	universeConfigurationStore.updateSummary(p2, {
		isActive = p4,
		privacyType = privacyTypeForAudiences,
		audiences = p3
	})
end

local _ = function(p2)
	-- upvalues: universeActivationModule (ref)
	return p2 ~= nil and table.find(p2, universeActivationModule.Audience.Public) ~= nil
end

local _ = function(p2, p3)
	return {
		stage = "set_audience",
		errorMessage = if typeof(p2) == "table" and p2.errorMessage ~= nil then tostring(p2.errorMessage) else tostring(p2),
		publishResult = p3
	}
end

local function setAudiencesForPublish(value, p2, p3)
	-- upvalues: fFlagBuildRehydrateOnPublishModule (ref), buildPublicAudiences (ref), promiseModule (ref), buildExperienceSetAudiencesMaxRetries (ref), buildExperienceSetAudiencesRetryDelayMs (ref), updateCachedAudience (ref), universeActivationModule (ref), debug (ref)
	local var3 = if fFlagBuildRehydrateOnPublishModule then buildPublicAudiences(p3) else p3
	
	return promiseModule.retryWithDelay(function()
		-- upvalues: value (ref), p2 (ref), var3 (ref)
		return value.setAudiences(p2, var3)
	end, buildExperienceSetAudiencesMaxRetries, buildExperienceSetAudiencesRetryDelayMs / 1000):andThen(function(p4)
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), updateCachedAudience (copy), p2 (ref), universeActivationModule (copy), debug (copy), promiseModule (copy)
		if fFlagBuildRehydrateOnPublishModule then
			updateCachedAudience(p2, p4.audiences, true)
			local audiences = p4.audiences
			
			if audiences ~= nil and table.find(audiences, universeActivationModule.Audience.Public) ~= nil then
				return p4
			else
				debug.log("warn", "GameConfigurationActions set audience missing Public", { universeId = p2 })
				
				return promiseModule.reject({
					errorMessage = "setAudiences did not return a Public audience"
				})
			end
		end
	end)
end

return {
	PublishFailureStage = { SetAudience = "set_audience" },
	getCreatorHubConfigureUrl = getCreatorHubConfigureUrl,
	publishExperience = function(p2)
		-- upvalues: saveAndPublishPlace (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), setAudiencesForPublish (ref), promiseModule (ref), debug (ref), buildExperienceSecondActivateAfterSetAudiences (ref), universeConfigurationModule (ref), rehydrateGameMetadataModule (ref)
		local var3
		local _ = nil
		
		local function publishPlace()
			-- upvalues: saveAndPublishPlace (copy), p2 (ref)
			return saveAndPublishPlace({
				placeId = p2.placeId,
				title = p2.title,
				description = p2.description
			})
		end
		
		if not p2.isActive then
			local universeActivationStore = universeActivationModule.getUniverseActivationStore()
			debug.log("info", "GameConfigurationActions publish activate-and-set-audience started", { universeId = p2.universeId, placeId = p2.placeId })
			
			local function setPublicAudience()
				-- upvalues: setAudiencesForPublish (copy), universeActivationStore (ref), p2 (ref), buildExperienceSecondActivateAfterSetAudiences (copy), debug (copy)
				return setAudiencesForPublish(universeActivationStore, p2.universeId, p2.audiences):andThen(function()
					-- upvalues: buildExperienceSecondActivateAfterSetAudiences (copy), universeActivationStore (copy), p2 (copy), debug (copy)
					return if buildExperienceSecondActivateAfterSetAudiences then universeActivationStore.activate(p2.universeId):catch(function(p3)
						-- upvalues: debug (copy), p2 (copy)
						debug.log("warn", "GameConfigurationActions second activate failed", { error = tostring(p3), universeId = p2.universeId })
					end) else nil
				end)
			end
			
			var3 = if fFlagBuildRehydrateOnPublishModule then universeActivationStore.activate(p2.universeId):andThen(function()
				-- upvalues: publishPlace (ref)
				return publishPlace()
			end):andThen(function(p3)
				-- upvalues: setAudiencesForPublish (copy), universeActivationStore (ref), p2 (ref), buildExperienceSecondActivateAfterSetAudiences (copy), debug (copy), promiseModule (copy)
				return setAudiencesForPublish(universeActivationStore, p2.universeId, p2.audiences):andThen(function()
					-- upvalues: buildExperienceSecondActivateAfterSetAudiences (copy), universeActivationStore (copy), p2 (copy), debug (copy)
					return if buildExperienceSecondActivateAfterSetAudiences then universeActivationStore.activate(p2.universeId):catch(function(p4)
						-- upvalues: debug (copy), p2 (copy)
						debug.log("warn", "GameConfigurationActions second activate failed", { error = tostring(p4), universeId = p2.universeId })
					end) else nil
				end):andThen(function()
					-- upvalues: p3 (ref)
					return p3
				end, function(p4)
					-- upvalues: promiseModule (copy), p3 (ref)
					return promiseModule.reject({
						stage = "set_audience",
						errorMessage = if typeof(p4) == "table" and p4.errorMessage ~= nil then tostring(p4.errorMessage) else tostring(p4),
						publishResult = p3
					})
				end)
			end) else universeActivationStore.activate(p2.universeId):andThen(function()
				-- upvalues: setPublicAudience (ref)
				return setPublicAudience()
			end):andThen(function()
				-- upvalues: p2 (ref), universeConfigurationModule (copy), publishPlace (ref)
				universeConfigurationModule.getUniverseConfigurationStore().updateSummary(p2.universeId, {
					isActive = true,
					privacyType = universeConfigurationModule.PrivacyType.Public,
					audiences = p2.audiences
				})
				
				return publishPlace()
			end)
		elseif fFlagBuildRehydrateOnPublishModule then
			local universeActivationStore = universeActivationModule.getUniverseActivationStore()
			var3 = saveAndPublishPlace({
				placeId = p2.placeId,
				title = p2.title,
				description = p2.description
			}):andThen(function(p3)
				-- upvalues: setAudiencesForPublish (copy), universeActivationStore (ref), p2 (ref), promiseModule (copy)
				return setAudiencesForPublish(universeActivationStore, p2.universeId, p2.audiences):andThen(function()
					-- upvalues: p3 (ref)
					return p3
				end, function(p4)
					-- upvalues: promiseModule (copy), p3 (ref)
					return promiseModule.reject({
						stage = "set_audience",
						errorMessage = if typeof(p4) == "table" and p4.errorMessage ~= nil then tostring(p4.errorMessage) else tostring(p4),
						publishResult = p3
					})
				end)
			end)
		else
			var3 = saveAndPublishPlace({
				placeId = p2.placeId,
				title = p2.title,
				description = p2.description
			})
		end
		return var3:finally(function()
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), rehydrateGameMetadataModule (copy), p2 (ref), var3 (write)
			if fFlagBuildRehydrateOnPublishModule then
				rehydrateGameMetadataModule(p2.universeId)
			end
			return var3
		end)
	end,
	getExperienceQuestionnaireUrl = getExperienceQuestionnaireUrl,
	saveAndPublishPlace = saveAndPublishPlace,
	archiveGame = archiveGame,
	updateCachedAudience = updateCachedAudience,
	updateTitleDescription = updateTitleDescription
}