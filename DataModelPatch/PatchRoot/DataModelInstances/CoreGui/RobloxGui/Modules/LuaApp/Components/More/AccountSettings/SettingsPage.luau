local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppUpdateService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppUpdateService
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local MemoizeModule = require(Modules.Common.memoize)
local ConstantsModule = require(Modules.LuaApp.Constants)
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MoreListModule = require(Modules.LuaApp.Components.More.MoreList)
local MoreItemContainerModule = require(Modules.LuaApp.Components.More.MoreItemContainer)
local MorePageScrollingFrameModule = require(Modules.LuaApp.Components.More.MorePageScrollingFrame)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local ReactModule = require(CorePackages.Packages.React)
local RobloxAppHooksModule = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local UseSettingsPageItemsModule = require(Modules.LuaApp.Hooks.useSettingsPageItems)
local UseBillingTabVisibilityFunction = require(CorePackages.Workspace.Packages.SettingsTabVisibility).useBillingTabVisibility
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local MoreSectionListModule = require(Modules.LuaApp.Components.More.MoreSectionList)
local VoiceChatModule = require(CorePackages.Workspace.Packages.VoiceChat)
local SetShowAgeVerificationOverlayFunction = VoiceChatModule.AgeVerificationOverlay.SetShowAgeVerificationOverlay
local SetVoiceChatOptInStatusFunction = VoiceChatModule.OptInStatus.SetVoiceChatOptInStatus
local GetFFlagEnableGateNotificationPreferencesTabFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableGateNotificationPreferencesTab
local FFlagEnableBillingTabHideLogicModule = require(Modules.LuaApp.Flags.FFlagEnableBillingTabHideLogic)
local SettingsPage = RoactModule.PureComponent:extend("SettingsPage")

function SettingsPage.init(p1)
	-- upvalues: RoactModule (copy), MoreItemContainerModule (copy), MemoizeModule (copy), GetFFlagEnableGateNotificationPreferencesTabFunction (copy), FFlagEnableBillingTabHideLogicModule (copy), MorePageSettingsModule (copy), CryoModule (copy)
	function p1.renderItem(Item, LayoutInfo)
		-- upvalues: RoactModule (upval), MoreItemContainerModule (upval)
		return RoactModule.createElement(MoreItemContainerModule, { item = Item, layoutInfo = LayoutInfo })
	end
	
	p1.getSettingsPageItemList = MemoizeModule(function(BadgeCount, p2, p3, HideBillingTab)
		-- upvalues: GetFFlagEnableGateNotificationPreferencesTabFunction (upval), p1 (copy), FFlagEnableBillingTabHideLogicModule (upval), MorePageSettingsModule (upval), CryoModule (upval)
		return CryoModule.List.map(MorePageSettingsModule.GetItemsInPage(p2, nil, nil, if GetFFlagEnableGateNotificationPreferencesTabFunction() then {
			enableNotificationPreferencesTab = p1.props.enableNotificationPreferencesTab,
			hideBillingTab = if FFlagEnableBillingTabHideLogicModule then HideBillingTab else nil
		} elseif FFlagEnableBillingTabHideLogicModule then { hideBillingTab = HideBillingTab } else nil, p3), function(p4)
			-- upvalues: MorePageSettingsModule (upval), BadgeCount (copy), CryoModule (upval)
			local JoinResults = {}
			
			for i, content in ipairs(p4.contents) do
				if content.itemType == MorePageSettingsModule.ItemType.Settings_AccountInfo and content.badgeCount ~= BadgeCount then
					content = CryoModule.Dictionary.join(content, { badgeCount = BadgeCount })
				end
				JoinResults[i] = content
			end
			return JoinResults
		end)
	end)
	
	if game:GetEngineFeature("VoiceChatSupported") then
		p1.props.setShowAgeVerificationOverlay()
	end
	p1.props.setVoiceChatOptInStatus()
end

function SettingsPage.render(p2)
	-- upvalues: FormFactor (copy), FFlagEnableBillingTabHideLogicModule (copy), ConstantsModule (copy), RoactModule (copy), MorePageScrollingFrameModule (copy), MoreListModule (copy), TopBarModule (copy), WithStyleFunction (copy)
	local ShowParentalControls = p2.props.showParentalControls
	local SettingsPageType = p2.props.settingsPageType
	local HideBillingTabOverride = if FFlagEnableBillingTabHideLogicModule then p2.props.hideBillingTabOverride ~= nil and p2.props.hideBillingTabOverride else nil
	local SettingsPageItemList = if FFlagEnableBillingTabHideLogicModule then p2.getSettingsPageItemList(p2.props.notificationCount, SettingsPageType, ShowParentalControls, HideBillingTabOverride) else p2.getSettingsPageItemList(p2.props.notificationCount, SettingsPageType, ShowParentalControls)
	local Offset = 0
	local Offset1 = 0
	local MOREPAGESECTIONPADDING = ConstantsModule.MORE_PAGE_SECTION_PADDING
	local MOREPAGESECTIONPADDING1 = ConstantsModule.MORE_PAGE_SECTION_PADDING
	
	if p2.props.formFactor == FormFactor.WIDE then
		Offset = ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL
		Offset1 = ConstantsModule.MORE_PAGE_WIDE_PADDING_HORIZONTAL
		MOREPAGESECTIONPADDING = ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL
		MOREPAGESECTIONPADDING1 = ConstantsModule.MORE_PAGE_WIDE_PADDING_VERTICAL
	end
	local NewMOREPAGECONTENTMAXWIDTH = ConstantsModule.MORE_PAGE_CONTENT_MAX_WIDTH + Offset + Offset1
	
	local function v35(BackgroundDefault)
		-- upvalues: RoactModule (upval), MorePageScrollingFrameModule (upval), NewMOREPAGECONTENTMAXWIDTH (copy), Offset (ref), Offset1 (ref), MOREPAGESECTIONPADDING (ref), MOREPAGESECTIONPADDING1 (ref), MoreListModule (upval), SettingsPageItemList (copy), p2 (copy), ConstantsModule (upval), TopBarModule (upval)
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
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
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					UIPadding = RoactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, Offset),
						PaddingRight = UDim.new(0, Offset1),
						PaddingTop = UDim.new(0, MOREPAGESECTIONPADDING),
						PaddingBottom = UDim.new(0, MOREPAGESECTIONPADDING1)
					}),
					SettingsPageList = RoactModule.createElement(MoreListModule, {
						itemList = SettingsPageItemList,
						renderItem = p2.renderItem,
						rowHeight = ConstantsModule.MORE_PAGE_ROW_HEIGHT
					})
				})
			})
		})
	end
	
	return WithStyleFunction(function(p3)
		-- upvalues: v35 (copy)
		return v35(p3.Theme.BackgroundDefault)
	end)
end

local v1 = RoactServices.connect({ appUpdateService = AppUpdateService })((RoactRoduxModule.connect(function(p2, _)
	return {
		formFactor = p2.FormFactor,
		notificationCount = p2.NotificationBadgeCounts.MorePageSettings,
		screenSize = p2.ScreenSize
	}
end, function(Callback)
	-- upvalues: SetShowAgeVerificationOverlayFunction (copy), SetVoiceChatOptInStatusFunction (copy)
	return {
		setShowAgeVerificationOverlay = function(p2, p3, p4, p5)
			-- upvalues: Callback (copy), SetShowAgeVerificationOverlayFunction (upval)
			return Callback(SetShowAgeVerificationOverlayFunction(p2, p3, p4, p5))
		end,
		setVoiceChatOptInStatus = function(p2)
			-- upvalues: Callback (copy), SetVoiceChatOptInStatusFunction (upval)
			return Callback(SetVoiceChatOptInStatusFunction(p2))
		end
	}
end)((RoactAppExperimentModule.connectUserLayer({ AppUserLayers.ParentalSpendControlsLayer }, function(p2, _)
	-- upvalues: AppUserLayers (copy)
	return {
		showParentalControls = (p2[AppUserLayers.ParentalSpendControlsLayer] or {}).showParentalSpendControls
	}
end)((RoactAppPolicy.connect(function(p2, _)
	-- upvalues: GetFFlagEnableGateNotificationPreferencesTabFunction (copy)
	return {
		settingsPageType = p2.getSettingsPageType(),
		enableNotificationPreferencesTab = if GetFFlagEnableGateNotificationPreferencesTabFunction() then p2.getEnableNotificationPreferencesPage() else nil
	}
end)(SettingsPage)))))))

return function(p2)
	-- upvalues: RobloxAppHooksModule (copy), UiMode (copy), FFlagEnableBillingTabHideLogicModule (copy), UseBillingTabVisibilityFunction (copy), CryoModule (copy), UseSettingsPageItemsModule (copy), ReactModule (copy), MoreSectionListModule (copy), v1 (ref)
	local IsUiModeMatch = RobloxAppHooksModule.useUiModeInfo().uiMode == UiMode.TenFoot
	
	if FFlagEnableBillingTabHideLogicModule then
		p2 = CryoModule.Dictionary.join(p2 or {}, {
			hideBillingTabOverride = not UseBillingTabVisibilityFunction().showBillingTab
		})
	end
	local P22 = p2 or {}
	local UseSettingsPageItemsModuleResult = UseSettingsPageItemsModule()
	
	return if IsUiModeMatch then ReactModule.createElement(MoreSectionListModule, { itemList = UseSettingsPageItemsModuleResult }) else ReactModule.createElement(v1, P22)
end