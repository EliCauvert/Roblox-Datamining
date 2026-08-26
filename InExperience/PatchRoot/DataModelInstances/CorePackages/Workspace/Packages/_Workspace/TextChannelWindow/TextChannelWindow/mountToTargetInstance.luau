local coreGuiService = game:GetService("CoreGui")
local starterGuiService = game:GetService("StarterGui")
local parent = script.Parent.Parent
local _ = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local expChatTextChannelWindowMinWidth = game:DefineFastInt("ExpChatTextChannelWindowMinWidth", 200)
local expChatTextChannelWindowMinHeight = game:DefineFastInt("ExpChatTextChannelWindowMinHeight", 200)
local t = {}

local function _(p1)
	if p1.Adornee ~= nil then
		return p1.Adornee
	end
	local parent = p1.Parent
	
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

local function connectGuiObjectSync(p1, p2, _, p3)
	local function syncTransform()
		-- upvalues: p2 (ref), p1 (ref)
		p2.Position = UDim2.fromOffset(p1.AbsolutePosition.X, p1.AbsolutePosition.Y)
		p2.Size = UDim2.fromOffset(p1.AbsoluteSize.X, p1.AbsoluteSize.Y)
		p2.Rotation = p1.Rotation
	end
	
	table.insert(p3, p1:GetPropertyChangedSignal("AbsolutePosition"):Connect(syncTransform))
	table.insert(p3, p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncTransform))
	table.insert(p3, p1:GetPropertyChangedSignal("Rotation"):Connect(syncTransform))
end

local function connectSurfaceGuiSync(p1, p2, p3)
	local function syncAdornee()
		-- upvalues: p2 (ref), p1 (ref)
		local adornee
		if p1.Adornee == nil then
			local parent = p1.Parent
			adornee = if parent and parent:IsA("BasePart") then parent else nil
		else
			adornee = p1.Adornee
		end
		p2.Adornee = adornee
	end
	
	table.insert(p3, p1:GetPropertyChangedSignal("Adornee"):Connect(syncAdornee))
	table.insert(p3, p1:GetPropertyChangedSignal("Parent"):Connect(syncAdornee))
	table.insert(p3, p1:GetPropertyChangedSignal("Face"):Connect(function()
		-- upvalues: p2 (ref), p1 (ref)
		p2.Face = p1.Face
	end))
	table.insert(p3, p1:GetPropertyChangedSignal("SizingMode"):Connect(function()
		-- upvalues: p2 (ref), p1 (ref)
		p2.SizingMode = p1.SizingMode
	end))
	table.insert(p3, p1:GetPropertyChangedSignal("CanvasSize"):Connect(function()
		-- upvalues: p2 (ref), p1 (ref)
		p2.CanvasSize = p1.CanvasSize
	end))
end

local function connectScreenGuiSync(p1, p2, p3)
	table.insert(p3, p1:GetPropertyChangedSignal("IgnoreGuiInset"):Connect(function()
		-- upvalues: p2 (ref), p1 (ref)
		p2.IgnoreGuiInset = p1.IgnoreGuiInset
	end))
	table.insert(p3, p1:GetPropertyChangedSignal("ZIndexBehavior"):Connect(function()
		-- upvalues: p2 (ref), p1 (ref)
		p2.ZIndexBehavior = p1.ZIndexBehavior
	end))
end

local _ = function(p1, p2, p3)
	-- upvalues: connectSurfaceGuiSync (ref), connectScreenGuiSync (ref)
	if p1 == nil then return end
	if p1:IsA("SurfaceGui") then
		connectSurfaceGuiSync(p1, p2, p3)
		
		return
	elseif p1:IsA("ScreenGui") then
		connectScreenGuiSync(p1, p2, p3)
	end
end

local function doMount(p1, p2)
	-- upvalues: t (ref), createOverlay (ref), reactRobloxModule (ref), connectGuiObjectSync (ref), connectSurfaceGuiSync (ref), connectScreenGuiSync (ref), expChatTextChannelWindowMinWidth (ref), expChatTextChannelWindowMinHeight (ref)
	if not p1:IsA("TextChannelWindow") then
		return nil
	elseif t[p1] then
		return nil
	end
	local layerCollector = p1:FindFirstAncestorWhichIsA("LayerCollector")
	
	if layerCollector and not layerCollector:IsA("ScreenGui") and not layerCollector:IsA("SurfaceGui") then
		return nil
	end
	local var1 = createOverlay(p1, layerCollector)
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Position = UDim2.fromOffset(p1.AbsolutePosition.X, p1.AbsolutePosition.Y)
	frame.Size = UDim2.fromOffset(p1.AbsoluteSize.X, p1.AbsoluteSize.Y)
	frame.Rotation = p1.Rotation
	frame.Parent = var1
	local var2 = reactRobloxModule.createRoot(frame)
	var2:render(p2)
	local t_1 = {}
	connectGuiObjectSync(p1, frame, var1, t_1)
	
	if layerCollector ~= nil then
		if layerCollector:IsA("SurfaceGui") then
			connectSurfaceGuiSync(layerCollector, var1, t_1)
		elseif layerCollector:IsA("ScreenGui") then
			connectScreenGuiSync(layerCollector, var1, t_1)
		end
	end
	local function updateEnabled()
		-- upvalues: var1 (ref), p1 (ref), p1 (ref), expChatTextChannelWindowMinWidth (copy), expChatTextChannelWindowMinHeight (copy)
		var1.Enabled = p1.IsRendering and (expChatTextChannelWindowMinWidth <= p1.AbsoluteSize.X and expChatTextChannelWindowMinHeight <= p1.AbsoluteSize.Y)
	end
	
	var1.Enabled = p1.IsRendering and (expChatTextChannelWindowMinWidth <= p1.AbsoluteSize.X and expChatTextChannelWindowMinHeight <= p1.AbsoluteSize.Y)
	table.insert(t_1, p1:GetPropertyChangedSignal("IsRendering"):Connect(updateEnabled))
	table.insert(t_1, p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateEnabled))
	
	local function unmount()
		-- upvalues: t_1 (ref), var2 (ref), var1 (ref), t (copy), p1 (ref)
		for i, v in t_1 do
			v:Disconnect()
		end
		var2:unmount()
		var1:Destroy()
		t[p1] = nil
	end
	
	table.insert(t_1, p1.Destroying:Connect(unmount))
	t[p1] = true
	
	return unmount
end

return function(p3, p4)
	-- upvalues: starterGuiService (ref), doMount (ref)
	return if p3:IsDescendantOf(starterGuiService) then nil else doMount(p3, p4)
end