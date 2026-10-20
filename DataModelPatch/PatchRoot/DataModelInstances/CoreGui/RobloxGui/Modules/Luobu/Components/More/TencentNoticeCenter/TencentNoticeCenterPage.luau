local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local _ = require(Modules.LuaApp.AppPage)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local TencentNoticeListModule = require(Modules.Luobu.Components.More.TencentNoticeCenter.TencentNoticeList)
local TencentNoticeItemContainerModule = require(Modules.Luobu.Components.More.TencentNoticeCenter.TencentNoticeItemContainer)
local MorePageScrollingFrameModule = require(Modules.LuaApp.Components.More.MorePageScrollingFrame)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local TencentNoticeCenterPage = RoactModule.PureComponent:extend("TencentNoticeCenterPage")
TencentNoticeCenterPage.validateProps = TModule.strictInterface({
	formFactor = TModule.string,
	noticeList = TModule.optional(TModule.table)
})

function TencentNoticeCenterPage.init(p1)
	-- upvalues: RoactModule (copy), TencentNoticeItemContainerModule (copy)
	function p1.renderItem(Item, LayoutInfo)
		-- upvalues: RoactModule (upval), TencentNoticeItemContainerModule (upval)
		return RoactModule.createElement(TencentNoticeItemContainerModule, { item = Item, layoutInfo = LayoutInfo })
	end
end

function TencentNoticeCenterPage.render(p1)
	-- upvalues: WithStyleFunction (copy), FormFactor (copy), RoactModule (copy), WithLocalizationFunction (copy), EmptyState (copy), MorePageScrollingFrameModule (copy), TencentNoticeListModule (copy), TopBarModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), FormFactor (upval), RoactModule (upval), WithLocalizationFunction (upval), EmptyState (upval), MorePageScrollingFrameModule (upval), TencentNoticeListModule (upval), TopBarModule (upval)
		local BackgroundDefault = p2.Theme.BackgroundDefault
		local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
		local NoticeList = p1.props.noticeList
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = BackgroundDefault.Color,
			BackgroundTransparency = BackgroundDefault.Transparency
		}, {
			TopBar = RoactModule.createElement(TopBarModule.Container, {
				leftItem = TopBarModule.BackButton,
				rightItems = {
					TopBarModule.BuyRobuxButton,
					TopBarModule.NotificationsButton
				}
			}),
			Content = RoactModule.createElement(TopBarModule.PageContent, {}, {
				ContentFrame = if NoticeList == nil then RoactModule.createElement("Frame", {
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = BackgroundDefault.Color
				}, {
					EmptySection = WithLocalizationFunction({ emptyText = "CommonUI.Features.Label.MoreEvents" })(function(p3)
						-- upvalues: RoactModule (upval), EmptyState (upval)
						return RoactModule.createElement(EmptyState, { text = p3.emptyText, size = UDim2.fromScale(1, 1) })
					end)
				}) else RoactModule.createElement(MorePageScrollingFrameModule, {
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromScale(1, 1)
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					UIPadding = RoactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, if IsFormFactorMatch then 60 else 0),
						PaddingRight = UDim.new(0, if IsFormFactorMatch then 60 else 0),
						PaddingTop = UDim.new(0, if IsFormFactorMatch then 40 else 20),
						PaddingBottom = UDim.new(0, if IsFormFactorMatch then 40 else 20)
					}),
					TencentNoticeCenterList = NoticeList and RoactModule.createElement(TencentNoticeListModule, { itemList = NoticeList, renderItem = p1.renderItem })
				})
			})
		})
	end)
end

return RoactRoduxModule.connect(function(p1)
	return {
		formFactor = p1.FormFactor,
		noticeList = p1.Luobu.TencentNotice.noticeList
	}
end)(TencentNoticeCenterPage)