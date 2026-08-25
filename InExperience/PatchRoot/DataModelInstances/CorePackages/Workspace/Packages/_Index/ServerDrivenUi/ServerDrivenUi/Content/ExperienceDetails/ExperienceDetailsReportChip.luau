local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local game = require(parent.DataHydration).Game
local sduiSharedContentModule = require(parent.SduiSharedContent)
local roactUtilsModule = require(parent.RoactUtils)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local sharedFlagsModule = require(parent.SharedFlags)
local centralOverlayModule = require(parent.CentralOverlay)
local localizationModule = require(parent.Localization)
local sduiChip = sduiSharedContentModule.SduiChip
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local useLocalization = localizationModule.Hooks.useLocalization
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local fFlagAddThumbnailSelectorReport = sharedFlagsModule.FFlagAddThumbnailSelectorReport

return reactModule.memo(function(p0)
	-- upvalues: useDispatch (ref), useAppPolicy (ref), useLocalization (ref), signalsReactModule (ref), game (ref), reactModule (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), fFlagAddThumbnailSelectorReport (ref), closeCentralOverlay (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p0.layoutOrder
	local universeId = p0.universeId
	local var11 = useDispatch()
	local var12 = useAppPolicy(function(p1)
		return p1.getGameReportingDisabled()
	end)
	local var13 = useLocalization({ report = "Feature.GameDetails.Action.Report" })
	local var14 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local rootPlaceId = var14 and var14.rootPlaceId
	
	return if var12 then nil else reactModule.createElement(sduiChip, {
		text = var13.report,
		leadingIconName = foundationModule.Enums.IconName.Flag,
		onActivated = reactModule.useCallback(function()
			-- upvalues: rootPlaceId (ref), var11 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), fFlagAddThumbnailSelectorReport (copy), universeId (ref), closeCentralOverlay (copy)
			if rootPlaceId then
				var11(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.Place,
					targetId = rootPlaceId,
					custom = if fFlagAddThumbnailSelectorReport then { universeId = universeId } else nil,
					onClose = function()
						-- upvalues: var11 (copy), closeCentralOverlay (copy)
						var11(closeCentralOverlay())
					end
				}))
				
				return
			end
		end, { universeId, rootPlaceId, var11 }),
		layoutOrder = layoutOrder
	})
end)