local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local reactModule = require(parent.React)
local tiltLoadingScreenViewModule = require(script.Parent.TiltLoadingScreenView)
local useTiltLoadingScreenViewModelModule = require(script.Parent.Hooks.useTiltLoadingScreenViewModel)
local useLoadingScreenAnimationModule = require(script.Parent.Hooks.useLoadingScreenAnimation)
local useScreenSizeModule = require(script.Parent.Hooks.useScreenSize)
local useViewportSettledModule = require(script.Parent.Hooks.useViewportSettled)
local fFlagLoadingScreenMilestones = require(parent.SharedFlags).FFlagLoadingScreenMilestones
local _ = require(progressLoading.LoadingScreenMilestones.Types)
local contentId = require(progressLoading.LoadingScreenMilestones.Constants).ContentId
local _ = require(script.Parent.Types)

return reactModule.memo(function(p1)
	-- upvalues: useScreenSizeModule (ref), useTiltLoadingScreenViewModelModule (ref), useViewportSettledModule (ref), fFlagLoadingScreenMilestones (ref), reactModule (ref), contentId (ref), useLoadingScreenAnimationModule (ref), tiltLoadingScreenViewModule (ref)
	local var1 = useScreenSizeModule()
	local var2 = useTiltLoadingScreenViewModelModule(p1.placeId, var1, p1.destinationUniverseId)
	local var3 = useViewportSettledModule(var1)
	local var4 = nil
	local var5 = nil
	
	if fFlagLoadingScreenMilestones then
		local var6, var7 = reactModule.useState(nil)
		var4 = var6
		var5 = var7
	end
	local var8 = fFlagLoadingScreenMilestones and (var3 and not p1.isDismissing)
	local var9 = var2.gameData ~= nil and var2.gameData.name ~= ""
	local var10 = var2.gameData ~= nil and var2.gameData.creator ~= ""
	local var11 = var4 ~= nil and var4 == var2.thumbnailUrl
	local var12 = if fFlagLoadingScreenMilestones then reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), contentId (copy), var9 (ref), var10 (ref), var11 (ref), var8 (ref)
		local milestones = p1.milestones
		
		if (if p2 == contentId.Title then var9 elseif p2 == contentId.Creator then var10 else p2 == contentId.Thumbnail and var11) and var8 and milestones then
			milestones.contentVisible(p2)
		end
	end, {
		var8,
		var9,
		var10,
		var11,
		p1.milestones
	}) else nil
	local var13 = useLoadingScreenAnimationModule({
		reducedMotion = p1.reducedMotion,
		contentReady = var2.gameData ~= nil and var3,
		isDismissing = p1.isDismissing,
		onEnterComplete = p1.onEnterComplete,
		onContentRevealComplete = var12
	})
	
	if fFlagLoadingScreenMilestones then
		reactModule.useEffect(function()
			-- upvalues: var13 (ref), var12 (ref), contentId (copy)
			if var13.title.reveal:getValue() == 1 and var12 then
				var12(contentId.Title)
			end
			if var13.creator.reveal:getValue() == 1 and var12 then
				var12(contentId.Creator)
			end
			if var13.keyart.coverTransparency:getValue() == 1 and var12 then
				var12(contentId.Thumbnail)
			end
		end, { var13, var12 })
	end
	return reactModule.createElement(tiltLoadingScreenViewModule, {
		isMobile = var2.isMobile,
		isDirectionalInput = p1.isDirectionalInput,
		gamepadCancelIcon = p1.gamepadCancelIcon,
		chromeReveal = p1.chromeReveal,
		animation = var13,
		gameData = var2.gameData,
		thumbnailUrl = var2.thumbnailUrl,
		onThumbnailLoaded = if fFlagLoadingScreenMilestones then var5 else nil,
		isAutoTranslated = var2.isAutoTranslated,
		statusPanel = var2.statusPanel,
		onCancel = p1.onCancel,
		safeAreaInsets = p1.safeAreaInsets,
		showContent = var3
	})
end)