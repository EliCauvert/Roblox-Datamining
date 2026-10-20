local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local InspectAndBuy = RobloxGui.Modules.InspectAndBuy
local RoactModule = require(CorePackages.Packages.Roact)
local InspectAndBuyModule = require(InspectAndBuy.Components.InspectAndBuy)
local InspectAndBuy1 = nil
local RenderWithCoreScriptsStyleProviderModule = require(RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local FFlagAXEnableNewInspectAndBuyContainerModule = require(InspectAndBuy.Flags.FFlagAXEnableNewInspectAndBuyContainer)
local TopBarModule = require(RobloxGui.Modules.TopBar)
local FFlagTopBarSignalizeMenuOpen = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local InspectAndBuyFixStyleLink = game:DefineFastFlag("InspectAndBuyFixStyleLink", false)
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
local function mount(HumanoidDescription, PlayerName, PlayerId, Ctx)
	-- upvalues: InspectAndBuy1 (ref), RoactModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), InspectAndBuyModule (copy), FFlagAXEnableNewInspectAndBuyContainerModule (copy), InspectAndBuyFixStyleLink (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (ref), UIManager (ref), PanelType (ref), RobloxGui (copy), GuiService (copy), FFlagTopBarSignalizeMenuOpen (copy), CoreGuiCommonModule (copy), TopBarModule (copy)
	if InspectAndBuy1 then
		RoactModule.unmount(InspectAndBuy1)
		InspectAndBuy1 = nil
	end
	local Element = if FFlagAXEnableNewInspectAndBuyContainerModule then RoactModule.createElement(InspectAndBuyModule, {
		humanoidDescription = HumanoidDescription,
		playerName = PlayerName,
		playerId = PlayerId,
		ctx = Ctx
	}) else RenderWithCoreScriptsStyleProviderModule({
		inspectAndBuy = RoactModule.createElement(InspectAndBuyModule, {
			humanoidDescription = HumanoidDescription,
			playerName = PlayerName,
			playerId = PlayerId,
			ctx = Ctx
		})
	})
	
	if InspectAndBuyFixStyleLink then
		Element = RoactModule.createElement("Folder", nil, Element)
	end
	InspectAndBuy1 = if IsInExperienceUIVREnabled and IsSpatialFunction() then RoactModule.mount(Element, UIManager.getInstance():getPanelObject(PanelType.MoreMenu), "InspectAndBuy") else RoactModule.mount(Element, RobloxGui, "InspectAndBuy")
	GuiService:SetMenuIsOpen(true, "InspectMenu")
	
	if FFlagTopBarSignalizeMenuOpen then
		CoreGuiCommonModule.Stores.GetInspectAndBuyStore(false).setInspectAndBuyOpen(true)
		
		return
	else
		TopBarModule:setInspectMenuOpen(true)
	end
end

local function unmountInspectAndBuy()
	-- upvalues: InspectAndBuy1 (ref), RoactModule (copy), GuiService (copy), FFlagTopBarSignalizeMenuOpen (copy), CoreGuiCommonModule (copy), TopBarModule (copy)
	if InspectAndBuy1 then
		RoactModule.unmount(InspectAndBuy1)
		InspectAndBuy1 = nil
		GuiService:SetMenuIsOpen(false, "InspectMenu")
		
		if FFlagTopBarSignalizeMenuOpen then
			CoreGuiCommonModule.Stores.GetInspectAndBuyStore(false).setInspectAndBuyOpen(false)
			
			return
		end
		TopBarModule:setInspectMenuOpen(false)
	end
end

local function _(HumanoidDescription, PlayerName, Ctx)
	-- upvalues: mount (copy)
	mount(HumanoidDescription, PlayerName, nil, Ctx)
end

local _ = function(PlayerId, Ctx)
	-- upvalues: mount (copy)
	mount(nil, nil, PlayerId, Ctx)
end

GuiService.InspectPlayerFromHumanoidDescriptionRequest:Connect(function(HumanoidDescription, PlayerName)
	-- upvalues: mount (copy)
	mount(HumanoidDescription, PlayerName, nil, "developerThroughHumanoidDescription")
end)
GuiService.InspectPlayerFromUserIdWithCtxRequest:Connect(function(UserId, Ctx)
	-- upvalues: mount (copy)
	mount(nil, nil, UserId, Ctx)
end)
GuiService.CloseInspectMenuRequest:Connect(function()
	-- upvalues: InspectAndBuy1 (ref), unmountInspectAndBuy (copy)
	if InspectAndBuy1 then
		unmountInspectAndBuy()
	end
end)
GuiService.InspectMenuEnabledChangedSignal:Connect(function(Enabled)
	-- upvalues: InspectAndBuy1 (ref), unmountInspectAndBuy (copy)
	if not Enabled and InspectAndBuy1 then
		unmountInspectAndBuy()
	end
end)