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
local var14 = urlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/configure")
local var15 = urlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/experience-questionnaire")

local function getCreatorHubConfigureUrl(p0)
	-- upvalues: var14 (ref)
	return var14({ universeId = p0 })
end

local function getExperienceQuestionnaireUrl(p1)
	-- upvalues: var15 (ref)
	return var15({ universeId = p1 })
end

local function saveAndPublishPlace(p2)
	-- upvalues: debug (ref), creatorAgentChatModule (ref), httpClientModule (ref)
	debug.log("info", "GameConfigurationActions save_and_publish started", { placeId = p2.placeId })
	
	return httpClientModule.asPromise(creatorAgentChatModule.getCreatorAgentChatStore().sessionSaveAndPublish(p2))
end

local function archiveGame(p3)
	-- upvalues: debug (ref), universeConfigurationModule (ref), universeSearchModule (ref), getBuildExperienceRefreshStoreModule (ref)
	debug.log("info", "GameConfigurationActions archive started", { universeId = p3 })
	
	return universeConfigurationModule.getUniverseConfigurationStore().patchConfiguration(p3, { isArchived = true }):andThen(function()
		-- upvalues: debug (copy), p3 (ref), universeSearchModule (copy), getBuildExperienceRefreshStoreModule (copy)
		debug.log("info", "GameConfigurationActions archive succeeded", { universeId = p3 })
		universeSearchModule.getUniverseSearchStore().invalidateAll()
		getBuildExperienceRefreshStoreModule().bumpRefreshTick()
	end):catch(function(p4)
		-- upvalues: debug (copy), p3 (ref)
		debug.log("warn", "GameConfigurationActions archive failed", { error = tostring(p4), universeId = p3 })
	end)
end

local function updateTitleDescription(p5, p6, p7)
	-- upvalues: debug (ref), universeConfigurationModule (ref), universeSearchModule (ref), dataHydrationModule (ref)
	debug.log("info", "GameConfigurationActions title and description update started", { universeId = p5 })
	
	return universeConfigurationModule.getUniverseConfigurationStore().patchConfiguration(p5, { name = p6, description = p7 }):andThen(function(p8)
		-- upvalues: universeSearchModule (copy), p5 (ref), p6 (ref), p7 (ref), dataHydrationModule (copy), debug (copy)
		universeSearchModule.getUniverseSearchStore().updateSearchItem(p5, { name = p6, description = p7 })
		local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
		
		if gameInfoStore.updateGameInfo == nil then
			debug.log("warn", "GameConfigurationActions updateGameInfo unavailable", { source = "updateTitleDescription", universeId = p5 })
			
			return p8
		end
		gameInfoStore.updateGameInfo(tostring(p5), { name = p6, description = p7 })
		
		return p8
	end)
end

local function _(p9, p10, p11)
	-- upvalues: universeConfigurationModule (ref)
	universeConfigurationModule.getUniverseConfigurationStore().updateSummary(p9, { isActive = true, privacyType = p11, audiences = p10 })
end

local function buildPublicAudiences(p12)
	-- upvalues: universeActivationModule (ref)
	local t = {}
	
	for i, v in p12 do
		if v ~= universeActivationModule.Audience.Public and v ~= universeActivationModule.Audience.Friends then
			table.insert(t, v)
		end
	end
	table.insert(t, universeActivationModule.Audience.Public)
	
	return t
end

local function updateCachedAudience(p13, p14, p15)
	-- upvalues: universeConfigurationModule (ref)
	local privacyTypeForAudiences = universeConfigurationModule.getPrivacyTypeForAudiences(p14)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	universeConfigurationStore.updateConfiguration(p13, { privacyType = privacyTypeForAudiences, audiences = p14 })
	universeConfigurationStore.updateSummary(p13, {
		isActive = p15,
		privacyType = privacyTypeForAudiences,
		audiences = p14
	})
end

local _ = function(p16)
	-- upvalues: universeActivationModule (ref)
	return p16 ~= nil and table.find(p16, universeActivationModule.Audience.Public) ~= nil
end

local _ = function(p17, p18)
	return {
		stage = "set_audience",
		errorMessage = if typeof(p17) == "table" and p17.errorMessage ~= nil then tostring(p17.errorMessage) else tostring(p17),
		publishResult = p18
	}
end

local function setAudiencesForPublish(value, p19, p20)
	-- upvalues: fFlagBuildRehydrateOnPublishModule (ref), buildPublicAudiences (ref), promiseModule (ref), buildExperienceSetAudiencesMaxRetries (ref), buildExperienceSetAudiencesRetryDelayMs (ref), updateCachedAudience (ref), universeActivationModule (ref), debug (ref)
	local var28 = if fFlagBuildRehydrateOnPublishModule then buildPublicAudiences(p20) else p20
	
	return promiseModule.retryWithDelay(function()
		-- upvalues: value (ref), p19 (ref), var28 (ref)
		return value.setAudiences(p19, var28)
	end, buildExperienceSetAudiencesMaxRetries, buildExperienceSetAudiencesRetryDelayMs / 1000):andThen(function(p21)
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), updateCachedAudience (copy), p19 (ref), universeActivationModule (copy), debug (copy), promiseModule (copy)
		if fFlagBuildRehydrateOnPublishModule then
			updateCachedAudience(p19, p21.audiences, true)
			local audiences = p21.audiences
			
			if audiences ~= nil and table.find(audiences, universeActivationModule.Audience.Public) ~= nil then
				return p21
			else
				debug.log("warn", "GameConfigurationActions set audience missing Public", { universeId = p19 })
				
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
	publishExperience = function(p22)
		-- upvalues: saveAndPublishPlace (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), setAudiencesForPublish (ref), promiseModule (ref), debug (ref), buildExperienceSecondActivateAfterSetAudiences (ref), universeConfigurationModule (ref), rehydrateGameMetadataModule (ref)
		local var31
		local _ = nil
		
		local function publishPlace()
			-- upvalues: saveAndPublishPlace (copy), p22 (ref)
			return saveAndPublishPlace({
				placeId = p22.placeId,
				title = p22.title,
				description = p22.description
			})
		end
		
		if not p22.isActive then
			local universeActivationStore = universeActivationModule.getUniverseActivationStore()
			debug.log("info", "GameConfigurationActions publish activate-and-set-audience started", { universeId = p22.universeId, placeId = p22.placeId })
			
			local function setPublicAudience()
				-- upvalues: setAudiencesForPublish (copy), universeActivationStore (ref), p22 (ref), buildExperienceSecondActivateAfterSetAudiences (copy), debug (copy)
				return setAudiencesForPublish(universeActivationStore, p22.universeId, p22.audiences):andThen(function()
					-- upvalues: buildExperienceSecondActivateAfterSetAudiences (copy), universeActivationStore (copy), p22 (copy), debug (copy)
					return if buildExperienceSecondActivateAfterSetAudiences then universeActivationStore.activate(p22.universeId):catch(function(p23)
						-- upvalues: debug (copy), p22 (copy)
						debug.log("warn", "GameConfigurationActions second activate failed", { error = tostring(p23), universeId = p22.universeId })
					end) else nil
				end)
			end
			
			var31 = if fFlagBuildRehydrateOnPublishModule then universeActivationStore.activate(p22.universeId):andThen(function()
				-- upvalues: publishPlace (ref)
				return publishPlace()
			end):andThen(function(p24)
				-- upvalues: setAudiencesForPublish (copy), universeActivationStore (ref), p22 (ref), buildExperienceSecondActivateAfterSetAudiences (copy), debug (copy), promiseModule (copy)
				return setAudiencesForPublish(universeActivationStore, p22.universeId, p22.audiences):andThen(function()
					-- upvalues: buildExperienceSecondActivateAfterSetAudiences (copy), universeActivationStore (copy), p22 (copy), debug (copy)
					return if buildExperienceSecondActivateAfterSetAudiences then universeActivationStore.activate(p22.universeId):catch(function(p26)
						-- upvalues: debug (copy), p22 (copy)
						debug.log("warn", "GameConfigurationActions second activate failed", { error = tostring(p26), universeId = p22.universeId })
					end) else nil
				end):andThen(function()
					-- upvalues: p24 (ref)
					return p24
				end, function(p25)
					-- upvalues: promiseModule (copy), p24 (ref)
					return promiseModule.reject({
						stage = "set_audience",
						errorMessage = if typeof(p25) == "table" and p25.errorMessage ~= nil then tostring(p25.errorMessage) else tostring(p25),
						publishResult = p24
					})
				end)
			end) else universeActivationStore.activate(p22.universeId):andThen(function()
				-- upvalues: setPublicAudience (ref)
				return setPublicAudience()
			end):andThen(function()
				-- upvalues: p22 (ref), universeConfigurationModule (copy), publishPlace (ref)
				universeConfigurationModule.getUniverseConfigurationStore().updateSummary(p22.universeId, {
					isActive = true,
					privacyType = universeConfigurationModule.PrivacyType.Public,
					audiences = p22.audiences
				})
				
				return publishPlace()
			end)
		elseif fFlagBuildRehydrateOnPublishModule then
			local universeActivationStore = universeActivationModule.getUniverseActivationStore()
			var31 = saveAndPublishPlace({
				placeId = p22.placeId,
				title = p22.title,
				description = p22.description
			}):andThen(function(p27)
				-- upvalues: setAudiencesForPublish (copy), universeActivationStore (ref), p22 (ref), promiseModule (copy)
				return setAudiencesForPublish(universeActivationStore, p22.universeId, p22.audiences):andThen(function()
					-- upvalues: p27 (ref)
					return p27
				end, function(p28)
					-- upvalues: promiseModule (copy), p27 (ref)
					return promiseModule.reject({
						stage = "set_audience",
						errorMessage = if typeof(p28) == "table" and p28.errorMessage ~= nil then tostring(p28.errorMessage) else tostring(p28),
						publishResult = p27
					})
				end)
			end)
		else
			var31 = saveAndPublishPlace({
				placeId = p22.placeId,
				title = p22.title,
				description = p22.description
			})
		end
		return var31:finally(function()
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), rehydrateGameMetadataModule (copy), p22 (ref), var31 (write)
			if fFlagBuildRehydrateOnPublishModule then
				rehydrateGameMetadataModule(p22.universeId)
			end
			return var31
		end)
	end,
	getExperienceQuestionnaireUrl = getExperienceQuestionnaireUrl,
	saveAndPublishPlace = saveAndPublishPlace,
	archiveGame = archiveGame,
	updateCachedAudience = updateCachedAudience,
	updateTitleDescription = updateTitleDescription
}