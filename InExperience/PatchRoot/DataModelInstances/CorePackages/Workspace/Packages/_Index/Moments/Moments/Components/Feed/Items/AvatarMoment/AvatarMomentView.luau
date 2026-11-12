local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local MomentItemModule = require(Moments.Components.Feed.Items.Moment.MomentItem)
local _ = require(Moments.Components.Feed.Items.Moment.MomentContext)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local _ = require(Parent.MomentsTypes)

return function(p1)
	-- upvalues: ReactModule (copy), MomentsCommonModule (copy), GetMomentsPreferencesStoreModule (copy), FoundationModule (copy), MomentItemModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full",
		backgroundStyle = { Transparency = 1 }
	}, {
		Moment = ReactModule.createElement(MomentItemModule, {
			isStaticMedia = true,
			isWorkspaceRendered = true,
			data = p1.data,
			moment = p1.moment,
			mediaSurface = ReactModule.createElement(MomentsCommonModule.Media.MomentMediaView, {
				suppressTapToToggle = true,
				momentId = p1.moment.momentId,
				getScaleType = GetMomentsPreferencesStoreModule(false).getMediaScaleType
			})
		})
	})
end