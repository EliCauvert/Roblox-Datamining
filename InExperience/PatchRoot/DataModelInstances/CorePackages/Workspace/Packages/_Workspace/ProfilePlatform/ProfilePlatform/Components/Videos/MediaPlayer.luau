local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local image = foundationModule.Image
local view = foundationModule.View
local loadableVideoModule = require(profilePlatform.Components.Videos.LoadableVideo)
local timeDurationOverlayModule = require(profilePlatform.Components.Videos.TimeDurationOverlay)

return function(p1)
	-- upvalues: reactModule (ref), view (ref), stateLayerAffordance (ref), loadableVideoModule (ref), image (ref), timeDurationOverlayModule (ref)
	return reactModule.createElement(view, {
		tag = "shrink size-full",
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			if p1.onExpandCallback then
				p1.onExpandCallback()
			end
		end, { p1.onExpandCallback }),
		stateLayer = { affordance = stateLayerAffordance.None },
		ZIndex = p1.ZIndex
	}, {
		VideoPreview = if reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return p1.Video or not p1.thumbnailImage
		end, { p1.Video, p1.thumbnailImage }) then reactModule.createElement(loadableVideoModule, {
			cornerRadius = p1.cornerRadius,
			Looped = p1.Looped,
			onLoaded = p1.onVideoLoaded,
			Playing = p1.Playing,
			Position = p1.Position,
			renderOnFailed = p1.renderOnFailed,
			scaleType = p1.scaleType,
			Size = p1.Size,
			Video = p1.Video,
			videoRef = p1.videoRef
		}) else nil,
		ThumbnailImage = if p1.thumbnailImage and not p1.Playing then reactModule.createElement(image, {
			ZIndex = 2,
			cornerRadius = if p1.cornerRadius then UDim.new(0, p1.cornerRadius) else nil,
			Image = p1.thumbnailImage,
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		TimeDurationOverlay = if p1.Playing or p1.isFullScreen or (not p1.timeLength or p1.timeLength <= 0) then nil else reactModule.createElement(timeDurationOverlayModule, { timeLength = p1.timeLength })
	})
end