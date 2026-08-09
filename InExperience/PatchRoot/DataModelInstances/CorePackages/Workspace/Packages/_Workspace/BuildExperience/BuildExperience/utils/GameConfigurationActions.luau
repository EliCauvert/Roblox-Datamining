local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local logger = require(parent.Loggers).Logger
local dataHydrationModule = require(parent.DataHydration)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local universeSearchModule = require(parent.DataHydration.UniverseSearch)
local getBuildExperienceRefreshStoreModule = require(buildExperience.Stores.GetBuildExperienceRefreshStore)
local debug = creatorAgentChatModule.debug

return {
	getCreatorHubConfigureUrl = function(p0) --[[ line: 13 ]]
		return `https://create.roblox.com/dashboard/creations/experiences/{p0}/configure`
	end,
	getExperienceQuestionnaireUrl = function(p1) --[[ line: 17 ]]
		return `https://create.roblox.com/dashboard/creations/experiences/{p1}/experience-questionnaire`
	end,
	archiveGame = function(p2) --[[ line: 21 ]]
		-- upvalues: logger (ref), universeConfigurationModule (ref), universeSearchModule (ref), getBuildExperienceRefreshStoreModule (ref)
		logger:info("GameConfigurationActions: archiving universe {}", p2)
		
		return universeConfigurationModule.getUniverseConfigurationStore().patchConfiguration(p2, { isArchived = true }):andThen(function() --[[ line: 25 ]]
			-- upvalues: logger (copy), p2 (ref), universeSearchModule (copy), getBuildExperienceRefreshStoreModule (copy)
			logger:info("GameConfigurationActions: archived universe {}", p2)
			universeSearchModule.getUniverseSearchStore().invalidateAll()
			getBuildExperienceRefreshStoreModule().bumpRefreshTick()
		end):catch(function(p3) --[[ line: 30 ]]
			-- upvalues: logger (copy), p2 (ref)
			logger:warning("GameConfigurationActions: failed to archive universe {}: {}", p2, tostring(p3))
		end)
	end,
	updateTitleDescription = function(p4, p5, p6) --[[ line: 35 ]]
		-- upvalues: logger (ref), universeConfigurationModule (ref), universeSearchModule (ref), dataHydrationModule (ref), debug (ref)
		logger:info("GameConfigurationActions: updating title and description for universe {}", p4)
		
		return universeConfigurationModule.getUniverseConfigurationStore().patchConfiguration(p4, { name = p5, description = p6 }):andThen(function(p7) --[[ line: 43 ]]
			-- upvalues: universeSearchModule (copy), p4 (ref), p5 (ref), p6 (ref), dataHydrationModule (copy), debug (copy)
			universeSearchModule.getUniverseSearchStore().updateSearchItem(p4, { name = p5, description = p6 })
			local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
			
			if gameInfoStore.updateGameInfo == nil then
				debug.log("warn", "GameConfigurationActions updateGameInfo unavailable", { source = "updateTitleDescription", universeId = p4 })
				
				return p7
			end
			gameInfoStore.updateGameInfo(tostring(p4), { name = p5, description = p6 })
			
			return p7
		end)
	end
}