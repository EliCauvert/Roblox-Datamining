local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui").RobloxGui
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local inspectAndBuy = robloxGui.Modules.InspectAndBuy
local roactModule = require(corePackagesService.Packages.Roact)
local inspectAndBuyModule = require(inspectAndBuy.Components.InspectAndBuy)
local var1 = nil
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local fFlagAXEnableNewInspectAndBuyContainerModule = require(inspectAndBuy.Flags.FFlagAXEnableNewInspectAndBuyContainer)
local topBarModule = require(robloxGui.Modules.TopBar)
local fFlagTopBarSignalizeMenuOpen = coreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local inspectAndBuyFixStyleLink = game:DefineFastFlag("InspectAndBuyFixStyleLink", false)
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
local function mount(p1, p2, p3, p4)
	-- upvalues: var1 (write), roactModule (ref), renderWithCoreScriptsStyleProviderModule (ref), inspectAndBuyModule (ref), fFlagAXEnableNewInspectAndBuyContainerModule (ref), inspectAndBuyFixStyleLink (ref), isInExperienceUIVREnabled (ref), isSpatial (write), UIManager (write), panelType (write), robloxGui (ref), guiService (ref), fFlagTopBarSignalizeMenuOpen (ref), coreGuiCommonModule (ref), topBarModule (ref)
	if var1 then
		roactModule.unmount(var1)
		var1 = nil
	end
	local var2 = if fFlagAXEnableNewInspectAndBuyContainerModule then roactModule.createElement(inspectAndBuyModule, {
		humanoidDescription = p1,
		playerName = p2,
		playerId = p3,
		ctx = p4
	}) else renderWithCoreScriptsStyleProviderModule({
		inspectAndBuy = roactModule.createElement(inspectAndBuyModule, {
			humanoidDescription = p1,
			playerName = p2,
			playerId = p3,
			ctx = p4
		})
	})
	
	if inspectAndBuyFixStyleLink then
		var2 = roactModule.createElement("Folder", nil, var2)
	end
	var1 = if isInExperienceUIVREnabled and isSpatial() then roactModule.mount(var2, UIManager.getInstance():getPanelObject(panelType.MoreMenu), "InspectAndBuy") else roactModule.mount(var2, robloxGui, "InspectAndBuy")
	guiService:SetMenuIsOpen(true, "InspectMenu")
	
	if fFlagTopBarSignalizeMenuOpen then
		coreGuiCommonModule.Stores.GetInspectAndBuyStore(false).setInspectAndBuyOpen(true)
		
		return
	end
	topBarModule:setInspectMenuOpen(true)
end

local function unmountInspectAndBuy()
	-- upvalues: var1 (write), roactModule (ref), guiService (ref), fFlagTopBarSignalizeMenuOpen (ref), coreGuiCommonModule (ref), topBarModule (ref)
	if var1 then
		roactModule.unmount(var1)
		var1 = nil
		guiService:SetMenuIsOpen(false, "InspectMenu")
		
		if fFlagTopBarSignalizeMenuOpen then
			coreGuiCommonModule.Stores.GetInspectAndBuyStore(false).setInspectAndBuyOpen(false)
			
			return
		end
		topBarModule:setInspectMenuOpen(false)
	end
end

local function _(p1, p2, p3)
	-- upvalues: mount (ref)
	mount(p1, p2, nil, p3)
end

local _ = function(p1, p2)
	-- upvalues: mount (ref)
	mount(nil, nil, p1, p2)
end

guiService.InspectPlayerFromHumanoidDescriptionRequest:Connect(function(p1, p2)
	-- upvalues: mount (ref)
	mount(p1, p2, nil, "developerThroughHumanoidDescription")
end)
guiService.InspectPlayerFromUserIdWithCtxRequest:Connect(function(p1, p2)
	-- upvalues: mount (ref)
	mount(nil, nil, p1, p2)
end)
guiService.CloseInspectMenuRequest:Connect(function()
	-- upvalues: var1 (write), unmountInspectAndBuy (ref)
	if var1 then
		unmountInspectAndBuy()
	end
end)
guiService.InspectMenuEnabledChangedSignal:Connect(function(p1)
	-- upvalues: var1 (write), unmountInspectAndBuy (ref)
	if not p1 and var1 then
		unmountInspectAndBuy()
	end
end)