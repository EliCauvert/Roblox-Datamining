local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local AppPageModule = require(Modules.LuaApp.AppPage)
local ConstantsModule = require(Modules.LuaApp.Constants)
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MoreListModule = require(Modules.LuaApp.Components.More.MoreList)
local MoreItemContainerModule = require(Modules.LuaApp.Components.More.MoreItemContainer)
local MorePageScrollingFrameModule = require(Modules.LuaApp.Components.More.MorePageScrollingFrame)
local GetFFlagEnableSupportCenterFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableSupportCenter
local FFlagEnableSafetyDashboardModule = require(Modules.LuaApp.Flags.FFlagEnableSafetyDashboard)
local SafetySupportProfileHeaderModule = if FFlagEnableSafetyDashboardModule then require(Modules.LuaApp.Components.More.SafetySupportProfileHeader) else nil

local function renderItem(Item, LayoutInfo)
	-- upvalues: ReactModule (copy), MoreItemContainerModule (copy)
	return ReactModule.createElement(MoreItemContainerModule, { item = Item, layoutInfo = LayoutInfo })
end

return function()
	-- upvalues: UseAppPolicyModule (copy), GetFFlagEnableSupportCenterFunction (copy), UseSelectorFunction (copy), FormFactor (copy), ConstantsModule (copy), UseStyleFunction (copy), ReactModule (copy), MorePageSettingsModule (copy), AppPageModule (copy), CryoModule (copy), TopBarModule (copy), MorePageScrollingFrameModule (copy), SafetySupportProfileHeaderModule (copy), MoreListModule (copy), FFlagEnableSafetyDashboardModule (copy), renderItem (copy)
	local Inverted = not UseAppPolicyModule(function(p1)
		return p1.getWebViewSupport()
	end)
	local UseAppPolicyModuleResult = if GetFFlagEnableSupportCenterFunction() then UseAppPolicyModule(function(p1)
		return p1.getSupportCenterEnabled()
	end) else false
	local Offset = 0
	local Offset1 = 0
	local MOREPAGESECTIONPADDING = ConstantsModule.MORE_PAGE_SECTION_PADDING
	local MOREPAGESECTIONPADDING1 = ConstantsModule.MORE_PAGE_SECTION_PADDING
	
	if UseSelectorFunction(function(p1)
		return p1.FormFactor
	end) == FormFactor.WIDE then
		Offset = ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL
		Offset1 = ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL
		MOREPAGESECTIONPADDING = ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL
		MOREPAGESECTIONPADDING1 = ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL
	end
	local NewMOREPAGECONTENTMAXWIDTH = ConstantsModule.MORE_PAGE_CONTENT_MAX_WIDTH + Offset + Offset1
	local BackgroundDefault = UseStyleFunction().Theme.BackgroundDefault
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = BackgroundDefault.Color,
		BackgroundTransparency = BackgroundDefault.Transparency
	}, {
		TopBar = ReactModule.createElement(TopBarModule.Container, {
			leftItem = TopBarModule.BackButton,
			rightItems = {
				TopBarModule.BuyRobuxButton,
				TopBarModule.NotificationsButton
			}
		}),
		PageContent = ReactModule.createElement(TopBarModule.PageContent, {}, {
			Scroller = ReactModule.createElement(MorePageScrollingFrameModule, {
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 1),
				maxWidth = NewMOREPAGECONTENTMAXWIDTH
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, ConstantsModule.MORE_PAGE_SECTION_PADDING)
				}),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, Offset),
					PaddingRight = UDim.new(0, Offset1),
					PaddingTop = UDim.new(0, MOREPAGESECTIONPADDING),
					PaddingBottom = UDim.new(0, MOREPAGESECTIONPADDING1)
				}),
				ProfileHeader = if SafetySupportProfileHeaderModule then ReactModule.createElement(SafetySupportProfileHeaderModule, { LayoutOrder = 1 }) else nil,
				SafetySupportPageList = ReactModule.createElement(MoreListModule, {
					LayoutOrder = if FFlagEnableSafetyDashboardModule then 2 else 1,
					itemList = ReactModule.useMemo(function()
						-- upvalues: MorePageSettingsModule (upval), AppPageModule (upval), GetFFlagEnableSupportCenterFunction (upval), UseAppPolicyModuleResult (copy), Inverted (copy), CryoModule (upval)
						return CryoModule.List.map(MorePageSettingsModule.GetItemsInPage(AppPageModule.SafetySupport, nil, nil, if GetFFlagEnableSupportCenterFunction() then { isSupportCenterEnabled = UseAppPolicyModuleResult } else nil, nil, Inverted), function(p1)
							return p1.contents
						end)
					end, {
						Inverted,
						if GetFFlagEnableSupportCenterFunction() then UseAppPolicyModuleResult else nil
					}),
					renderItem = renderItem,
					rowHeight = ConstantsModule.MORE_PAGE_ROW_HEIGHT
				})
			})
		})
	})
end