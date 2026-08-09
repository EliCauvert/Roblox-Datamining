local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local momentsSessionContextModule = require(moments.Stores.GetMomentsStore.MomentsSessionContext)
local momentsHostContextModule = require(moments.MomentsHostContext)
local _ = require(moments.Stores.GetMomentsStore.createMomentsStore)
local experienceDetailsSheet = require(moments.ExperienceDetailsSheet).ExperienceDetailsSheet
local toastOverlayModule = require(moments.Components.ToastOverlay)

return function(p0) --[[ line: 45 | named "MomentsHostShell" ]]
	-- upvalues: reactModule (ref), momentsSessionContextModule (ref), momentsHostContextModule (ref), experienceDetailsSheet (ref), toastOverlayModule (ref)
	return reactModule.createElement(momentsSessionContextModule.MomentsSessionContext.Provider, { value = p0.sessionStore }, {
		Host = reactModule.createElement(momentsHostContextModule.MomentsHostContext.Provider, {
			value = reactModule.useMemo(function() --[[ line: 46 ]]
				-- upvalues: p0 (ref)
				return {
					openProfile = p0.openProfile,
					openOwnMoments = p0.openOwnMoments
				}
			end, { p0.openProfile, p0.openOwnMoments })
		}, {
			Content = reactModule.createElement(reactModule.Fragment, nil, p0.children, reactModule.createElement(experienceDetailsSheet), reactModule.createElement(toastOverlayModule))
		})
	})
end