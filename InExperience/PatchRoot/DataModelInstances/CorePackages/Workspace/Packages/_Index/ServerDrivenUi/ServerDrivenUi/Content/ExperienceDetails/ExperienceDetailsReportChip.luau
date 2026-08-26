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

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), useAppPolicy (ref), useLocalization (ref), signalsReactModule (ref), game (ref), reactModule (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), fFlagAddThumbnailSelectorReport (ref), closeCentralOverlay (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local var1 = useDispatch()
	local var2 = useAppPolicy(function(p2)
		return p2.getGameReportingDisabled()
	end)
	local var3 = useLocalization({ report = "Feature.GameDetails.Action.Report" })
	local var4 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local rootPlaceId = var4 and var4.rootPlaceId
	
	return if var2 then nil else reactModule.createElement(sduiChip, {
		text = var3.report,
		leadingIconName = foundationModule.Enums.IconName.Flag,
		onActivated = reactModule.useCallback(function()
			-- upvalues: rootPlaceId (ref), var1 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), fFlagAddThumbnailSelectorReport (copy), universeId (ref), closeCentralOverlay (copy)
			if rootPlaceId then
				var1(openDynamicAbuseReportModule({
					abuseVector = abuseVectorModule.Place,
					targetId = rootPlaceId,
					custom = if fFlagAddThumbnailSelectorReport then { universeId = universeId } else nil,
					onClose = function()
						-- upvalues: var1 (copy), closeCentralOverlay (copy)
						var1(closeCentralOverlay())
					end
				}))
				
				return
			end
		end, { universeId, rootPlaceId, var1 }),
		layoutOrder = layoutOrder
	})
end)