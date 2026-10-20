local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local ExpChatSharedModule = require(CorePackages.Workspace.Packages.ExpChatShared)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local LayerCollectorProvider = require(CorePackages.Packages.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local StyleProviderWithDefaultTheme = require(CorePackages.Workspace.Packages.Style).StyleProviderWithDefaultTheme
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local ChatModalSelectorDialogModule = require(AbuseReportMenu.Components.ChatModalSelectorDialog)
local _ = require(AbuseReportMenu.Components.Types)
local FFlagHideShortcutsOnReportDropdownModule = require(AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local IsSpatialFunction = nil
local UIManager = nil
local PanelType = nil

if IsInExperienceUIVREnabled then
	IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
	local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
	UIManager = VrSpatialUiModule.UIManager
	PanelType = VrSpatialUiModule.Constants.PanelType
end
local config = {
	modalSelectorHandle = nil,
	modalSelectorFrame = nil,
	modalSelectorScreenGui = nil
}

return {
	mountModalSelector = function(OnClose, Callback: () -> (), OnSelect)
		-- upvalues: IsInExperienceUIVREnabled (copy), IsSpatialFunction (ref), UIManager (ref), PanelType (ref), config (copy), CoreGui (copy), ConstantsModule (copy), FFlagHideShortcutsOnReportDropdownModule (copy), RoactModule (copy), LayerCollectorProvider (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RoactRoduxModule (copy), ExpChatSharedModule (copy), StyleProviderWithDefaultTheme (copy), ChatModalSelectorDialogModule (copy)
		if IsInExperienceUIVREnabled and IsSpatialFunction() then
			local PanelObject = UIManager.getInstance():getPanelObject(PanelType.MoreMenu)
			local Frame = Instance.new("Frame")
			Frame.BackgroundTransparency = 1
			Frame.Position = UDim2.new(0, 0, 0, 0)
			Frame.Size = UDim2.new(1, 0, 1, 0)
			Frame.ZIndex = 10
			Frame.Parent = PanelObject
			config.modalSelectorFrame = Frame
		elseif not config.modalSelectorScreenGui then
			local ModalSelectorDialogGui = Instance.new("ScreenGui")
			ModalSelectorDialogGui.Name = "ModalSelectorDialogGui"
			ModalSelectorDialogGui.DisplayOrder = 7
			ModalSelectorDialogGui.Enabled = true
			ModalSelectorDialogGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			ModalSelectorDialogGui.Parent = CoreGui:FindFirstChild(ConstantsModule.AbuseReportMenuPlaceholderFrame, true)
			ModalSelectorDialogGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
			config.modalSelectorScreenGui = ModalSelectorDialogGui
			local Frame = Instance.new("Frame")
			Frame.BackgroundTransparency = 1
			Frame.Position = UDim2.new(0, 0, 0, 0)
			Frame.Size = UDim2.new(1, 0, 1, 0)
			Frame.Parent = config.modalSelectorScreenGui
			config.modalSelectorFrame = Frame
		end
		if FFlagHideShortcutsOnReportDropdownModule and Callback ~= nil then
			Callback()
		end
		config.modalSelectorHandle = RoactModule.mount(RoactModule.createElement(LayerCollectorProvider, {}, RoactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			StoreProvider = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = ExpChatSharedModule.context.store }, {
				StyleProviderWithDefaultTheme = RoactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true }, {
					ChatModalSelectorDialog = RoactModule.createElement(ChatModalSelectorDialogModule, { isShown = true, onClose = OnClose, onSelect = OnSelect })
				})
			})
		})), config.modalSelectorFrame, "ChatModalSelectorDialog")
	end,
	unmountModalSelector = function()
		-- upvalues: config (copy), RoactModule (copy), IsInExperienceUIVREnabled (copy)
		if config.modalSelectorHandle ~= nil then
			RoactModule.unmount(config.modalSelectorHandle)
			config.modalSelectorHandle = nil
		end
		if IsInExperienceUIVREnabled then
			if config.modalSelectorFrame ~= nil then
				config.modalSelectorFrame.Parent = nil
				config.modalSelectorFrame = nil
			end
			if config.modalSelectorScreenGui ~= nil then
				config.modalSelectorScreenGui = nil
				
				return
			end
		elseif config.modalSelectorScreenGui ~= nil then
			config.modalSelectorFrame.Parent = nil
			config.modalSelectorFrame = nil
			config.modalSelectorScreenGui = nil
		end
	end
}