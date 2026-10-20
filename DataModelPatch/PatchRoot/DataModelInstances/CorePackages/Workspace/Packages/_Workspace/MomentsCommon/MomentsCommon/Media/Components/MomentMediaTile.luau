local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local MomentMediaViewModule = require(script.Parent.MomentMediaView)
local _ = require(script.Parent.Parent.MediaTypes)
local UseVideoPosterFrameModule = require(script.Parent.Parent.useVideoPosterFrame)

return function(p1)
	-- upvalues: UseVideoPosterFrameModule (copy), ReactModule (copy), MomentMediaViewModule (copy)
	local MediaItem = p1.mediaItem
	local CornerRadius = MediaItem.cornerRadius
	local IsCaptureTypeMatch = MediaItem.captureType == Enum.CaptureType.Video
	local UseVideoPosterFrameModuleResult = UseVideoPosterFrameModule(if IsCaptureTypeMatch then MediaItem.content else nil) or MediaItem.posterContent
	
	return if p1.isActive and IsCaptureTypeMatch then ReactModule.createElement(MomentMediaViewModule, {
		suppressTapToToggle = true,
		holdPosterUntilPlaying = true,
		tag = "size-full clip",
		momentId = MediaItem.momentId,
		posterContent = UseVideoPosterFrameModuleResult,
		cornerRadius = CornerRadius
	}) else ReactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ImageContent = UseVideoPosterFrameModuleResult,
		ScaleType = Enum.ScaleType.Crop
	}, {
		Corner = if CornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) })
	})
end