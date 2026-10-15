local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local momentsSessionContextModule = require(moments.Stores.GetMomentsStore.MomentsSessionContext)
local momentsHostContextModule = require(moments.MomentsHostContext)
local _ = require(moments.Stores.GetMomentsStore.createMomentsStore)
local experienceDetailsSheet = require(moments.ExperienceDetailsSheet).ExperienceDetailsSheet
local getExperienceDetailsSheetStoreModule = require(moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local toastOverlayModule = require(moments.Components.ToastOverlay)
local useIsTopMomentsShellModule = require(moments.Hooks.useIsTopMomentsShell)
local fFlagMomentsOverlaysInTopShellOnlyModule = require(moments.Flags.FFlagMomentsOverlaysInTopShellOnly)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagMomentsAvatarLookTryOn = sharedFlagsModule.FFlagMomentsAvatarLookTryOn
local var1 = if fFlagMomentsComments then require(moments.Components.Comments.Sheet) else nil

local function closeSheets(p1)
	-- upvalues: getExperienceDetailsSheetStoreModule (ref), var1 (ref)
	getExperienceDetailsSheetStoreModule(false).close()
	
	if var1 ~= nil then
		local commentsSheetStore = var1.getCommentsSheetStore(false)
		
		if commentsSheetStore.getIsOpen(false) then
			commentsSheetStore.close(if p1 == "popped" then "unmounted" else "navigation_hidden")
		end
	end
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagMomentsAvatarLookTryOn (ref), fFlagMomentsOverlaysInTopShellOnlyModule (ref), useIsTopMomentsShellModule (ref), closeSheets (ref), momentsSessionContextModule (ref), momentsHostContextModule (ref), experienceDetailsSheet (ref), fFlagMomentsComments (ref), var1 (ref), toastOverlayModule (ref)
	local var2 = if fFlagMomentsOverlaysInTopShellOnlyModule then useIsTopMomentsShellModule(closeSheets) else true
	
	return reactModule.createElement(momentsSessionContextModule.MomentsSessionContext.Provider, { value = p1.sessionStore }, {
		Host = reactModule.createElement(momentsHostContextModule.MomentsHostContext.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: p1 (ref), fFlagMomentsAvatarLookTryOn (copy)
				return {
					openProfile = p1.openProfile,
					openOwnMoments = p1.openOwnMoments,
					openMomentsFeedReport = p1.openMomentsFeedReport,
					openAvatarLookTryOn = if fFlagMomentsAvatarLookTryOn then p1.openAvatarLookTryOn else nil,
					openMomentCommentReport = p1.openMomentCommentReport,
					openBlockUser = p1.openBlockUser
				}
			end, {
				p1.openProfile, p1.openOwnMoments, p1.openMomentsFeedReport,
				p1.openMomentCommentReport, p1.openBlockUser,
				if fFlagMomentsAvatarLookTryOn then p1.openAvatarLookTryOn else nil
			})
		}, {
			Content = reactModule.createElement(reactModule.Fragment, nil, p1.children, if var2 then reactModule.createElement(experienceDetailsSheet) else nil, if fFlagMomentsComments and var1 ~= nil and var2 then reactModule.createElement(var1.CommentsSheetContainer) else nil, if var2 then reactModule.createElement(toastOverlayModule) else nil)
		})
	})
end