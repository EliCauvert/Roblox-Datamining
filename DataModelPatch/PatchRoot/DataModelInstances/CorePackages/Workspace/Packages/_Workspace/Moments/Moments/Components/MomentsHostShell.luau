local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local MomentsSessionContextModule = require(Moments.Stores.GetMomentsStore.MomentsSessionContext)
local MomentsHostContextModule = require(Moments.MomentsHostContext)
local _ = require(Moments.Stores.GetMomentsStore.createMomentsStore)
local ExperienceDetailsSheet = require(Moments.ExperienceDetailsSheet).ExperienceDetailsSheet
local ToastOverlayModule = require(Moments.Components.ToastOverlay)

return function(p1)
	-- upvalues: ReactModule (copy), MomentsSessionContextModule (copy), MomentsHostContextModule (copy), ExperienceDetailsSheet (copy), ToastOverlayModule (copy)
	return ReactModule.createElement(MomentsSessionContextModule.MomentsSessionContext.Provider, { value = p1.sessionStore }, {
		Host = ReactModule.createElement(MomentsHostContextModule.MomentsHostContext.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: p1 (copy)
				return {
					openProfile = p1.openProfile,
					openOwnMoments = p1.openOwnMoments
				}
			end, { p1.openProfile, p1.openOwnMoments })
		}, {
			Content = ReactModule.createElement(ReactModule.Fragment, nil, p1.children, ReactModule.createElement(ExperienceDetailsSheet), ReactModule.createElement(ToastOverlayModule))
		})
	})
end