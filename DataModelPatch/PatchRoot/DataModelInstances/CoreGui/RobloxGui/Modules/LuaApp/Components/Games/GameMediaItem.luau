local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local SpringAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local LoadableImageModule = require(Modules.LuaApp.Components.LoadableImage)
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local GameMediaItem = RoactModule.PureComponent:extend("GameMediaItem")

function GameMediaItem.init(p1)
	-- upvalues: LoadableImageModule (copy)
	p1.state = { loaded = LoadableImageModule.isLoaded(p1.props.Image) }
	p1.isMounted = false
	
	function p1.onImageLoaded()
		-- upvalues: p1 (copy)
		if p1.state.loaded == false and p1.isMounted then
			p1:setState({ loaded = true })
			
			if p1.props.onImageLoaded then
				p1.props.onImageLoaded()
			end
		end
	end
end

function GameMediaItem.didMount(p1)
	p1.isMounted = true
end

function GameMediaItem.willUnmount(p1)
	p1.isMounted = false
end

function GameMediaItem.render(p1)
	-- upvalues: RoactModule (copy), LoadableImageModule (copy), SpringAnimatedItem (copy), ImageSetLabel (copy), GetImageDataFunction (copy)
	local Image = p1.props.Image
	local ImageTransparency = p1.props.ImageTransparency
	local IsVideo = p1.props.isVideo
	local VideoIconColor = p1.props.videoIconColor
	local AnimationSettings = p1.props.animationSettings
	local OnActivated = p1.props.onActivated
	local Loaded = p1.state.loaded
	local IsNotImageTransparencyMatch = ImageTransparency ~= 1
	local Crop = IsVideo and Enum.ScaleType.Crop or Enum.ScaleType.Stretch
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = p1.props.Size,
		Position = p1.props.Position,
		LayoutOrder = p1.props.LayoutOrder,
		BackgroundColor3 = p1.props.BackgroundColor3,
		BackgroundTransparency = p1.props.BackgroundTransparency
	}, {
		MediaImage = IsNotImageTransparencyMatch and not Loaded and RoactModule.createElement(LoadableImageModule, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			useShimmerAnimationWhileLoading = true,
			Size = UDim2.new(1, 0, 1, 0),
			Image = Image,
			ImageTransparency = ImageTransparency,
			ScaleType = Crop,
			onLoaded = p1.onImageLoaded
		}) or RoactModule.createElement(SpringAnimatedItem.AnimatedImageLabel, {
			regularProps = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Image = Image,
				ScaleType = Crop
			},
			animatedValues = { transparency = ImageTransparency },
			mapValuesToProps = function(p2)
				return { ImageTransparency = p2.transparency }
			end,
			springOptions = AnimationSettings
		}),
		VideoIconBackground = IsVideo and IsNotImageTransparencyMatch and RoactModule.createElement("ImageLabel", {
			Image = "rbxasset://textures/ui/LuaApp/graphic/playBtnBackground.png",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			VideoIcon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ImageTransparency = 0.5,
				AnchorPoint = Vector2.new(1, 1),
				Size = UDim2.new(0, 60, 0, 45),
				Position = UDim2.new(1, -10, 1, -10),
				Image = GetImageDataFunction("LuaApp/buttons/buttonPill") or "LuaApp/buttons/buttonPill",
				ImageColor3 = VideoIconColor
			}, {
				Icon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0, 26, 0, 26),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = GetImageDataFunction("LuaApp/icons/GameDetails/play") or "LuaApp/icons/GameDetails/play",
					ImageColor3 = VideoIconColor,
					ScaleType = Enum.ScaleType.Fit
				})
			})
		}),
		ItemActivationButton = OnActivated ~= nil and RoactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			ZIndex = 3,
			[RoactModule.Event.Activated] = OnActivated
		})
	})
end

return GameMediaItem