local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local image = foundationModule.Image
local text = foundationModule.Text
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
local fFlagAppChatMomentShareCardUseFoundationImageModule = require(appChat.Flags.FFlagAppChatMomentShareCardUseFoundationImage)
local fFlagAppChatNativeFoundationCornerRadiiModule = require(appChat.Flags.FFlagAppChatNativeFoundationCornerRadii)
local fFlagAppChatMomentShareCardLoadingSkeletonsModule = require(appChat.Flags.FFlagAppChatMomentShareCardLoadingSkeletons)
local fFlagAppChatMomentShareCardUseFoundationImageModule_1 = fFlagAppChatNativeFoundationCornerRadiiModule and (foundationModule.Utility.Flags.FoundationImageContentSupport and fFlagAppChatMomentShareCardUseFoundationImageModule)
local gameCardErrorModule = require(script.Parent.Parent.GameCardComponents.GameCardError)
local momentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)

local function _(p1)
	return if type(p1) == "number" then UDim.new(0, p1) else p1
end

local function roundedCorner(value)
	-- upvalues: reactModule (ref)
	if value == nil then
		return nil
	end
	local createElement = reactModule.createElement
	local var1 = "UICorner"
	local t = {}
	local topLeft = value.topLeft
	t.TopLeftRadius = if type(topLeft) == "number" then UDim.new(0, topLeft) else topLeft
	local topRight = value.topRight
	t.TopRightRadius = if type(topRight) == "number" then UDim.new(0, topRight) else topRight
	local bottomLeft = value.bottomLeft
	t.BottomLeftRadius = if type(bottomLeft) == "number" then UDim.new(0, bottomLeft) else bottomLeft
	local bottomRight = value.bottomRight
	t.BottomRightRadius = if type(bottomRight) == "number" then UDim.new(0, bottomRight) else bottomRight
	
	return createElement(var1, t)
end

return reactModule.memo(function(p1)
	-- upvalues: momentDetailsStatusModule (ref), reactModule (ref), gameCardErrorModule (ref), view (ref), roundedCorner (ref), skeleton (ref), radius (ref), fFlagAppChatMomentShareCardUseFoundationImageModule_1 (ref), image (ref), icon (ref), iconName (ref), iconSize (ref), fFlagAppChatNativeFoundationCornerRadiiModule (ref), fFlagAppChatMomentShareCardLoadingSkeletonsModule (ref), text (ref)
	if p1.status == momentDetailsStatusModule.Error then
		return reactModule.createElement(gameCardErrorModule)
	end
	local var1
	local createElement = reactModule.createElement
	local t = {
		tag = "col auto-y",
		testId = "MomentShareCardView",
		Size = UDim2.fromOffset(p1.mediaSize, 0),
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = {
		MomentSharePlaceholder = reactModule.createElement(view, {
			tag = "clip",
			testId = "MomentSharePlaceholder",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p1.mediaSize, p1.mediaSize)
		}, {
			MomentShareCardPoster = if p1.hasMedia then reactModule.createElement(view, { tag = "size-full", testId = "MomentShareCardPoster" }, {
				ShimmerClip = if not p1.isPosterLoaded then reactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 1,
					[reactModule.Tag] = "data-testid=MomentShareCardPosterShimmer"
				}, {
					Corner = roundedCorner(p1.cornerRadii),
					Shimmer = reactModule.createElement(skeleton, { radius = radius.None, Size = UDim2.fromScale(1, 1) })
				}) else nil,
				Poster = if p1.posterContent ~= nil then nil elseif fFlagAppChatMomentShareCardUseFoundationImageModule_1 then reactModule.createElement(image, {
					tag = "size-full",
					ZIndex = 2,
					testId = "MomentShareCardPosterImage",
					ImageContent = p1.posterContent,
					ScaleType = Enum.ScaleType.Crop,
					cornerRadius = p1.cornerRadii
				}) else reactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ImageContent = p1.posterContent,
					ScaleType = Enum.ScaleType.Crop,
					ZIndex = 2,
					[reactModule.Tag] = "data-testid=MomentShareCardPosterImage"
				}, { Corner = roundedCorner(p1.cornerRadii) })
			}) else nil,
			MomentSharePlayButton = if p1.isVideo then reactModule.createElement(view, {
				tag = "row align-x-center align-y-center position-center-center anchor-center-center size-1200-1200 radius-circle clip bg-over-media-0",
				testId = "MomentSharePlayButton",
				ZIndex = 2
			}, {
				Glyph = reactModule.createElement(icon, {
					name = iconName.PlayLarge,
					size = iconSize.Medium,
					style = p1.playIconStyle
				})
			}) else nil,
			InteractionOverlay = reactModule.createElement(view, {
				tag = "size-full",
				testId = "MomentShareInteractionOverlay",
				ZIndex = 3,
				onActivated = p1.onActivated,
				cornerRadius = if fFlagAppChatNativeFoundationCornerRadiiModule then p1.cornerRadii else nil,
				selection = { Selectable = p1.selectable }
			}, {
				Corner = if not fFlagAppChatNativeFoundationCornerRadiiModule then roundedCorner(p1.cornerRadii) else nil
			})
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		tag = "col size-full-0 auto-y padding-medium",
		testId = "MomentShareFooter",
		LayoutOrder = 2
	}
	local t_3 = {
		Username = if fFlagAppChatMomentShareCardLoadingSkeletonsModule and p1.isUsernameLoading then reactModule.createElement(view, {
			tag = "row align-y-center size-full-500",
			LayoutOrder = 1
		}, {
			Skeleton = reactModule.createElement(skeleton, {
				testId = "MomentShareUsernameSkeleton",
				Size = UDim2.fromScale(0.6, 1),
				radius = radius.Small
			})
		}) elseif p1.username then reactModule.createElement(text, {
			tag = "size-full-500 text-title-medium text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 1,
			Text = p1.username
		}) else nil
	}
	
	if p1.metadataText or fFlagAppChatMomentShareCardLoadingSkeletonsModule and p1.isMetadataLoading then
		var1 = reactModule.createElement
		var1 = var1(view, {
			tag = "row align-y-center gap-xsmall size-full-500",
			testId = "MomentShareMetadata",
			LayoutOrder = 2
		}, {
			MomentsGlyph = reactModule.createElement(icon, {
				testId = "MomentShareMomentsGlyph",
				LayoutOrder = 1,
				name = iconName.Moments,
				size = iconSize.Small
			}),
			MetadataText = if fFlagAppChatMomentShareCardLoadingSkeletonsModule and p1.isMetadataLoading then reactModule.createElement(skeleton, {
				testId = "MomentShareMetadataSkeleton",
				LayoutOrder = 2,
				Size = UDim2.fromScale(0.7, 1),
				radius = radius.Small
			}) else reactModule.createElement(text, {
				tag = "fill auto-y text-body-medium text-align-x-left text-truncate-end content-default",
				LayoutOrder = 2,
				Text = p1.metadataText
			})
		})
	else
		var1 = nil
	end
	t_3.Metadata = var1
	t_1.Footer = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end)