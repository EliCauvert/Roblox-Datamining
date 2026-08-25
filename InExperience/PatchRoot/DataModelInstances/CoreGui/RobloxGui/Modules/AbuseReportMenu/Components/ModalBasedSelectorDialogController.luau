local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(abuseReportMenu.Components.Constants)
local modalBaseSelectorDialogModule = require(abuseReportMenu.Components.ModalBaseSelectorDialog)
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
	mountModalSelector = function(p0, p1, p2, p3, p4, p5)
		-- upvalues: guiService (ref), isInExperienceUIVREnabled (ref), isSpatial (write), UIManager (write), panelType (write), t (ref), coreGuiService (ref), constantsModule (ref), fFlagHideShortcutsOnReportDropdownModule (ref), roactModule (ref), modalBaseSelectorDialogModule (ref)
		local guiInset, _ = guiService:GetGuiInset()
		
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
			t.modalSelectorScreenGui = modalSelectorDialogGui
			local frame = Instance.new("Frame")
			frame.BackgroundTransparency = 1
			frame.Position = UDim2.new(0, 0, 0, -guiInset.Y)
			frame.Size = UDim2.new(1, 0, 1, guiInset.Y)
			frame.Parent = t.modalSelectorScreenGui
			t.modalSelectorFrame = frame
		end
		if fFlagHideShortcutsOnReportDropdownModule and p5 ~= nil then
			p5()
		end
		t.modalSelectorHandle = roactModule.mount(roactModule.createElement(modalBaseSelectorDialogModule, {
			isShown = true,
			cellData = p2,
			viewportHeight = p0,
			viewportWidth = p1,
			onSelect = p3,
			onClose = p4
		}), t.modalSelectorFrame, "ModalSelectorDialog")
	end,
	unmountModalSelector = function()
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