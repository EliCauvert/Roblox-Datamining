local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local Parent = script.Parent.Parent
local _ = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ExpChatTextChannelWindowMinWidth = game:DefineFastInt("ExpChatTextChannelWindowMinWidth", 200)
local ExpChatTextChannelWindowMinHeight = game:DefineFastInt("ExpChatTextChannelWindowMinHeight", 200)
local t = {}

local function _(p1) --[[ Line: 17 | Named "getEffectiveAdornee" ]]
	if p1.Adornee == nil then
		local Parent = p1.Parent
		
		return if Parent and Parent:IsA("BasePart") then Parent else nil
	else
		return p1.Adornee
	end
end

local function createOverlay(Frame, ScreenGui) --[[ Line: 28 ]]
	-- upvalues: CoreGui (copy)
	if ScreenGui and ScreenGui:IsA("SurfaceGui") then
		local SurfaceGui = Instance.new("SurfaceGui")
		SurfaceGui.Name = "TextChannelWindowOverlay_" .. Frame.Name
		SurfaceGui.ResetOnSpawn = false
		local Adornee = nil
		
		if ScreenGui.Adornee == nil then
			local Parent = ScreenGui.Parent
			Adornee = if Parent and Parent:IsA("BasePart") then Parent else nil
		else
			Adornee = ScreenGui.Adornee
		end
		SurfaceGui.Adornee = Adornee
		SurfaceGui.Face = ScreenGui.Face
		SurfaceGui.SizingMode = ScreenGui.SizingMode
		SurfaceGui.CanvasSize = ScreenGui.CanvasSize
		SurfaceGui.Parent = CoreGui
		
		return SurfaceGui
	else
		local ScreenGui1 = Instance.new("ScreenGui")
		ScreenGui1.Name = "TextChannelWindowOverlay_" .. Frame.Name
		ScreenGui1.ResetOnSpawn = false
		
		if ScreenGui and ScreenGui:IsA("ScreenGui") then
			ScreenGui1.IgnoreGuiInset = ScreenGui.IgnoreGuiInset
			ScreenGui1.DisplayOrder = -1
			ScreenGui1.ZIndexBehavior = ScreenGui.ZIndexBehavior
		else
			ScreenGui1.IgnoreGuiInset = true
			ScreenGui1.DisplayOrder = -1
			ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		end
		ScreenGui1.Parent = CoreGui
		
		return ScreenGui1
	end
end

local function connectGuiObjectSync(Frame: Frame, Frame1, _, List) --[[ Line: 59 ]]
	local function syncTransform() --[[ Line: 65 ]]
		-- upvalues: Frame1 (copy), Frame (copy)
		Frame1.Position = UDim2.fromOffset(Frame.AbsolutePosition.X, Frame.AbsolutePosition.Y)
		Frame1.Size = UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y)
		Frame1.Rotation = Frame.Rotation
	end
	
	table.insert(List, Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(syncTransform))
	table.insert(List, Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncTransform))
	table.insert(List, Frame:GetPropertyChangedSignal("Rotation"):Connect(syncTransform))
end

local function connectSurfaceGuiSync(Object, ScrollFrame, List) --[[ Line: 76 ]]
	local function syncAdornee() --[[ Line: 77 ]]
		-- upvalues: ScrollFrame (copy), Object (copy)
		local Adornee = nil
		if Object.Adornee == nil then
			local Parent = Object.Parent
			Adornee = if Parent and Parent:IsA("BasePart") then Parent else nil
		else
			Adornee = Object.Adornee
		end
		ScrollFrame.Adornee = Adornee
	end
	
	table.insert(List, Object:GetPropertyChangedSignal("Adornee"):Connect(syncAdornee))
	table.insert(List, Object:GetPropertyChangedSignal("Parent"):Connect(syncAdornee))
	table.insert(List, Object:GetPropertyChangedSignal("Face"):Connect(function() --[[ Line: 85 ]]
		-- upvalues: ScrollFrame (copy), Object (copy)
		ScrollFrame.Face = Object.Face
	end))
	table.insert(List, Object:GetPropertyChangedSignal("SizingMode"):Connect(function() --[[ Line: 91 ]]
		-- upvalues: ScrollFrame (copy), Object (copy)
		ScrollFrame.SizingMode = Object.SizingMode
	end))
	table.insert(List, Object:GetPropertyChangedSignal("CanvasSize"):Connect(function() --[[ Line: 97 ]]
		-- upvalues: ScrollFrame (copy), Object (copy)
		ScrollFrame.CanvasSize = Object.CanvasSize
	end))
end

local function connectScreenGuiSync(ScreenGui, ScreenGui1, List) --[[ Line: 103 ]]
	table.insert(List, ScreenGui:GetPropertyChangedSignal("IgnoreGuiInset"):Connect(function() --[[ Line: 106 ]]
		-- upvalues: ScreenGui1 (copy), ScreenGui (copy)
		ScreenGui1.IgnoreGuiInset = ScreenGui.IgnoreGuiInset
	end))
	table.insert(List, ScreenGui:GetPropertyChangedSignal("ZIndexBehavior"):Connect(function() --[[ Line: 112 ]]
		-- upvalues: ScreenGui1 (copy), ScreenGui (copy)
		ScreenGui1.ZIndexBehavior = ScreenGui.ZIndexBehavior
	end))
end

local _ = function(Object, ScreenGui, p1) --[[ Line: 118 | Named "connectLayerCollectorSync" ]]
	-- upvalues: connectSurfaceGuiSync (copy), connectScreenGuiSync (copy)
	if Object == nil then return end
	if Object:IsA("SurfaceGui") then
		connectSurfaceGuiSync(Object, ScreenGui, p1)
		
		return
	end
	if Object:IsA("ScreenGui") then
		connectScreenGuiSync(Object, ScreenGui, p1)
	end
end

local function doMount(Frame: Frame, p1) --[[ Line: 133 ]]
	-- upvalues: t (copy), createOverlay (copy), ReactRobloxModule (copy), connectGuiObjectSync (copy), connectSurfaceGuiSync (copy), connectScreenGuiSync (copy), ExpChatTextChannelWindowMinWidth (copy), ExpChatTextChannelWindowMinHeight (copy)
	if not Frame:IsA("TextChannelWindow") then
		return nil
	end
	if t[Frame] then
		return nil
	end
	local LayerCollector = Frame:FindFirstAncestorWhichIsA("LayerCollector")
	
	if LayerCollector and not LayerCollector:IsA("ScreenGui") and not LayerCollector:IsA("SurfaceGui") then
		return nil
	end
	local Overlay = createOverlay(Frame, LayerCollector)
	local Frame1 = Instance.new("Frame")
	Frame1.BackgroundTransparency = 1
	Frame1.Position = UDim2.fromOffset(Frame.AbsolutePosition.X, Frame.AbsolutePosition.Y)
	Frame1.Size = UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y)
	Frame1.Rotation = Frame.Rotation
	Frame1.Parent = Overlay
	local Root = ReactRobloxModule.createRoot(Frame1)
	Root:render(p1)
	local List = {}
	connectGuiObjectSync(Frame, Frame1, Overlay, List)
	
	if LayerCollector ~= nil then
		if LayerCollector:IsA("SurfaceGui") then
			connectSurfaceGuiSync(LayerCollector, Overlay, List)
		elseif LayerCollector:IsA("ScreenGui") then
			connectScreenGuiSync(LayerCollector, Overlay, List)
		end
	end
	local function updateEnabled() --[[ Line: 165 ]]
		-- upvalues: Overlay (copy), Frame (copy), Frame (copy), ExpChatTextChannelWindowMinWidth (upval), ExpChatTextChannelWindowMinHeight (upval)
		Overlay.Enabled = Frame.IsRendering and (ExpChatTextChannelWindowMinWidth <= Frame.AbsoluteSize.X and ExpChatTextChannelWindowMinHeight <= Frame.AbsoluteSize.Y)
	end
	
	Overlay.Enabled = Frame.IsRendering and (ExpChatTextChannelWindowMinWidth <= Frame.AbsoluteSize.X and ExpChatTextChannelWindowMinHeight <= Frame.AbsoluteSize.Y)
	table.insert(List, Frame:GetPropertyChangedSignal("IsRendering"):Connect(updateEnabled))
	table.insert(List, Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateEnabled))
	
	local function unmount() --[[ Line: 174 ]]
		-- upvalues: List (copy), Root (copy), Overlay (copy), t (upval), Frame (copy)
		for _, Connection in List do
			Connection:Disconnect()
		end
		Root:unmount()
		Overlay:Destroy()
		t[Frame] = nil
	end
	
	table.insert(List, Frame.Destroying:Connect(unmount))
	t[Frame] = true
	
	return unmount
end

return function(Frame, p2) --[[ Line: 189 | Named "mountToTargetInstance" ]]
	-- upvalues: StarterGui (copy), doMount (copy)
	return if Frame:IsDescendantOf(StarterGui) then nil else doMount(Frame, p2)
end