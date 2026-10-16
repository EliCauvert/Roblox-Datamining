local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local Game = require(Parent.DataHydration).Game
local SduiChip = require(Parent.SduiSharedContent).SduiChip
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport

return ReactModule.memo(function(p1) --[[ Line: 32 | Named "ExperienceDetailsReportChip" ]]
	-- upvalues: UseDispatchFunction (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), SignalsReactModule (copy), Game (copy), ReactModule (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), FFlagAddThumbnailSelectorReport (copy), CloseCentralOverlayFunction (copy), SduiChip (copy), FoundationModule (copy)
	local LayoutOrder = p1.layoutOrder
	local UniverseId = p1.universeId
	local UseDispatchResult = UseDispatchFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 37 ]]
		return p2.getGameReportingDisabled()
	end)
	local UseLocalizationResult = UseLocalizationFunction({ report = "Feature.GameDetails.Action.Report" })
	local UseSignalStateResult = SignalsReactModule.useSignalState(Game.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	local RootPlaceId = UseSignalStateResult and UseSignalStateResult.rootPlaceId
	local UseResult = ReactModule.useCallback(function() --[[ Line: 49 ]]
		-- upvalues: RootPlaceId (copy), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), FFlagAddThumbnailSelectorReport (upval), UniverseId (copy), CloseCentralOverlayFunction (upval)
		if RootPlaceId then
			UseDispatchResult(OpenDynamicAbuseReportModule({
				abuseVector = AbuseVectorModule.Place,
				targetId = RootPlaceId,
				custom = if FFlagAddThumbnailSelectorReport then { universeId = UniverseId } else nil,
				onClose = function() --[[ Line: 61 ]]
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					UseDispatchResult(CloseCentralOverlayFunction())
				end
			}))
			
			return
		end
	end, { UniverseId, RootPlaceId, UseDispatchResult })
	
	return if UseAppPolicyResult then nil else ReactModule.createElement(SduiChip, {
		text = UseLocalizationResult.report,
		leadingIconName = FoundationModule.Enums.IconName.Flag,
		onActivated = UseResult,
		layoutOrder = LayoutOrder
	})
end)