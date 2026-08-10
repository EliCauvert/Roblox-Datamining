local parent = script:FindFirstAncestor("SponsoredTiles").Parent
local gameTileModule = require(parent.GameTile)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local iconButton = foundationModule.IconButton
local image = foundationModule.Image
local view = foundationModule.View
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens
local playButton = require(parent.GamePlayButton).PlayButton
local useLocalization = require(parent.Localization).Hooks.useLocalization
local omniRecommendationsContentType = require(parent.DiscoveryTypes).OmniRecommendationsContentType
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
local _ = require(parent.VideoUtils)
local useIsHoveredTile = gameTileModule.useIsHoveredTile
local useValidTileBadges = gameTileModule.useValidTileBadges
local gameTileThumbnailBadges = gameTileModule.GameTileThumbnailBadges
local var4 = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentLandscape", 40) / 100
local var5 = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentSquare", 25) / 100

local function noop() --[[ line: 59 ]] end

return reactModule.memo(function(p0) --[[ line: 61 | named "OneByTwoTile" ]]
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), useIsHoveredTile (ref), useNavigation (ref), appPage (ref), useValidTileBadges (ref), useLocalization (ref), omniRecommendationsContentType (ref), var4 (ref), var5 (ref), buttonSize (ref), image (ref), gameTileThumbnailBadges (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), noop (ref), playButton (ref), fFlagLuaAppDemoModePlayButton (ref)
	local large, headingMedium, bodyMedium, xSmall, medium, size1000, titleMedium
	local var7 = useTokens()
	local var8 = responsiveModule.useResponsive({ responsiveModule.BreakpointConfig.sizes.Small }) == responsiveModule.Keys.Small
	local var9 = reactModule.useRef(nil)
	local var10 = useIsHoveredTile(var9, `OneByTwoTile_{p0.layoutOrder or 0}`, true)
	local var11 = useNavigation()
	local var12 = reactModule.useCallback(function() --[[ line: 74 ]]
		-- upvalues: var11 (ref), appPage (copy), p0 (ref)
		var11.navigate(appPage.FeatureTileAdPlayer, {
			extraProps = {
				videoAssetId = p0.primaryVideoAssetId,
				imageAssetId = p0.primaryImageAssetId,
				videoPlaybackContext = p0.videoPlaybackContext
			}
		})
	end, {
		var11,
		p0.primaryVideoAssetId,
		p0.primaryImageAssetId,
		p0.videoPlaybackContext
	})
	local var13 = useValidTileBadges(p0.universeId or "", p0.topicId, p0.badgeOverride)
	local var14 = useLocalization({
		joinButtonText = "Common.VisitGame.Label.Play",
		learnButtonText = "CommonUI.Features.Label.Learn"
	})
	local var15 = p0.contentType == omniRecommendationsContentType.AdLink
	local var16 = if var15 then var14.learnButtonText else var14.joinButtonText
	local var17 = tonumber(p0.logoAspectRatio)
	local var18 = if var17 and var17 > 0 then var17 else 1
	local var19 = if var18 == 3 then var4 else var5
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var8 then
		large = var7.Padding.Medium
		headingMedium = var7.Typography.TitleLarge
		bodyMedium = var7.Typography.BodySmall
		xSmall = var7.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var7.Size.Size_800
		titleMedium = var7.Typography.TitleSmall
	else
		large = var7.Padding.Large
		headingMedium = var7.Typography.HeadingMedium
		bodyMedium = var7.Typography.BodyMedium
		xSmall = var7.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var7.Size.Size_1000
		titleMedium = var7.Typography.TitleMedium
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex
	}, {
		Container = reactModule.createElement("TextButton", {
			ref = var9,
			Size = p0.size or UDim2.fromScale(1, 1),
			BackgroundColor3 = var7.Color.Surface.Surface_100.Color3,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Text = "",
			AutoButtonColor = false,
			[reactModule.Event.Activated] = var12
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) }),
			Thumbnail = reactModule.createElement(image, {
				ZIndex = 1,
				Image = `rbxassetid://{p0.primaryImageAssetId}`,
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Crop,
				cornerRadius = UDim.new(0, var7.Radius.Medium)
			}),
			TileBadge = if var13 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var13 })
			}) else nil,
			Logo = if p0.logoImageAssetId then reactModule.createElement(image, {
				ZIndex = 2,
				Image = `rbxassetid://{p0.logoImageAssetId}`,
				Position = UDim2.new(1, -var7.Padding.Medium, 0, var7.Padding.Medium),
				AnchorPoint = Vector2.new(1, 0),
				Size = UDim2.new(var19, 0, 1, 0),
				aspectRatio = var18
			}) else nil,
			OverflowMenuButton = if var10 then reactModule.createElement(view, {
				tag = "auto-xy bg-over-media-0 radius-circle",
				ZIndex = 4,
				Position = UDim2.new(1, -var7.Padding.Medium, 0, var7.Padding.Medium),
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Button = reactModule.createElement(iconButton, {
					isCircular = true,
					icon = iconName.ThreeDotsHorizontal,
					size = inputSize.Small,
					variant = buttonVariant.Utility,
					onActivated = noop
				})
			}) else nil,
			BottomStack = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.new(1, -2 * large, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, large, 1, -large),
				AnchorPoint = Vector2.new(0, 1)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, large)
				}),
				TextStack = reactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, xSmall)
					}),
					Headline = if p0.headline then reactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = p0.headline,
						Font = headingMedium.Font,
						TextSize = headingMedium.FontSize,
						TextColor3 = var7.LightMode.ActionOverMedia.Foreground.Color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top
					}) else nil,
					Subtitle = if p0.subtitle then reactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = p0.subtitle,
						Font = bodyMedium.Font,
						TextSize = bodyMedium.FontSize,
						TextColor3 = var7.LightMode.ActionOverMedia.Foreground.Color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top
					}) else nil
				}),
				CtaButton = if var15 then reactModule.createElement("TextButton", {
					LayoutOrder = 2,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(0, size1000),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = var7.Color.Extended.White.White_20.Color3,
					BackgroundTransparency = var7.Color.Extended.White.White_20.Transparency,
					Text = var16,
					TextColor3 = var7.LightMode.ActionOverMedia.Foreground.Color3,
					Font = titleMedium.Font,
					TextSize = titleMedium.FontSize
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) }),
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, var7.Padding.Large),
						PaddingRight = UDim.new(0, var7.Padding.Large)
					})
				}) elseif p0.universeId then reactModule.createElement(playButton, {
					LayoutOrder = 2,
					eventContext = "OneByTwoTile",
					launchSource = "OneByTwoTile",
					hidePlayableIcon = true,
					universeId = p0.universeId,
					placeId = if p0.placeIdOverride then p0.placeIdOverride else p0.placeId,
					referralSource = p0.referralSource,
					playableText = var16,
					buttonSize = medium,
					preferSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then true else nil,
					reportExperienceLaunched = p0.reportExperienceLaunched,
					experienceJoinData = if p0.launchDataOverride then { launchData = p0.launchDataOverride } else nil
				}) else nil
			})
		})
	})
end)