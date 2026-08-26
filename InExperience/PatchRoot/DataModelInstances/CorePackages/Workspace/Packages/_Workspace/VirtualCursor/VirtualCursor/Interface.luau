local virtualCursor = script:FindFirstAncestor("VirtualCursor")
local parent = virtualCursor.Parent
local coreGuiService = game:GetService("CoreGui")
local tweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
local _ = coreGuiService.RobloxGui
local propertiesModule = require(virtualCursor.Properties)
local getFFlagVirtualCursorDisplayOrder = require(parent.SharedFlags).getFFlagVirtualCursorDisplayOrder
local t = {}
local t_1 = {
	Default = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png",
	Hover = "rbxasset://textures/ui/VirtualCursor/cursorHover.png",
	Pressed = "rbxasset://textures/ui/VirtualCursor/cursorPressed.png",
	Arrow = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
}
local var1 = nil
local var2 = nil
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local t_2 = { Default = 2, Activated = 1.7 }

local function getCursorSize(p1)
	-- upvalues: t_2 (ref), propertiesModule (ref)
	local var8 = t_2[p1] * propertiesModule.CursorRadius
	
	return UDim2.fromOffset(var8, var8)
end

local function _(value)
	-- upvalues: var2 (write)
	if value then
		var2.Image = "rbxasset://textures/ui/VirtualCursor/cursorHover.png"
		
		return
	end
	var2.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
end

local _ = function(value)
	-- upvalues: var2 (write)
	var2.Position = UDim2.fromOffset(value.x, value.y)
end

local function getOrCreateVirtualCursorContainer()
	-- upvalues: var1 (write), getFFlagVirtualCursorDisplayOrder (ref), var2 (write), t_2 (ref), propertiesModule (ref), coreGuiService (ref), var3 (write), tweenService (ref), var4 (write)
	if var1 == nil then
		var1 = Instance.new("ScreenGui")
		var1.Enabled = false
		var1.IgnoreGuiInset = true
		var1.DisplayOrder = if getFFlagVirtualCursorDisplayOrder() then 1e999 else 100
		
		if getFFlagVirtualCursorDisplayOrder() then
			var1.OnTopOfCoreBlur = true
		end
		var1.Name = "VirtualCursorGui"
		var2 = Instance.new("ImageLabel")
		var2.Active = false
		var2.AnchorPoint = Vector2.new(0.5, 0.5)
		local var8 = t_2.Default * propertiesModule.CursorRadius
		var2.Size = UDim2.fromOffset(var8, var8)
		var2.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
		var2.Visible = false
		var2.BackgroundTransparency = 1
		var2.Transparency = 1
		var2.Parent = var1
		var1.Parent = coreGuiService
		local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local var9 = var2
		local t = {}
		local var10 = t_2.Activated * propertiesModule.CursorRadius
		t.Size = UDim2.fromOffset(var10, var10)
		var3 = tweenService:Create(var9, tweenInfo, t)
		local var11 = var2
		local var12 = tweenInfo
		local t_1 = {}
		local var13 = t_2.Default * propertiesModule.CursorRadius
		t_1.Size = UDim2.fromOffset(var13, var13)
		var4 = tweenService:Create(var11, var12, t_1)
	end
	return var1
end

local function tweenCursorOpacity(p1)
	-- upvalues: var7 (write), var6 (write), tweenService (ref), var2 (write), getOrCreateVirtualCursorContainer (ref)
	if var7 then
		var7:Disconnect()
		var7 = nil
	end
	var6 = tweenService:Create(var2, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { ImageTransparency = if p1 then 0 else 1 })
	var7 = var6.Completed:Connect(function()
		-- upvalues: var2 (copy), p1 (ref), getOrCreateVirtualCursorContainer (copy)
		var2.Visible = p1
		getOrCreateVirtualCursorContainer().Enabled = p1
	end)
	var6:Play()
end

local function tweenCursorPosition(p1)
	-- upvalues: var5 (write), tweenService (ref), var2 (write)
	var5 = tweenService:Create(var2, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { Position = UDim2.fromOffset(p1.x, p1.y) })
	var5:Play()
end

function t.GetCursorSize(_, p1)
	-- upvalues: getCursorSize (ref)
	return getCursorSize(p1)
end

function t.PlayCursorTweenActivate(_)
	-- upvalues: var3 (write)
	var3:Play()
end

function t.PlayCursorTweenDefault(_)
	-- upvalues: var4 (write)
	var4:Play()
end

function t.SetCursorHighlight(_, p1)
	-- upvalues: var2 (write), t_1 (ref)
	if p1 then
		var2.Image = t_1.Hover
		
		return
	end
	var2.Image = t_1.Default
end

function t.SetCursorPosition(_, p1)
	-- upvalues: var2 (write)
	var2.Position = UDim2.fromOffset(p1.x, p1.y)
end

function t.TweenCursorPosition(_, p1)
	-- upvalues: tweenCursorPosition (ref)
	tweenCursorPosition(p1)
end

function t.TweenCursorOpacity(_, p1)
	-- upvalues: tweenCursorOpacity (ref)
	tweenCursorOpacity(p1)
end

function t.SetArrow(_, p1, p2)
	-- upvalues: var2 (write)
	if p1 == -1 and p2 == 0 then
		var2.Rotation = 90
	elseif p2 == 0 then
		var2.Rotation = 270
	end
	if p1 == 0 and p2 == 1 then
		var2.Rotation = 0
	elseif p1 == 0 then
		var2.Rotation = 180
	end
	var2.Image = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
end

function t.EnableUI(_, p1)
	-- upvalues: VRService (ref), getOrCreateVirtualCursorContainer (ref), var2 (write), t_2 (ref), propertiesModule (ref), t (ref)
	local var8 = not VRService.VREnabled
	getOrCreateVirtualCursorContainer().Enabled = var8
	local var9 = t_2.Default * propertiesModule.CursorRadius
	var2.Size = UDim2.fromOffset(var9, var9)
	var2.Position = UDim2.fromOffset(p1.x, p1.y)
	var2.Visible = var8
	t:TweenCursorOpacity(true)
end

function t.DisableUI(_)
	-- upvalues: var2 (write), t_1 (ref), t (ref)
	var2.Image = t_1.Default
	t:TweenCursorOpacity(false)
end

return t