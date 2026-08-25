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
local var7 = nil
local var8 = nil
local var9 = nil
local var10 = nil
local var11 = nil
local var12 = nil
local var13 = nil
local t_2 = { Default = 2, Activated = 1.7 }

local function getCursorSize(p0)
	-- upvalues: t_2 (ref), propertiesModule (ref)
	local var19 = t_2[p0] * propertiesModule.CursorRadius
	
	return UDim2.fromOffset(var19, var19)
end

local function _(value)
	-- upvalues: var8 (write)
	if value then
		var8.Image = "rbxasset://textures/ui/VirtualCursor/cursorHover.png"
		
		return
	end
	var8.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
end

local _ = function(value)
	-- upvalues: var8 (write)
	var8.Position = UDim2.fromOffset(value.x, value.y)
end

local function getOrCreateVirtualCursorContainer()
	-- upvalues: var7 (write), getFFlagVirtualCursorDisplayOrder (ref), var8 (write), t_2 (ref), propertiesModule (ref), coreGuiService (ref), var9 (write), tweenService (ref), var10 (write)
	if var7 == nil then
		var7 = Instance.new("ScreenGui")
		var7.Enabled = false
		var7.IgnoreGuiInset = true
		var7.DisplayOrder = if getFFlagVirtualCursorDisplayOrder() then 1e999 else 100
		
		if getFFlagVirtualCursorDisplayOrder() then
			var7.OnTopOfCoreBlur = true
		end
		var7.Name = "VirtualCursorGui"
		var8 = Instance.new("ImageLabel")
		var8.Active = false
		var8.AnchorPoint = Vector2.new(0.5, 0.5)
		local var20 = t_2.Default * propertiesModule.CursorRadius
		var8.Size = UDim2.fromOffset(var20, var20)
		var8.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
		var8.Visible = false
		var8.BackgroundTransparency = 1
		var8.Transparency = 1
		var8.Parent = var7
		var7.Parent = coreGuiService
		local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local var22 = var8
		local t = {}
		local var24 = t_2.Activated * propertiesModule.CursorRadius
		t.Size = UDim2.fromOffset(var24, var24)
		var9 = tweenService:Create(var22, tweenInfo, t)
		local var25 = var8
		local var26 = tweenInfo
		local t_1 = {}
		local var28 = t_2.Default * propertiesModule.CursorRadius
		t_1.Size = UDim2.fromOffset(var28, var28)
		var10 = tweenService:Create(var25, var26, t_1)
	end
	return var7
end

local function tweenCursorOpacity(p1)
	-- upvalues: var13 (write), var12 (write), tweenService (ref), var8 (write), getOrCreateVirtualCursorContainer (ref)
	if var13 then
		var13:Disconnect()
		var13 = nil
	end
	var12 = tweenService:Create(var8, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { ImageTransparency = if p1 then 0 else 1 })
	var13 = var12.Completed:Connect(function()
		-- upvalues: var8 (copy), p1 (ref), getOrCreateVirtualCursorContainer (copy)
		var8.Visible = p1
		getOrCreateVirtualCursorContainer().Enabled = p1
	end)
	var12:Play()
end

local function tweenCursorPosition(p2)
	-- upvalues: var11 (write), tweenService (ref), var8 (write)
	var11 = tweenService:Create(var8, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { Position = UDim2.fromOffset(p2.x, p2.y) })
	var11:Play()
end

function t.GetCursorSize(_, p3)
	-- upvalues: getCursorSize (ref)
	return getCursorSize(p3)
end

function t.PlayCursorTweenActivate(_)
	-- upvalues: var9 (write)
	var9:Play()
end

function t.PlayCursorTweenDefault(_)
	-- upvalues: var10 (write)
	var10:Play()
end

function t.SetCursorHighlight(_, p4)
	-- upvalues: var8 (write), t_1 (ref)
	if p4 then
		var8.Image = t_1.Hover
		
		return
	end
	var8.Image = t_1.Default
end

function t.SetCursorPosition(_, p5)
	-- upvalues: var8 (write)
	var8.Position = UDim2.fromOffset(p5.x, p5.y)
end

function t.TweenCursorPosition(_, p6)
	-- upvalues: tweenCursorPosition (ref)
	tweenCursorPosition(p6)
end

function t.TweenCursorOpacity(_, p7)
	-- upvalues: tweenCursorOpacity (ref)
	tweenCursorOpacity(p7)
end

function t.SetArrow(_, p8, p9)
	-- upvalues: var8 (write)
	if p8 == -1 and p9 == 0 then
		var8.Rotation = 90
	elseif p9 == 0 then
		var8.Rotation = 270
	end
	if p8 == 0 and p9 == 1 then
		var8.Rotation = 0
	elseif p8 == 0 then
		var8.Rotation = 180
	end
	var8.Image = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
end

function t.EnableUI(_, p10)
	-- upvalues: VRService (ref), getOrCreateVirtualCursorContainer (ref), var8 (write), t_2 (ref), propertiesModule (ref), t (ref)
	local var29 = not VRService.VREnabled
	getOrCreateVirtualCursorContainer().Enabled = var29
	local var30 = t_2.Default * propertiesModule.CursorRadius
	var8.Size = UDim2.fromOffset(var30, var30)
	var8.Position = UDim2.fromOffset(p10.x, p10.y)
	var8.Visible = var29
	t:TweenCursorOpacity(true)
end

function t.DisableUI(_)
	-- upvalues: var8 (write), t_1 (ref), t (ref)
	var8.Image = t_1.Default
	t:TweenCursorOpacity(false)
end

return t