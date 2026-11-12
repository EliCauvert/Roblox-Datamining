local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local FFlagProfileRenderAvatarMoments = require(Parent.SharedFlags).FFlagProfileRenderAvatarMoments
local FFlagMomentsAvatarSceneStageModule = require(Moments.Flags.FFlagMomentsAvatarSceneStage)
local MomentItemModule = require(Moments.Components.Feed.Items.Moment.MomentItem)
local _ = require(Moments.Components.Feed.Items.Moment.MomentContext)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local _ = require(Parent.MomentsTypes)

return function(p1)
	-- upvalues: ReactModule (copy), MomentsCommonModule (copy), GetMomentsPreferencesStoreModule (copy), FFlagMomentsAvatarSceneStageModule (copy), FoundationModule (copy), FFlagProfileRenderAvatarMoments (copy), MomentItemModule (copy)
	local Element = ReactModule.createElement(MomentsCommonModule.Media.MomentMediaView, {
		suppressTapToToggle = true,
		momentId = p1.moment.momentId,
		getScaleType = GetMomentsPreferencesStoreModule(false).getMediaScaleType
	})
	
	if FFlagMomentsAvatarSceneStageModule and p1.viewportFrameRef ~= nil then
		Element = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full",
			backgroundStyle = { Transparency = 1 }
		}, {
			SceneViewport = ReactModule.createElement("ViewportFrame", {
				BackgroundTransparency = 1,
				ZIndex = 0,
				Size = UDim2.fromScale(1, 1),
				ref = p1.viewportFrameRef
			}, {
				WorldModel = ReactModule.createElement("WorldModel", { ref = p1.worldModelRef })
			}),
			Media = Element
		})
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full",
		backgroundStyle = { Transparency = 1 },
		ref = if FFlagProfileRenderAvatarMoments or FFlagMomentsAvatarSceneStageModule then p1.pageRef else nil
	}, {
		Moment = ReactModule.createElement(MomentItemModule, {
			isStaticMedia = true,
			isWorkspaceRendered = true,
			data = p1.data,
			moment = p1.moment,
			mediaSurface = Element
		})
	})
end