local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local IconButton = FoundationModule.IconButton
local Image = FoundationModule.Image
local View = FoundationModule.View
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PlayButton = require(Parent.GamePlayButton).PlayButton
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(Parent.VideoUtils)
local UseIsHoveredTileModule = require(GameTile.useIsHoveredTile)
local UseValidTileBadgesModule = require(GameTile.Overlays.useValidTileBadges)
local GameTileThumbnailBadgesModule = require(GameTile.Overlays.GameTileThumbnailBadges)
local _ = require(GameTile.GameTileTypes)
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentLandscape", 40) / 100
local LuaAppOneByTwoTileLogoWidthPercentSquareRatio = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentSquare", 25) / 100

local function noop() end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), ReactModule (copy), UseIsHoveredTileModule (copy), UseNavigationFunction (copy), AppPage (copy), FFlagLuaAppHomeTouchAutoplay (copy), UseValidTileBadgesModule (copy), UseLocalizationFunction (copy), OmniRecommendationsContentType (copy), LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio (copy), LuaAppOneByTwoTileLogoWidthPercentSquareRatio (copy), ButtonSize (copy), Image (copy), GameTileThumbnailBadgesModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), noop (copy), PlayButton (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseResponsiveResultMatch = ResponsiveModule.useResponsive({ ResponsiveModule.BreakpointConfig.sizes.Small }) == ResponsiveModule.Keys.Small
	local UseRefResult = ReactModule.useRef(nil)
	local UseIsHoveredTileModuleResult = UseIsHoveredTileModule(UseRefResult, `OneByTwoTile_{p1.layoutOrder or 0}`, true)
	local UseNavigationResult = UseNavigationFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPage (upval), p1 (copy), FFlagLuaAppHomeTouchAutoplay (upval)
		UseNavigationResult.navigate(AppPage.FeatureTileAdPlayer, {
			extraProps = {
				videoAssetId = p1.primaryVideoAssetId,
				imageAssetId = p1.primaryImageAssetId,
				videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackContext else nil
			}
		})
	end, {
		UseNavigationResult,
		p1.primaryVideoAssetId,
		p1.primaryImageAssetId,
		if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackContext else nil
	})
	local UseValidTileBadgesModuleResult = UseValidTileBadgesModule(p1.universeId or "", p1.topicId, p1.badgeOverride)
	local UseLocalizationResult = UseLocalizationFunction({
		joinButtonText = "Common.VisitGame.Label.Play",
		learnButtonText = "CommonUI.Features.Label.Learn"
	})
	local IsContentTypeMatch = p1.contentType == OmniRecommendationsContentType.AdLink
	local LearnButtonText = if IsContentTypeMatch then UseLocalizationResult.learnButtonText else UseLocalizationResult.joinButtonText
	local Number: number? = tonumber(p1.logoAspectRatio)
	local Number1: number = if Number and Number > 0 then Number else 1
	local LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio1 = if Number1 == 3 then LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio else LuaAppOneByTwoTileLogoWidthPercentSquareRatio
	local Small = nil
	local TitleSmall = nil
	local Medium = nil
	local TitleLarge = nil
	local Size800 = nil
	local BodySmall = nil
	local XXSmall = nil
	
	if IsUseResponsiveResultMatch then
		Medium = UseTokensResult.Padding.Medium
		TitleLarge = UseTokensResult.Typography.TitleLarge
		BodySmall = UseTokensResult.Typography.BodySmall
		XXSmall = UseTokensResult.Gap.XXSmall
		Small = ButtonSize.Small
		Size800 = UseTokensResult.Size.Size_800
		TitleSmall = UseTokensResult.Typography.TitleSmall
	else
		Medium = UseTokensResult.Padding.Large
		TitleLarge = UseTokensResult.Typography.HeadingMedium
		BodySmall = UseTokensResult.Typography.BodyMedium
		XXSmall = UseTokensResult.Gap.XSmall
		Small = ButtonSize.Medium
		Size800 = UseTokensResult.Size.Size_1000
		TitleSmall = UseTokensResult.Typography.TitleMedium
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, {
		Container = ReactModule.createElement("TextButton", {
			ref = UseRefResult,
			Size = p1.size or UDim2.fromScale(1, 1),
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Text = "",
			AutoButtonColor = false,
			[ReactModule.Event.Activated] = UseResult
		}, {
			UICorner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			}),
			Thumbnail = ReactModule.createElement(Image, {
				ZIndex = 1,
				Image = `rbxassetid://{p1.primaryImageAssetId}`,
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Crop,
				cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			}),
			TileBadge = if UseValidTileBadgesModuleResult then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = ReactModule.createElement(GameTileThumbnailBadgesModule, { tileBadgesByPosition = UseValidTileBadgesModuleResult })
			}) else nil,
			Logo = if p1.logoImageAssetId then ReactModule.createElement(Image, {
				ZIndex = 2,
				Image = `rbxassetid://{p1.logoImageAssetId}`,
				Position = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium),
				AnchorPoint = Vector2.new(1, 0),
				Size = UDim2.new(LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio1, 0, 1, 0),
				aspectRatio = Number1
			}) else nil,
			OverflowMenuButton = if UseIsHoveredTileModuleResult then ReactModule.createElement(View, {
				tag = "auto-xy bg-over-media-0 radius-circle",
				ZIndex = 4,
				Position = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium),
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Button = ReactModule.createElement(IconButton, {
					isCircular = true,
					icon = IconName.ThreeDotsHorizontal,
					size = InputSize.Small,
					variant = ButtonVariant.Utility,
					onActivated = noop
				})
			}) else nil,
			BottomStack = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.new(1, -2 * Medium, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, Medium, 1, -Medium),
				AnchorPoint = Vector2.new(0, 1)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, Medium)
				}),
				TextStack = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, XXSmall)
					}),
					Headline = if p1.headline then ReactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = p1.headline,
						Font = TitleLarge.Font,
						TextSize = TitleLarge.FontSize,
						TextColor3 = UseTokensResult.LightMode.ActionOverMedia.Foreground.Color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top
					}) else nil,
					Subtitle = if p1.subtitle then ReactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = p1.subtitle,
						Font = BodySmall.Font,
						TextSize = BodySmall.FontSize,
						TextColor3 = UseTokensResult.LightMode.ActionOverMedia.Foreground.Color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top
					}) else nil
				}),
				CtaButton = if IsContentTypeMatch then ReactModule.createElement("TextButton", {
					LayoutOrder = 2,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(0, Size800),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = UseTokensResult.Color.Extended.White.White_20.Color3,
					BackgroundTransparency = UseTokensResult.Color.Extended.White.White_20.Transparency,
					Text = LearnButtonText,
					TextColor3 = UseTokensResult.LightMode.ActionOverMedia.Foreground.Color3,
					Font = TitleSmall.Font,
					TextSize = TitleSmall.FontSize
				}, {
					UICorner = ReactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
					}),
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UseTokensResult.Padding.Large),
						PaddingRight = UDim.new(0, UseTokensResult.Padding.Large)
					})
				}) elseif p1.universeId then ReactModule.createElement(PlayButton, {
					LayoutOrder = 2,
					eventContext = "OneByTwoTile",
					launchSource = "OneByTwoTile",
					hidePlayableIcon = true,
					universeId = p1.universeId,
					placeId = if p1.placeIdOverride then p1.placeIdOverride else p1.placeId,
					referralSource = p1.referralSource,
					playableText = LearnButtonText,
					buttonSize = Small,
					reportExperienceLaunched = p1.reportExperienceLaunched,
					experienceJoinData = if p1.launchDataOverride then { launchData = p1.launchDataOverride } else nil
				}) else nil
			})
		})
	})
end)