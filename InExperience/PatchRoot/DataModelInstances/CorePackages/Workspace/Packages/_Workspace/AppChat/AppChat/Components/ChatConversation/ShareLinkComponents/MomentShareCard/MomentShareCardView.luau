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
local fFlagAppChatNativeFoundationCornerRadiiModule = require(appChat.Flags.FFlagAppChatNativeFoundationCornerRadii)
local fFlagAppChatMomentShareCardUseFoundationImage = fFlagAppChatNativeFoundationCornerRadiiModule and (foundationModule.Utility.Flags.FoundationImageContentSupport and require(appChat.Flags.FFlagAppChatMomentShareCardUseFoundationImage))
local gameCardErrorModule = require(script.Parent.Parent.GameCardComponents.GameCardError)

local function _(p0)
	return if type(p0) == "number" then UDim.new(0, p0) else p0
end

local function roundedCorner(value)
	-- upvalues: reactModule (ref)
	if value == nil then
		return nil
	end
	local createElement = reactModule.createElement
	local var7 = "UICorner"
	local t = {}
	local topLeft = value.topLeft
	t.TopLeftRadius = if type(topLeft) == "number" then UDim.new(0, topLeft) else topLeft
	local topRight = value.topRight
	t.TopRightRadius = if type(topRight) == "number" then UDim.new(0, topRight) else topRight
	local bottomLeft = value.bottomLeft
	t.BottomLeftRadius = if type(bottomLeft) == "number" then UDim.new(0, bottomLeft) else bottomLeft
	local bottomRight = value.bottomRight
	t.BottomRightRadius = if type(bottomRight) == "number" then UDim.new(0, bottomRight) else bottomRight
	
	return createElement(var7, t)
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), gameCardErrorModule (ref), view (ref), roundedCorner (ref), skeleton (ref), radius (ref), fFlagAppChatMomentShareCardUseFoundationImage (ref), image (ref), icon (ref), iconName (ref), iconSize (ref), fFlagAppChatNativeFoundationCornerRadiiModule (ref), text (ref)
	return if p1.status == "error" then reactModule.createElement(gameCardErrorModule) else reactModule.createElement(view, {
		tag = "col auto-y",
		testId = "MomentShareCardView",
		Size = UDim2.fromOffset(p1.mediaSize, 0),
		LayoutOrder = p1.LayoutOrder
	}, {
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
				Poster = if p1.posterContent ~= nil then nil elseif fFlagAppChatMomentShareCardUseFoundationImage then reactModule.createElement(image, {
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
		}),
		Footer = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y padding-medium",
			testId = "MomentShareFooter",
			LayoutOrder = 2
		}, {
			Username = if p1.username then reactModule.createElement(text, {
				tag = "size-full-500 text-title-medium text-align-x-left text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = p1.username
			}) else nil,
			Metadata = if p1.metadataText then reactModule.createElement(view, {
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
				MetadataText = reactModule.createElement(text, {
					tag = "fill auto-y text-body-medium text-align-x-left text-truncate-end content-default",
					LayoutOrder = 2,
					Text = p1.metadataText
				})
			}) else nil
		})
	})
end)