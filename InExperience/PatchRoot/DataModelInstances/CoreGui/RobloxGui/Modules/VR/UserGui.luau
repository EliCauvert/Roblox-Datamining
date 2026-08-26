local panelType, UIManager
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local VRService = game:GetService("VRService")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local _ = game:GetService("GamepadService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = coreGuiService.RobloxGui
local modules = robloxGui:WaitForChild("Modules")
local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local virtualKeyboardModule = require(robloxGui.Modules.VR.VirtualKeyboard)
local inGameMenuConstantsModule = require(robloxGui.Modules.InGameMenuConstants)
local isSpatialRobloxGuiEnabledModule = require(robloxGui.Modules.VR.IsSpatialRobloxGuiEnabled)
local corePackagesService_1 = game:GetService("CorePackages")
local VRConstants = require(corePackagesService_1.Workspace.Packages.VrCompatibility).VRConstants
local _ = game:GetService("UserInputService")
local _ = game:GetService("RunService")
local isInExperienceUIVREnabled = require(corePackagesService_1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagEnableUIManagerPackgify = require(corePackagesService_1.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify
local _ = nil
local _ = nil

if fFlagEnableUIManagerPackgify then
	local vrSpatialUiModule = require(corePackagesService_1.Workspace.Packages.VrSpatialUi)
	panelType = vrSpatialUiModule.Constants.PanelType
	UIManager = vrSpatialUiModule.UIManager
else
	local UIManager_1 = modules:WaitForChild("UIManager")
	panelType = require(UIManager_1.Constants).PanelType
	UIManager = require(UIManager_1.UIManager)
end
local var1 = (require(robloxGui.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01
local fixVRActionBinding = game:DefineFastFlag("FixVRActionBinding", false)
local fixUserGuiRenderingAfterVRDisabled = game:DefineFastFlag("FixUserGuiRenderingAfterVRDisabled", false)

if not VRService.VREnabled then
	warn("UserGui should not be required while not in VR")
	
	return nil
end
local var2
VRService.QuestDisplayRefreshRate = 90
local t = {
	ModuleName = "UserGui",
	KeepVRTopbarOpen = false,
	VRIsExclusive = false,
	VRClosesNonExclusive = false,
	SetVisible = nil
}
VRHub:RegisterModule(t)
local _ = Vector2.new(4, 3)
local vector2 = Vector2.new(2.66 * var1, 2 * var1)
local var3 = false
local var4 = panel3D.Get(t.ModuleName)
var4:SetType(panel3D.Type.NewStandard)
var4:GetPart().CanQuery = false
local vector2_1 = Vector2.new(2.7978, 2.09835)
var4:ResizeStuds(vector2_1.x, vector2_1.y, 128)
var4:SetVisible(false)
local _ = nil

if isSpatialRobloxGuiEnabledModule then
	var2 = panel3D.Get(VRConstants.PositionLockedPanelName)
	config = {}
	config.uiManagerPanelPart = UIManager.getInstance():createUI({ panelType = panelType.RobloxGui }).panelObject
	var2:SetType(panel3D.Type.UIManagerManaged, config)
else
	var2 = panel3D.Get(VRConstants.PositionLockedPanelName)
	var2:SetType(panel3D.Type.PositionLocked)
end
var2:GetPart().CanQuery = false
var2:ResizeStuds(vector2.x, vector2.y, 128)
var2:SetVisible(false)
var2.showCursor = true
VRHub.ModuleOpened.Event:connect(function(p1)
	-- upvalues: t (ref), VRHub (ref), var4 (ref)
	if p1 ~= t.ModuleName and VRHub:GetModule(p1).VRClosesNonExclusive and var4:IsVisible() then
		t:SetVisible(false, nil)
	end
end)
local var5 = false
local var6 = false

function t.SetVisible(_, _, _)
	-- upvalues: var6 (write), VRHub (ref), t (ref), var5 (write), isSpatialRobloxGuiEnabledModule (ref), coreGuiService (ref)
-- FATAL: Failed to generate AST for `SetVisible` function:
runtime : [KeyError] :11990: 17
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

function t.IsVisible(_)
	-- upvalues: var6 (write)
	return var6
end

function t.Update(p1)
	-- upvalues: var6 (write)
	p1:SetVisible(var6)
end

local function onGuiSelection()
	-- upvalues: fixUserGuiRenderingAfterVRDisabled (ref), VRService (ref), VRHub (ref), t (ref), var2 (write), var1 (ref), var3 (write), vector2 (ref), guiService (ref)
	if fixUserGuiRenderingAfterVRDisabled and not VRService.VREnabled then return end
	VRHub.LaserPointer:updateInputUserCFrame()
	
	if VRHub.ShowTopBar then
		t:SetVisible(true, var2)
		var2.initialCFLerp = 1
		var2:ForcePositionUpdate(true)
		var2.distance = 2.5 * var1
		
		if var3 then
			return
		else
			var2:StartLerp(vector2)
			var3 = true
			
			return
		end
	else
		var2:StartLerp(vector2 * 0.25)
		t:SetVisible(false, var2)
		guiService.SelectedObject = nil
		var3 = false
	end
end

VRHub.ShowTopBarChanged.Event:connect(onGuiSelection)
guiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(onGuiSelection)
VRService.UserCFrameEnabled:Connect(onGuiSelection)
guiService.PurchasePromptShown:Connect(function()
	-- upvalues: VRHub (ref)
	if not VRHub.ShowTopBar then
		VRHub:SetShowTopBar(true)
	end
end)

local function onGuiSelectedObjectChanged(_)
	-- upvalues: guiService (ref), VRHub (ref)
	if (guiService.SelectedObject or guiService.SelectedCoreObject) and not VRHub.ShowTopBar then
		VRHub:SetShowTopBar(true)
	end
	guiService.SelectedObject = nil
	guiService.SelectedCoreObject = nil
end

guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(onGuiSelectedObjectChanged)
guiService:GetPropertyChangedSignal("SelectedObject"):Connect(onGuiSelectedObjectChanged)
local inGameMenuModule = require(robloxGui.Modules.InGameMenu)

local function onVRMenuClicked(p1)
	-- upvalues: VRHub (ref), rbxAnalyticsService (ref), inGameMenuModule (ref), inGameMenuConstantsModule (ref)
	if p1 == "OpenVRMenu" then
		if VRHub.ShowTopBar then
			VRHub:SetShowTopBar(false)
			inGameMenuModule.closeInGameMenu()
			rbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-Off")
		else
			VRHub:SetShowTopBar(true)
			rbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-On")
		end
	end
	if p1 == "OpenIGMenu" then
		if not VRHub.ShowTopBar then
			VRHub:SetShowTopBar(true)
		end
		if not inGameMenuModule.getOpen() then
			inGameMenuModule.openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
		end
	end
end

local function handleAction(p1, p2, _)
	-- upvalues: onVRMenuClicked (ref)
	if p2 == Enum.UserInputState.Begin then
		onVRMenuClicked(p1)
	end
end

if isInExperienceUIVREnabled then
	local inputHandlersModule = require(corePackagesService_1.Packages.InputHandlers)
	local var7 = false
	local var8 = false
	
	function t.isInputNeededForOpenVRMenu(_, p1)
		return p1.KeyCode == Enum.KeyCode.ButtonSelect
	end
	
	function t.getOpenVRMenuHandler(_)
		-- upvalues: inputHandlersModule (ref), var7 (write), var8 (write), UIManager (write), VRHub (ref), rbxAnalyticsService (ref), inGameMenuModule (ref)
		local var9 = inputHandlersModule.handleInput({
			onPress = function()
				-- upvalues: var7 (copy), var8 (copy)
				var7 = true
				var8 = false
			end,
			hold = {
				durationSeconds = 1,
				allowReleaseAfterHold = true,
				onComplete = function()
					-- upvalues: var8 (copy), UIManager (copy)
					var8 = true
					UIManager.getInstance():resetDragAndDrop()
				end
			},
			onRelease = function()
				-- upvalues: var8 (copy), VRHub (copy), rbxAnalyticsService (copy), inGameMenuModule (copy), var7 (copy)
				if not var8 then
					if VRHub.ShowTopBar then
						VRHub:SetShowTopBar(false)
						inGameMenuModule.closeInGameMenu()
						rbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-Off")
					else
						VRHub:SetShowTopBar(true)
						rbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-On")
					end
				end
				var7 = false
				var8 = false
			end
		})
		
		return function(_, p1, _)
			-- upvalues: var9 (ref)
			var9({ eventData = { UserInputState = p1 } })
		end
	end
end
if not fixVRActionBinding and not isInExperienceUIVREnabled then
	contextActionService:BindAction("OpenVRMenu", handleAction, false, Enum.KeyCode.ButtonSelect)
elseif isInExperienceUIVREnabled then
	contextActionService:BindCoreAction("OpenVRMenu", t:getOpenVRMenuHandler(), false, Enum.KeyCode.ButtonSelect)
else
	contextActionService:BindCoreAction("OpenVRMenu", handleAction, false, Enum.KeyCode.ButtonSelect)
end
contextActionService:BindAction("OpenIGMenu", handleAction, false, Enum.KeyCode.ButtonStart)

local function OnVREnabledChanged()
	-- upvalues: VRService (ref), var4 (ref), coreGuiService (ref), t (ref), var2 (write), VRHub (ref)
	if VRService.VREnabled then
		t:SetVisible(false, var4)
		t:SetVisible(true, var2)
		VRHub:SetShowTopBar(true)
		
		return
	end
	var4:SetVisible(false)
	coreGuiService:SetUserGuiRendering(false, nil, Enum.NormalId.Front)
end

VRService:GetPropertyChangedSignal("VREnabled"):connect(OnVREnabledChanged)
OnVREnabledChanged()
virtualKeyboardModule.OpenedEvent:connect(function()
	-- upvalues: var5 (write), t (ref)
	var5 = true
	t:Update()
end)
virtualKeyboardModule.ClosedEvent:connect(function()
	-- upvalues: var5 (write), t (ref)
	var5 = false
	t:Update()
end)
VRHub:SetShowTopBar(true)
onGuiSelection()

function t.getPanel(_)
	-- upvalues: var2 (write)
	return var2
end

return t