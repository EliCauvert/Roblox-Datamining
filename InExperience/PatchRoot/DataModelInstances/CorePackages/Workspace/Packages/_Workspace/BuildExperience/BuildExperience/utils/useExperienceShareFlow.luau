local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local logger = require(parent.Loggers).Logger
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local sharePublishedExperience = require(buildExperience.utils.sharePublishedExperience).sharePublishedExperience
local sharePrivateExperienceModule = require(buildExperience.utils.sharePrivateExperience)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local fFlagBuildExperienceShareUseUniverseSummary = require(parent.SharedFlags).FFlagBuildExperienceShareUseUniverseSummary
local privacyType = universeConfigurationModule.PrivacyType
local var9 = signalsModule.createSignal(nil)

return function(p0, p1) --[[ line: 59 | named "useExperienceShareFlow" ]]
	-- upvalues: reactModule (ref), var9 (ref), universeConfigurationModule (ref), fFlagBuildExperienceShareUseUniverseSummary (ref), signalsReactModule (ref), sharePublishedExperience (ref), gameConfigurationLabelsModule (ref), privacyType (ref), fFlagBuildExperiencePrivateInvitesModule (ref), sendBuildExperienceEventModule (ref), sharePrivateExperienceModule (ref), logger (ref)
	local var10 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: p0 (ref), var9 (copy), universeConfigurationModule (copy), fFlagBuildExperienceShareUseUniverseSummary (copy)
		if p0 == nil then
			return var9
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		return if fFlagBuildExperienceShareUseUniverseSummary then universeConfigurationStore.getAndFetchSummary(p0).data else universeConfigurationStore.getAndFetchConfiguration(p0).data
	end, { p0 }))
	local none, none_1 = reactModule.useState("none")
	local var13, var14 = reactModule.useState(false)
	local var15 = reactModule.useCallback(function() --[[ line: 80 ]]
		-- upvalues: var14 (ref), none_1 (ref)
		var14(false)
		none_1("none")
	end, {})
	local var16 = reactModule.useCallback(function() --[[ line: 85 ]]
		-- upvalues: p1 (ref), sharePublishedExperience (copy)
		if p1 ~= nil then
			sharePublishedExperience(p1)
		end
	end, { p1 })
	local var17 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: gameConfigurationLabelsModule (copy), var10 (ref)
		return gameConfigurationLabelsModule.getAudience(var10)
	end, { var10 })
	
	return {
		onShare = reactModule.useCallback(function() --[[ line: 100 ]]
			-- upvalues: var17 (ref), privacyType (copy), fFlagBuildExperiencePrivateInvitesModule (copy), none_1 (ref), p0 (ref), sendBuildExperienceEventModule (copy), var16 (ref)
			if var17 ~= privacyType.Private then
				if var17 == privacyType.FriendsOnly then
					none_1("friends")
					
					return
				elseif var17 == privacyType.Public then
					var16()
				end
			elseif fFlagBuildExperiencePrivateInvitesModule then
				none_1("playtesters")
				
				if p0 == nil then
					return
				else
					sendBuildExperienceEventModule("PLAYTEST_SHARE_DIALOG_IMPRESSION", { universeId = p0 })
				end
			end
		end, { var17, var16, p0 }),
		audience = var17,
		activeDialog = none,
		hasShareError = var13,
		onCancelDialog = var15,
		onConfirmFriends = reactModule.useCallback(function() --[[ line: 120 ]]
			-- upvalues: none_1 (ref), var16 (ref)
			none_1("none")
			var16()
		end, { var16 }),
		onConfirmPlaytesters = reactModule.useCallback(function() --[[ line: 125 ]]
			-- upvalues: p0 (ref), sendBuildExperienceEventModule (copy), var14 (ref), sharePrivateExperienceModule (copy), none_1 (ref), logger (copy)
			if p0 == nil then
				return
			end
			sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = p0 }, { source = "playtesters_dialog" })
			var14(false)
			sharePrivateExperienceModule(p0):andThen(function() --[[ line: 137 ]]
				-- upvalues: none_1 (copy)
				none_1("none")
			end):catch(function(p2) --[[ line: 140 ]]
				-- upvalues: logger (copy), p0 (copy), var14 (copy)
				logger:warning("useExperienceShareFlow: private share failed for universe {}: {}", p0, p2)
				var14(true)
			end)
		end, { p0 })
	}
end