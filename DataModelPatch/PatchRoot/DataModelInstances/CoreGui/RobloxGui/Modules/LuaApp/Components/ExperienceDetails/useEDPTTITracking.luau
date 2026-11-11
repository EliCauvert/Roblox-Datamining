local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local UseTTIRenderAndMountedTracking = if TimeToInteractiveTracker.Hooks then TimeToInteractiveTracker.Hooks.useTTIRenderAndMountedTracking else nil
local FetchGamePlayButtonData = require(CorePackages.Workspace.Packages.GamePlayButton).FetchGamePlayButtonData
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GameDetailTelemetryModule = require(CorePackages.Workspace.Packages.GameDetailTelemetry)
local EDPTTIManager = GameDetailTelemetryModule.EDPTTIManager
local UseAssetFetchStatusFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useAssetFetchStatus
local MediaCarouselImageStatus = require(script.Parent.useFirstMediaCarouselImageUri).MediaCarouselImageStatus
local EDPTTIEVENTNAME = GameDetailTelemetryModule.EDPTTIConstants.EDP_TTI_EVENT_NAME

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), EDPTTIManager (copy), UseTTIRenderAndMountedTracking (copy), EDPTTIEVENTNAME (copy), UseSelectorFunction (copy), FetchGamePlayButtonData (copy), MediaCarouselImageStatus (copy), UseAssetFetchStatusFunction (copy)
	local UseRefResult = ReactModule.useRef(false)
	
	if not UseRefResult.current then
		UseRefResult.current = true
		EDPTTIManager.startTracking("Untracked")
		EDPTTIManager.setImplementation(p1)
	end
	if UseTTIRenderAndMountedTracking then
		UseTTIRenderAndMountedTracking(EDPTTIEVENTNAME)
	end
	local UseSelectorResult = UseSelectorFunction(function(p4)
		-- upvalues: p2 (copy), FetchGamePlayButtonData (upval)
		return not p2 or FetchGamePlayButtonData.IsLoading(p4, p2)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), p2 (copy), EDPTTIManager (upval)
		if not UseSelectorResult and p2 then
			EDPTTIManager.trackFunctionallyReady()
		end
	end, { UseSelectorResult, p2 })
	local IsStatusMatch = p3.status == MediaCarouselImageStatus.NotFound
	local IsUseAssetFetchStatusResultMatch: boolean = UseAssetFetchStatusFunction(p3.url) == Enum.AssetFetchStatus.Success or IsStatusMatch
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), IsUseAssetFetchStatusResultMatch (copy), p2 (copy), EDPTTIManager (upval), IsStatusMatch (copy)
		if not UseSelectorResult and IsUseAssetFetchStatusResultMatch and p2 then
			EDPTTIManager.trackSurfaceReady({ mediaImageFound = not IsStatusMatch })
		end
	end, {
		UseSelectorResult,
		IsUseAssetFetchStatusResultMatch,
		IsStatusMatch,
		p2
	})
end