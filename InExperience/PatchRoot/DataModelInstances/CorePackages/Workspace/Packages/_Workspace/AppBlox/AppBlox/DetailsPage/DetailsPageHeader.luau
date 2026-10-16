local Parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local ActionBar = UIBloxModule.App.Button.ActionBar
local DeviceType = require(Parent.RobloxAppEnums).DeviceType
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local DetailsPageTitleContentModule = require(script.Parent.DetailsPageTitleContent)
local FFlagLuaAppFixDetailsPageThumbnailRenderInPhone = require(Parent.SharedFlags).FFlagLuaAppFixDetailsPageThumbnailRenderInPhone
local LuaAppBottomAlignDetailsHeaderInfoFrame = game:DefineFastFlag("LuaAppBottomAlignDetailsHeaderInfoFrame", false)
local FFlagUIBloxEnableActionBarButtonOverride = require(Parent.SharedFlags).UIBlox.FFlagUIBloxEnableActionBarButtonOverride
local FFlagUIBloxAddTestIdToActionBar = require(Parent.SharedFlags).UIBlox.FFlagUIBloxAddTestIdToActionBar
local FFlagFixDetailsPageIconShadowSlicing = game:DefineFastFlag("FFlagFixDetailsPageIconShadowSlicing", false)
local DetailsPageHeader = RoactModule.PureComponent:extend("DetailsPageHeader")
DetailsPageHeader.defaultProps = {
	thumbnailHeight = 200,
	actionBarHeight = 48,
	actionBarWidth = 380,
	thumbnailAspectRatio = Vector2.new(1, 1)
}
DetailsPageHeader.validateProps = TModule.strictInterface({
	thumbnailImageUrl = TModule.optional(TModule.string),
	thumbnailAspectRatio = TModule.optional(TModule.Vector2),
	thumbnailHeight = TModule.optional(TModule.number),
	titleText = TModule.optional(TModule.string),
	subTitleText = TModule.optional(TModule.string),
	actionBarLabelText = TModule.optional(TModule.string),
	renderInfoContent = TModule.optional(TModule.callback),
	renderCustomHeader = TModule.optional(TModule.callback),
	headerBarBackgroundHeight = TModule.optional(TModule.number),
	sideMargin = TModule.optional(TModule.number),
	itemPadding = TModule.optional(TModule.number),
	bottomMargin = TModule.optional(TModule.number),
	gradientHeight = TModule.optional(TModule.number),
	thumbnailShadowHeight = TModule.optional(TModule.number),
	actionBarHeight = TModule.optional(TModule.number),
	actionBarWidth = TModule.optional(TModule.number),
	maxContentWidth = TModule.optional(TModule.number),
	actionBarProps = TModule.optional(TModule.table),
	renderActionBarLabelImpressionsDetector = TModule.optional(TModule.callback),
	scrollViewPositionChangedSignal = TModule.optional(TModule.table),
	deviceType = TModule.optional(TModule.string)
})

function DetailsPageHeader.init(p1) --[[ Line: 83 ]]
	-- upvalues: RoactModule (copy)
	p1.actionBarLabelRef = RoactModule.createRef()
end

function DetailsPageHeader.renderThumbnail(p1, p2, ThumbnailShadowHeight: number, XOffset, YOffset) --[[ Line: 87 ]]
	-- upvalues: RoactModule (copy), LoadableImage (copy), ImageSetLabel (copy), Images (copy), FFlagFixDetailsPageIconShadowSlicing (copy)
	return RoactModule.createElement("Frame", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(XOffset, YOffset),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0)
	}, {
		ThumbnailTile = RoactModule.createElement(LoadableImage, {
			cornerRadius = UDim.new(0, 8),
			Size = UDim2.fromScale(1, 1),
			Image = p1.props.thumbnailImageUrl
		}),
		DropShadow = if ThumbnailShadowHeight > 0 then RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 28),
			Position = UDim2.fromScale(0, 1),
			Image = Images["component_assets/dropshadow_thumbnail_28"],
			ImageColor3 = p2.Theme.DropShadow.Color,
			ImageTransparency = p2.Theme.DropShadow.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = if FFlagFixDetailsPageIconShadowSlicing then Rect.new(32, 0, 33, 1) else Rect.new(32, 0, 33, 28)
		}) else nil
	})
end

function DetailsPageHeader.renderDesktopMode(p1, p2) --[[ Line: 117 ]]
	-- upvalues: RoactModule (copy), LuaAppBottomAlignDetailsHeaderInfoFrame (copy), DetailsPageTitleContentModule (copy), ActionBar (copy), FFlagUIBloxEnableActionBarButtonOverride (copy), FFlagUIBloxAddTestIdToActionBar (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local ThumbnailHeight = p1.props.thumbnailHeight
	local ScaledThumbnailHeight = ThumbnailHeight * (p1.props.thumbnailAspectRatio.X / p1.props.thumbnailAspectRatio.Y)
	local SideMargin = p1.props.sideMargin or 48
	local ItemPadding = p1.props.itemPadding or 24
	local ThumbnailShadowHeight = if p1.props.thumbnailShadowHeight == nil then 28 else p1.props.thumbnailShadowHeight
	local Frame = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, -(ScaledThumbnailHeight + SideMargin * 2), 1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, if p1.props.renderCustomHeader then p1.props.renderCustomHeader() else {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = if LuaAppBottomAlignDetailsHeaderInfoFrame then Enum.VerticalAlignment.Bottom else Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, 16)
		}),
		TitleInfo = RoactModule.createElement(DetailsPageTitleContentModule, {
			layoutOrder = 1,
			titleText = p1.props.titleText,
			subTitleText = p1.props.subTitleText,
			renderInfoContent = p1.props.renderInfoContent,
			verticalAlignment = Enum.VerticalAlignment.Top
		}),
		ActonBarFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromOffset(p1.props.actionBarWidth, p1.props.actionBarHeight)
		}, {
			ActionBar = p1.props.actionBarProps and RoactModule.createElement(ActionBar, {
				enableButtonAtStart = true,
				button = p1.props.actionBarProps.button,
				buttonOverride = if FFlagUIBloxEnableActionBarButtonOverride then p1.props.actionBarProps.buttonOverride else nil,
				icons = p1.props.actionBarProps.icons,
				iconSize = p1.props.actionBarProps.iconSize,
				buttonHeight = p1.props.actionBarProps.buttonHeight,
				buttonPadding = p1.props.actionBarProps.buttonPadding,
				textButtons = p1.props.actionBarProps.textButtons,
				marginOverride = { left = 0, right = 0, top = 0, bottom = 0 },
				horizontalAlignment = Enum.HorizontalAlignment.Left,
				testId = if FFlagUIBloxAddTestIdToActionBar then "--experience-details" else nil
			}) or nil
		}),
		ActionBarLabel = if p1.props.actionBarLabelText then RoactModule.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1.props.actionBarLabelText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Font = if FoundationFontFaceMigration then nil else p2.Tokens.Typography.BodyLarge.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
			TextSize = p2.Tokens.FontSize.FontSize_350,
			TextColor3 = p2.Tokens.Color.Content.Emphasis.Color3,
			TextTransparency = p2.Tokens.Color.Content.Emphasis.Transparency,
			LayoutOrder = 3,
			[RoactModule.Ref] = p1.actionBarLabelRef
		}) else nil,
		ActionBarLabelImpressionsDetector = if p1.props.actionBarLabelText and p1.props.renderActionBarLabelImpressionsDetector then p1.props.renderActionBarLabelImpressionsDetector(p1.actionBarLabelRef, p1.props.scrollViewPositionChangedSignal) else nil
	})
	
	return {
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SideMargin),
			PaddingRight = UDim.new(0, SideMargin),
			PaddingBottom = UDim.new(0, 16)
		}),
		ContentFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(0.5, 1)
		}, if p1.props.renderCustomHeader then {
			CustomHeader = p1.props.renderCustomHeader(),
			UISizeConstraint = if p1.props.maxContentWidth then RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maxContentWidth, 1e999) }) else nil
		} else {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, ItemPadding)
			}),
			ThumbnailTileFrame = p1:renderThumbnail(p2, ThumbnailShadowHeight, ScaledThumbnailHeight, ThumbnailHeight),
			InfoFrame = Frame,
			UISizeConstraint = if p1.props.maxContentWidth then RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maxContentWidth, 1e999) }) else nil
		})
	}
end

function DetailsPageHeader.renderisPhone(p1, p2) --[[ Line: 257 ]]
	-- upvalues: RoactModule (copy), FFlagLuaAppFixDetailsPageThumbnailRenderInPhone (copy)
	local ThumbnailHeight = p1.props.thumbnailHeight
	local ScaledThumbnailHeight = ThumbnailHeight * (p1.props.thumbnailAspectRatio.X / p1.props.thumbnailAspectRatio.Y)
	local SideMargin = p1.props.sideMargin or 24
	
	return if p1.props.renderCustomHeader then {
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SideMargin),
			PaddingRight = UDim.new(0, SideMargin),
			PaddingBottom = UDim.new(0, 16)
		}),
		ContentFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		}, { Content = p1.props.renderCustomHeader() })
	} else {
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SideMargin),
			PaddingRight = UDim.new(0, SideMargin),
			PaddingBottom = UDim.new(0, 16)
		}),
		ThumbnailTileFrame = if FFlagLuaAppFixDetailsPageThumbnailRenderInPhone then p1:renderThumbnail(p2, 0, ScaledThumbnailHeight, ThumbnailHeight) else p1:renderThumbnail(p2, ScaledThumbnailHeight, ThumbnailHeight)
	}
end

function DetailsPageHeader.render(p1) --[[ Line: 295 ]]
	-- upvalues: DeviceType (copy), WithStyleFunction (copy), RoactModule (copy)
	local IsDeviceTypeMatch = p1.props.deviceType == DeviceType.Phone
	local ThumbnailHeight: number = p1.props.thumbnailHeight
	local HeaderBarBackgroundHeight = p1.props.headerBarBackgroundHeight or 80
	local GradientHeight = p1.props.gradientHeight or ThumbnailHeight + 16 - HeaderBarBackgroundHeight + 44
	local BottomMargin = p1.props.bottomMargin
	
	return WithStyleFunction(function(p2) --[[ Line: 305 ]]
		-- upvalues: RoactModule (upval), GradientHeight (copy), HeaderBarBackgroundHeight (copy), IsDeviceTypeMatch (copy), p1 (copy), ThumbnailHeight (copy), BottomMargin (copy)
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}),
			GradientBar = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, GradientHeight),
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				AnchorPoint = Vector2.new(0, 1)
			}, {
				Gradient = RoactModule.createElement("UIGradient", {
					Rotation = 270,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(0.5, 0.25),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}),
			BackgroundBar = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, HeaderBarBackgroundHeight),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency
			}, IsDeviceTypeMatch and p1:renderisPhone(p2, ThumbnailHeight) or p1:renderDesktopMode(p2, ThumbnailHeight)),
			Padding = if BottomMargin then RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, BottomMargin)
			}) else nil
		})
	end)
end

return DetailsPageHeader