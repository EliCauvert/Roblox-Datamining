local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local logger = require(parent.Loggers).Logger
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local sharePublishedExperienceModule = require(buildExperience.utils.sharePublishedExperience)
local sharePublishedExperience = sharePublishedExperienceModule.sharePublishedExperience
local useSharePublishedExperience = sharePublishedExperienceModule.useSharePublishedExperience
local sharePrivateExperienceModule = require(buildExperience.utils.sharePrivateExperience)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local fFlagBuildExperienceShareUseUniverseSummary = sharedFlagsModule.FFlagBuildExperienceShareUseUniverseSummary
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local privacyType = universeConfigurationModule.PrivacyType
local var11 = signalsModule.createSignal(nil)

return function(p0, p1)
	-- upvalues: fFlagBuildLocalization (ref), useSharePublishedExperience (ref), reactModule (ref), var11 (ref), universeConfigurationModule (ref), fFlagBuildExperienceShareUseUniverseSummary (ref), signalsReactModule (ref), sharePublishedExperience (ref), gameConfigurationLabelsModule (ref), privacyType (ref), fFlagBuildExperiencePrivateInvitesModule (ref), sendBuildExperienceEventModule (ref), sharePrivateExperienceModule (ref), logger (ref)
	local var12 = if fFlagBuildLocalization then useSharePublishedExperience(p0) else nil
	local var13 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p0 (ref), var11 (copy), universeConfigurationModule (copy), fFlagBuildExperienceShareUseUniverseSummary (copy)
		if p0 == nil then
			return var11
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		return if fFlagBuildExperienceShareUseUniverseSummary then universeConfigurationStore.getAndFetchSummary(p0).data else universeConfigurationStore.getAndFetchConfiguration(p0).data
	end, { p0 }))
	local none, none_1 = reactModule.useState("none")
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), none_1 (ref)
		var17(false)
		none_1("none")
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagBuildLocalization (copy), var12 (ref), sharePublishedExperience (copy)
		if p1 ~= nil then
			if fFlagBuildLocalization then
				var12(p1)
				
				return
			end
			sharePublishedExperience(p1)
		end
	end, { p1, var12 })
	local var20 = reactModule.useMemo(function()
		-- upvalues: gameConfigurationLabelsModule (copy), var13 (ref)
		return gameConfigurationLabelsModule.getAudience(var13)
	end, { var13 })
	
	return {
		onShare = reactModule.useCallback(function()
			-- upvalues: var20 (ref), privacyType (copy), fFlagBuildExperiencePrivateInvitesModule (copy), none_1 (ref), p0 (ref), sendBuildExperienceEventModule (copy), var19 (ref)
			if var20 ~= privacyType.Private then
				if var20 == privacyType.FriendsOnly then
					none_1("friends")
					
					return
				elseif var20 == privacyType.Public then
					var19()
				end
			elseif fFlagBuildExperiencePrivateInvitesModule then
				none_1("playtesters")
				
				if p0 == nil then
					return
				else
					sendBuildExperienceEventModule("PLAYTEST_SHARE_DIALOG_IMPRESSION", { universeId = p0 })
				end
			end
		end, { var20, var19, p0 }),
		audience = var20,
		activeDialog = none,
		hasShareError = var16,
		onCancelDialog = var18,
		onConfirmFriends = reactModule.useCallback(function()
			-- upvalues: none_1 (ref), var19 (ref)
			none_1("none")
			var19()
		end, { var19 }),
		onConfirmPlaytesters = reactModule.useCallback(function()
			-- upvalues: p0 (ref), sendBuildExperienceEventModule (copy), var17 (ref), sharePrivateExperienceModule (copy), none_1 (ref), logger (copy)
			if p0 == nil then
				return
			end
			sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = p0 }, { source = "playtesters_dialog" })
			var17(false)
			sharePrivateExperienceModule(p0):andThen(function()
				-- upvalues: none_1 (copy)
				none_1("none")
			end):catch(function(p2)
				-- upvalues: logger (copy), p0 (copy), var17 (copy)
				logger:warning("useExperienceShareFlow: private share failed for universe {}: {}", p0, p2)
				var17(true)
			end)
		end, { p0 })
	}
end