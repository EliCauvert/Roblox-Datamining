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
local var13 = (require(robloxGui.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01
local fixVRActionBinding = game:DefineFastFlag("FixVRActionBinding", false)

if not VRService.VREnabled then
	warn("UserGui should not be required while not in VR")
	
	return nil
end
local var20
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
local vector2 = Vector2.new(2.66 * var13, 2 * var13)
local var17 = false
local var18 = panel3D.Get(t.ModuleName)
var18:SetType(panel3D.Type.NewStandard)
var18:GetPart().CanQuery = false
local vector2_1 = Vector2.new(2.7978, 2.09835)
var18:ResizeStuds(vector2_1.x, vector2_1.y, 128)
var18:SetVisible(false)
local _ = nil

if isSpatialRobloxGuiEnabledModule then
	var20 = panel3D.Get(VRConstants.PositionLockedPanelName)
	config = {}
	config.uiManagerPanelPart = UIManager.getInstance():createUI({ panelType = panelType.RobloxGui }).panelObject
	var20:SetType(panel3D.Type.UIManagerManaged, config)
else
	var20 = panel3D.Get(VRConstants.PositionLockedPanelName)
	var20:SetType(panel3D.Type.PositionLocked)
end
var20:GetPart().CanQuery = false
var20:ResizeStuds(vector2.x, vector2.y, 128)
var20:SetVisible(false)
var20.showCursor = true
VRHub.ModuleOpened.Event:connect(function(p0) --[[ line: 105 ]]
	-- upvalues: t (ref), VRHub (ref), var18 (ref)
	if p0 ~= t.ModuleName and VRHub:GetModule(p0).VRClosesNonExclusive and var18:IsVisible() then
		t:SetVisible(false, nil)
	end
end)
local var21 = false
local var22 = false

function t.SetVisible(_, _, _) --[[ line: 117 ]]
	-- upvalues: var22 (write), VRHub (ref), t (ref), var21 (write), isSpatialRobloxGuiEnabledModule (ref), coreGuiService (ref)
-- FATAL: Failed to generate AST for `SetVisible` function:
runtime : [KeyError] :11990: 17
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

function t.IsVisible(_) --[[ line: 138 ]]
	-- upvalues: var22 (write)
	return var22
end

function t.Update(p1) --[[ line: 142 ]]
	-- upvalues: var22 (write)
	p1:SetVisible(var22)
end

local function onGuiSelection() --[[ line: 147 ]]
	-- upvalues: VRHub (ref), t (ref), var20 (write), var13 (ref), var17 (write), vector2 (ref), guiService (ref)
	VRHub.LaserPointer:updateInputUserCFrame()
	
	if VRHub.ShowTopBar then
		t:SetVisible(true, var20)
		var20.initialCFLerp = 1
		var20:ForcePositionUpdate(true)
		var20.distance = 2.5 * var13
		
		if var17 then
			return
		else
			var20:StartLerp(vector2)
			var17 = true
			
			return
		end
	else
		var20:StartLerp(vector2 * 0.25)
		t:SetVisible(false, var20)
		guiService.SelectedObject = nil
		var17 = false
	end
end

VRHub.ShowTopBarChanged.Event:connect(onGuiSelection)
guiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(onGuiSelection)
VRService.UserCFrameEnabled:Connect(onGuiSelection)
guiService.PurchasePromptShown:Connect(function() --[[ line: 174 ]]
	-- upvalues: VRHub (ref)
	if not VRHub.ShowTopBar then
		VRHub:SetShowTopBar(true)
	end
end)

local function onGuiSelectedObjectChanged(_) --[[ line: 181 ]]
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

local function onVRMenuClicked(p2) --[[ line: 194 ]]
	-- upvalues: VRHub (ref), rbxAnalyticsService (ref), inGameMenuModule (ref), inGameMenuConstantsModule (ref)
	if p2 == "OpenVRMenu" then
		if VRHub.ShowTopBar then
			VRHub:SetShowTopBar(false)
			inGameMenuModule.closeInGameMenu()
			rbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-Off")
		else
			VRHub:SetShowTopBar(true)
			rbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-On")
		end
	end
	if p2 == "OpenIGMenu" then
		if not VRHub.ShowTopBar then
			VRHub:SetShowTopBar(true)
		end
		if not inGameMenuModule.getOpen() then
			inGameMenuModule.openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
		end
	end
end

local function handleAction(p3, p4, _) --[[ line: 219 ]]
	-- upvalues: onVRMenuClicked (ref)
	if p4 == Enum.UserInputState.Begin then
		onVRMenuClicked(p3)
	end
end

if isInExperienceUIVREnabled then
	local inputHandlersModule = require(corePackagesService_1.Packages.InputHandlers)
	local var29 = false
	local var30 = false
	
	function t.isInputNeededForOpenVRMenu(_, p5) --[[ line: 230 ]]
		return p5.KeyCode == Enum.KeyCode.ButtonSelect
	end
	
	function t.getOpenVRMenuHandler(_) --[[ line: 234 ]]
		-- upvalues: inputHandlersModule (ref), var29 (write), var30 (write), UIManager (write), VRHub (ref), rbxAnalyticsService (ref), inGameMenuModule (ref)
		local var32 = inputHandlersModule.handleInput({
			onPress = function() --[[ line: 236 ]]
				-- upvalues: var29 (copy), var30 (copy)
				var29 = true
				var30 = false
			end,
			hold = {
				durationSeconds = 1,
				allowReleaseAfterHold = true,
				onComplete = function() --[[ line: 242 ]]
					-- upvalues: var30 (copy), UIManager (copy)
					var30 = true
					UIManager.getInstance():resetDragAndDrop()
				end
			},
			onRelease = function() --[[ line: 248 ]]
				-- upvalues: var30 (copy), VRHub (copy), rbxAnalyticsService (copy), inGameMenuModule (copy), var29 (copy)
				if not var30 then
					if VRHub.ShowTopBar then
						VRHub:SetShowTopBar(false)
						inGameMenuModule.closeInGameMenu()
						rbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-Off")
					else
						VRHub:SetShowTopBar(true)
						rbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-On")
					end
				end
				var29 = false
				var30 = false
			end
		})
		
		return function(_, p6, _) --[[ line: 256 ]]
			-- upvalues: var32 (ref)
			var32({ eventData = { UserInputState = p6 } })
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

local function OnVREnabledChanged() --[[ line: 283 ]]
	-- upvalues: VRService (ref), var18 (ref), coreGuiService (ref), t (ref), var20 (write), VRHub (ref)
	if VRService.VREnabled then
		t:SetVisible(false, var18)
		t:SetVisible(true, var20)
		VRHub:SetShowTopBar(true)
		
		return
	end
	var18:SetVisible(false)
	coreGuiService:SetUserGuiRendering(false, nil, Enum.NormalId.Front)
end

VRService:GetPropertyChangedSignal("VREnabled"):connect(OnVREnabledChanged)
OnVREnabledChanged()
virtualKeyboardModule.OpenedEvent:connect(function() --[[ line: 296 ]]
	-- upvalues: var21 (write), t (ref)
	var21 = true
	t:Update()
end)
virtualKeyboardModule.ClosedEvent:connect(function() --[[ line: 301 ]]
	-- upvalues: var21 (write), t (ref)
	var21 = false
	t:Update()
end)
VRHub:SetShowTopBar(true)
onGuiSelection()

function t.getPanel(_) --[[ line: 309 ]]
	-- upvalues: var20 (write)
	return var20
end

return t