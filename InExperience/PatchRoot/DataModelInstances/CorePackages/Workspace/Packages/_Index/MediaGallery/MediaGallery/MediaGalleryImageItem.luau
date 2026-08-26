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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), getImageUriModule (ref), fFlagSduiExperienceDetailsSupport (ref), image (ref), iconButton (ref), foundationModule (ref), inputSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	local imageId = p1.imageId
	
	if p1.isYouTubeVideo and (imageId == nil or imageId == "") and p1.videoHash then
		imageId = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", p1.videoHash)
	end
	local uDim = UDim.new(0, p1.cornerRadius or var1.Radius.Medium)
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
		LayoutOrder = p1.itemIndex,
		Size = p1.Size
	}, {
		Image = reactModule.createElement(image, {
			ZIndex = 1,
			cornerRadius = uDim,
			Size = UDim2.fromScale(1, 1),
			Image = getImageUriModule(imageId),
			ScaleType = Enum.ScaleType.Crop,
			onLoaded = if fFlagSduiExperienceDetailsSupport and p1.onMediaResolved then if fFlagSduiExperienceDetailsSupport then reactModule.useCallback(function(p2)
				-- upvalues: p1 (ref)
				if p1.onMediaResolved then
					p1.onMediaResolved(p2 == Enum.AssetFetchStatus.Success)
				end
			end, { p1.onMediaResolved }) else nil else nil
		}),
		GradientOverlay = if p1.showGradient == false or not p1.gradientOverlayHeight then nil else reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.new(1, 0, 0, p1.gradientOverlayHeight),
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
		PlayButton = if p1.isYouTubeVideo then reactModule.createElement(iconButton, {
			isCircular = true,
			ZIndex = 3,
			icon = { name = foundationModule.Enums.IconName.PlayLarge },
			size = inputSize.Large,
			variant = buttonVariant.OverMedia,
			onActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref), imageId (write)
				if p1.onYouTubeVideoPlay then
					p1.onYouTubeVideoPlay({
						index = p1.itemIndex,
						imageId = imageId,
						videoHash = p1.videoHash or "",
						videoTitle = p1.videoTitle
					})
					
					return
				end
			end, {
				p1.videoHash,
				p1.videoTitle,
				imageId,
				p1.onYouTubeVideoPlay,
				p1.itemIndex
			}),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -var1.Size.Size_500, 1, -var1.Size.Size_500)
		}) else nil,
		ItemOverlay = if p1.overlay then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p1.overlay }) else nil
	})
end)