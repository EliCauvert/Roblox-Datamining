local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local expChatSharedModule = require(corePackagesService.Workspace.Packages.ExpChatShared)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local layerCollectorProvider = require(corePackagesService.Packages.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local styleProviderWithDefaultTheme = require(corePackagesService.Workspace.Packages.Style).StyleProviderWithDefaultTheme
local constantsModule = require(abuseReportMenu.Components.Constants)
local chatModalSelectorDialogModule = require(abuseReportMenu.Components.ChatModalSelectorDialog)
local _ = require(abuseReportMenu.Components.Types)
local fFlagHideShortcutsOnReportDropdownModule = require(abuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = nil
local UIManager = nil
local panelType = nil

if isInExperienceUIVREnabled then
	isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	UIManager = vrSpatialUiModule.UIManager
	panelType = vrSpatialUiModule.Constants.PanelType
end
local t = {
	modalSelectorHandle = nil,
	modalSelectorFrame = nil,
	modalSelectorScreenGui = nil
}

return {
	mountModalSelector = function(p0, p1, p2) --[[ line: 71 ]]
		-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (write), UIManager (write), panelType (write), t (ref), coreGuiService (ref), constantsModule (ref), fFlagHideShortcutsOnReportDropdownModule (ref), roactModule (ref), layerCollectorProvider (ref), localizationProvider (ref), localization (ref), localizationService (ref), roactRoduxModule (ref), expChatSharedModule (ref), styleProviderWithDefaultTheme (ref), chatModalSelectorDialogModule (ref)
		if isInExperienceUIVREnabled and isSpatial() then
			local moreMenuPanelObject = UIManager.getInstance():getPanelObject(panelType.MoreMenu)
			local frame = Instance.new("Frame")
			frame.BackgroundTransparency = 1
			frame.Position = UDim2.new(0, 0, 0, 0)
			frame.Size = UDim2.new(1, 0, 1, 0)
			frame.ZIndex = 10
			frame.Parent = moreMenuPanelObject
			t.modalSelectorFrame = frame
		elseif not t.modalSelectorScreenGui then
			local modalSelectorDialogGui = Instance.new("ScreenGui")
			modalSelectorDialogGui.Name = "ModalSelectorDialogGui"
			modalSelectorDialogGui.DisplayOrder = 7
			modalSelectorDialogGui.Enabled = true
			modalSelectorDialogGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			modalSelectorDialogGui.Parent = coreGuiService:FindFirstChild(constantsModule.AbuseReportMenuPlaceholderFrame, true)
			modalSelectorDialogGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
			t.modalSelectorScreenGui = modalSelectorDialogGui
			local frame = Instance.new("Frame")
			frame.BackgroundTransparency = 1
			frame.Position = UDim2.new(0, 0, 0, 0)
			frame.Size = UDim2.new(1, 0, 1, 0)
			frame.Parent = t.modalSelectorScreenGui
			t.modalSelectorFrame = frame
		end
		if fFlagHideShortcutsOnReportDropdownModule and p1 ~= nil then
			p1()
		end
		t.modalSelectorHandle = roactModule.mount(roactModule.createElement(layerCollectorProvider, {}, roactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			StoreProvider = roactModule.createElement(roactRoduxModule.StoreProvider, { store = expChatSharedModule.context.store }, {
				StyleProviderWithDefaultTheme = roactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true }, {
					ChatModalSelectorDialog = roactModule.createElement(chatModalSelectorDialogModule, { isShown = true, onClose = p0, onSelect = p2 })
				})
			})
		})), t.modalSelectorFrame, "ChatModalSelectorDialog")
	end,
	unmountModalSelector = function() --[[ line: 43 ]]
		-- upvalues: t (ref), roactModule (ref), isInExperienceUIVREnabled (ref)
		if t.modalSelectorHandle ~= nil then
			roactModule.unmount(t.modalSelectorHandle)
			t.modalSelectorHandle = nil
		end
		if isInExperienceUIVREnabled then
			if t.modalSelectorFrame ~= nil then
				t.modalSelectorFrame.Parent = nil
				t.modalSelectorFrame = nil
			end
			if t.modalSelectorScreenGui == nil then
				return
			else
				t.modalSelectorScreenGui = nil
				
				return
			end
		elseif t.modalSelectorScreenGui ~= nil then
			t.modalSelectorFrame.Parent = nil
			t.modalSelectorFrame = nil
			t.modalSelectorScreenGui = nil
		end
	end
}