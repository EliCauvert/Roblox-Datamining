local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local Image = FoundationModule.Image
local View = FoundationModule.View
local LoadableVideoModule = require(ProfilePlatform.Components.Videos.LoadableVideo)
local TimeDurationOverlayModule = require(ProfilePlatform.Components.Videos.TimeDurationOverlay)

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), StateLayerAffordance (copy), LoadableVideoModule (copy), Image (copy), TimeDurationOverlayModule (copy)
	return ReactModule.createElement(View, {
		tag = "shrink size-full",
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			if p1.onExpandCallback then
				p1.onExpandCallback()
			end
		end, { p1.onExpandCallback }),
		stateLayer = { affordance = StateLayerAffordance.None },
		ZIndex = p1.ZIndex
	}, {
		VideoPreview = if ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			return p1.Video or not p1.thumbnailImage
		end, { p1.Video, p1.thumbnailImage }) then ReactModule.createElement(LoadableVideoModule, {
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
		ThumbnailImage = if p1.thumbnailImage and not p1.Playing then ReactModule.createElement(Image, {
			ZIndex = 2,
			cornerRadius = if p1.cornerRadius then UDim.new(0, p1.cornerRadius) else nil,
			Image = p1.thumbnailImage,
			Size = UDim2.fromScale(1, 1)
		}) else nil,
		TimeDurationOverlay = if p1.Playing or p1.isFullScreen or not p1.timeLength or p1.timeLength <= 0 then nil else ReactModule.createElement(TimeDurationOverlayModule, { timeLength = p1.timeLength })
	})
end