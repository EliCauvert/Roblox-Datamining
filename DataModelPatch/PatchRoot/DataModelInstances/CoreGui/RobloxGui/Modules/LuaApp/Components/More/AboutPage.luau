local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AppPageModule = require(Modules.LuaApp.AppPage)
local ConstantsModule = require(Modules.LuaApp.Constants)
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MoreListModule = require(Modules.LuaApp.Components.More.MoreList)
local MoreItemContainerModule = require(Modules.LuaApp.Components.More.MoreItemContainer)
local MorePageScrollingFrameModule = require(Modules.LuaApp.Components.More.MorePageScrollingFrame)
local ReactModule = require(CorePackages.Packages.React)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local RobloxAppHooksModule = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local Constants = require(CorePackages.Workspace.Packages.TenFootUiShell).Constants
local MoreSectionListModule = require(Modules.LuaApp.Components.More.MoreSectionList)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local _ = string.format("%s (%.6s)", RunService:GetRobloxVersion(), RunService.ClientGitHash)
local AboutPage = RoactModule.PureComponent:extend("AboutPage")

function AboutPage.init(p1)
	-- upvalues: RoactModule (copy), MoreItemContainerModule (copy)
	function p1.renderItem(Item, LayoutInfo)
		-- upvalues: RoactModule (upval), MoreItemContainerModule (upval)
		return RoactModule.createElement(MoreItemContainerModule, { item = Item, layoutInfo = LayoutInfo })
	end
end

function AboutPage.render(p1)
	-- upvalues: FormFactor (copy), ConstantsModule (copy), MorePageSettingsModule (copy), CryoModule (copy), RoactModule (copy), TopBarModule (copy), MorePageScrollingFrameModule (copy), MoreListModule (copy), WithStyleFunction (copy)
	local Offset = 0
	local Offset1 = 0
	local MOREPAGESECTIONPADDING = ConstantsModule.MORE_PAGE_SECTION_PADDING
	local MOREPAGESECTIONPADDING1 = ConstantsModule.MORE_PAGE_SECTION_PADDING
	
	if p1.props.formFactor == FormFactor.WIDE then
		Offset = ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL
		Offset1 = ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL
		MOREPAGESECTIONPADDING = ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL
		MOREPAGESECTIONPADDING1 = ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL
	end
	local NewMOREPAGECONTENTMAXWIDTH = ConstantsModule.MORE_PAGE_CONTENT_MAX_WIDTH + Offset + Offset1
	local MapResult = CryoModule.List.map(MorePageSettingsModule.GetItemsInPage(p1.props.aboutPageType, nil, nil, nil, nil, p1.props.disableWebViewSupport), function(p2)
		return p2.contents
	end)
	
	local function v29(BackgroundDefault, _)
		-- upvalues: RoactModule (upval), TopBarModule (upval), MorePageScrollingFrameModule (upval), NewMOREPAGECONTENTMAXWIDTH (copy), ConstantsModule (upval), Offset (ref), Offset1 (ref), MOREPAGESECTIONPADDING (ref), MOREPAGESECTIONPADDING1 (ref), MoreListModule (upval), MapResult (ref), p1 (copy)
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
			PageContent = RoactModule.createElement(TopBarModule.PageContent, {}, {
				Scroller = RoactModule.createElement(MorePageScrollingFrameModule, {
					Position = UDim2.fromScale(0, 0),
					Size = UDim2.fromScale(1, 1),
					maxWidth = NewMOREPAGECONTENTMAXWIDTH
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, ConstantsModule.MORE_PAGE_SECTION_PADDING)
					}),
					UIPadding = RoactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, Offset),
						PaddingRight = UDim.new(0, Offset1),
						PaddingTop = UDim.new(0, MOREPAGESECTIONPADDING),
						PaddingBottom = UDim.new(0, MOREPAGESECTIONPADDING1)
					}),
					AboutPageList = RoactModule.createElement(MoreListModule, {
						LayoutOrder = 1,
						itemList = MapResult,
						renderItem = p1.renderItem,
						rowHeight = ConstantsModule.MORE_PAGE_ROW_HEIGHT
					})
				})
			})
		})
	end
	
	return WithStyleFunction(function(p2)
		-- upvalues: CryoModule (upval), v29 (copy)
		return v29(p2.Theme.BackgroundDefault, (CryoModule.Dictionary.join(p2.Theme.TextDefault, {
			Font = p2.Font.Footer.Font,
			Size = p2.Font.BaseSize * p2.Font.Footer.RelativeSize
		})))
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor }
end)((RoactAppPolicy.connect(function(p1, _)
	return {
		aboutPageType = p1.getAboutPageType(),
		disableWebViewSupport = not p1.getWebViewSupport()
	}
end)(AboutPage)))

return function(p1)
	-- upvalues: RobloxAppHooksModule (copy), UiMode (copy), UseAppPolicyModule (copy), MorePageSettingsModule (copy), CryoModule (copy), FFlagEnableLeftNavOnConsole (copy), AppPageModule (copy), Constants (copy), ReactModule (copy), MoreSectionListModule (copy), v1 (ref)
	local IsUiModeMatch = RobloxAppHooksModule.useUiModeInfo().uiMode == UiMode.TenFoot
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getAboutPageType()
	end)
	
	return if IsUiModeMatch then ReactModule.createElement(MoreSectionListModule, {
		itemList = CryoModule.List.map(MorePageSettingsModule.GetItemsInPage(UseAppPolicyModuleResult), function(p2)
			return p2.contents
		end),
		topbarHeight = if FFlagEnableLeftNavOnConsole then 0 elseif UseAppPolicyModuleResult == AppPageModule.TenFootAbout then Constants.TOP_BAR_CANVAS_SIZE.Y else 0
	}) else ReactModule.createElement(v1, p1)
end