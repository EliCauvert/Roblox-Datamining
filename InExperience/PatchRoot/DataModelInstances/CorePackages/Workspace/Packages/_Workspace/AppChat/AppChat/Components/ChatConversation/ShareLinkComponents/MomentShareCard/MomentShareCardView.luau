local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local FFlagAppChatMomentShareCardUseFoundationImageModule = require(AppChat.Flags.FFlagAppChatMomentShareCardUseFoundationImage)
local FFlagAppChatNativeFoundationCornerRadiiModule = require(AppChat.Flags.FFlagAppChatNativeFoundationCornerRadii)
local FFlagAppChatMomentShareCardLoadingSkeletonsModule = require(AppChat.Flags.FFlagAppChatMomentShareCardLoadingSkeletons)
local FFlagAppChatMomentShareCardHideMomentsGlyphModule = require(AppChat.Flags.FFlagAppChatMomentShareCardHideMomentsGlyph)
local FFlagAppChatMomentShareCardUseFoundationImageModule1 = FFlagAppChatNativeFoundationCornerRadiiModule and FFlagAppChatMomentShareCardUseFoundationImageModule
local GameCardErrorModule = require(script.Parent.Parent.GameCardComponents.GameCardError)
local MomentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)
local MomentShareCardUnavailableModule = require(script.Parent.MomentShareCardUnavailable)

local function _(Offset) --[[ Line: 54 | Named "toUDim" ]]
	return if type(Offset) == "number" then UDim.new(0, Offset) else Offset
end

local function roundedCorner(CornerRadii) --[[ Line: 58 ]]
	-- upvalues: ReactModule (copy)
	if CornerRadii == nil then
		return nil
	else
		local TopLeft = CornerRadii.topLeft
		local _UDim = if type(TopLeft) == "number" then UDim.new(0, TopLeft) else TopLeft
		local TopRight = CornerRadii.topRight
		local _UDim1 = if type(TopRight) == "number" then UDim.new(0, TopRight) else TopRight
		local BottomLeft = CornerRadii.bottomLeft
		local _UDim2 = if type(BottomLeft) == "number" then UDim.new(0, BottomLeft) else BottomLeft
		local BottomRight = CornerRadii.bottomRight
		
		return ReactModule.createElement("UICorner", {
			TopLeftRadius = _UDim,
			TopRightRadius = _UDim1,
			BottomLeftRadius = _UDim2,
			BottomRightRadius = if type(BottomRight) == "number" then UDim.new(0, BottomRight) else BottomRight
		})
	end
end

return ReactModule.memo(function(Frame) --[[ Line: 70 | Named "MomentShareCardView" ]]
	-- upvalues: MomentDetailsStatusModule (copy), ReactModule (copy), GameCardErrorModule (copy), MomentShareCardUnavailableModule (copy), View (copy), roundedCorner (copy), Skeleton (copy), Radius (copy), FFlagAppChatMomentShareCardUseFoundationImageModule1 (copy), Image (copy), Icon (copy), IconName (copy), IconSize (copy), FFlagAppChatNativeFoundationCornerRadiiModule (copy), FFlagAppChatMomentShareCardLoadingSkeletonsModule (copy), Text (copy), FFlagAppChatMomentShareCardHideMomentsGlyphModule (copy)
	return if Frame.status == MomentDetailsStatusModule.Error then ReactModule.createElement(GameCardErrorModule) elseif Frame.status == MomentDetailsStatusModule.Unavailable or Frame.status == MomentDetailsStatusModule.Locked then ReactModule.createElement(MomentShareCardUnavailableModule) else ReactModule.createElement(View, {
		tag = "col auto-y",
		testId = "MomentShareCardView",
		Size = UDim2.fromOffset(Frame.mediaSize, 0),
		LayoutOrder = Frame.LayoutOrder
	}, {
		MomentSharePlaceholder = ReactModule.createElement(View, {
			tag = "clip",
			testId = "MomentSharePlaceholder",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(Frame.mediaSize, Frame.mediaSize)
		}, {
			MomentShareCardPoster = if Frame.hasMedia then ReactModule.createElement(View, { tag = "size-full", testId = "MomentShareCardPoster" }, {
				ShimmerClip = if Frame.isPosterLoaded then nil else ReactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 1,
					[ReactModule.Tag] = "data-testid=MomentShareCardPosterShimmer"
				}, {
					Corner = roundedCorner(Frame.cornerRadii),
					Shimmer = ReactModule.createElement(Skeleton, { radius = Radius.None, Size = UDim2.fromScale(1, 1) })
				}),
				Poster = if Frame.posterContent == nil then nil elseif FFlagAppChatMomentShareCardUseFoundationImageModule1 then ReactModule.createElement(Image, {
					tag = "size-full",
					ZIndex = 2,
					testId = "MomentShareCardPosterImage",
					ImageContent = Frame.posterContent,
					ScaleType = Enum.ScaleType.Crop,
					cornerRadius = Frame.cornerRadii
				}) else ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ImageContent = Frame.posterContent,
					ScaleType = Enum.ScaleType.Crop,
					ZIndex = 2,
					[ReactModule.Tag] = "data-testid=MomentShareCardPosterImage"
				}, { Corner = roundedCorner(Frame.cornerRadii) })
			}) else nil,
			MomentSharePlayButton = if Frame.isVideo then ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center position-center-center anchor-center-center size-1200-1200 radius-circle clip bg-over-media-0",
				testId = "MomentSharePlayButton",
				ZIndex = 2
			}, {
				Glyph = ReactModule.createElement(Icon, {
					name = IconName.PlayLarge,
					size = IconSize.Medium,
					style = Frame.playIconStyle
				})
			}) else nil,
			InteractionOverlay = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "MomentShareInteractionOverlay",
				ZIndex = 3,
				onActivated = Frame.onActivated,
				cornerRadius = if FFlagAppChatNativeFoundationCornerRadiiModule then Frame.cornerRadii else nil,
				selection = { Selectable = Frame.selectable }
			}, {
				Corner = if FFlagAppChatNativeFoundationCornerRadiiModule then nil else roundedCorner(Frame.cornerRadii)
			})
		}),
		Footer = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y padding-medium",
			testId = "MomentShareFooter",
			LayoutOrder = 2
		}, {
			Username = if FFlagAppChatMomentShareCardLoadingSkeletonsModule and Frame.isUsernameLoading then ReactModule.createElement(View, {
				tag = "row align-y-center size-full-500",
				LayoutOrder = 1
			}, {
				Skeleton = ReactModule.createElement(Skeleton, {
					testId = "MomentShareUsernameSkeleton",
					Size = UDim2.fromScale(0.6, 1),
					radius = Radius.Small
				})
			}) elseif Frame.username then ReactModule.createElement(Text, {
				tag = "size-full-500 text-title-medium text-align-x-left text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = Frame.username
			}) else nil,
			Metadata = if Frame.metadataText or FFlagAppChatMomentShareCardLoadingSkeletonsModule and Frame.isMetadataLoading then ReactModule.createElement(View, {
				tag = "row align-y-center gap-xsmall size-full-500",
				testId = "MomentShareMetadata",
				LayoutOrder = 2
			}, {
				MomentsGlyph = if FFlagAppChatMomentShareCardHideMomentsGlyphModule then nil else ReactModule.createElement(Icon, {
					testId = "MomentShareMomentsGlyph",
					LayoutOrder = 1,
					name = IconName.Moments,
					size = IconSize.Small
				}),
				MetadataText = if FFlagAppChatMomentShareCardLoadingSkeletonsModule and Frame.isMetadataLoading then ReactModule.createElement(Skeleton, {
					testId = "MomentShareMetadataSkeleton",
					LayoutOrder = 2,
					Size = UDim2.fromScale(0.7, 1),
					radius = Radius.Small
				}) else ReactModule.createElement(Text, {
					tag = "fill auto-y text-body-medium text-align-x-left text-truncate-end content-default",
					LayoutOrder = 2,
					Text = Frame.metadataText
				})
			}) else nil
		})
	})
end)