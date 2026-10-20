local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconButton = FoundationModule.IconButton
local InputSize = FoundationModule.Enums.InputSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Image = FoundationModule.Image
local _ = require(MediaGallery.MediaGalleryTypes)
local GetImageUriModule = require(MediaGallery.getImageUri)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), GetImageUriModule (copy), Image (copy), IconButton (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local ImageId = p1.imageId
	
	if p1.isYouTubeVideo and (ImageId == nil or ImageId == "") and p1.videoHash then
		ImageId = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", p1.videoHash)
	end
	local _UDim = UDim.new(0, p1.cornerRadius or UseTokensResult.Radius.Medium)
	ReactModule.useEffect(function()
		-- upvalues: ImageId (ref), GetImageUriModule (upval)
		if ImageId then
			task.spawn(function()
				-- upvalues: GetImageUriModule (upval), ImageId (upval)
				local Image = Instance.new("ImageLabel")
				Image.Image = GetImageUriModule(ImageId)
				game:GetService("ContentProvider"):PreloadAsync({ Image })
				Image:Destroy()
			end)
		end
	end, { ImageId })
	local UseResult = ReactModule.useCallback(function(AssetFetchStatus)
		-- upvalues: p1 (copy)
		if p1.onMediaResolved then
			p1.onMediaResolved(AssetFetchStatus == Enum.AssetFetchStatus.Success)
		end
	end, { p1.onMediaResolved })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ImageId (ref)
		if p1.onYouTubeVideoPlay then
			p1.onYouTubeVideoPlay({
				index = p1.itemIndex,
				imageId = ImageId,
				videoHash = p1.videoHash or "",
				videoTitle = p1.videoTitle
			})
			
			return
		end
	end, {
		p1.videoHash,
		p1.videoTitle,
		ImageId,
		p1.onYouTubeVideoPlay,
		p1.itemIndex
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.itemIndex,
		Size = p1.Size
	}, {
		Image = ReactModule.createElement(Image, {
			ZIndex = 1,
			cornerRadius = _UDim,
			Size = UDim2.fromScale(1, 1),
			Image = GetImageUriModule(ImageId),
			ScaleType = Enum.ScaleType.Crop,
			onLoaded = if p1.onMediaResolved then UseResult else nil
		}),
		GradientOverlay = if p1.showGradient == false or not p1.gradientOverlayHeight then nil else ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.new(1, 0, 0, p1.gradientOverlayHeight),
			BackgroundColor3 = Color3.new(0, 0, 0)
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0.2)
				})
			}),
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
		}),
		PlayButton = if p1.isYouTubeVideo then ReactModule.createElement(IconButton, {
			isCircular = true,
			ZIndex = 3,
			icon = { name = FoundationModule.Enums.IconName.PlayLarge },
			size = InputSize.Large,
			variant = ButtonVariant.OverMedia,
			onActivated = UseResult1,
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -UseTokensResult.Size.Size_500, 1, -UseTokensResult.Size.Size_500)
		}) else nil,
		ItemOverlay = if p1.overlay then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1)
		}, { Overlay = p1.overlay }) else nil
	})
end)