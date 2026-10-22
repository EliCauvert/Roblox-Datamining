local CoreGui = game:GetService("CoreGui")

local function _(p1)
	if p1.Adornee == nil then
		local Parent = p1.Parent
		
		return if Parent and Parent:IsA("BasePart") then Parent else nil
	else
		return p1.Adornee
	end
end

local function connectSurfaceGuiSync(Object, ScrollFrame, List)
	local function syncAdornee()
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
	table.insert(List, Object:GetPropertyChangedSignal("Face"):Connect(function()
		-- upvalues: ScrollFrame (copy), Object (copy)
		ScrollFrame.Face = Object.Face
	end))
	table.insert(List, Object:GetPropertyChangedSignal("SizingMode"):Connect(function()
		-- upvalues: ScrollFrame (copy), Object (copy)
		ScrollFrame.SizingMode = Object.SizingMode
		ScrollFrame.CanvasSize = Object.CanvasSize
		ScrollFrame.PixelsPerStud = Object.PixelsPerStud
	end))
	table.insert(List, Object:GetPropertyChangedSignal("CanvasSize"):Connect(function()
		-- upvalues: ScrollFrame (copy), Object (copy)
		ScrollFrame.CanvasSize = Object.CanvasSize
	end))
	table.insert(List, Object:GetPropertyChangedSignal("PixelsPerStud"):Connect(function()
		-- upvalues: ScrollFrame (copy), Object (copy)
		ScrollFrame.PixelsPerStud = Object.PixelsPerStud
	end))
end

local _ = function(Object, ScreenGui, List)
	table.insert(List, Object:GetPropertyChangedSignal("ZIndexBehavior"):Connect(function()
		-- upvalues: ScreenGui (copy), Object (copy)
		ScreenGui.ZIndexBehavior = Object.ZIndexBehavior
	end))
end

return {
	create = function(p1, Object)
		-- upvalues: CoreGui (copy)
		if Object and Object:IsA("SurfaceGui") then
			local SurfaceGui = Instance.new("SurfaceGui")
			SurfaceGui.Name = "TextChannelWindowOverlay_" .. p1.Name
			SurfaceGui.ResetOnSpawn = false
			local Adornee = nil
			
			if Object.Adornee == nil then
				local Parent = Object.Parent
				Adornee = if Parent and Parent:IsA("BasePart") then Parent else nil
			else
				Adornee = Object.Adornee
			end
			SurfaceGui.Adornee = Adornee
			SurfaceGui.Face = Object.Face
			SurfaceGui.SizingMode = Object.SizingMode
			SurfaceGui.CanvasSize = Object.CanvasSize
			SurfaceGui.PixelsPerStud = Object.PixelsPerStud
			SurfaceGui.Parent = CoreGui
			
			return SurfaceGui
		else
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Name = "TextChannelWindowOverlay_" .. p1.Name
			ScreenGui.ResetOnSpawn = false
			
			if Object and Object:IsA("ScreenGui") then
				ScreenGui.IgnoreGuiInset = false
				ScreenGui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
				ScreenGui.DisplayOrder = -1
				ScreenGui.ZIndexBehavior = Object.ZIndexBehavior
			else
				ScreenGui.IgnoreGuiInset = true
				ScreenGui.DisplayOrder = -1
				ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			end
			ScreenGui.Parent = CoreGui
			
			return ScreenGui
		end
	end,
	connect = function(Object, ScreenGui, List)
		-- upvalues: connectSurfaceGuiSync (copy)
		if Object == nil then return end
		if Object:IsA("SurfaceGui") then
			connectSurfaceGuiSync(Object, ScreenGui, List)
			
			return
		end
		if Object:IsA("ScreenGui") then
			table.insert(List, Object:GetPropertyChangedSignal("ZIndexBehavior"):Connect(function()
				-- upvalues: ScreenGui (copy), Object (copy)
				ScreenGui.ZIndexBehavior = Object.ZIndexBehavior
			end))
		end
	end
}