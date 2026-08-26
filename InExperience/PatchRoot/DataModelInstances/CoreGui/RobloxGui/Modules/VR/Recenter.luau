local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local var1 = false
local t = {
	ModuleName = "Recenter",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = false
}
VRHub:RegisterModule(t)
local recenterCountdown = panel3D.Get("RecenterCountdown")
recenterCountdown:SetType(panel3D.Type.HorizontalFollow)
recenterCountdown:ResizeStuds(5, 3, 128)
recenterCountdown:SetCanFade(false)
local var2 = create("TextLabel")({
	BackgroundTransparency = 0.9,
	Text = "",
	TextScaled = true,
	Visible = true,
	Parent = recenterCountdown:GetGUI(),
	Position = UDim2.new(0.5, -64, 0.5, -64),
	Size = UDim2.new(0, 128, 0, 128),
	BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
	TextColor3 = Color3.new(1, 1, 1),
	Font = Enum.Font.SourceSansBold
})
local _ = create("ImageLabel")({
	BackgroundTransparency = 1,
	Image = "rbxasset://textures/ui/VR/recenterFrame.png",
	Parent = recenterCountdown:GetGUI(),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, 0, 1, 0)
})
recenterCountdown:SetVisible(false)
local var3 = false

local function _()
	-- upvalues: var3 (write), recenterCountdown (ref)
	var3 = false
	recenterCountdown:SetVisible(false)
end

VRHub.ModuleOpened.Event:connect(function(p1)
	-- upvalues: t (ref), VRHub (ref), var3 (write), recenterCountdown (ref)
	if p1 ~= t.ModuleName and VRHub:GetModule(p1).VRIsExclusive then
		var3 = false
		recenterCountdown:SetVisible(false)
	end
end)

function t.SetVisible(_, p1)
	-- upvalues: var1 (write), var3 (write), recenterCountdown (ref), VRHub (ref), t (ref), contextActionService (ref), var2 (ref), userInputService (ref)
	var1 = p1
	
	if not var1 then
		var3 = false
		recenterCountdown:SetVisible(false)
		VRHub:FireModuleClosed(t.ModuleName)
		
		return
	elseif var3 then
		var3 = false
		recenterCountdown:SetVisible(false)
		VRHub:FireModuleClosed(t.ModuleName)
		
		return
	end
	VRHub:FireModuleOpened(t.ModuleName)
	spawn(function()
		-- upvalues: var3 (copy), recenterCountdown (copy), contextActionService (copy), var2 (copy), userInputService (copy), VRHub (copy), t (copy)
		var3 = true
		recenterCountdown:SetVisible(true)
		contextActionService:BindCoreAction("CancelRecenterShortcut", function(_, p2, _)
			-- upvalues: var3 (copy), recenterCountdown (copy)
			if p2 == Enum.UserInputState.Begin then
				var3 = false
				recenterCountdown:SetVisible(false)
			end
		end, false, Enum.KeyCode.ButtonB)
		var2.Text = tostring(3)
		wait(1)
		var2.Text = tostring(2)
		wait(1)
		var2.Text = tostring(1)
		wait(1)
		userInputService:RecenterUserHeadCFrame()
		recenterCountdown:SetVisible(false)
		var3 = false
		contextActionService:UnbindCoreAction("CancelRecenterShortcut")
		VRHub:FireModuleClosed(t.ModuleName)
	end)
end

function t.IsVisible(_)
	-- upvalues: var1 (write)
	return var1
end

return t