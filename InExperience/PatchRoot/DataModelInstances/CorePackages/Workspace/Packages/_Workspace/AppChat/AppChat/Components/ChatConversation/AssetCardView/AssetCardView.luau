local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local Skeleton = FoundationModule.Skeleton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTextSizeOffsetFunction = FoundationModule.Hooks.useTextSizeOffset
local ConstantsModule = require(AppChat.Constants)
local GetGroupCornerRadiiModule = require(AppChat.Components.ChatConversation.Grouping.getGroupCornerRadii)
local LoadFoundationCloudAssetModule = require(AppChat.Utils.loadFoundationCloudAsset)
local Status = require(script.Parent.AssetCardTypes).Status
local Frozen = table.freeze({ Transparency = 1, Color3 = Color3.new(1, 1, 1) })

local function ErrorContent(p1)
	-- upvalues: ReactModule (copy), LoadFoundationCloudAssetModule (copy), View (copy), Image (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-small size-full-0 auto-y padding-xxlarge",
		testId = "AssetCardError"
	}, {
		Pictogram = ReactModule.createElement(Image, {
			tag = "size-1600 content-system-contrast",
			LayoutOrder = 1,
			Image = ReactModule.useMemo(function()
				-- upvalues: LoadFoundationCloudAssetModule (upval)
				return (LoadFoundationCloudAssetModule("pictograms/alert"))
			end, {}),
			ScaleType = Enum.ScaleType.Fit
		}),
		Text = if p1.text then ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-system-contrast",
			LayoutOrder = 2,
			Text = p1.text
		}) else nil
	})
end

local function Media(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), Frozen (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local XScale: number = if Frame.isPictogram then 0.66 else 1
	
	return ReactModule.createElement(View, {
		tag = "bg-shift-200",
		testId = "AssetCardMedia",
		Size = UDim2.fromOffset(Frame.width, (math.round(Frame.width / Frame.aspectRatio))),
		cornerRadius = Frame.cornerRadii,
		onActivated = Frame.onActivated,
		isDisabled = Frame.isDisabled,
		selection = { Selectable = Frame.isSelectable },
		cursor = { radius = Frame.cursorRadius },
		ref = Frame.mediaRef,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Image = if Frame.image then ReactModule.createElement(Image, {
			tag = "position-center-center anchor-center-center",
			testId = "AssetCardMediaImage",
			ZIndex = 1,
			Size = UDim2.fromScale(XScale, XScale),
			ImageContent = Frame.image,
			ScaleType = if Frame.isPictogram then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
			imageStyle = if Frame.isImageLoading then Frozen elseif Frame.isPictogram then UseTokensResult.Color.Content.Emphasis else nil,
			cornerRadius = Frame.cornerRadii
		}) else nil,
		Overlay = if Frame.overlayIcon then ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center position-center-center anchor-center-center size-1200-1200 radius-circle bg-over-media-0",
			testId = "AssetCardMediaOverlay",
			ZIndex = 3
		}, {
			Icon = ReactModule.createElement(Icon, {
				name = Frame.overlayIcon,
				size = IconSize.Medium,
				style = UseTokensResult.Color.Content.Emphasis
			})
		}) else nil
	})
end

local function SkeletonRow(Frame)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	return ReactModule.createElement(View, {
		tag = `row align-y-center {Frame.heightTag}`,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Skeleton = ReactModule.createElement(Skeleton, {
			Size = UDim2.fromScale(Frame.width, 1),
			radius = Radius.Small,
			testId = Frame.testId
		})
	})
end

local function Title(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), UseTextSizeOffsetFunction (copy), ReactModule (copy), SkeletonRow (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	
	if Frame.isLoading then
		return ReactModule.createElement(SkeletonRow, {
			heightTag = "size-full-500",
			width = 0.6,
			testId = "AssetCardTitleSkeleton",
			LayoutOrder = Frame.LayoutOrder
		})
	elseif Frame.text == nil then
		return nil
	else
		local TitleMedium = UseTokensResult.Typography.TitleMedium
		local Ceiled = math.ceil((TitleMedium.FontSize + UseTextSizeOffsetResult) * TitleMedium.LineHeight * Frame.maxLines)
		
		return ReactModule.createElement(Text, {
			testId = "AssetCardTitle",
			tag = {
				["size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis"] = true,
				["text-wrap"] = Frame.maxLines > 1
			},
			Text = Frame.text,
			sizeConstraint = if Frame.maxLines > 1 then { MaxSize = Vector2.new(1e999, Ceiled) } else nil,
			LayoutOrder = Frame.LayoutOrder
		})
	end
end

local function Subtitle(Frame)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Skeleton (copy), Radius (copy), Text (copy)
	return if Frame.isLoading or Frame.text ~= nil then ReactModule.createElement(View, {
		testId = "AssetCardSubtitle",
		tag = {
			["row align-y-center gap-xsmall"] = true,
			["size-full-500"] = Frame.isLoading,
			["size-full-0 auto-y"] = not Frame.isLoading
		},
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = if Frame.icon then ReactModule.createElement(Icon, {
			testId = "AssetCardSubtitleIcon",
			LayoutOrder = 1,
			name = Frame.icon,
			size = IconSize.Small
		}) else nil,
		Text = if Frame.isLoading then ReactModule.createElement(Skeleton, {
			testId = "AssetCardSubtitleSkeleton",
			LayoutOrder = 2,
			Size = UDim2.fromScale(0.7, 1),
			radius = Radius.Small
		}) else ReactModule.createElement(Text, {
			tag = "fill auto-y text-body-medium text-align-x-left text-truncate-end content-default",
			LayoutOrder = 2,
			Text = Frame.text
		})
	}) else nil
end

local function GameStat(Frame)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-xsmall auto-xy",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = Frame.icon,
			size = IconSize.Small
		}),
		Text = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-small content-default",
			LayoutOrder = 2,
			Text = Frame.text
		})
	})
end

local function GameStats(Frame: Frame)
	-- upvalues: ReactModule (copy), SkeletonRow (copy), View (copy), GameStat (copy), IconName (copy)
	return if Frame.isLoading then ReactModule.createElement(SkeletonRow, {
		heightTag = "size-full-400",
		width = 0.4,
		testId = "AssetCardGameStatsSkeleton",
		LayoutOrder = Frame.LayoutOrder
	}) elseif Frame.rating == nil and Frame.playerCount == nil then nil else ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y",
		testId = "AssetCardGameStats",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Rating = if Frame.rating then ReactModule.createElement(GameStat, {
			LayoutOrder = 1,
			icon = IconName.ThumbUp,
			text = Frame.rating
		}) else nil,
		PlayerCount = if Frame.playerCount then ReactModule.createElement(GameStat, {
			LayoutOrder = 2,
			icon = IconName.PersonPlay,
			text = Frame.playerCount
		}) else nil
	})
end

local function ActionButton(Frame: Frame)
	-- upvalues: ReactModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy), IconButton (copy)
	return if Frame.label then ReactModule.createElement(Button, {
		testId = "AssetCardAction",
		text = Frame.label,
		icon = Frame.icon,
		variant = ButtonVariant.Standard,
		size = InputSize.Small,
		onActivated = Frame.onActivated,
		Selectable = Frame.isSelectable,
		LayoutOrder = Frame.LayoutOrder
	}) elseif Frame.icon == nil then nil else ReactModule.createElement(IconButton, {
		isCircular = true,
		testId = "AssetCardAction",
		icon = Frame.icon,
		variant = ButtonVariant.Emphasis,
		size = InputSize.Medium,
		onActivated = Frame.onActivated,
		Selectable = Frame.isSelectable,
		LayoutOrder = Frame.LayoutOrder
	})
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), ConstantsModule (copy), Status (copy), GetGroupCornerRadiiModule (copy), ReactModule (copy), View (copy), ErrorContent (copy), Media (copy), Title (copy), Subtitle (copy), GameStats (copy), ActionButton (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScaledValueResult = UseScaledValueFunction(ConstantsModule.AssetCard.WIDTH)
	local Size500 = UseTokensResult.Size.Size_500
	local _UDim = UDim.new(0, Size500)
	local Media1 = Frame.media
	local Footer = Frame.footer
	local IsStatusMatch = Frame.status == Status.Ready
	local IsStatusMatch1 = Frame.status == Status.Error
	local IsSelectable = IsStatusMatch and Media1.isSelectable
	local GroupCornerRadiiModule = GetGroupCornerRadiiModule(Frame.groupShape, Size500)
	local Config = if Footer then {
		bottomLeft = 0,
		bottomRight = 0,
		topLeft = GroupCornerRadiiModule.topLeft,
		topRight = GroupCornerRadiiModule.topRight
	} else GroupCornerRadiiModule
	
	return ReactModule.createElement(View, {
		tag = "col auto-y",
		testId = "AssetCardView",
		Size = UDim2.fromOffset(UseScaledValueResult, 0),
		backgroundStyle = UseTokensResult.Color.Shift.Shift_400,
		cornerRadius = GroupCornerRadiiModule,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Error = if IsStatusMatch1 then ReactModule.createElement(ErrorContent, { text = Frame.errorText }) else nil,
		Media = if IsStatusMatch1 then nil else ReactModule.createElement(Media, {
			LayoutOrder = 1,
			image = if IsStatusMatch then Media1.image else nil,
			isImageLoading = Media1.isLoading == true,
			aspectRatio = Media1.aspectRatio,
			isPictogram = Media1.isPictogram == true,
			overlayIcon = Media1.overlayIcon,
			onActivated = Media1.onActivated,
			isDisabled = not IsStatusMatch,
			isSelectable = IsSelectable,
			width = UseScaledValueResult,
			cornerRadii = Config,
			cursorRadius = _UDim,
			mediaRef = if IsSelectable then Frame.mediaRef else nil
		}),
		Footer = if IsStatusMatch1 or not Footer then nil else ReactModule.createElement(View, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-medium",
			testId = "AssetCardFooter",
			LayoutOrder = 2
		}, {
			TextColumn = ReactModule.createElement(View, {
				tag = "col fill gap-xsmall auto-y",
				testId = "AssetCardFooterText",
				LayoutOrder = 1,
				onActivated = Footer.onActivated,
				isDisabled = not IsStatusMatch,
				selection = { Selectable = false },
				cursor = { radius = _UDim }
			}, {
				Title = ReactModule.createElement(Title, {
					LayoutOrder = 1,
					text = Footer.titleText,
					maxLines = Footer.titleMaxLines or 1,
					isLoading = Footer.isTitleLoading == true
				}),
				Subtitle = ReactModule.createElement(Subtitle, {
					LayoutOrder = 2,
					text = Footer.subtitleText,
					icon = Footer.subtitleIcon,
					isLoading = Footer.isSubtitleLoading == true
				}),
				GameStats = ReactModule.createElement(GameStats, {
					LayoutOrder = 3,
					rating = if Footer.gameStats then Footer.gameStats.rating else nil,
					playerCount = if Footer.gameStats then Footer.gameStats.playerCount else nil,
					isLoading = Footer.isGameStatsLoading == true
				})
			}),
			Action = if IsStatusMatch and Footer.action then ReactModule.createElement(ActionButton, {
				LayoutOrder = 2,
				label = Footer.action.label,
				icon = Footer.action.icon,
				onActivated = Footer.action.onActivated,
				isSelectable = Footer.action.isSelectable
			}) else nil
		})
	})
end)