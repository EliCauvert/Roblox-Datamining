local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local momentsSessionContextModule = require(moments.Stores.GetMomentsStore.MomentsSessionContext)
local momentsHostContextModule = require(moments.MomentsHostContext)
local _ = require(moments.Stores.GetMomentsStore.createMomentsStore)
local experienceDetailsSheet = require(moments.ExperienceDetailsSheet).ExperienceDetailsSheet
local toastOverlayModule = require(moments.Components.ToastOverlay)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagMomentsAvatarLookTryOn = sharedFlagsModule.FFlagMomentsAvatarLookTryOn
local var1 = if fFlagMomentsComments then require(moments.Components.Comments.Sheet) else nil

return function(p1)
	-- upvalues: reactModule (ref), fFlagMomentsAvatarLookTryOn (ref), momentsSessionContextModule (ref), momentsHostContextModule (ref), experienceDetailsSheet (ref), fFlagMomentsComments (ref), var1 (ref), toastOverlayModule (ref)
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
			Content = reactModule.createElement(reactModule.Fragment, nil, p1.children, reactModule.createElement(experienceDetailsSheet), if fFlagMomentsComments and var1 ~= nil then reactModule.createElement(var1.CommentsSheetContainer) else nil, reactModule.createElement(toastOverlayModule))
		})
	})
end