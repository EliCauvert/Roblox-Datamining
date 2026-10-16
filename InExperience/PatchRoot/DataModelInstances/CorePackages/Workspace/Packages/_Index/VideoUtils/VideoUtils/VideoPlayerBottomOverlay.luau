local Parent = script:FindFirstAncestor("VideoUtils").Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local Icon = BuilderIconsModule.Icon
local IconVariant = BuilderIconsModule.IconVariant
local MaybeForceDarkThemeFunction = require(Parent.CollectionViews).maybeForceDarkTheme
local FoundationModule = require(Parent.Foundation)
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local VideoProgressBarModule = require(script.Parent.VideoProgressBar)
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen

return function(p1) --[[ Line: 45 | Named "VideoPlayerBottomOverlay" ]]
	-- upvalues: UseTokensFunction (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy), ReactModule (copy), IconButton (copy), Icon (copy), IconVariant (copy), IconSize (copy), VideoProgressBarModule (copy), MaybeForceDarkThemeFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local HasMuteButtonConfig: boolean = p1.muteButtonConfig ~= nil or FFlagLuaAppEdpMediaGalleryFullScreen and (p1.playButtonConfig ~= nil or p1.progressBarConfig ~= nil)
	local XXLarge = UseTokensResult.Padding.XXLarge
	local Medium = if UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small) then 0 else UseTokensResult.Padding.Medium
	local Medium1 = UseTokensResult.Padding.Medium
	local Size1000 = UseTokensResult.Size.Size_1000
	local Size100 = UseTokensResult.Size.Size_100
	local XSmall = UseTokensResult.Padding.XSmall
	local Element = if p1.muteButtonConfig then ReactModule.createElement(IconButton, {
		Selectable = false,
		icon = {
			name = if p1.muteButtonConfig.muted then Icon.SpeakerSlash else Icon.Speaker,
			variant = IconVariant.Filled
		},
		iconSize = IconSize.Medium,
		onActivated = p1.muteButtonConfig.onMuteButtonActivated or nil,
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.fromScale(1, 1)
	}) else nil
	local Config = if FFlagLuaAppEdpMediaGalleryFullScreen then {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, XSmall),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, XXLarge),
			PaddingBottom = UDim.new(0, Medium),
			PaddingLeft = UDim.new(0, Medium1),
			PaddingRight = UDim.new(0, Medium1)
		}),
		ProgressBar = if p1.progressBarConfig then ReactModule.createElement(VideoProgressBarModule, {
			LayoutOrder = 1,
			progressBinding = p1.progressBarConfig.progressBinding,
			Size = UDim2.new(1, 0, 0, Size100)
		}) else nil,
		ButtonsContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, Size1000)
		}, {
			PlayButton = if p1.playButtonConfig then ReactModule.createElement(IconButton, {
				Selectable = false,
				icon = {
					name = if p1.playButtonConfig.isVideoPlaying then Icon.PauseLarge else Icon.PlayLarge,
					variant = IconVariant.Filled
				},
				iconSize = IconSize.Medium,
				onActivated = p1.playButtonConfig.onPlayButtonActivated,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1)
			}) else nil,
			MuteButton = if p1.muteButtonConfig then Element else nil
		})
	} else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 0, (ReactModule.useMemo(function() --[[ Line: 124 ]]
			-- upvalues: XXLarge (copy), Medium (copy), p1 (copy), FFlagLuaAppEdpMediaGalleryFullScreen (upval), Size1000 (copy), Size100 (copy), XSmall (copy)
			local NewXXLarge = XXLarge + Medium
			
			if p1.muteButtonConfig or FFlagLuaAppEdpMediaGalleryFullScreen and p1.playButtonConfig then
				NewXXLarge += Size1000
			end
			if FFlagLuaAppEdpMediaGalleryFullScreen and p1.progressBarConfig then
				NewXXLarge += Size100 + XSmall
			end
			return NewXXLarge
		end, {
			p1.muteButtonConfig,
			if FFlagLuaAppEdpMediaGalleryFullScreen then p1.playButtonConfig else nil,
			if FFlagLuaAppEdpMediaGalleryFullScreen then p1.progressBarConfig else nil,
			XXLarge, Medium, Size1000, Size100, XSmall
		}))),
		ZIndex = p1.ZIndex
	}, {
		GradientOverlay = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = UseTokensResult.Color.Extended.Black.Black_100.Color3
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0.2)
				})
			}),
			UICorner = if p1.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil
		}),
		UserControls = if p1.videoLoaded and HasMuteButtonConfig then MaybeForceDarkThemeFunction(ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.fromScale(1, 1)
		}, if FFlagLuaAppEdpMediaGalleryFullScreen then Config else {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, XXLarge),
				PaddingBottom = UDim.new(0, Medium),
				PaddingLeft = UDim.new(0, Medium1),
				PaddingRight = UDim.new(0, Medium1)
			}),
			MuteButton = if p1.muteButtonConfig then Element else nil
		}), true) else nil
	})
end