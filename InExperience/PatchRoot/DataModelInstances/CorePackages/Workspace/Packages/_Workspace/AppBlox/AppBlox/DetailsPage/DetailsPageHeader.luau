local parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(parent.UIBlox)
local withStyle = UIBloxModule.Core.Style.withStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local actionBar = UIBloxModule.App.Button.ActionBar
local deviceType = require(parent.RobloxAppEnums).DeviceType
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local detailsPageTitleContentModule = require(script.Parent.DetailsPageTitleContent)
local fFlagLuaAppFixDetailsPageThumbnailRenderInPhone = require(parent.SharedFlags).FFlagLuaAppFixDetailsPageThumbnailRenderInPhone
local luaAppBottomAlignDetailsHeaderInfoFrame = game:DefineFastFlag("LuaAppBottomAlignDetailsHeaderInfoFrame", false)
local fFlagUIBloxEnableActionBarButtonOverride = require(parent.SharedFlags).UIBlox.FFlagUIBloxEnableActionBarButtonOverride
local fFlagUIBloxAddTestIdToActionBar = require(parent.SharedFlags).UIBlox.FFlagUIBloxAddTestIdToActionBar
local fFlagFixDetailsPageIconShadowSlicing = game:DefineFastFlag("FFlagFixDetailsPageIconShadowSlicing", false)
local detailsPageHeader = roactModule.PureComponent:extend("DetailsPageHeader")
detailsPageHeader.defaultProps = {
	thumbnailHeight = 200,
	actionBarHeight = 48,
	actionBarWidth = 380,
	thumbnailAspectRatio = Vector2.new(1, 1)
}
detailsPageHeader.validateProps = tModule.strictInterface({
	thumbnailImageUrl = tModule.optional(tModule.string),
	thumbnailAspectRatio = tModule.optional(tModule.Vector2),
	thumbnailHeight = tModule.optional(tModule.number),
	titleText = tModule.optional(tModule.string),
	subTitleText = tModule.optional(tModule.string),
	actionBarLabelText = tModule.optional(tModule.string),
	renderInfoContent = tModule.optional(tModule.callback),
	renderCustomHeader = tModule.optional(tModule.callback),
	headerBarBackgroundHeight = tModule.optional(tModule.number),
	sideMargin = tModule.optional(tModule.number),
	itemPadding = tModule.optional(tModule.number),
	bottomMargin = tModule.optional(tModule.number),
	gradientHeight = tModule.optional(tModule.number),
	thumbnailShadowHeight = tModule.optional(tModule.number),
	actionBarHeight = tModule.optional(tModule.number),
	actionBarWidth = tModule.optional(tModule.number),
	maxContentWidth = tModule.optional(tModule.number),
	actionBarProps = tModule.optional(tModule.table),
	renderActionBarLabelImpressionsDetector = tModule.optional(tModule.callback),
	scrollViewPositionChangedSignal = tModule.optional(tModule.table),
	deviceType = tModule.optional(tModule.string)
})

function detailsPageHeader.init(p1)
	-- upvalues: roactModule (ref)
	p1.actionBarLabelRef = roactModule.createRef()
end

function detailsPageHeader.renderThumbnail(p1, p2, p3, p4, p5)
	-- upvalues: roactModule (ref), loadableImage (ref), imageSetLabel (ref), images (ref), fFlagFixDetailsPageIconShadowSlicing (ref)
	return roactModule.createElement("Frame", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(p4, p5),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0)
	}, {
		ThumbnailTile = roactModule.createElement(loadableImage, {
			cornerRadius = UDim.new(0, 8),
			Size = UDim2.fromScale(1, 1),
			Image = p1.props.thumbnailImageUrl
		}),
		DropShadow = if p3 > 0 then roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 28),
			Position = UDim2.fromScale(0, 1),
			Image = images["component_assets/dropshadow_thumbnail_28"],
			ImageColor3 = p2.Theme.DropShadow.Color,
			ImageTransparency = p2.Theme.DropShadow.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = if fFlagFixDetailsPageIconShadowSlicing then Rect.new(32, 0, 33, 1) else Rect.new(32, 0, 33, 28)
		}) else nil
	})
end

function detailsPageHeader.renderDesktopMode(p1, p2)
	-- upvalues: roactModule (ref), luaAppBottomAlignDetailsHeaderInfoFrame (ref), detailsPageTitleContentModule (ref), actionBar (ref), fFlagUIBloxEnableActionBarButtonOverride (ref), fFlagUIBloxAddTestIdToActionBar (ref)
	local thumbnailHeight = p1.props.thumbnailHeight
	local var1 = thumbnailHeight * (p1.props.thumbnailAspectRatio.X / p1.props.thumbnailAspectRatio.Y)
	local sideMargin = p1.props.sideMargin or 48
	
	return {
		Padding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, sideMargin),
			PaddingRight = UDim.new(0, sideMargin),
			PaddingBottom = UDim.new(0, 16)
		}),
		ContentFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(0.5, 1)
		}, if p1.props.renderCustomHeader then {
			CustomHeader = p1.props.renderCustomHeader(),
			UISizeConstraint = if p1.props.maxContentWidth then roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maxContentWidth, 1e999) }) else nil
		} else {
			Layout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, p1.props.itemPadding or 24)
			}),
			ThumbnailTileFrame = p1:renderThumbnail(p2, if p1.props.thumbnailShadowHeight ~= nil then p1.props.thumbnailShadowHeight else 28, var1, thumbnailHeight),
			InfoFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, -(var1 + sideMargin * 2), 1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, if p1.props.renderCustomHeader then p1.props.renderCustomHeader() else {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = if luaAppBottomAlignDetailsHeaderInfoFrame then Enum.VerticalAlignment.Bottom else Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, 16)
				}),
				TitleInfo = roactModule.createElement(detailsPageTitleContentModule, {
					layoutOrder = 1,
					titleText = p1.props.titleText,
					subTitleText = p1.props.subTitleText,
					renderInfoContent = p1.props.renderInfoContent,
					verticalAlignment = Enum.VerticalAlignment.Top
				}),
				ActonBarFrame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromOffset(p1.props.actionBarWidth, p1.props.actionBarHeight)
				}, {
					ActionBar = p1.props.actionBarProps and roactModule.createElement(actionBar, {
						enableButtonAtStart = true,
						button = p1.props.actionBarProps.button,
						buttonOverride = if fFlagUIBloxEnableActionBarButtonOverride then p1.props.actionBarProps.buttonOverride else nil,
						icons = p1.props.actionBarProps.icons,
						iconSize = p1.props.actionBarProps.iconSize,
						buttonHeight = p1.props.actionBarProps.buttonHeight,
						buttonPadding = p1.props.actionBarProps.buttonPadding,
						textButtons = p1.props.actionBarProps.textButtons,
						marginOverride = { left = 0, right = 0, top = 0, bottom = 0 },
						horizontalAlignment = Enum.HorizontalAlignment.Left,
						testId = if fFlagUIBloxAddTestIdToActionBar then "--experience-details" else nil
					}) or nil
				}),
				ActionBarLabel = if p1.props.actionBarLabelText then roactModule.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = p1.props.actionBarLabelText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Font = p2.Tokens.Typography.BodyLarge.Font,
					TextSize = p2.Tokens.FontSize.FontSize_350,
					TextColor3 = p2.Tokens.Color.Content.Emphasis.Color3,
					TextTransparency = p2.Tokens.Color.Content.Emphasis.Transparency,
					LayoutOrder = 3,
					[roactModule.Ref] = p1.actionBarLabelRef
				}) else nil,
				ActionBarLabelImpressionsDetector = if p1.props.actionBarLabelText and p1.props.renderActionBarLabelImpressionsDetector then p1.props.renderActionBarLabelImpressionsDetector(p1.actionBarLabelRef, p1.props.scrollViewPositionChangedSignal) else nil
			}),
			UISizeConstraint = if p1.props.maxContentWidth then roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maxContentWidth, 1e999) }) else nil
		})
	}
end

function detailsPageHeader.renderisPhone(p1, p2)
	-- upvalues: roactModule (ref), fFlagLuaAppFixDetailsPageThumbnailRenderInPhone (ref)
	local thumbnailHeight = p1.props.thumbnailHeight
	local var1 = thumbnailHeight * (p1.props.thumbnailAspectRatio.X / p1.props.thumbnailAspectRatio.Y)
	local sideMargin = p1.props.sideMargin or 24
	
	return if p1.props.renderCustomHeader then {
		Padding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, sideMargin),
			PaddingRight = UDim.new(0, sideMargin),
			PaddingBottom = UDim.new(0, 16)
		}),
		ContentFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		}, { Content = p1.props.renderCustomHeader() })
	} else {
		Padding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, sideMargin),
			PaddingRight = UDim.new(0, sideMargin),
			PaddingBottom = UDim.new(0, 16)
		}),
		ThumbnailTileFrame = if fFlagLuaAppFixDetailsPageThumbnailRenderInPhone then p1:renderThumbnail(p2, 0, var1, thumbnailHeight) else p1:renderThumbnail(p2, var1, thumbnailHeight)
	}
end

function detailsPageHeader.render(p1)
	-- upvalues: deviceType (ref), withStyle (ref), roactModule (ref)
	local var1 = p1.props.deviceType == deviceType.Phone
	local thumbnailHeight = p1.props.thumbnailHeight
	local headerBarBackgroundHeight = p1.props.headerBarBackgroundHeight or 80
	local gradientHeight = p1.props.gradientHeight or thumbnailHeight + 16 - headerBarBackgroundHeight + 44
	local bottomMargin = p1.props.bottomMargin
	
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), gradientHeight (ref), headerBarBackgroundHeight (ref), var1 (ref), p1 (ref), thumbnailHeight (ref), bottomMargin (ref)
		local theme = p2.Theme
		
		return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Layout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}),
			GradientBar = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, gradientHeight),
				BackgroundColor3 = theme.BackgroundDefault.Color,
				AnchorPoint = Vector2.new(0, 1)
			}, {
				Gradient = roactModule.createElement("UIGradient", {
					Rotation = 270,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(0.5, 0.25),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}),
			BackgroundBar = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, headerBarBackgroundHeight),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = theme.BackgroundDefault.Color,
				BackgroundTransparency = theme.BackgroundDefault.Transparency
			}, var1 and p1:renderisPhone(p2, thumbnailHeight) or p1:renderDesktopMode(p2, thumbnailHeight)),
			Padding = if bottomMargin then roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, bottomMargin)
			}) else nil
		})
	end)
end

return detailsPageHeader