local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local ModalBaseSelectorDialogModule = require(AbuseReportMenu.Components.ModalBaseSelectorDialog)
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
	mountModalSelector = function(ViewportHeight, ViewportWidth, CellData, OnSelect, OnClose, Callback: () -> ()) --[[ Line: 58 ]]
		-- upvalues: GuiService (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (ref), UIManager (ref), PanelType (ref), config (copy), CoreGui (copy), ConstantsModule (copy), FFlagHideShortcutsOnReportDropdownModule (copy), RoactModule (copy), ModalBaseSelectorDialogModule (copy)
		local GuiInset, _ = GuiService:GetGuiInset()
		
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
			config.modalSelectorScreenGui = ModalSelectorDialogGui
			local Frame = Instance.new("Frame")
			Frame.BackgroundTransparency = 1
			Frame.Position = UDim2.new(0, 0, 0, -GuiInset.Y)
			Frame.Size = UDim2.new(1, 0, 1, GuiInset.Y)
			Frame.Parent = config.modalSelectorScreenGui
			config.modalSelectorFrame = Frame
		end
		if FFlagHideShortcutsOnReportDropdownModule and Callback ~= nil then
			Callback()
		end
		config.modalSelectorHandle = RoactModule.mount(RoactModule.createElement(ModalBaseSelectorDialogModule, {
			isShown = true,
			cellData = CellData,
			viewportHeight = ViewportHeight,
			viewportWidth = ViewportWidth,
			onSelect = OnSelect,
			onClose = OnClose
		}), config.modalSelectorFrame, "ModalSelectorDialog")
	end,
	unmountModalSelector = function() --[[ Line: 34 ]]
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