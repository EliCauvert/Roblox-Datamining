local coreGuiService = game:GetService("CoreGui")
local starterGuiService = game:GetService("StarterGui")
local parent = script.Parent.Parent
local _ = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local t = {}
local t_1 = {}

local function createOverlay(p0, p1) --[[ line: 15 ]]
	-- upvalues: coreGuiService (ref)
	if p1 and p1:IsA("SurfaceGui") then
		local surfaceGui = Instance.new("SurfaceGui")
		surfaceGui.Name = "TextChannelWindowOverlay_" .. p0.Name
		surfaceGui.ResetOnSpawn = false
		surfaceGui.Adornee = p1.Adornee
		surfaceGui.Face = p1.Face
		surfaceGui.SizingMode = p1.SizingMode
		surfaceGui.CanvasSize = p1.CanvasSize
		surfaceGui.Parent = coreGuiService
		
		return surfaceGui
	end
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "TextChannelWindowOverlay_" .. p0.Name
	screenGui.ResetOnSpawn = false
	
	if p1 and p1:IsA("ScreenGui") then
		screenGui.IgnoreGuiInset = p1.IgnoreGuiInset
		screenGui.DisplayOrder = -1
		screenGui.ZIndexBehavior = p1.ZIndexBehavior
	else
		screenGui.IgnoreGuiInset = true
		screenGui.DisplayOrder = -1
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	end
	screenGui.Parent = coreGuiService
	
	return screenGui
end

local function connectGuiObjectSync(p2, p3, _, p4) --[[ line: 46 ]]
	local function syncTransform() --[[ line: 52 ]]
		-- upvalues: p3 (ref), p2 (ref)
		p3.Position = UDim2.fromOffset(p2.AbsolutePosition.X, p2.AbsolutePosition.Y)
		p3.Size = UDim2.fromOffset(p2.AbsoluteSize.X, p2.AbsoluteSize.Y)
		p3.Rotation = p2.Rotation
	end
	
	table.insert(p4, p2:GetPropertyChangedSignal("AbsolutePosition"):Connect(syncTransform))
	table.insert(p4, p2:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncTransform))
	table.insert(p4, p2:GetPropertyChangedSignal("Rotation"):Connect(syncTransform))
end

local function connectSurfaceGuiSync(p5, p6, p7) --[[ line: 63 ]]
	table.insert(p7, p5:GetPropertyChangedSignal("Adornee"):Connect(function() --[[ line: 66 ]]
		-- upvalues: p6 (ref), p5 (ref)
		p6.Adornee = p5.Adornee
	end))
	table.insert(p7, p5:GetPropertyChangedSignal("Face"):Connect(function() --[[ line: 72 ]]
		-- upvalues: p6 (ref), p5 (ref)
		p6.Face = p5.Face
	end))
	table.insert(p7, p5:GetPropertyChangedSignal("SizingMode"):Connect(function() --[[ line: 78 ]]
		-- upvalues: p6 (ref), p5 (ref)
		p6.SizingMode = p5.SizingMode
	end))
	table.insert(p7, p5:GetPropertyChangedSignal("CanvasSize"):Connect(function() --[[ line: 84 ]]
		-- upvalues: p6 (ref), p5 (ref)
		p6.CanvasSize = p5.CanvasSize
	end))
end

local function connectScreenGuiSync(p8, p9, p10) --[[ line: 90 ]]
	table.insert(p10, p8:GetPropertyChangedSignal("IgnoreGuiInset"):Connect(function() --[[ line: 93 ]]
		-- upvalues: p9 (ref), p8 (ref)
		p9.IgnoreGuiInset = p8.IgnoreGuiInset
	end))
	table.insert(p10, p8:GetPropertyChangedSignal("ZIndexBehavior"):Connect(function() --[[ line: 99 ]]
		-- upvalues: p9 (ref), p8 (ref)
		p9.ZIndexBehavior = p8.ZIndexBehavior
	end))
end

local function _(p11, p12, p13) --[[ line: 105 | named "connectLayerCollectorSync" ]]
	-- upvalues: connectSurfaceGuiSync (ref), connectScreenGuiSync (ref)
	if p11 == nil then return end
	if p11:IsA("SurfaceGui") then
		connectSurfaceGuiSync(p11, p12, p13)
		
		return
	elseif p11:IsA("ScreenGui") then
		connectScreenGuiSync(p11, p12, p13)
	end
end

local function doMount(p14, p15) --[[ line: 120 ]]
	-- upvalues: t (ref), createOverlay (ref), reactRobloxModule (ref), connectGuiObjectSync (ref), connectSurfaceGuiSync (ref), connectScreenGuiSync (ref)
	if not p14:IsA("TextChannelWindow") then
		return nil
	elseif t[p14] then
		return nil
	end
	local layerCollector = p14:FindFirstAncestorWhichIsA("LayerCollector")
	
	if layerCollector and not layerCollector:IsA("ScreenGui") and not layerCollector:IsA("SurfaceGui") then
		return nil
	end
	local var14 = createOverlay(p14, layerCollector)
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Position = UDim2.fromOffset(p14.AbsolutePosition.X, p14.AbsolutePosition.Y)
	frame.Size = UDim2.fromOffset(p14.AbsoluteSize.X, p14.AbsoluteSize.Y)
	frame.Rotation = p14.Rotation
	frame.Parent = var14
	local var16 = reactRobloxModule.createRoot(frame)
	var16:render(p15)
	local t_1 = {}
	connectGuiObjectSync(p14, frame, var14, t_1)
	
	if layerCollector ~= nil then
		if layerCollector:IsA("SurfaceGui") then
			connectSurfaceGuiSync(layerCollector, var14, t_1)
		elseif layerCollector:IsA("ScreenGui") then
			connectScreenGuiSync(layerCollector, var14, t_1)
		end
	end
	var14.Enabled = p14.IsRendering
	table.insert(t_1, p14:GetPropertyChangedSignal("IsRendering"):Connect(function() --[[ line: 155 ]]
		-- upvalues: var14 (ref), p14 (ref)
		var14.Enabled = p14.IsRendering
	end))
	
	local function unmount() --[[ line: 160 ]]
		-- upvalues: t_1 (ref), var16 (ref), var14 (ref), t (copy), p14 (ref)
		for i, v in t_1 do
			v:Disconnect()
		end
		var16:unmount()
		var14:Destroy()
		t[p14] = nil
	end
	
	table.insert(t_1, p14.Destroying:Connect(unmount))
	t[p14] = true
	
	return unmount
end

return function(p16, p17) --[[ line: 175 | named "mountToTargetInstance" ]]
	-- upvalues: starterGuiService (ref), t_1 (ref), doMount (ref)
	if p16:IsDescendantOf(starterGuiService) then
		return nil
	elseif p16.AbsoluteSize.X == 0 and p16.AbsoluteSize.Y == 0 then
		t_1[p16] = true
		local var19 = nil
		local destroyingConnection = nil
		
		local function cleanup() --[[ line: 188 ]]
			-- upvalues: var19 (write), destroyingConnection (write), t_1 (copy), p16 (ref)
			var19:Disconnect()
			destroyingConnection:Disconnect()
			t_1[p16] = nil
		end
		
		var19 = p16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 194 ]]
			-- upvalues: p16 (ref), var19 (write), destroyingConnection (write), t_1 (copy), p16 (ref), doMount (copy), p17 (ref)
			if p16.AbsoluteSize.X ~= 0 or p16.AbsoluteSize.Y ~= 0 then
				var19:Disconnect()
				destroyingConnection:Disconnect()
				t_1[p16] = nil
				doMount(p16, p17)
			end
		end)
		destroyingConnection = p16.Destroying:Connect(cleanup)
		
		return nil
	end
	return doMount(p16, p17)
end