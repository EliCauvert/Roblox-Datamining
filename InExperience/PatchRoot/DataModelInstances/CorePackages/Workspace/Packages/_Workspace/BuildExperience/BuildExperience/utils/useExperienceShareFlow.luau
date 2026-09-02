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
local var1 = signalsModule.createSignal(nil)

return function(p1, p2)
	-- upvalues: fFlagBuildLocalization (ref), useSharePublishedExperience (ref), reactModule (ref), var1 (ref), universeConfigurationModule (ref), fFlagBuildExperienceShareUseUniverseSummary (ref), signalsReactModule (ref), sharePublishedExperience (ref), gameConfigurationLabelsModule (ref), privacyType (ref), fFlagBuildExperiencePrivateInvitesModule (ref), sendBuildExperienceEventModule (ref), sharePrivateExperienceModule (ref), logger (ref)
	local var2 = if fFlagBuildLocalization then useSharePublishedExperience(p1) else nil
	local var3 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (copy), universeConfigurationModule (copy), fFlagBuildExperienceShareUseUniverseSummary (copy)
		if p1 == nil then
			return var1
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		return if fFlagBuildExperienceShareUseUniverseSummary then universeConfigurationStore.getAndFetchSummary(p1).data else universeConfigurationStore.getAndFetchConfiguration(p1).data
	end, { p1 }))
	local none, none_1 = reactModule.useState("none")
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), none_1 (ref)
		var5(false)
		none_1("none")
	end, {})
	local var7 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), fFlagBuildLocalization (copy), var2 (ref), sharePublishedExperience (copy)
		if p2 ~= nil then
			if fFlagBuildLocalization then
				var2(p2)
				
				return
			end
			sharePublishedExperience(p2)
		end
	end, { p2, var2 })
	local var8 = reactModule.useMemo(function()
		-- upvalues: gameConfigurationLabelsModule (copy), var3 (ref)
		return gameConfigurationLabelsModule.getAudience(var3)
	end, { var3 })
	
	return {
		onShare = reactModule.useCallback(function()
			-- upvalues: var8 (ref), privacyType (copy), fFlagBuildExperiencePrivateInvitesModule (copy), none_1 (ref), p1 (ref), sendBuildExperienceEventModule (copy), var7 (ref)
			if var8 ~= privacyType.Private then
				if var8 == privacyType.FriendsOnly then
					none_1("friends")
					
					return
				elseif var8 == privacyType.Public then
					var7()
				end
			elseif fFlagBuildExperiencePrivateInvitesModule then
				none_1("playtesters")
				
				if p1 == nil then
					return
				else
					sendBuildExperienceEventModule("PLAYTEST_SHARE_DIALOG_IMPRESSION", { universeId = p1 })
				end
			end
		end, { var8, var7, p1 }),
		audience = var8,
		activeDialog = none,
		hasShareError = var4,
		onCancelDialog = var6,
		onConfirmFriends = reactModule.useCallback(function()
			-- upvalues: none_1 (ref), var7 (ref)
			none_1("none")
			var7()
		end, { var7 }),
		onConfirmPlaytesters = reactModule.useCallback(function()
			-- upvalues: p1 (ref), sendBuildExperienceEventModule (copy), var5 (ref), sharePrivateExperienceModule (copy), none_1 (ref), logger (copy)
			if p1 == nil then
				return
			end
			sendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = p1 }, { source = "playtesters_dialog" })
			var5(false)
			sharePrivateExperienceModule(p1):andThen(function()
				-- upvalues: none_1 (copy)
				none_1("none")
			end):catch(function(p3)
				-- upvalues: logger (copy), p1 (copy), var5 (copy)
				logger:warning("useExperienceShareFlow: private share failed for universe {}: {}", p1, p3)
				var5(true)
			end)
		end, { p1 })
	}
end