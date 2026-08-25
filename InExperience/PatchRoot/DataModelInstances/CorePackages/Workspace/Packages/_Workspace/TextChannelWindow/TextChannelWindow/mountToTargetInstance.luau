local coreGuiService = game:GetService("CoreGui")
local starterGuiService = game:GetService("StarterGui")
local parent = script.Parent.Parent
local _ = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local expChatTextChannelWindowMinWidth = game:DefineFastInt("ExpChatTextChannelWindowMinWidth", 200)
local expChatTextChannelWindowMinHeight = game:DefineFastInt("ExpChatTextChannelWindowMinHeight", 200)
local t = {}

local function _(p0)
	if p0.Adornee ~= nil then
		return p0.Adornee
	end
	local parent = p0.Parent
	
	return if parent and parent:IsA("BasePart") then parent else nil
end

local function createOverlay(p1, p2)
	-- upvalues: coreGuiService (ref)
	if p2 and p2:IsA("SurfaceGui") then
		local adornee
		local surfaceGui = Instance.new("SurfaceGui")
		surfaceGui.Name = "TextChannelWindowOverlay_" .. p1.Name
		surfaceGui.ResetOnSpawn = false
		
		if p2.Adornee == nil then
			local parent = p2.Parent
			adornee = if parent and parent:IsA("BasePart") then parent else nil
		else
			adornee = p2.Adornee
		end
		surfaceGui.Adornee = adornee
		surfaceGui.Face = p2.Face
		surfaceGui.SizingMode = p2.SizingMode
		surfaceGui.CanvasSize = p2.CanvasSize
		surfaceGui.Parent = coreGuiService
		
		return surfaceGui
	else
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "TextChannelWindowOverlay_" .. p1.Name
		screenGui.ResetOnSpawn = false
		
		if p2 and p2:IsA("ScreenGui") then
			screenGui.IgnoreGuiInset = p2.IgnoreGuiInset
			screenGui.DisplayOrder = -1
			screenGui.ZIndexBehavior = p2.ZIndexBehavior
		else
			screenGui.IgnoreGuiInset = true
			screenGui.DisplayOrder = -1
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		end
		screenGui.Parent = coreGuiService
		
		return screenGui
	end
end

local function connectGuiObjectSync(p3, p4, _, p5)
	local function syncTransform()
		-- upvalues: p4 (ref), p3 (ref)
		p4.Position = UDim2.fromOffset(p3.AbsolutePosition.X, p3.AbsolutePosition.Y)
		p4.Size = UDim2.fromOffset(p3.AbsoluteSize.X, p3.AbsoluteSize.Y)
		p4.Rotation = p3.Rotation
	end
	
	table.insert(p5, p3:GetPropertyChangedSignal("AbsolutePosition"):Connect(syncTransform))
	table.insert(p5, p3:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncTransform))
	table.insert(p5, p3:GetPropertyChangedSignal("Rotation"):Connect(syncTransform))
end

local function connectSurfaceGuiSync(p6, p7, p8)
	local function syncAdornee()
		-- upvalues: p7 (ref), p6 (ref)
		local adornee
		if p6.Adornee == nil then
			local parent = p6.Parent
			adornee = if parent and parent:IsA("BasePart") then parent else nil
		else
			adornee = p6.Adornee
		end
		p7.Adornee = adornee
	end
	
	table.insert(p8, p6:GetPropertyChangedSignal("Adornee"):Connect(syncAdornee))
	table.insert(p8, p6:GetPropertyChangedSignal("Parent"):Connect(syncAdornee))
	table.insert(p8, p6:GetPropertyChangedSignal("Face"):Connect(function()
		-- upvalues: p7 (ref), p6 (ref)
		p7.Face = p6.Face
	end))
	table.insert(p8, p6:GetPropertyChangedSignal("SizingMode"):Connect(function()
		-- upvalues: p7 (ref), p6 (ref)
		p7.SizingMode = p6.SizingMode
	end))
	table.insert(p8, p6:GetPropertyChangedSignal("CanvasSize"):Connect(function()
		-- upvalues: p7 (ref), p6 (ref)
		p7.CanvasSize = p6.CanvasSize
	end))
end

local function connectScreenGuiSync(p9, p10, p11)
	table.insert(p11, p9:GetPropertyChangedSignal("IgnoreGuiInset"):Connect(function()
		-- upvalues: p10 (ref), p9 (ref)
		p10.IgnoreGuiInset = p9.IgnoreGuiInset
	end))
	table.insert(p11, p9:GetPropertyChangedSignal("ZIndexBehavior"):Connect(function()
		-- upvalues: p10 (ref), p9 (ref)
		p10.ZIndexBehavior = p9.ZIndexBehavior
	end))
end

local _ = function(p12, p13, p14)
	-- upvalues: connectSurfaceGuiSync (ref), connectScreenGuiSync (ref)
	if p12 == nil then return end
	if p12:IsA("SurfaceGui") then
		connectSurfaceGuiSync(p12, p13, p14)
		
		return
	elseif p12:IsA("ScreenGui") then
		connectScreenGuiSync(p12, p13, p14)
	end
end

local function doMount(p15, p16)
	-- upvalues: t (ref), createOverlay (ref), reactRobloxModule (ref), connectGuiObjectSync (ref), connectSurfaceGuiSync (ref), connectScreenGuiSync (ref), expChatTextChannelWindowMinWidth (ref), expChatTextChannelWindowMinHeight (ref)
	if not p15:IsA("TextChannelWindow") then
		return nil
	elseif t[p15] then
		return nil
	end
	local layerCollector = p15:FindFirstAncestorWhichIsA("LayerCollector")
	
	if layerCollector and not layerCollector:IsA("ScreenGui") and not layerCollector:IsA("SurfaceGui") then
		return nil
	end
	local var16 = createOverlay(p15, layerCollector)
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Position = UDim2.fromOffset(p15.AbsolutePosition.X, p15.AbsolutePosition.Y)
	frame.Size = UDim2.fromOffset(p15.AbsoluteSize.X, p15.AbsoluteSize.Y)
	frame.Rotation = p15.Rotation
	frame.Parent = var16
	local var18 = reactRobloxModule.createRoot(frame)
	var18:render(p16)
	local t_1 = {}
	connectGuiObjectSync(p15, frame, var16, t_1)
	
	if layerCollector ~= nil then
		if layerCollector:IsA("SurfaceGui") then
			connectSurfaceGuiSync(layerCollector, var16, t_1)
		elseif layerCollector:IsA("ScreenGui") then
			connectScreenGuiSync(layerCollector, var16, t_1)
		end
	end
	local function updateEnabled()
		-- upvalues: var16 (ref), p15 (ref), p15 (ref), expChatTextChannelWindowMinWidth (copy), expChatTextChannelWindowMinHeight (copy)
		var16.Enabled = p15.IsRendering and (expChatTextChannelWindowMinWidth <= p15.AbsoluteSize.X and expChatTextChannelWindowMinHeight <= p15.AbsoluteSize.Y)
	end
	
	var16.Enabled = p15.IsRendering and (expChatTextChannelWindowMinWidth <= p15.AbsoluteSize.X and expChatTextChannelWindowMinHeight <= p15.AbsoluteSize.Y)
	table.insert(t_1, p15:GetPropertyChangedSignal("IsRendering"):Connect(updateEnabled))
	table.insert(t_1, p15:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateEnabled))
	
	local function unmount()
		-- upvalues: t_1 (ref), var18 (ref), var16 (ref), t (copy), p15 (ref)
		for i, v in t_1 do
			v:Disconnect()
		end
		var18:unmount()
		var16:Destroy()
		t[p15] = nil
	end
	
	table.insert(t_1, p15.Destroying:Connect(unmount))
	t[p15] = true
	
	return unmount
end

return function(p17, p18)
	-- upvalues: starterGuiService (ref), doMount (ref)
	return if p17:IsDescendantOf(starterGuiService) then nil else doMount(p17, p18)
end