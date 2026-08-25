local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local momentsSessionContextModule = require(moments.Stores.GetMomentsStore.MomentsSessionContext)
local momentsHostContextModule = require(moments.MomentsHostContext)
local _ = require(moments.Stores.GetMomentsStore.createMomentsStore)
local experienceDetailsSheet = require(moments.ExperienceDetailsSheet).ExperienceDetailsSheet
local toastOverlayModule = require(moments.Components.ToastOverlay)

return function(p0)
	-- upvalues: reactModule (ref), momentsSessionContextModule (ref), momentsHostContextModule (ref), experienceDetailsSheet (ref), toastOverlayModule (ref)
	return reactModule.createElement(momentsSessionContextModule.MomentsSessionContext.Provider, { value = p0.sessionStore }, {
		Host = reactModule.createElement(momentsHostContextModule.MomentsHostContext.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: p0 (ref)
				return {
					openProfile = p0.openProfile,
					openOwnMoments = p0.openOwnMoments,
					openMomentsFeedReport = p0.openMomentsFeedReport
				}
			end, {
				p0.openProfile,
				p0.openOwnMoments,
				p0.openMomentsFeedReport
			})
		}, {
			Content = reactModule.createElement(reactModule.Fragment, nil, p0.children, reactModule.createElement(experienceDetailsSheet), reactModule.createElement(toastOverlayModule))
		})
	})
end