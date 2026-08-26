local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local icon = builderIconsModule.Icon
local iconVariant = builderIconsModule.IconVariant
local maybeForceDarkTheme = require(parent.CollectionViews).maybeForceDarkTheme
local foundationModule = require(parent.Foundation)
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local videoProgressBarModule = require(script.Parent.VideoProgressBar)
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen

return function(p1)
	-- upvalues: useTokens (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), reactModule (ref), iconButton (ref), icon (ref), iconVariant (ref), iconSize (ref), videoProgressBarModule (ref), maybeForceDarkTheme (ref)
	local var1 = useTokens()
	local var2 = if p1.muteButtonConfig == nil then fFlagLuaAppEdpMediaGalleryFullScreen and (if p1.playButtonConfig == nil then p1.progressBarConfig ~= nil else true) else true
	local XXLarge = var1.Padding.XXLarge
	local var3 = if useBreakpointXOrSmaller(responsiveModule.Keys.Small) then 0 else var1.Padding.Medium
	local medium = var1.Padding.Medium
	local size1000 = var1.Size.Size_1000
	local size100 = var1.Size.Size_100
	local xSmall = var1.Padding.XSmall
	local var4 = if p1.muteButtonConfig then reactModule.createElement(iconButton, {
		Selectable = false,
		icon = {
			name = if p1.muteButtonConfig.muted then icon.SpeakerSlash else icon.Speaker,
			variant = iconVariant.Filled
		},
		iconSize = iconSize.Medium,
		onActivated = p1.muteButtonConfig.onMuteButtonActivated or nil,
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.fromScale(1, 1)
	}) else nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 0, reactModule.useMemo(function()
			-- upvalues: XXLarge (ref), var3 (ref), p1 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), size1000 (ref), size100 (ref), xSmall (ref)
			local var5 = XXLarge + var3
			
			if p1.muteButtonConfig or fFlagLuaAppEdpMediaGalleryFullScreen and p1.playButtonConfig then
				var5 += size1000
			end
			if fFlagLuaAppEdpMediaGalleryFullScreen and p1.progressBarConfig then
				var5 += size100 + xSmall
			end
			return var5
		end, {
			p1.muteButtonConfig,
			if fFlagLuaAppEdpMediaGalleryFullScreen then p1.playButtonConfig else nil,
			if fFlagLuaAppEdpMediaGalleryFullScreen then p1.progressBarConfig else nil,
			XXLarge, var3, size1000, size100, xSmall
		})),
		ZIndex = p1.ZIndex
	}, {
		GradientOverlay = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var1.Color.Extended.Black.Black_100.Color3
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0.2)
				})
			}),
			UICorner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
		}),
		UserControls = if p1.videoLoaded and var2 then maybeForceDarkTheme(reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.fromScale(1, 1)
		}, if fFlagLuaAppEdpMediaGalleryFullScreen then if fFlagLuaAppEdpMediaGalleryFullScreen then {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, xSmall),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, XXLarge),
				PaddingBottom = UDim.new(0, var3),
				PaddingLeft = UDim.new(0, medium),
				PaddingRight = UDim.new(0, medium)
			}),
			ProgressBar = if p1.progressBarConfig then reactModule.createElement(videoProgressBarModule, {
				LayoutOrder = 1,
				progressBinding = p1.progressBarConfig.progressBinding,
				Size = UDim2.new(1, 0, 0, size100)
			}) else nil,
			ButtonsContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, size1000)
			}, {
				PlayButton = if p1.playButtonConfig then reactModule.createElement(iconButton, {
					Selectable = false,
					icon = {
						name = if p1.playButtonConfig.isVideoPlaying then icon.PauseLarge else icon.PlayLarge,
						variant = iconVariant.Filled
					},
					iconSize = iconSize.Medium,
					onActivated = p1.playButtonConfig.onPlayButtonActivated,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.fromScale(0, 1)
				}) else nil,
				MuteButton = if p1.muteButtonConfig then var4 else nil
			})
		} else nil else {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, XXLarge),
				PaddingBottom = UDim.new(0, var3),
				PaddingLeft = UDim.new(0, medium),
				PaddingRight = UDim.new(0, medium)
			}),
			MuteButton = if p1.muteButtonConfig then var4 else nil
		}), true) else nil
	})
end