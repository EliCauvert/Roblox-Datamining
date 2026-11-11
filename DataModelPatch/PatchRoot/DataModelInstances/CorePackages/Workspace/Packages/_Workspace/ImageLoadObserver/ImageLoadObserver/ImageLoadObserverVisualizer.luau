local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local OBSERVEDIMAGETAG = require(script.Parent.Constants).OBSERVED_IMAGE_TAG
local DebugEnableImageLoadObserver = game:DefineFastFlag("DebugEnableImageLoadObserver", false)
local _Color3 = Color3.fromRGB(40, 140, 240)
local _Color3_1 = Color3.fromRGB(40, 230, 90)
local ImageLoadObserverVisualizerModule = {}
ImageLoadObserverVisualizerModule.__index = ImageLoadObserverVisualizerModule

function ImageLoadObserverVisualizerModule.isEnabled()
	-- upvalues: DebugEnableImageLoadObserver (copy)
	return DebugEnableImageLoadObserver
end

function ImageLoadObserverVisualizerModule.new()
	-- upvalues: ImageLoadObserverVisualizerModule (copy), DebugEnableImageLoadObserver (copy), RunService (copy)
	local self = setmetatable({ connection = nil, strokes = {} }, ImageLoadObserverVisualizerModule)
	
	if DebugEnableImageLoadObserver then
		self.connection = RunService.Heartbeat:Connect(function()
			-- upvalues: self (copy)
			self:_outlineTagged()
		end)
	end
	return self
end

function ImageLoadObserverVisualizerModule:_ensureStroke(Gui)
	-- upvalues: _Color3 (copy)
	local Stroke = self.strokes[Gui]
	
	if Stroke and Stroke.Parent == Gui then
		return Stroke
	else
		local ImageLoadObserverDebugStroke = Instance.new("UIStroke")
		ImageLoadObserverDebugStroke.Name = "ImageLoadObserverDebugStroke"
		ImageLoadObserverDebugStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		ImageLoadObserverDebugStroke.Color = _Color3
		ImageLoadObserverDebugStroke.Thickness = 3
		ImageLoadObserverDebugStroke.Transparency = 0
		ImageLoadObserverDebugStroke.Parent = Gui
		self.strokes[Gui] = ImageLoadObserverDebugStroke
		
		return ImageLoadObserverDebugStroke
	end
end

function ImageLoadObserverVisualizerModule:_removeStroke(p1)
	local Stroke = self.strokes[p1]
	self.strokes[p1] = nil
	
	if Stroke then
		Stroke:Destroy()
	end
end

function ImageLoadObserverVisualizerModule:_outlineTagged()
	-- upvalues: CollectionService (copy), OBSERVEDIMAGETAG (copy)
	local t = {}
	
	for i, Gui in CollectionService:GetTagged(OBSERVEDIMAGETAG) do
		if Gui:IsA("GuiObject") then
			t[Gui] = true
			self:_ensureStroke(Gui)
		end
	end
	for i in self.strokes do
		if not t[i] then
			self:_removeStroke(i)
		end
	end
end

function ImageLoadObserverVisualizerModule:flash(Gui)
	-- upvalues: DebugEnableImageLoadObserver (copy), _Color3_1 (copy), _Color3 (copy)
	if not DebugEnableImageLoadObserver then return end
	if Gui ~= nil and Gui:IsA("GuiObject") then
		local EnsureStrokeResult = self:_ensureStroke(Gui)
		EnsureStrokeResult.Color = _Color3_1
		EnsureStrokeResult.Thickness = 6
		task.delay(2.5, function()
			-- upvalues: EnsureStrokeResult (copy), _Color3 (upval)
			if EnsureStrokeResult.Parent ~= nil then
				EnsureStrokeResult.Color = _Color3
				EnsureStrokeResult.Thickness = 3
			end
		end)
		
		return
	end
end

function ImageLoadObserverVisualizerModule:flashAndDestroy(Gui)
	-- upvalues: DebugEnableImageLoadObserver (copy)
	if DebugEnableImageLoadObserver then
		self:flash(Gui)
		task.delay(2.5, function()
			-- upvalues: self (copy)
			self:destroy()
		end)
		
		return
	end
end

function ImageLoadObserverVisualizerModule:destroy()
	if self.connection then
		self.connection:Disconnect()
		self.connection = nil
	end
	for stroke in self.strokes do
		self:_removeStroke(stroke)
	end
end

return ImageLoadObserverVisualizerModule