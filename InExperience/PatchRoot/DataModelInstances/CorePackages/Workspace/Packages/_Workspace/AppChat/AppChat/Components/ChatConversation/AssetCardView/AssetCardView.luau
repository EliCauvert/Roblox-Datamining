local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local icon = foundationModule.Icon
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local skeleton = foundationModule.Skeleton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTextSizeOffset = foundationModule.Hooks.useTextSizeOffset
local constantsModule = require(appChat.Constants)
local getGroupCornerRadiiModule = require(appChat.Components.ChatConversation.Grouping.getGroupCornerRadii)
local loadFoundationCloudAssetModule = require(appChat.Utils.loadFoundationCloudAsset)
local status = require(script.Parent.AssetCardTypes).Status
local frozen = table.freeze({ Transparency = 1, Color3 = Color3.new(1, 1, 1) })

local function ErrorContent(p1)
	-- upvalues: reactModule (ref), loadFoundationCloudAssetModule (ref), view (ref), image (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-small size-full-0 auto-y padding-xxlarge",
		testId = "AssetCardError"
	}, {
		Pictogram = reactModule.createElement(image, {
			tag = "size-1600 content-system-contrast",
			LayoutOrder = 1,
			Image = reactModule.useMemo(function()
				-- upvalues: loadFoundationCloudAssetModule (copy)
				return loadFoundationCloudAssetModule("pictograms/alert")
			end, {}),
			ScaleType = Enum.ScaleType.Fit
		}),
		Text = if p1.text then reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-system-contrast",
			LayoutOrder = 2,
			Text = p1.text
		}) else nil
	})
end

local function Media(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), frozen (ref), icon (ref), iconSize (ref)
	local var1 = useTokens()
	local var2 = if p1.isPictogram then 0.66 else 1
	
	return reactModule.createElement(view, {
		tag = "bg-shift-200",
		testId = "AssetCardMedia",
		Size = UDim2.fromOffset(p1.width, math.round(p1.width / p1.aspectRatio)),
		cornerRadius = p1.cornerRadii,
		onActivated = p1.onActivated,
		isDisabled = p1.isDisabled,
		selection = { Selectable = p1.isSelectable },
		cursor = { radius = p1.cursorRadius },
		ref = p1.mediaRef,
		LayoutOrder = p1.LayoutOrder
	}, {
		Image = if p1.image then reactModule.createElement(image, {
			tag = "position-center-center anchor-center-center",
			testId = "AssetCardMediaImage",
			ZIndex = 1,
			Size = UDim2.fromScale(var2, var2),
			ImageContent = p1.image,
			ScaleType = if p1.isPictogram then Enum.ScaleType.Fit else Enum.ScaleType.Crop,
			imageStyle = if p1.isImageLoading then frozen elseif p1.isPictogram then var1.Color.Content.Emphasis else nil,
			cornerRadius = p1.cornerRadii
		}) else nil,
		Overlay = if p1.overlayIcon then reactModule.createElement(view, {
			tag = "row align-x-center align-y-center position-center-center anchor-center-center size-1200-1200 radius-circle bg-over-media-0",
			testId = "AssetCardMediaOverlay",
			ZIndex = 3
		}, {
			Icon = reactModule.createElement(icon, {
				name = p1.overlayIcon,
				size = iconSize.Medium,
				style = var1.Color.Content.Emphasis
			})
		}) else nil
	})
end

local function SkeletonRow(p1)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(view, {
		tag = `row align-y-center {p1.heightTag}`,
		LayoutOrder = p1.LayoutOrder
	}, {
		Skeleton = reactModule.createElement(skeleton, {
			Size = UDim2.fromScale(p1.width, 1),
			radius = radius.Small,
			testId = p1.testId
		})
	})
end

local function Title(p1)
	-- upvalues: useTokens (ref), useTextSizeOffset (ref), reactModule (ref), SkeletonRow (ref), text (ref)
	local var1 = useTokens()
	local var2 = useTextSizeOffset()
	
	if p1.isLoading then
		return reactModule.createElement(SkeletonRow, {
			heightTag = "size-full-500",
			width = 0.6,
			testId = "AssetCardTitleSkeleton",
			LayoutOrder = p1.LayoutOrder
		})
	elseif p1.text == nil then
		return nil
	end
	local titleMedium = var1.Typography.TitleMedium
	
	return reactModule.createElement(text, {
		testId = "AssetCardTitle",
		tag = {
			["size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis"] = true,
			["text-wrap"] = p1.maxLines > 1
		},
		Text = p1.text,
		sizeConstraint = if p1.maxLines > 1 then {
			MaxSize = Vector2.new(1e999, math.ceil((titleMedium.FontSize + var2) * titleMedium.LineHeight * p1.maxLines))
		} else nil,
		LayoutOrder = p1.LayoutOrder
	})
end

local function Subtitle(p1)
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconSize (ref), skeleton (ref), radius (ref), text (ref)
	return if p1.isLoading or p1.text ~= nil then reactModule.createElement(view, {
		testId = "AssetCardSubtitle",
		tag = {
			["row align-y-center gap-xsmall"] = true,
			["size-full-500"] = p1.isLoading,
			["size-full-0 auto-y"] = not p1.isLoading
		},
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = if p1.icon then reactModule.createElement(icon, {
			testId = "AssetCardSubtitleIcon",
			LayoutOrder = 1,
			name = p1.icon,
			size = iconSize.Small
		}) else nil,
		Text = if p1.isLoading then reactModule.createElement(skeleton, {
			testId = "AssetCardSubtitleSkeleton",
			LayoutOrder = 2,
			Size = UDim2.fromScale(0.7, 1),
			radius = radius.Small
		}) else reactModule.createElement(text, {
			tag = "fill auto-y text-body-medium text-align-x-left text-truncate-end content-default",
			LayoutOrder = 2,
			Text = p1.text
		})
	}) else nil
end

local function GameStat(p1)
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall auto-xy",
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(icon, { LayoutOrder = 1, name = p1.icon, size = iconSize.Small }),
		Text = reactModule.createElement(text, {
			tag = "auto-xy text-body-small content-default",
			LayoutOrder = 2,
			Text = p1.text
		})
	})
end

local function GameStats(p1)
	-- upvalues: reactModule (ref), SkeletonRow (ref), view (ref), GameStat (ref), iconName (ref)
	return if p1.isLoading then reactModule.createElement(SkeletonRow, {
		heightTag = "size-full-400",
		width = 0.4,
		testId = "AssetCardGameStatsSkeleton",
		LayoutOrder = p1.LayoutOrder
	}) elseif p1.rating == nil and p1.playerCount == nil then nil else reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-full-0 auto-y",
		testId = "AssetCardGameStats",
		LayoutOrder = p1.LayoutOrder
	}, {
		Rating = if p1.rating then reactModule.createElement(GameStat, {
			LayoutOrder = 1,
			icon = iconName.ThumbUp,
			text = p1.rating
		}) else nil,
		PlayerCount = if p1.playerCount then reactModule.createElement(GameStat, {
			LayoutOrder = 2,
			icon = iconName.PersonPlay,
			text = p1.playerCount
		}) else nil
	})
end

local function ActionButton(p1)
	-- upvalues: reactModule (ref), button (ref), buttonVariant (ref), inputSize (ref), iconButton (ref)
	return if p1.label then reactModule.createElement(button, {
		testId = "AssetCardAction",
		text = p1.label,
		icon = p1.icon,
		variant = buttonVariant.Standard,
		size = inputSize.Small,
		onActivated = p1.onActivated,
		Selectable = p1.isSelectable,
		LayoutOrder = p1.LayoutOrder
	}) elseif p1.icon == nil then nil else reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "AssetCardAction",
		icon = p1.icon,
		variant = buttonVariant.Emphasis,
		size = inputSize.Medium,
		onActivated = p1.onActivated,
		Selectable = p1.isSelectable,
		LayoutOrder = p1.LayoutOrder
	})
end

return reactModule.memo(function(value)
	-- upvalues: useTokens (ref), useScaledValue (ref), constantsModule (ref), status (ref), getGroupCornerRadiiModule (ref), reactModule (ref), view (ref), ErrorContent (ref), Media (ref), Title (ref), Subtitle (ref), GameStats (ref), ActionButton (ref)
	local createElement_1
	local var1 = useTokens()
	local var2 = useScaledValue(constantsModule.AssetCard.WIDTH)
	local size500 = var1.Size.Size_500
	local uDim = UDim.new(0, size500)
	local media = value.media
	local footer = value.footer
	local var3 = value.status == status.Ready
	local var4 = value.status == status.Error
	local isSelectable = var3 and media.isSelectable
	local var5 = getGroupCornerRadiiModule(value.groupShape, size500)
	local var6 = if footer then {
		bottomLeft = 0,
		bottomRight = 0,
		topLeft = var5.topLeft,
		topRight = var5.topRight
	} else var5
	local createElement = reactModule.createElement
	local t = {
		tag = "col auto-y",
		testId = "AssetCardView",
		Size = UDim2.fromOffset(var2, 0),
		backgroundStyle = var1.Color.Shift.Shift_400,
		cornerRadius = var5,
		LayoutOrder = value.LayoutOrder
	}
	local t_1 = {
		Error = if var4 then reactModule.createElement(ErrorContent, { text = value.errorText }) else nil,
		Media = if not var4 then reactModule.createElement(Media, {
			LayoutOrder = 1,
			image = if var3 then media.image else nil,
			isImageLoading = media.isLoading == true,
			aspectRatio = media.aspectRatio,
			isPictogram = media.isPictogram == true,
			overlayIcon = media.overlayIcon,
			onActivated = media.onActivated,
			isDisabled = not var3,
			isSelectable = isSelectable,
			width = var2,
			cornerRadii = var6,
			cursorRadius = uDim,
			mediaRef = if isSelectable then value.mediaRef else nil
		}) else nil
	}
	
	if var4 or not footer then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-medium",
			testId = "AssetCardFooter",
			LayoutOrder = 2
		}, {
			TextColumn = reactModule.createElement(view, {
				tag = "col fill gap-xsmall auto-y",
				testId = "AssetCardFooterText",
				LayoutOrder = 1,
				onActivated = footer.onActivated,
				isDisabled = not var3,
				selection = { Selectable = false },
				cursor = { radius = uDim }
			}, {
				Title = reactModule.createElement(Title, {
					LayoutOrder = 1,
					text = footer.titleText,
					maxLines = footer.titleMaxLines or 1,
					isLoading = footer.isTitleLoading == true
				}),
				Subtitle = reactModule.createElement(Subtitle, {
					LayoutOrder = 2,
					text = footer.subtitleText,
					icon = footer.subtitleIcon,
					isLoading = footer.isSubtitleLoading == true
				}),
				GameStats = reactModule.createElement(GameStats, {
					LayoutOrder = 3,
					rating = if footer.gameStats then footer.gameStats.rating else nil,
					playerCount = if footer.gameStats then footer.gameStats.playerCount else nil,
					isLoading = footer.isGameStatsLoading == true
				})
			}),
			Action = if var3 and footer.action then reactModule.createElement(ActionButton, {
				LayoutOrder = 2,
				label = footer.action.label,
				icon = footer.action.icon,
				onActivated = footer.action.onActivated,
				isSelectable = footer.action.isSelectable
			}) else nil
		})
	end
	t_1.Footer = createElement_1
	
	return createElement(view, t, t_1)
end)