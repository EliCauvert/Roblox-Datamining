local Parent = script:FindFirstAncestor("MomentsCommon").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MomentMediaViewModule = require(script.Parent.MomentMediaView)
local _ = require(script.Parent.Parent.MediaTypes)
local UseVideoPosterFrameModule = require(script.Parent.Parent.useVideoPosterFrame)
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius

return function(p1) --[[ Line: 41 | Named "MomentMediaTile" ]]
	-- upvalues: UseVideoPosterFrameModule (copy), ReactModule (copy), MomentMediaViewModule (copy), Skeleton (copy), Radius (copy)
	local MediaItem = p1.mediaItem
	local CornerRadius = MediaItem.cornerRadius
	local IsCaptureTypeMatch = MediaItem.captureType == Enum.CaptureType.Video
	local UseVideoPosterFrameModuleResult = UseVideoPosterFrameModule(if IsCaptureTypeMatch then MediaItem.content else nil)
	local UseVideoPosterFrameModuleResult1 = if IsCaptureTypeMatch then UseVideoPosterFrameModuleResult else MediaItem.posterContent
	
	return if p1.isActive and IsCaptureTypeMatch then ReactModule.createElement(MomentMediaViewModule, {
		suppressTapToToggle = true,
		holdPosterUntilPlaying = true,
		tag = "size-full clip",
		momentId = MediaItem.momentId,
		posterContent = UseVideoPosterFrameModuleResult1,
		cornerRadius = CornerRadius
	}) else ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Shimmer = ReactModule.createElement(Skeleton, {
			ZIndex = 1,
			radius = if CornerRadius then Radius.Large else Radius.None,
			Size = UDim2.fromScale(1, 1)
		}),
		Poster = if UseVideoPosterFrameModuleResult1 == nil then nil else ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ImageContent = UseVideoPosterFrameModuleResult1,
			ScaleType = Enum.ScaleType.Crop
		}, {
			Corner = if CornerRadius == nil then nil else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) })
		})
	})
end