local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local VRService = game:GetService("VRService")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local _ = game:GetService("GamepadService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = CoreGui.RobloxGui
local Modules = RobloxGui:WaitForChild("Modules")
local Panel3D = require(CorePackages.Workspace.Packages.VrCommon).Panel3D
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local VirtualKeyboardModule = require(RobloxGui.Modules.VR.VirtualKeyboard)
local InGameMenuConstantsModule = require(RobloxGui.Modules.InGameMenuConstants)
local IsSpatialRobloxGuiEnabledModule = require(RobloxGui.Modules.VR.IsSpatialRobloxGuiEnabled)
local CorePackages1 = game:GetService("CorePackages")
local VRConstants = require(CorePackages1.Workspace.Packages.VrCompatibility).VRConstants
local _ = game:GetService("UserInputService")
local _ = game:GetService("RunService")
local IsInExperienceUIVREnabled = require(CorePackages1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local UIManager = nil
local PanelType = nil

if require(CorePackages1.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify then
	local VrSpatialUiModule = require(CorePackages1.Workspace.Packages.VrSpatialUi)
	PanelType = VrSpatialUiModule.Constants.PanelType
	UIManager = VrSpatialUiModule.UIManager
else
	local UIManager1 = Modules:WaitForChild("UIManager")
	PanelType = require(UIManager1.Constants).PanelType
	UIManager = require(UIManager1.UIManager)
end
local v1 = (require(RobloxGui.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01
local FixVRActionBinding = game:DefineFastFlag("FixVRActionBinding", false)
local FixUserGuiRenderingAfterVRDisabled = game:DefineFastFlag("FixUserGuiRenderingAfterVRDisabled", false)

if not VRService.VREnabled then
	warn("UserGui should not be required while not in VR")
	
	return nil
end
VRService.QuestDisplayRefreshRate = 90
local UserGuiModule = {
	ModuleName = "UserGui",
	KeepVRTopbarOpen = false,
	VRIsExclusive = false,
	VRClosesNonExclusive = false,
	SetVisible = nil
}
VRHub:RegisterModule(UserGuiModule)
local _ = Vector2.new(4, 3)
local _Vector2 = Vector2.new(2.66 * v1, 2 * v1)
local Flag = false
local GetResult = Panel3D.Get(UserGuiModule.ModuleName)
GetResult:SetType(Panel3D.Type.NewStandard)
GetResult:GetPart().CanQuery = false
local _Vector2_1 = Vector2.new(2.7978, 2.09835)
GetResult:ResizeStuds(_Vector2_1.x, _Vector2_1.y, 128)
GetResult:SetVisible(false)
local GetResult1 = nil

if IsSpatialRobloxGuiEnabledModule then
	GetResult1 = Panel3D.Get(VRConstants.PositionLockedPanelName)
	config = {}
	config.uiManagerPanelPart = UIManager.getInstance():createUI({ panelType = PanelType.RobloxGui }).panelObject
	GetResult1:SetType(Panel3D.Type.UIManagerManaged, config)
else
	GetResult1 = Panel3D.Get(VRConstants.PositionLockedPanelName)
	GetResult1:SetType(Panel3D.Type.PositionLocked)
end
GetResult1:GetPart().CanQuery = false
GetResult1:ResizeStuds(_Vector2.x, _Vector2.y, 128)
GetResult1:SetVisible(false)
GetResult1.showCursor = true
VRHub.ModuleOpened.Event:connect(function(ModuleName)
	-- upvalues: UserGuiModule (copy), VRHub (copy), GetResult (copy)
	if ModuleName ~= UserGuiModule.ModuleName and VRHub:GetModule(ModuleName).VRClosesNonExclusive and GetResult:IsVisible() then
		UserGuiModule:SetVisible(false, nil)
	end
end)
local Flag1 = false
local Visible = false

function UserGuiModule:SetVisible(Value, GetResult)
	-- upvalues: Visible (ref), VRHub (copy), UserGuiModule (copy), Flag1 (ref), IsSpatialRobloxGuiEnabledModule (copy), CoreGui (copy)
	Visible = Value
	
	if GetResult then
		GetResult:SetVisible(Visible)
	end
	if Visible then
		VRHub:FireModuleOpened(UserGuiModule.ModuleName)
	else
		VRHub:FireModuleClosed(UserGuiModule.ModuleName)
	end
	local NoFlag1: boolean = Visible and not Flag1
	
	if IsSpatialRobloxGuiEnabledModule then
		CoreGui:SetUserGuiRendering(true, NoFlag1 and GetResult and GetResult:GetPart() or nil, Enum.NormalId.Back)
		
		return
	else
		CoreGui:SetUserGuiRendering(true, NoFlag1 and GetResult and GetResult:GetPart() or nil, Enum.NormalId.Front)
	end
end

function UserGuiModule:IsVisible()
	-- upvalues: Visible (ref)
	return Visible
end

function UserGuiModule.Update(p1)
	-- upvalues: Visible (ref)
	p1:SetVisible(Visible)
end

local function onGuiSelection()
	-- upvalues: FixUserGuiRenderingAfterVRDisabled (copy), VRService (copy), VRHub (copy), UserGuiModule (copy), GetResult1 (ref), v1 (copy), Flag (ref), _Vector2 (copy), GuiService (copy)
	if FixUserGuiRenderingAfterVRDisabled and not VRService.VREnabled then return end
	VRHub.LaserPointer:updateInputUserCFrame()
	
	if VRHub.ShowTopBar then
		UserGuiModule:SetVisible(true, GetResult1)
		GetResult1.initialCFLerp = 1
		GetResult1:ForcePositionUpdate(true)
		GetResult1.distance = 2.5 * v1
		
		if not Flag then
			GetResult1:StartLerp(_Vector2)
			Flag = true
			
			return
		end
	else
		GetResult1:StartLerp(_Vector2 * 0.25)
		UserGuiModule:SetVisible(false, GetResult1)
		GuiService.SelectedObject = nil
		Flag = false
	end
end

VRHub.ShowTopBarChanged.Event:connect(onGuiSelection)
GuiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(onGuiSelection)
VRService.UserCFrameEnabled:Connect(onGuiSelection)
GuiService.PurchasePromptShown:Connect(function()
	-- upvalues: VRHub (copy)
	if not VRHub.ShowTopBar then
		VRHub:SetShowTopBar(true)
	end
end)

local function onGuiSelectedObjectChanged(_)
	-- upvalues: GuiService (copy), VRHub (copy)
	if (GuiService.SelectedObject or GuiService.SelectedCoreObject) and not VRHub.ShowTopBar then
		VRHub:SetShowTopBar(true)
	end
	GuiService.SelectedObject = nil
	GuiService.SelectedCoreObject = nil
end

GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(onGuiSelectedObjectChanged)
GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(onGuiSelectedObjectChanged)
local InGameMenuModule = require(RobloxGui.Modules.InGameMenu)

local function onVRMenuClicked(p1)
	-- upvalues: VRHub (copy), RbxAnalyticsService (copy), InGameMenuModule (copy), InGameMenuConstantsModule (copy)
	if p1 == "OpenVRMenu" then
		if VRHub.ShowTopBar then
			VRHub:SetShowTopBar(false)
			InGameMenuModule.closeInGameMenu()
			RbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-Off")
		else
			VRHub:SetShowTopBar(true)
			RbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-On")
		end
	end
	if p1 == "OpenIGMenu" then
		if not VRHub.ShowTopBar then
			VRHub:SetShowTopBar(true)
		end
		if not InGameMenuModule.getOpen() then
			InGameMenuModule.openInGameMenu(InGameMenuConstantsModule.MainPagePageKey)
		end
	end
end

local function handleAction(ActionName, InputState, _)
	-- upvalues: onVRMenuClicked (copy)
	if InputState == Enum.UserInputState.Begin then
		onVRMenuClicked(ActionName)
	end
end

if IsInExperienceUIVREnabled then
	local InputHandlersModule = require(CorePackages1.Packages.InputHandlers)
	local Flag2 = false
	local Flag3 = false
	
	function UserGuiModule:isInputNeededForOpenVRMenu(Input): boolean
		return Input.KeyCode == Enum.KeyCode.ButtonSelect
	end
	
	function UserGuiModule:getOpenVRMenuHandler()
		-- upvalues: InputHandlersModule (copy), Flag2 (ref), Flag3 (ref), UIManager (ref), VRHub (copy), RbxAnalyticsService (copy), InGameMenuModule (copy)
		local HandleInputResult = InputHandlersModule.handleInput({
			onPress = function()
				-- upvalues: Flag2 (upval), Flag3 (upval)
				Flag2 = true
				Flag3 = false
			end,
			hold = {
				durationSeconds = 1,
				allowReleaseAfterHold = true,
				onComplete = function()
					-- upvalues: Flag3 (upval), UIManager (upval)
					Flag3 = true
					UIManager.getInstance():resetDragAndDrop()
				end
			},
			onRelease = function()
				-- upvalues: Flag3 (upval), VRHub (upval), RbxAnalyticsService (upval), InGameMenuModule (upval), Flag2 (upval)
				if not Flag3 then
					if VRHub.ShowTopBar then
						VRHub:SetShowTopBar(false)
						InGameMenuModule.closeInGameMenu()
						RbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-Off")
					else
						VRHub:SetShowTopBar(true)
						RbxAnalyticsService:ReportCounter("VR-BindAction-ToggleGui-On")
					end
				end
				Flag2 = false
				Flag3 = false
			end
		})
		
		return function(_, UserInputState, _)
			-- upvalues: HandleInputResult (copy)
			HandleInputResult({ eventData = { UserInputState = UserInputState } })
		end
	end
end
if FixVRActionBinding or IsInExperienceUIVREnabled then
	if IsInExperienceUIVREnabled then
		ContextActionService:BindCoreAction("OpenVRMenu", UserGuiModule:getOpenVRMenuHandler(), false, Enum.KeyCode.ButtonSelect)
	else
		ContextActionService:BindCoreAction("OpenVRMenu", handleAction, false, Enum.KeyCode.ButtonSelect)
	end
else
	ContextActionService:BindAction("OpenVRMenu", handleAction, false, Enum.KeyCode.ButtonSelect)
end
ContextActionService:BindAction("OpenIGMenu", handleAction, false, Enum.KeyCode.ButtonStart)

local function OnVREnabledChanged()
	-- upvalues: VRService (copy), GetResult (copy), CoreGui (copy), UserGuiModule (copy), GetResult1 (ref), VRHub (copy)
	if VRService.VREnabled then
		UserGuiModule:SetVisible(false, GetResult)
		UserGuiModule:SetVisible(true, GetResult1)
		VRHub:SetShowTopBar(true)
		
		return
	else
		GetResult:SetVisible(false)
		CoreGui:SetUserGuiRendering(false, nil, Enum.NormalId.Front)
	end
end

VRService:GetPropertyChangedSignal("VREnabled"):connect(OnVREnabledChanged)
OnVREnabledChanged()
VirtualKeyboardModule.OpenedEvent:connect(function()
	-- upvalues: Flag1 (ref), UserGuiModule (copy)
	Flag1 = true
	UserGuiModule:Update()
end)
VirtualKeyboardModule.ClosedEvent:connect(function()
	-- upvalues: Flag1 (ref), UserGuiModule (copy)
	Flag1 = false
	UserGuiModule:Update()
end)
VRHub:SetShowTopBar(true)
onGuiSelection()

function UserGuiModule:getPanel()
	-- upvalues: GetResult1 (ref)
	return GetResult1
end

return UserGuiModule