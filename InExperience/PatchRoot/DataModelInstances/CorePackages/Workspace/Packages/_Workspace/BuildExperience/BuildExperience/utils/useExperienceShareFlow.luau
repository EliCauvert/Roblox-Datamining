local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local Logger = require(Parent.Loggers).Logger
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local UseSharePublishedExperienceFunction = require(BuildExperience.utils.sharePublishedExperience).useSharePublishedExperience
local SharePrivateExperienceModule = require(BuildExperience.utils.sharePrivateExperience)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildExperiencePrivateInvitesModule = require(BuildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local PrivacyType = UniverseConfigurationModule.PrivacyType
local Signal = require(Parent.Signals).createSignal(nil)

return function(UniverseId, p1)
	-- upvalues: UseSharePublishedExperienceFunction (copy), ReactModule (copy), Signal (copy), UniverseConfigurationModule (copy), SignalsReactModule (copy), GameConfigurationLabelsModule (copy), PrivacyType (copy), FFlagBuildExperiencePrivateInvitesModule (copy), SendBuildExperienceEventModule (copy), SharePrivateExperienceModule (copy), Logger (copy)
	local UseSharePublishedExperienceResult = UseSharePublishedExperienceFunction(UniverseId)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: UniverseId (copy), Signal (upval), UniverseConfigurationModule (upval)
		return if UniverseId == nil then Signal else UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(UniverseId).data
	end, { UniverseId })))
	local None, None2 = ReactModule.useState("none")
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseSharePublishedExperienceResult (copy)
		if p1 ~= nil then
			UseSharePublishedExperienceResult(p1)
		end
	end, { p1, UseSharePublishedExperienceResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GameConfigurationLabelsModule (upval), UseSignalStateResult (copy)
		return GameConfigurationLabelsModule.getAudience(UseSignalStateResult)
	end, { UseSignalStateResult })
	
	return {
		onShare = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult (copy), PrivacyType (upval), FFlagBuildExperiencePrivateInvitesModule (upval), None2 (copy), UniverseId (copy), SendBuildExperienceEventModule (upval), UseResult (copy)
			if UseMemoResult == PrivacyType.Private then
				if FFlagBuildExperiencePrivateInvitesModule then
					None2("playtesters")
					
					if UniverseId ~= nil then
						SendBuildExperienceEventModule("PLAYTEST_SHARE_DIALOG_IMPRESSION", { universeId = UniverseId })
						
						return
					end
				end
			elseif UseMemoResult == PrivacyType.FriendsOnly then
				None2("friends")
				
				return
			else
				if UseMemoResult == PrivacyType.Public then
					UseResult()
				end
			end
		end, { UseMemoResult, UseResult, UniverseId }),
		audience = UseMemoResult,
		activeDialog = None,
		hasShareError = UseStateResult,
		onCancelDialog = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), None2 (copy)
			UseStateResult2(false)
			None2("none")
		end, {}),
		onConfirmFriends = ReactModule.useCallback(function()
			-- upvalues: None2 (copy), UseResult (copy)
			None2("none")
			UseResult()
		end, { UseResult }),
		onConfirmPlaytesters = ReactModule.useCallback(function()
			-- upvalues: UniverseId (copy), SendBuildExperienceEventModule (upval), UseStateResult2 (copy), SharePrivateExperienceModule (upval), None2 (copy), Logger (upval)
			if UniverseId ~= nil then
				SendBuildExperienceEventModule("PLAYTEST_SHARE_CLICK", { universeId = UniverseId }, { source = "playtesters_dialog" })
				UseStateResult2(false)
				SharePrivateExperienceModule(UniverseId):andThen(function()
					-- upvalues: None2 (upval)
					None2("none")
				end):catch(function(Err)
					-- upvalues: Logger (upval), UniverseId (upval), UseStateResult2 (upval)
					Logger:warning("useExperienceShareFlow: private share failed for universe {}: {}", UniverseId, Err)
					UseStateResult2(true)
				end)
				
				return
			end
		end, { UniverseId })
	}
end