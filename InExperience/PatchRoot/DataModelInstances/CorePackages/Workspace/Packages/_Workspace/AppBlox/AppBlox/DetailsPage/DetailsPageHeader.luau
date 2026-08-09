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
local fFlagLuaAppDesktopPlayabilityMessageFontSizeUpdate = require(parent.SharedFlags).FFlagLuaAppDesktopPlayabilityMessageFontSizeUpdate
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local fFlagLuaAppPlayButtonContextualMessageImpression = require(parent.SharedFlags).FFlagLuaAppPlayButtonContextualMessageImpression
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
	renderActionBarLabelImpressionsDetector = if fFlagLuaAppPlayButtonContextualMessageImpression then tModule.optional(tModule.callback) else nil,
	scrollViewPositionChangedSignal = if fFlagLuaAppPlayButtonContextualMessageImpression then tModule.optional(tModule.table) else nil,
	deviceType = tModule.optional(tModule.string)
})

if fFlagLuaAppPlayButtonContextualMessageImpression then
	function detailsPageHeader.init(p0) --[[ line: 90 ]]
		-- upvalues: roactModule (ref)
		p0.actionBarLabelRef = roactModule.createRef()
	end
end
function detailsPageHeader.renderThumbnail(p1, p2, p3, p4, p5) --[[ line: 95 ]]
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

function detailsPageHeader.renderDesktopMode(p6, p7) --[[ line: 125 ]]
	-- upvalues: roactModule (ref), luaAppBottomAlignDetailsHeaderInfoFrame (ref), detailsPageTitleContentModule (ref), actionBar (ref), fFlagUIBloxEnableActionBarButtonOverride (ref), fFlagUIBloxAddTestIdToActionBar (ref), fFlagLuaAppDesktopPlayabilityMessageFontSizeUpdate (ref), fFlagRenameDeprecatedUIBloxTokens (ref), fFlagLuaAppPlayButtonContextualMessageImpression (ref)
	local thumbnailHeight = p6.props.thumbnailHeight
	local var7 = thumbnailHeight * (p6.props.thumbnailAspectRatio.X / p6.props.thumbnailAspectRatio.Y)
	local sideMargin = p6.props.sideMargin or 48
	
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
		}, if p6.props.renderCustomHeader then {
			CustomHeader = p6.props.renderCustomHeader(),
			UISizeConstraint = if p6.props.maxContentWidth then roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p6.props.maxContentWidth, 1e999) }) else nil
		} else {
			Layout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Padding = UDim.new(0, p6.props.itemPadding or 24)
			}),
			ThumbnailTileFrame = p6:renderThumbnail(p7, if p6.props.thumbnailShadowHeight ~= nil then p6.props.thumbnailShadowHeight else 28, var7, thumbnailHeight),
			InfoFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, -(var7 + sideMargin * 2), 1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, if p6.props.renderCustomHeader then p6.props.renderCustomHeader() else {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = if luaAppBottomAlignDetailsHeaderInfoFrame then Enum.VerticalAlignment.Bottom else Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, 16)
				}),
				TitleInfo = roactModule.createElement(detailsPageTitleContentModule, {
					layoutOrder = 1,
					titleText = p6.props.titleText,
					subTitleText = p6.props.subTitleText,
					renderInfoContent = p6.props.renderInfoContent,
					verticalAlignment = Enum.VerticalAlignment.Top
				}),
				ActonBarFrame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromOffset(p6.props.actionBarWidth, p6.props.actionBarHeight)
				}, {
					ActionBar = p6.props.actionBarProps and roactModule.createElement(actionBar, {
						enableButtonAtStart = true,
						button = p6.props.actionBarProps.button,
						buttonOverride = if fFlagUIBloxEnableActionBarButtonOverride then p6.props.actionBarProps.buttonOverride else nil,
						icons = p6.props.actionBarProps.icons,
						iconSize = p6.props.actionBarProps.iconSize,
						buttonHeight = p6.props.actionBarProps.buttonHeight,
						buttonPadding = p6.props.actionBarProps.buttonPadding,
						textButtons = p6.props.actionBarProps.textButtons,
						marginOverride = { left = 0, right = 0, top = 0, bottom = 0 },
						horizontalAlignment = Enum.HorizontalAlignment.Left,
						testId = if fFlagUIBloxAddTestIdToActionBar then "--experience-details" else nil
					}) or nil
				}),
				ActionBarLabel = if p6.props.actionBarLabelText then roactModule.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = p6.props.actionBarLabelText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Font = p7.Tokens.Typography.BodyLarge.Font,
					TextSize = if fFlagLuaAppDesktopPlayabilityMessageFontSizeUpdate then if fFlagRenameDeprecatedUIBloxTokens then p7.Tokens.FontSize.FontSize_350 else p7.Tokens.FontSize.FontSize_300 else p7.Tokens.Typography.BodyLarge.FontSize,
					TextColor3 = p7.Tokens.Color.Content.Emphasis.Color3,
					TextTransparency = p7.Tokens.Color.Content.Emphasis.Transparency,
					LayoutOrder = 3,
					[roactModule.Ref] = if fFlagLuaAppPlayButtonContextualMessageImpression then p6.actionBarLabelRef else nil
				}) else nil,
				ActionBarLabelImpressionsDetector = if fFlagLuaAppPlayButtonContextualMessageImpression and p6.props.actionBarLabelText and p6.props.renderActionBarLabelImpressionsDetector then p6.props.renderActionBarLabelImpressionsDetector(p6.actionBarLabelRef, p6.props.scrollViewPositionChangedSignal) else nil
			}),
			UISizeConstraint = if p6.props.maxContentWidth then roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p6.props.maxContentWidth, 1e999) }) else nil
		})
	}
end

function detailsPageHeader.renderisPhone(p8, p9) --[[ line: 270 ]]
	-- upvalues: roactModule (ref), fFlagLuaAppFixDetailsPageThumbnailRenderInPhone (ref)
	local thumbnailHeight = p8.props.thumbnailHeight
	local var9 = thumbnailHeight * (p8.props.thumbnailAspectRatio.X / p8.props.thumbnailAspectRatio.Y)
	local sideMargin = p8.props.sideMargin or 24
	
	return if p8.props.renderCustomHeader then {
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
		}, { Content = p8.props.renderCustomHeader() })
	} else {
		Padding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, sideMargin),
			PaddingRight = UDim.new(0, sideMargin),
			PaddingBottom = UDim.new(0, 16)
		}),
		ThumbnailTileFrame = if fFlagLuaAppFixDetailsPageThumbnailRenderInPhone then p8:renderThumbnail(p9, 0, var9, thumbnailHeight) else p8:renderThumbnail(p9, var9, thumbnailHeight)
	}
end

function detailsPageHeader.render(p10) --[[ line: 308 ]]
	-- upvalues: deviceType (ref), withStyle (ref), roactModule (ref)
	local var11 = p10.props.deviceType == deviceType.Phone
	local thumbnailHeight = p10.props.thumbnailHeight
	local headerBarBackgroundHeight = p10.props.headerBarBackgroundHeight or 80
	local gradientHeight = p10.props.gradientHeight or thumbnailHeight + 16 - headerBarBackgroundHeight + 44
	local bottomMargin = p10.props.bottomMargin
	
	return withStyle(function(p11) --[[ line: 318 ]]
		-- upvalues: roactModule (copy), gradientHeight (ref), headerBarBackgroundHeight (ref), var11 (ref), p10 (ref), thumbnailHeight (ref), bottomMargin (ref)
		local theme = p11.Theme
		
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
			}, var11 and p10:renderisPhone(p11, thumbnailHeight) or p10:renderDesktopMode(p11, thumbnailHeight)),
			Padding = if bottomMargin then roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, bottomMargin)
			}) else nil
		})
	end)
end

return detailsPageHeader