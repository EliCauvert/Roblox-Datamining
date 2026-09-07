local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local momentsSessionContextModule = require(moments.Stores.GetMomentsStore.MomentsSessionContext)
local momentsHostContextModule = require(moments.MomentsHostContext)
local _ = require(moments.Stores.GetMomentsStore.createMomentsStore)
local experienceDetailsSheet = require(moments.ExperienceDetailsSheet).ExperienceDetailsSheet
local toastOverlayModule = require(moments.Components.ToastOverlay)

return function(p1)
	-- upvalues: reactModule (ref), momentsSessionContextModule (ref), momentsHostContextModule (ref), experienceDetailsSheet (ref), toastOverlayModule (ref)
	return reactModule.createElement(momentsSessionContextModule.MomentsSessionContext.Provider, { value = p1.sessionStore }, {
		Host = reactModule.createElement(momentsHostContextModule.MomentsHostContext.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: p1 (ref)
				return {
					openProfile = p1.openProfile,
					openOwnMoments = p1.openOwnMoments,
					openMomentsFeedReport = p1.openMomentsFeedReport
				}
			end, {
				p1.openProfile,
				p1.openOwnMoments,
				p1.openMomentsFeedReport
			})
		}, {
			Content = reactModule.createElement(reactModule.Fragment, nil, p1.children, reactModule.createElement(experienceDetailsSheet), reactModule.createElement(toastOverlayModule))
		})
	})
end