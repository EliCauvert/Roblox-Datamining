local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local ReactModule = require(Parent.React)
local TiltLoadingScreenViewModule = require(script.Parent.TiltLoadingScreenView)
local UseTiltLoadingScreenViewModelModule = require(script.Parent.Hooks.useTiltLoadingScreenViewModel)
local UseLoadingScreenAnimationModule = require(script.Parent.Hooks.useLoadingScreenAnimation)
local UseScreenSizeModule = require(script.Parent.Hooks.useScreenSize)
local UseViewportSettledModule = require(script.Parent.Hooks.useViewportSettled)
local FFlagLoadingScreenMilestones = require(Parent.SharedFlags).FFlagLoadingScreenMilestones
local _ = require(ProgressLoading.LoadingScreenMilestones.Types)
local ContentId = require(ProgressLoading.LoadingScreenMilestones.Constants).ContentId
local _ = require(script.Parent.Types)

return ReactModule.memo(function(p1) --[[ Line: 21 | Named "TiltLoadingScreenContent" ]]
	-- upvalues: UseScreenSizeModule (copy), UseTiltLoadingScreenViewModelModule (copy), UseViewportSettledModule (copy), FFlagLoadingScreenMilestones (copy), ReactModule (copy), ContentId (copy), UseLoadingScreenAnimationModule (copy), TiltLoadingScreenViewModule (copy)
	local UseScreenSizeModuleResult = UseScreenSizeModule()
	local UseTiltLoadingScreenViewModelModuleResult = UseTiltLoadingScreenViewModelModule(p1.placeId, UseScreenSizeModuleResult, p1.destinationUniverseId)
	local UseViewportSettledModuleResult = UseViewportSettledModule(UseScreenSizeModuleResult)
	local ThumbnailUrl = nil
	local v1 = nil
	
	if FFlagLoadingScreenMilestones then
		ThumbnailUrl, v16 = ReactModule.useState(nil)
	end
	local NoIsDismissing: boolean = FFlagLoadingScreenMilestones and (UseViewportSettledModuleResult and not p1.isDismissing)
	local IsNotNameMatch: boolean = UseTiltLoadingScreenViewModelModuleResult.gameData ~= nil and UseTiltLoadingScreenViewModelModuleResult.gameData.name ~= ""
	local IsNotCreatorMatch: boolean = UseTiltLoadingScreenViewModelModuleResult.gameData ~= nil and UseTiltLoadingScreenViewModelModuleResult.gameData.creator ~= ""
	local IsThumbnailUrlMatch: boolean = ThumbnailUrl ~= nil and ThumbnailUrl == UseTiltLoadingScreenViewModelModuleResult.thumbnailUrl
	local UseResult = if FFlagLoadingScreenMilestones then ReactModule.useCallback(function(Creator) --[[ Line: 34 ]]
		-- upvalues: p1 (copy), ContentId (upval), IsNotNameMatch (copy), IsNotCreatorMatch (copy), IsThumbnailUrlMatch (copy), NoIsDismissing (copy)
		local Milestones = p1.milestones
		
		if (Creator == ContentId.Title and IsNotNameMatch or (Creator == ContentId.Creator and IsNotCreatorMatch or Creator == ContentId.Thumbnail and IsThumbnailUrlMatch)) and NoIsDismissing and Milestones then
			Milestones.contentVisible(Creator)
		end
	end, {
		NoIsDismissing,
		IsNotNameMatch,
		IsNotCreatorMatch,
		IsThumbnailUrlMatch,
		p1.milestones
	}) else nil
	local UseLoadingScreenAnimationModuleResult = UseLoadingScreenAnimationModule({
		reducedMotion = p1.reducedMotion,
		contentReady = UseTiltLoadingScreenViewModelModuleResult.gameData ~= nil and UseViewportSettledModuleResult,
		isDismissing = p1.isDismissing,
		onEnterComplete = p1.onEnterComplete,
		onContentRevealComplete = UseResult
	})
	
	if FFlagLoadingScreenMilestones then
		ReactModule.useEffect(function() --[[ Line: 53 ]]
			-- upvalues: UseLoadingScreenAnimationModuleResult (copy), UseResult (copy), ContentId (upval)
			if UseLoadingScreenAnimationModuleResult.title.reveal:getValue() == 1 and UseResult then
				UseResult(ContentId.Title)
			end
			if UseLoadingScreenAnimationModuleResult.creator.reveal:getValue() == 1 and UseResult then
				UseResult(ContentId.Creator)
			end
			if UseLoadingScreenAnimationModuleResult.keyart.coverTransparency:getValue() == 1 and UseResult then
				UseResult(ContentId.Thumbnail)
			end
		end, { UseLoadingScreenAnimationModuleResult, UseResult })
	end
	return ReactModule.createElement(TiltLoadingScreenViewModule, {
		isMobile = UseTiltLoadingScreenViewModelModuleResult.isMobile,
		isDirectionalInput = p1.isDirectionalInput,
		gamepadCancelIcon = p1.gamepadCancelIcon,
		chromeReveal = p1.chromeReveal,
		animation = UseLoadingScreenAnimationModuleResult,
		gameData = UseTiltLoadingScreenViewModelModuleResult.gameData,
		thumbnailUrl = UseTiltLoadingScreenViewModelModuleResult.thumbnailUrl,
		onThumbnailLoaded = if FFlagLoadingScreenMilestones then v1 else nil,
		isAutoTranslated = UseTiltLoadingScreenViewModelModuleResult.isAutoTranslated,
		statusPanel = UseTiltLoadingScreenViewModelModuleResult.statusPanel,
		onCancel = p1.onCancel,
		safeAreaInsets = p1.safeAreaInsets,
		showContent = UseViewportSettledModuleResult
	})
end)