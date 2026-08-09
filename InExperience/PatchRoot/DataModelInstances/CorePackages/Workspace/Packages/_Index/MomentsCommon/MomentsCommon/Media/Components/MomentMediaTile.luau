local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local momentMediaViewModule = require(script.Parent.MomentMediaView)
local _ = require(script.Parent.Parent.MediaTypes)
local useVideoPosterFrameModule = require(script.Parent.Parent.useVideoPosterFrame)

return function(p0) --[[ line: 23 | named "MomentMediaTile" ]]
	-- upvalues: useVideoPosterFrameModule (ref), reactModule (ref), momentMediaViewModule (ref)
	local mediaItem = p0.mediaItem
	local cornerRadius = mediaItem.cornerRadius
	local var3 = mediaItem.captureType == Enum.CaptureType.Video
	local var4 = useVideoPosterFrameModule(if var3 then mediaItem.content else nil) or mediaItem.posterContent
	
	return if p0.isActive and var3 then reactModule.createElement(momentMediaViewModule, {
		suppressTapToToggle = true,
		holdPosterUntilPlaying = true,
		tag = "size-full clip",
		momentId = mediaItem.momentId,
		posterContent = var4,
		cornerRadius = cornerRadius
	}) else reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ImageContent = var4,
		ScaleType = Enum.ScaleType.Crop
	}, {
		Corner = if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
	})
end