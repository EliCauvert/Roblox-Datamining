local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local MomentsSessionContextModule = require(Moments.Stores.GetMomentsStore.MomentsSessionContext)
local MomentsHostContextModule = require(Moments.MomentsHostContext)
local _ = require(Moments.Stores.GetMomentsStore.createMomentsStore)
local ExperienceDetailsSheet = require(Moments.ExperienceDetailsSheet).ExperienceDetailsSheet
local GetExperienceDetailsSheetStoreModule = require(Moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local ToastOverlayModule = require(Moments.Components.ToastOverlay)

local function getPostStatusCardContainer()
	-- upvalues: Moments (copy)
	return require(Moments.Components.PostFeedback.PostStatusCard.PostStatusCardContainer)
end

local UseIsTopMomentsShellModule = require(Moments.Hooks.useIsTopMomentsShell)
local FFlagMomentsCreateAvatarPosts = SharedFlagsModule.FFlagMomentsCreateAvatarPosts
local FFlagMomentsOverlaysInTopShellOnlyModule = require(Moments.Flags.FFlagMomentsOverlaysInTopShellOnly)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsAvatarLookTryOn = SharedFlagsModule.FFlagMomentsAvatarLookTryOn
local FFlagProfileRenderAvatarMoments = SharedFlagsModule.FFlagProfileRenderAvatarMoments
local FFlagMomentsPostFeedback = SharedFlagsModule.FFlagMomentsPostFeedback
local SheetModule = if FFlagMomentsComments then require(Moments.Components.Comments.Sheet) else nil
local FFlagMomentsCreatorAnalyticsModule = require(Moments.Flags.FFlagMomentsCreatorAnalytics)
local PostInsightsModule = if FFlagMomentsCreatorAnalyticsModule then require(Moments.Components.PostInsights) else nil

local function closeSheets(p1)
	-- upvalues: GetExperienceDetailsSheetStoreModule (copy), SheetModule (copy), PostInsightsModule (copy)
	GetExperienceDetailsSheetStoreModule(false).close()
	
	if SheetModule ~= nil then
		local CommentsSheetStore = SheetModule.getCommentsSheetStore(false)
		
		if CommentsSheetStore.getIsOpen(false) then
			CommentsSheetStore.close(if p1 == "popped" then "unmounted" else "navigation_hidden")
		end
	end
	if PostInsightsModule ~= nil then
		PostInsightsModule.getPostInsightsPageStore(false).close()
	end
end

local function ignoreTopShellChange(_) end

return function(p1)
	-- upvalues: FFlagMomentsOverlaysInTopShellOnlyModule (copy), FFlagProfileRenderAvatarMoments (copy), UseIsTopMomentsShellModule (copy), closeSheets (copy), ignoreTopShellChange (copy), ReactModule (copy), FFlagMomentsCreateAvatarPosts (copy), FFlagMomentsAvatarLookTryOn (copy), MomentsSessionContextModule (copy), MomentsHostContextModule (copy), ExperienceDetailsSheet (copy), FFlagMomentsComments (copy), SheetModule (copy), FFlagMomentsCreatorAnalyticsModule (copy), PostInsightsModule (copy), FFlagMomentsPostFeedback (copy), getPostStatusCardContainer (copy), ToastOverlayModule (copy)
	local NoFFlagProfileRenderAvatarMoments = not FFlagMomentsOverlaysInTopShellOnlyModule and not FFlagProfileRenderAvatarMoments or UseIsTopMomentsShellModule(if FFlagMomentsOverlaysInTopShellOnlyModule then closeSheets else ignoreTopShellChange)
	local NoFFlagMomentsOverlaysInTopShellOnlyModule = not FFlagMomentsOverlaysInTopShellOnlyModule or NoFFlagProfileRenderAvatarMoments
	
	return ReactModule.createElement(MomentsSessionContextModule.MomentsSessionContext.Provider, { value = p1.sessionStore }, {
		Host = ReactModule.createElement(MomentsHostContextModule.MomentsHostContext.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: FFlagProfileRenderAvatarMoments (upval), NoFFlagProfileRenderAvatarMoments (ref), p1 (copy), FFlagMomentsCreateAvatarPosts (upval), FFlagMomentsAvatarLookTryOn (upval)
				return {
					isTopShell = if FFlagProfileRenderAvatarMoments then NoFFlagProfileRenderAvatarMoments else nil,
					openProfile = p1.openProfile,
					openOwnMoments = p1.openOwnMoments,
					openAvatarMomentsCreation = if FFlagMomentsCreateAvatarPosts then p1.openAvatarMomentsCreation else nil,
					openMomentsFeedReport = p1.openMomentsFeedReport,
					openAvatarLookTryOn = if FFlagMomentsAvatarLookTryOn then p1.openAvatarLookTryOn else nil,
					openMomentCommentReport = p1.openMomentCommentReport,
					openBlockUser = p1.openBlockUser
				}
			end, {
				if FFlagProfileRenderAvatarMoments then NoFFlagProfileRenderAvatarMoments else nil,
				p1.openProfile, p1.openOwnMoments,
				if FFlagMomentsCreateAvatarPosts then p1.openAvatarMomentsCreation else nil,
				p1.openMomentsFeedReport, p1.openMomentCommentReport, p1.openBlockUser,
				if FFlagMomentsAvatarLookTryOn then p1.openAvatarLookTryOn else nil
			})
		}, {
			Content = ReactModule.createElement(ReactModule.Fragment, nil, p1.children, if NoFFlagMomentsOverlaysInTopShellOnlyModule then ReactModule.createElement(ExperienceDetailsSheet) else nil, if FFlagMomentsComments and SheetModule ~= nil and NoFFlagMomentsOverlaysInTopShellOnlyModule then ReactModule.createElement(SheetModule.CommentsSheetContainer) else nil, if FFlagMomentsCreatorAnalyticsModule and PostInsightsModule ~= nil and NoFFlagMomentsOverlaysInTopShellOnlyModule then ReactModule.createElement(PostInsightsModule.PostInsightsPageContainer) else nil, if FFlagMomentsPostFeedback and NoFFlagMomentsOverlaysInTopShellOnlyModule then ReactModule.createElement(getPostStatusCardContainer()) else nil, if NoFFlagMomentsOverlaysInTopShellOnlyModule then ReactModule.createElement(ToastOverlayModule) else nil)
		})
	})
end