local VirtualCursor = script:FindFirstAncestor("VirtualCursor")
local _ = VirtualCursor.Parent
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
local _ = CoreGui.RobloxGui
local PropertiesModule = require(VirtualCursor.Properties)
local config = {
	Default = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png",
	Hover = "rbxasset://textures/ui/VirtualCursor/cursorHover.png",
	Pressed = "rbxasset://textures/ui/VirtualCursor/cursorPressed.png",
	Arrow = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
}
local ScreenGui = nil
local Image = nil
local CreateResult = nil
local CreateResult1 = nil
local CreateResult2 = nil
local CreateResult3 = nil
local CompletedConnection = nil
local config1 = { Default = 2, Activated = 1.7 }

local function getCursorSize(p1): UDim2 --[[ Line: 43 ]]
	-- upvalues: config1 (copy), PropertiesModule (copy)
	local ScaledEntry = config1[p1] * PropertiesModule.CursorRadius
	
	return UDim2.fromOffset(ScaledEntry, ScaledEntry)
end

local function _(p1) --[[ Line: 48 | Named "setCursorHighlight" ]]
	-- upvalues: Image (ref)
	if p1 then
		Image.Image = "rbxasset://textures/ui/VirtualCursor/cursorHover.png"
		
		return
	else
		Image.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
	end
end

local _ = function(Vector) --[[ Line: 56 | Named "setCursorPosition" ]]
	-- upvalues: Image (ref)
	Image.Position = UDim2.fromOffset(Vector.x, Vector.y)
end

local function getOrCreateVirtualCursorContainer() --[[ Line: 60 ]]
	-- upvalues: ScreenGui (ref), Image (ref), config1 (copy), PropertiesModule (copy), CoreGui (copy), CreateResult (ref), TweenService (copy), CreateResult1 (ref)
	if ScreenGui == nil then
		ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Enabled = false
		ScreenGui.IgnoreGuiInset = true
		ScreenGui.DisplayOrder = 1e999
		ScreenGui.OnTopOfCoreBlur = true
		ScreenGui.Name = "VirtualCursorGui"
		Image = Instance.new("ImageLabel")
		Image.Active = false
		Image.AnchorPoint = Vector2.new(0.5, 0.5)
		local ScaledDefault = config1.Default * PropertiesModule.CursorRadius
		Image.Size = UDim2.fromOffset(ScaledDefault, ScaledDefault)
		Image.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
		Image.Visible = false
		Image.BackgroundTransparency = 1
		Image.Transparency = 1
		Image.Parent = ScreenGui
		ScreenGui.Parent = CoreGui
		local _TweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local ScaledActivated = config1.Activated * PropertiesModule.CursorRadius
		CreateResult = TweenService:Create(Image, _TweenInfo, {
			Size = UDim2.fromOffset(ScaledActivated, ScaledActivated)
		})
		local ScaledDefault1 = config1.Default * PropertiesModule.CursorRadius
		CreateResult1 = TweenService:Create(Image, _TweenInfo, { Size = UDim2.fromOffset(ScaledDefault1, ScaledDefault1) })
	end
	return ScreenGui
end

local function tweenCursorOpacity(Enabled) --[[ Line: 91 ]]
	-- upvalues: CompletedConnection (ref), CreateResult3 (ref), TweenService (copy), Image (ref), getOrCreateVirtualCursorContainer (copy)
	if CompletedConnection then
		CompletedConnection:Disconnect()
		CompletedConnection = nil
	end
	CreateResult3 = TweenService:Create(Image, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { ImageTransparency = if Enabled then 0 else 1 })
	CompletedConnection = CreateResult3.Completed:Connect(function() --[[ Line: 100 ]]
		-- upvalues: Image (upval), Enabled (copy), getOrCreateVirtualCursorContainer (upval)
		Image.Visible = Enabled
		getOrCreateVirtualCursorContainer().Enabled = Enabled
	end)
	CreateResult3:Play()
end

local function tweenCursorPosition(Vector) --[[ Line: 108 ]]
	-- upvalues: CreateResult2 (ref), TweenService (copy), Image (ref)
	CreateResult2 = TweenService:Create(Image, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { Position = UDim2.fromOffset(Vector.x, Vector.y) })
	CreateResult2:Play()
end

local InterfaceModule = {
	GetCursorSize = function(_, p1) --[[ Line: 115 ]]
		-- upvalues: getCursorSize (copy)
		return getCursorSize(p1)
	end,
	PlayCursorTweenActivate = function(_) --[[ Line: 119 ]]
		-- upvalues: CreateResult (ref)
		CreateResult:Play()
	end,
	PlayCursorTweenDefault = function(_) --[[ Line: 123 ]]
		-- upvalues: CreateResult1 (ref)
		CreateResult1:Play()
	end,
	SetCursorHighlight = function(_, p1) --[[ Line: 127 ]]
		-- upvalues: Image (ref), config (copy)
		if p1 then
			Image.Image = config.Hover
			
			return
		else
			Image.Image = config.Default
		end
	end,
	SetCursorPosition = function(_, Vector) --[[ Line: 131 ]]
		-- upvalues: Image (ref)
		Image.Position = UDim2.fromOffset(Vector.x, Vector.y)
	end,
	TweenCursorPosition = function(_, p1) --[[ Line: 135 ]]
		-- upvalues: tweenCursorPosition (copy)
		tweenCursorPosition(p1)
	end,
	TweenCursorOpacity = function(_, Enabled) --[[ Line: 139 ]]
		-- upvalues: tweenCursorOpacity (copy)
		tweenCursorOpacity(Enabled)
	end,
	SetArrow = function(_, p1, p2) --[[ Line: 143 ]]
		-- upvalues: Image (ref)
		if p1 == -1 and p2 == 0 then
			Image.Rotation = 90
		elseif p2 == 0 then
			Image.Rotation = 270
		end
		if p1 == 0 and p2 == 1 then
			Image.Rotation = 0
		elseif p1 == 0 then
			Image.Rotation = 180
		end
		Image.Image = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
	end
}

function InterfaceModule:EnableUI(Vector) --[[ Line: 159 ]]
	-- upvalues: VRService (copy), getOrCreateVirtualCursorContainer (copy), Image (ref), config1 (copy), PropertiesModule (copy), InterfaceModule (copy)
	local NoVREnabled = not VRService.VREnabled
	getOrCreateVirtualCursorContainer().Enabled = NoVREnabled
	local ScaledDefault = config1.Default * PropertiesModule.CursorRadius
	Image.Size = UDim2.fromOffset(ScaledDefault, ScaledDefault)
	Image.Position = UDim2.fromOffset(Vector.x, Vector.y)
	Image.Visible = NoVREnabled
	InterfaceModule:TweenCursorOpacity(true)
end

function InterfaceModule:DisableUI() --[[ Line: 170 ]]
	-- upvalues: Image (ref), config (copy), InterfaceModule (copy)
	Image.Image = config.Default
	InterfaceModule:TweenCursorOpacity(false)
end

return InterfaceModule