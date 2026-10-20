local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Panel3D = require(CorePackages.Workspace.Packages.VrCommon).Panel3D
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local Visible = false
local RecenterModule = {
	ModuleName = "Recenter",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = false
}
VRHub:RegisterModule(RecenterModule)
local RecenterCountdown = Panel3D.Get("RecenterCountdown")
RecenterCountdown:SetType(Panel3D.Type.HorizontalFollow)
RecenterCountdown:ResizeStuds(5, 3, 128)
RecenterCountdown:SetCanFade(false)
local v1 = CreateFunction("TextLabel")({
	BackgroundTransparency = 0.9,
	Text = "",
	TextScaled = true,
	Visible = true,
	Parent = RecenterCountdown:GetGUI(),
	Position = UDim2.new(0.5, -64, 0.5, -64),
	Size = UDim2.new(0, 128, 0, 128),
	BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
	TextColor3 = Color3.new(1, 1, 1),
	Font = Enum.Font.SourceSansBold
})
local _ = CreateFunction("ImageLabel")({
	BackgroundTransparency = 1,
	Image = "rbxasset://textures/ui/VR/recenterFrame.png",
	Parent = RecenterCountdown:GetGUI(),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, 0, 1, 0)
})
RecenterCountdown:SetVisible(false)
local Flag = false

local function _()
	-- upvalues: Flag (ref), RecenterCountdown (copy)
	Flag = false
	RecenterCountdown:SetVisible(false)
end

VRHub.ModuleOpened.Event:connect(function(ModuleName)
	-- upvalues: RecenterModule (copy), VRHub (copy), Flag (ref), RecenterCountdown (copy)
	if ModuleName ~= RecenterModule.ModuleName and VRHub:GetModule(ModuleName).VRIsExclusive then
		Flag = false
		RecenterCountdown:SetVisible(false)
	end
end)

function RecenterModule:SetVisible(Value)
	-- upvalues: Visible (ref), Flag (ref), RecenterCountdown (copy), VRHub (copy), RecenterModule (copy), ContextActionService (copy), v1 (copy), UserInputService (copy)
	Visible = Value
	
	if not Visible then
		Flag = false
		RecenterCountdown:SetVisible(false)
		VRHub:FireModuleClosed(RecenterModule.ModuleName)
		
		return
	end
	if Flag then
		Flag = false
		RecenterCountdown:SetVisible(false)
		VRHub:FireModuleClosed(RecenterModule.ModuleName)
		
		return
	else
		VRHub:FireModuleOpened(RecenterModule.ModuleName)
		spawn(function()
			-- upvalues: Flag (upval), RecenterCountdown (upval), ContextActionService (upval), v1 (upval), UserInputService (upval), VRHub (upval), RecenterModule (upval)
			Flag = true
			RecenterCountdown:SetVisible(true)
			ContextActionService:BindCoreAction("CancelRecenterShortcut", function(_, UserInputState, _)
				-- upvalues: Flag (upval), RecenterCountdown (upval)
				if UserInputState == Enum.UserInputState.Begin then
					Flag = false
					RecenterCountdown:SetVisible(false)
				end
			end, false, Enum.KeyCode.ButtonB)
			
			if Flag then
				v1.Text = tostring(3)
				wait(1)
			end
			if Flag then
				v1.Text = tostring(2)
				wait(1)
			end
			if Flag then
				v1.Text = tostring(1)
				wait(1)
			end
			if Flag then
				UserInputService:RecenterUserHeadCFrame()
			end
			RecenterCountdown:SetVisible(false)
			Flag = false
			ContextActionService:UnbindCoreAction("CancelRecenterShortcut")
			VRHub:FireModuleClosed(RecenterModule.ModuleName)
		end)
	end
end

function RecenterModule:IsVisible()
	-- upvalues: Visible (ref)
	return Visible
end

return RecenterModule