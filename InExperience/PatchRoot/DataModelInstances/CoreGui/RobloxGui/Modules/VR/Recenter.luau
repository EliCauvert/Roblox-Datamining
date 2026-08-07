local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local var3 = false
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
local var6 = create("TextLabel")({
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
local var7 = false

local function _() --[[ line: 55 | named "cancelCountdown" ]]
	-- upvalues: var7 (write), recenterCountdown (ref)
	var7 = false
	recenterCountdown:SetVisible(false)
end

VRHub.ModuleOpened.Event:connect(function(p0) --[[ line: 60 ]]
	-- upvalues: t (ref), VRHub (ref), var7 (write), recenterCountdown (ref)
	if p0 ~= t.ModuleName and VRHub:GetModule(p0).VRIsExclusive then
		var7 = false
		recenterCountdown:SetVisible(false)
	end
end)

function t.SetVisible(_, p1) --[[ line: 69 ]]
	-- upvalues: var3 (write), var7 (write), recenterCountdown (ref), VRHub (ref), t (ref), contextActionService (ref), var6 (ref), userInputService (ref)
	var3 = p1
	
	if not var3 then
		var7 = false
		recenterCountdown:SetVisible(false)
		VRHub:FireModuleClosed(t.ModuleName)
		
		return
	elseif var7 then
		var7 = false
		recenterCountdown:SetVisible(false)
		VRHub:FireModuleClosed(t.ModuleName)
		
		return
	end
	VRHub:FireModuleOpened(t.ModuleName)
	spawn(function() --[[ line: 81 ]]
		-- upvalues: var7 (copy), recenterCountdown (copy), contextActionService (copy), var6 (copy), userInputService (copy), VRHub (copy), t (copy)
		var7 = true
		recenterCountdown:SetVisible(true)
		contextActionService:BindCoreAction("CancelRecenterShortcut", function(_, p2, _) --[[ line: 85 ]]
			-- upvalues: var7 (copy), recenterCountdown (copy)
			if p2 == Enum.UserInputState.Begin then
				var7 = false
				recenterCountdown:SetVisible(false)
			end
		end, false, Enum.KeyCode.ButtonB)
		var6.Text = tostring(3)
		wait(1)
		var6.Text = tostring(2)
		wait(1)
		var6.Text = tostring(1)
		wait(1)
		userInputService:RecenterUserHeadCFrame()
		recenterCountdown:SetVisible(false)
		var7 = false
		contextActionService:UnbindCoreAction("CancelRecenterShortcut")
		VRHub:FireModuleClosed(t.ModuleName)
	end)
end

function t.IsVisible(_) --[[ line: 115 ]]
	-- upvalues: var3 (write)
	return var3
end

return t