local parent = script:FindFirstAncestor("MomentsCommon").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local momentMediaViewModule = require(script.Parent.MomentMediaView)
local _ = require(script.Parent.Parent.MediaTypes)
local useVideoPosterFrameModule = require(script.Parent.Parent.useVideoPosterFrame)
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius

return function(p1)
	-- upvalues: useVideoPosterFrameModule (ref), reactModule (ref), momentMediaViewModule (ref), skeleton (ref), radius (ref)
	local mediaItem = p1.mediaItem
	local cornerRadius = mediaItem.cornerRadius
	local var1 = mediaItem.captureType == Enum.CaptureType.Video
	local var2 = if var1 then useVideoPosterFrameModule(if var1 then mediaItem.content else nil) else mediaItem.posterContent
	
	return if p1.isActive and var1 then reactModule.createElement(momentMediaViewModule, {
		suppressTapToToggle = true,
		holdPosterUntilPlaying = true,
		tag = "size-full clip",
		momentId = mediaItem.momentId,
		posterContent = var2,
		cornerRadius = cornerRadius
	}) else reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Shimmer = reactModule.createElement(skeleton, {
			ZIndex = 1,
			radius = if cornerRadius then radius.Large else radius.None,
			Size = UDim2.fromScale(1, 1)
		}),
		Poster = if var2 ~= nil then nil else reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ImageContent = var2,
			ScaleType = Enum.ScaleType.Crop
		}, {
			Corner = if cornerRadius ~= nil then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
		})
	})
end