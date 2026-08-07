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
local privacyType = universeConfigurationModule.PrivacyType
local var9 = signalsModule.createSignal(nil)

return function(p0, p1) --[[ line: 58 | named "useExperienceShareFlow" ]]
	-- upvalues: reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), var9 (ref), sharePublishedExperience (ref), gameConfigurationLabelsModule (ref), privacyType (ref), fFlagBuildExperiencePrivateInvitesModule (ref), sendBuildExperienceEventModule (ref), sharePrivateExperienceModule (ref), logger (ref)
	local var10 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: p0 (ref), universeConfigurationModule (copy)
		return if p0 == nil then nil else universeConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p0)
	end, { p0 })
	local var11 = signalsReactModule.useSignalState(if var10 ~= nil then var9 else var10.data)
	local none, none_1 = reactModule.useState("none")
	local var14, var15 = reactModule.useState(false)
	local var16 = reactModule.useCallback(function() --[[ line: 74 ]]
		-- upvalues: var15 (ref), none_1 (ref)
		var15(false)
		none_1("none")
	end, {})
	local var17 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: p1 (ref), sharePublishedExperience (copy)
		if p1 ~= nil then
			sharePublishedExperience(p1)
		end
	end, { p1 })
	local var18 = reactModule.useMemo(function() --[[ line: 88 ]]
		-- upvalues: gameConfigurationLabelsModule (copy), var11 (ref)
		return gameConfigurationLabelsModule.getAudience(var11)
	end, { var11 })
	
	return {
		onShare = reactModule.useCallback(function() --[[ line: 94 ]]
			-- upvalues: var18 (ref), privacyType (copy), fFlagBuildExperiencePrivateInvitesModule (copy), none_1 (ref), p0 (ref), sendBuildExperienceEventModule (copy), var17 (ref)
			if var18 ~= privacyType.Private then
				if var18 == privacyType.FriendsOnly then
					none_1("friends")
					
					return
				elseif var18 == privacyType.Public then
					var17()
				end
			elseif fFlagBuildExperiencePrivateInvitesModule then
				none_1("playtesters")
				
				if p0 == nil then
					return
				else
					sendBuildExperienceEventModule("PLAYTEST_SHARE_DIALOG_IMPRESSION", { universeId = p0 })
				end
			end
		end, { var18, var17, p0 }),
		audience = var18,
		activeDialog = none,
		hasShareError = var14,
		onCancelDialog = var16,
		onConfirmFriends = reactModule.useCallback(function() --[[ line: 114 ]]
			-- upvalues: none_1 (ref), var17 (ref)
			none_1("none")
			var17()
		end, { var17 }),
		onConfirmPlaytesters = reactModule.useCallback(function() --[[ line: 119 ]]
			-- upvalues: p0 (ref), sendBuildExperienceEventModule (copy), var15 (ref), sharePrivateExperienceModule (copy), none_1 (ref), logger (copy)
			if p0 == nil then
				return
			end
			sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = p0 }, { source = "playtesters_dialog" })
			var15(false)
			sharePrivateExperienceModule(p0):andThen(function() --[[ line: 131 ]]
				-- upvalues: none_1 (copy)
				none_1("none")
			end):catch(function(p2) --[[ line: 134 ]]
				-- upvalues: logger (copy), p0 (copy), var15 (copy)
				logger:warning("useExperienceShareFlow: private share failed for universe {}: {}", p0, p2)
				var15(true)
			end)
		end, { p0 })
	}
end