local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui").RobloxGui
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local inspectAndBuy = robloxGui.Modules.InspectAndBuy
local roactModule = require(corePackagesService.Packages.Roact)
local inspectAndBuyModule = require(inspectAndBuy.Components.InspectAndBuy)
local var5 = nil
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
local function mount(p0, p1, p2, p3)
	-- upvalues: var5 (write), roactModule (ref), renderWithCoreScriptsStyleProviderModule (ref), inspectAndBuyModule (ref), fFlagAXEnableNewInspectAndBuyContainerModule (ref), inspectAndBuyFixStyleLink (ref), isInExperienceUIVREnabled (ref), isSpatial (write), UIManager (write), panelType (write), robloxGui (ref), guiService (ref), fFlagTopBarSignalizeMenuOpen (ref), coreGuiCommonModule (ref), topBarModule (ref)
	if var5 then
		roactModule.unmount(var5)
		var5 = nil
	end
	local var13 = if fFlagAXEnableNewInspectAndBuyContainerModule then roactModule.createElement(inspectAndBuyModule, {
		humanoidDescription = p0,
		playerName = p1,
		playerId = p2,
		ctx = p3
	}) else renderWithCoreScriptsStyleProviderModule({
		inspectAndBuy = roactModule.createElement(inspectAndBuyModule, {
			humanoidDescription = p0,
			playerName = p1,
			playerId = p2,
			ctx = p3
		})
	})
	
	if inspectAndBuyFixStyleLink then
		var13 = roactModule.createElement("Folder", nil, var13)
	end
	var5 = if isInExperienceUIVREnabled and isSpatial() then roactModule.mount(var13, UIManager.getInstance():getPanelObject(panelType.MoreMenu), "InspectAndBuy") else roactModule.mount(var13, robloxGui, "InspectAndBuy")
	guiService:SetMenuIsOpen(true, "InspectMenu")
	
	if fFlagTopBarSignalizeMenuOpen then
		coreGuiCommonModule.Stores.GetInspectAndBuyStore(false).setInspectAndBuyOpen(true)
		
		return
	end
	topBarModule:setInspectMenuOpen(true)
end

local function unmountInspectAndBuy()
	-- upvalues: var5 (write), roactModule (ref), guiService (ref), fFlagTopBarSignalizeMenuOpen (ref), coreGuiCommonModule (ref), topBarModule (ref)
	if var5 then
		roactModule.unmount(var5)
		var5 = nil
		guiService:SetMenuIsOpen(false, "InspectMenu")
		
		if fFlagTopBarSignalizeMenuOpen then
			coreGuiCommonModule.Stores.GetInspectAndBuyStore(false).setInspectAndBuyOpen(false)
			
			return
		end
		topBarModule:setInspectMenuOpen(false)
	end
end

local function _(p4, p5, p6)
	-- upvalues: mount (ref)
	mount(p4, p5, nil, p6)
end

local _ = function(p7, p8)
	-- upvalues: mount (ref)
	mount(nil, nil, p7, p8)
end

guiService.InspectPlayerFromHumanoidDescriptionRequest:Connect(function(p9, p10)
	-- upvalues: mount (ref)
	mount(p9, p10, nil, "developerThroughHumanoidDescription")
end)
guiService.InspectPlayerFromUserIdWithCtxRequest:Connect(function(p11, p12)
	-- upvalues: mount (ref)
	mount(nil, nil, p11, p12)
end)
guiService.CloseInspectMenuRequest:Connect(function()
	-- upvalues: var5 (write), unmountInspectAndBuy (ref)
	if var5 then
		unmountInspectAndBuy()
	end
end)
guiService.InspectMenuEnabledChangedSignal:Connect(function(p13)
	-- upvalues: var5 (write), unmountInspectAndBuy (ref)
	if not p13 and var5 then
		unmountInspectAndBuy()
	end
end)