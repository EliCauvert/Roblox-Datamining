local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local TextModule = require(Modules.Common.Text)
local TencentNoticeTypeModule = require(Modules.Luobu.Enum.TencentNoticeType)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local NoticePageControlItem = RoactModule.PureComponent:extend("NoticePageControlItem")
NoticePageControlItem.validateProps = TModule.strictInterface({
	headerHeight = TModule.number,
	contentHeight = TModule.number,
	width = TModule.number,
	notice = TModule.table,
	layoutOrder = TModule.number,
	formFactor = TModule.string,
	hasOneNotice = TModule.boolean
})

function NoticePageControlItem.render(p1)
	-- upvalues: WithStyleFunction (copy), TencentNoticeTypeModule (copy), RoactModule (copy)
	local HeaderHeight = p1.props.headerHeight
	local ContentHeight = p1.props.contentHeight
	local Width = p1.props.width
	local Title = p1.props.notice.title
	local LayoutOrder = p1.props.layoutOrder
	
	return WithStyleFunction(function(p2)
		-- upvalues: Width (copy), p1 (copy), TencentNoticeTypeModule (upval), RoactModule (upval), HeaderHeight (copy), ContentHeight (copy), LayoutOrder (copy), Title (copy)
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = Theme.BackgroundUIDefault.Transparency,
			BackgroundColor3 = Theme.BackgroundUIDefault.Color,
			Size = UDim2.fromOffset(Width, HeaderHeight + ContentHeight),
			AnchorPoint = Vector2.new(0, 0),
			LayoutOrder = LayoutOrder
		}, {
			TopFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 3,
				Size = UDim2.fromOffset(Width, HeaderHeight + 10),
				BackgroundTransparency = Theme.BackgroundUIDefault.Transparency,
				BackgroundColor3 = Theme.BackgroundUIDefault.Color
			}, {
				TitleLabel = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0.7, 0, 1, 0),
					Text = Title,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Font = p2.Font.Header1.Font,
					TextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize
				}),
				DividerLine = p1.props.notice.type == TencentNoticeTypeModule.Text and RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundColor3 = Theme.Divider.Color,
					BackgroundTransparency = Theme.Divider.Transparency,
					Size = UDim2.fromOffset(Width - 48, 1),
					Position = UDim2.fromOffset(24, HeaderHeight + 10)
				})
			}),
			ContentFrame = p1:renderContent(p2, HeaderHeight, Width, ContentHeight)
		})
	end)
end

function NoticePageControlItem.renderContent(p1, p2, HeaderHeight, XOffset, ContentHeight)
	-- upvalues: TencentNoticeTypeModule (copy)
	local Type = p1.props.notice.type
	
	if Type == TencentNoticeTypeModule.Text then
		return p1:renderTextContent(p2, HeaderHeight, XOffset, ContentHeight)
	elseif Type == TencentNoticeTypeModule.Image then
		return p1:renderImageContent(p2, HeaderHeight, XOffset, ContentHeight)
	else
		warn("Error: TencentNoticeType is incorrect! Please fix or add new type:" .. Type)
		
		return nil
	end
end

function NoticePageControlItem.renderTextContent(p1, p2, p3: number, XOffset: number, p4: number)
	-- upvalues: TextModule (copy), RoactModule (copy)
	local Content = p1.props.notice.content
	
	if Content == nil then
		return nil
	end
	local XOffsetDelta = XOffset - 48
	local Theme = p2.Theme
	local BodyFont = p2.Font.Body.Font
	local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize
	local TextDefault = Theme.TextDefault
	local TextHeight = TextModule.GetTextHeight(Content, BodyFont, ScaledBaseSize, 10000)
	local YOffset1 = TextHeight < p4 and p4 or TextHeight
	local YOffset = p4 + 10
	
	if p1.props.hasOneNotice then
		YOffset -= 48
	end
	return RoactModule.createElement("ScrollingFrame", {
		BorderSizePixel = 0,
		ScrollBarThickness = 0,
		Size = UDim2.fromOffset(XOffset, YOffset),
		Position = UDim2.new(0, 0, 0, p3 - 10),
		BackgroundColor3 = Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = Theme.BackgroundUIDefault.Transparency,
		CanvasSize = UDim2.new(0, XOffset, 0, YOffset1),
		ScrollingDirection = Enum.ScrollingDirection.Y
	}, {
		Content = RoactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(XOffsetDelta, YOffset1),
			Position = UDim2.fromOffset(24, 34),
			Text = Content,
			Font = BodyFont,
			TextSize = ScaledBaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = TextDefault.Color,
			TextTransparency = TextDefault.Transparency,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end

function NoticePageControlItem.renderImageContent(p1, p2, YOffset1, XOffset, YOffset: number)
	-- upvalues: FormFactor (copy), RoactModule (copy), LoadableImage (copy)
	local Theme = p2.Theme
	local LandscapePicUrl = p1.props.notice.landscapePicUrl
	local PortraitPicUrl = p1.props.notice.portraitPicUrl
	local Frame = RoactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ZIndex = 3,
		BackgroundColor3 = Theme.Overlay.Color,
		Size = UDim2.fromOffset(XOffset, 48),
		Position = UDim2.fromOffset(0, YOffset - 48)
	}, {
		UIGradient = RoactModule.createElement("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
				ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
			}),
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.1, 1),
				NumberSequenceKeypoint.new(1, 0)
			})
		})
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(XOffset, YOffset),
		Position = UDim2.fromOffset(0, YOffset1)
	}, {
		TopCoverLayer = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			BackgroundTransparency = Theme.BackgroundUIDefault.Transparency,
			BackgroundColor3 = Theme.BackgroundUIDefault.Color,
			Size = UDim2.fromOffset(XOffset, 10),
			Position = UDim2.fromOffset(0, 0)
		}),
		ImageView = RoactModule.createElement(LoadableImage, {
			useShimmerAnimationWhileLoading = true,
			showFailedStateWhenLoadingFailed = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(XOffset, YOffset),
			Position = UDim2.fromOffset(0, 0),
			Image = p1.props.formFactor == FormFactor.WIDE and LandscapePicUrl or PortraitPicUrl
		}, { gradientLayer = not p1.props.hasOneNotice and Frame })
	})
end

return (RoactRoduxModule.connect(function(p1)
	return { formFactor = p1.FormFactor }
end, nil)(NoticePageControlItem))