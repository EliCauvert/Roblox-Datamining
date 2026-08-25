local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local image = foundationModule.Image
local view = foundationModule.View
local loadableVideoModule = require(profilePlatform.Components.Videos.LoadableVideo)
local timeDurationOverlayModule = require(profilePlatform.Components.Videos.TimeDurationOverlay)

return function(p0)
	-- upvalues: reactModule (ref), view (ref), stateLayerAffordance (ref), loadableVideoModule (ref), image (ref), timeDurationOverlayModule (ref)
	return reactModule.createElement(view, {
		tag = "shrink size-full",
		onActivated = reactModule.useCallback(function()
			-- upvalues: p0 (ref)
			if p0.onExpandCallback then
				p0.onExpandCallback()
			end
		end, { p0.onExpandCallback }),
		stateLayer = { affordance = stateLayerAffordance.None },
		ZIndex = p0.ZIndex
	}, {
		VideoPreview = if reactModule.useMemo(function()
			-- upvalues: p0 (ref)
			return p0.Video or not p0.thumbnailImage
		end, { p0.Video, p0.thumbnailImage }) then reactModule.createElement(loadableVideoModule, {
			cornerRadius = p0.cornerRadius,
			Looped = p0.Looped,
			onLoaded = p0.onVideoLoaded,
			Playing = p0.Playing,
			Position = p0.Position,
			renderOnFailed = p0.renderOnFailed,
			scaleType = p0.scaleType,
			Size = p0.Size,
			Video = p0.Video,
			videoRef = p0.videoRef
		}) else nil,
		ThumbnailImage = if p0.thumbnailImage and not p0.Playing then reactModule.createElement(image, {
			ZIndex = 2,
			cornerRadius = if p0.cornerRadius then UDim.new(0, p0.cornerRadius) else nil,
			Image = p0.thumbnailImage,
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		TimeDurationOverlay = if p0.Playing or p0.isFullScreen or (not p0.timeLength or p0.timeLength <= 0) then nil else reactModule.createElement(timeDurationOverlayModule, { timeLength = p0.timeLength })
	})
end