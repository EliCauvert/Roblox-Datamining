local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local iconButton = foundationModule.IconButton
local inputSize = foundationModule.Enums.InputSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local image = foundationModule.Image
local _ = require(mediaGallery.MediaGalleryTypes)
local getImageUriModule = require(mediaGallery.getImageUri)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), getImageUriModule (ref), fFlagSduiExperienceDetailsSupport (ref), image (ref), iconButton (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref)
	local var4 = useTokens()
	local imageId = p0.imageId
	
	if p0.isYouTubeVideo and (imageId == nil or imageId == "") and p0.videoHash then
		imageId = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", p0.videoHash)
	end
	local uDim = UDim.new(0, p0.cornerRadius or var4.Radius.Medium)
	reactModule.useEffect(function()
		-- upvalues: imageId (write), getImageUriModule (copy)
		if imageId then
			task.spawn(function()
				-- upvalues: getImageUriModule (copy), imageId (copy)
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Image = getImageUriModule(imageId)
				game:GetService("ContentProvider"):PreloadAsync({ imageLabel })
				imageLabel:Destroy()
			end)
		end
	end, { imageId })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p0.itemIndex,
		Size = p0.Size
	}, {
		Image = reactModule.createElement(image, {
			ZIndex = 1,
			cornerRadius = uDim,
			Size = UDim2.fromScale(1, 1),
			Image = getImageUriModule(imageId),
			ScaleType = Enum.ScaleType.Crop,
			onLoaded = if fFlagSduiExperienceDetailsSupport and p0.onMediaResolved then if fFlagSduiExperienceDetailsSupport then reactModule.useCallback(function(p1)
				-- upvalues: p0 (ref)
				if p0.onMediaResolved then
					p0.onMediaResolved(p1 == Enum.AssetFetchStatus.Success)
				end
			end, { p0.onMediaResolved }) else nil else nil
		}),
		GradientOverlay = if p0.showGradient == false or not p0.gradientOverlayHeight then nil else reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.new(1, 0, 0, p0.gradientOverlayHeight),
			BackgroundColor3 = Color3.new(0, 0, 0)
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0.2)
				})
			}),
			UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
		}),
		PlayButton = if p0.isYouTubeVideo then reactModule.createElement(iconButton, {
			isCircular = true,
			ZIndex = 3,
			icon = { name = foundationModule.Enums.IconName.PlayLarge },
			size = inputSize.Large,
			variant = buttonVariant.OverMedia,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p0 (ref), imageId (write)
				if p0.onYouTubeVideoPlay then
					p0.onYouTubeVideoPlay({
						index = p0.itemIndex,
						imageId = imageId,
						videoHash = p0.videoHash or "",
						videoTitle = p0.videoTitle
					})
					
					return
				end
			end, {
				p0.videoHash,
				p0.videoTitle,
				imageId,
				p0.onYouTubeVideoPlay,
				p0.itemIndex
			}),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -var4.Size.Size_500, 1, -var4.Size.Size_500)
		}) else nil,
		ItemOverlay = if p0.overlay then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p0.overlay }) else nil
	})
end)