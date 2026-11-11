local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local _ = require(Modules.Luobu.Constants)
local _ = require(Modules.LuaApp.AppPage)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MorePageScrollingFrameModule = require(Modules.LuaApp.Components.More.MorePageScrollingFrame)
local OpenWebviewModule = require(Modules.LuaApp.Thunks.OpenWebview)
local TModule = require(CorePackages.Packages.t)
local TextModule = require(Modules.Common.Text)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local TencentNoticeTypeModule = require(Modules.Luobu.Enum.TencentNoticeType)
local TencentNoticeContentPage = RoactModule.PureComponent:extend("TencentNoticeContentPage")
TencentNoticeContentPage.validateProps = TModule.strictInterface({
	notice = TModule.table,
	dateText = TModule.string,
	screenWidth = TModule.number,
	screenHeight = TModule.number,
	formFactor = TModule.string,
	openNoticeDetail = TModule.callback
})

function TencentNoticeContentPage.init(p1)
	function p1.onNoticeClicked()
		-- upvalues: p1 (copy)
		p1.props.openNoticeDetail(p1.props.notice.noticeUrl, p1.props.notice.title)
	end
end

function TencentNoticeContentPage.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), TopBarModule (copy), MorePageScrollingFrameModule (copy)
	local Title = p1.props.notice.title
	local DateText = p1.props.dateText
	local ScreenWidth: number = p1.props.screenWidth
	local ScreenHeight = p1.props.screenHeight
	local XOffset = ScreenWidth - 48
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ScreenWidth (copy), ScreenHeight (copy), TopBarModule (upval), MorePageScrollingFrameModule (upval), Title (copy), XOffset (copy), DateText (copy), p1 (copy)
		local BackgroundUIDefault = p2.Theme.BackgroundUIDefault
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(ScreenWidth, ScreenHeight),
			BackgroundColor3 = BackgroundUIDefault.Color,
			BackgroundTransparency = BackgroundUIDefault.Transparency
		}, {
			TopBarFrame = RoactModule.createElement(TopBarModule.Container, { titleText = "", leftItem = TopBarModule.BackButton }),
			PageContent = RoactModule.createElement(TopBarModule.PageContent, {}, {
				Scroller = RoactModule.createElement(MorePageScrollingFrameModule, {
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromScale(1, 1)
				}, {
					Title = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0.85, 0, 0, 28),
						Position = UDim2.fromOffset(24, 24),
						Text = Title,
						Font = p2.Font.Header2.Font,
						TextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd
					}),
					DateLabel = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(XOffset, 14),
						Position = UDim2.fromOffset(24, 64),
						Text = DateText,
						TextColor3 = Theme.TextDefault.Color,
						Font = p2.Font.CaptionBody.Font,
						TextSize = p2.Font.BaseSize * p2.Font.CaptionBody.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					DividerLine = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundColor3 = Theme.Divider.Color,
						BackgroundTransparency = Theme.Divider.Transparency,
						Size = UDim2.fromOffset(XOffset, 1),
						Position = UDim2.fromOffset(24, 90)
					}),
					ContentFrame = p1:renderContent(ScreenWidth, p2)
				})
			})
		})
	end)
end

function TencentNoticeContentPage.renderContent(p1, ScreenWidth: number, p2)
	-- upvalues: TencentNoticeTypeModule (copy), TextModule (copy), RoactModule (copy), FormFactor (copy), LoadableImage (copy)
	local Content = p1.props.notice.content
	local Type = p1.props.notice.type
	local PortraitPicUrl = p1.props.notice.portraitPicUrl
	local LandscapePicUrl = p1.props.notice.landscapePicUrl
	local FormFactor1 = p1.props.formFactor
	local BodyFont = p2.Font.Body.Font
	local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize
	local TextDefault = p2.Theme.TextDefault
	local NoticeUrl = p1.props.notice.noticeUrl
	
	if Type == TencentNoticeTypeModule.Text then
		local TextHeight = TextModule.GetTextHeight(Content, BodyFont, ScaledBaseSize, 10000)
		local ScreenHeight = p1.props.screenHeight
		
		return RoactModule.createElement("TextButton", {
			Position = UDim2.fromOffset(24, 115),
			Size = UDim2.fromOffset(ScreenWidth - 48, TextHeight < ScreenHeight and ScreenHeight or TextHeight),
			Text = Content,
			Font = BodyFont,
			TextSize = ScaledBaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = TextDefault.Color,
			TextWrapped = true,
			BackgroundTransparency = 1,
			[RoactModule.Event.Activated] = p1.onNoticeClicked,
			Active = Content ~= nil
		})
	elseif Type ~= TencentNoticeTypeModule.Image then
		warn("Error: TencentNoticeType is incorrect. Please fix or add new type:" .. Type)
		
		return
	else
		local XOffset = ScreenWidth - 64
		local IsFormFactorMatch = FormFactor1 == FormFactor.WIDE
		
		return RoactModule.createElement("TextButton", {
			Size = UDim2.fromOffset(XOffset, (if IsFormFactorMatch then 0.4074 else 1.4516) * XOffset),
			Position = UDim2.fromOffset(32, 115),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = NoticeUrl ~= nil,
			[RoactModule.Event.Activated] = p1.onNoticeClicked
		}, (RoactModule.createElement(LoadableImage, {
			useShimmerAnimationWhileLoading = true,
			showFailedStateWhenLoadingFailed = true,
			Size = UDim2.new(1, 0, 1, 0),
			Image = IsFormFactorMatch and LandscapePicUrl or PortraitPicUrl
		})))
	end
end

return RoactRoduxModule.connect(function(p1)
	return {
		formFactor = p1.FormFactor,
		screenWidth = p1.ScreenSize.X,
		screenHeight = p1.ScreenSize.Y
	}
end, function(Callback)
	-- upvalues: OpenWebviewModule (copy)
	return {
		openNoticeDetail = function(p1, p2)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			Callback(OpenWebviewModule(p1, p2))
		end
	}
end)(TencentNoticeContentPage)