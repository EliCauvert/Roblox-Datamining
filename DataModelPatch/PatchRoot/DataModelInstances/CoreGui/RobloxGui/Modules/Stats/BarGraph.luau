local StatsUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Stats.StatsUtils)
local BarGraphModule = {}
BarGraphModule.__index = BarGraphModule

function BarGraphModule.new(_showExtras)
	-- upvalues: BarGraphModule (copy)
	local t = {}
	setmetatable(t, BarGraphModule)
	t._barFrame = Instance.new("Frame")
	t._barFrame.Name = "PS_BarFrame"
	t._barFrame.BackgroundTransparency = 1
	t._lineFrame = Instance.new("Frame")
	t._lineFrame.Name = "PS_LineFrame"
	t._lineFrame.BackgroundTransparency = 1
	t._showExtras = _showExtras
	t._values = {}
	t._bars = {}
	t._average = 0
	t._target = 0
	
	if t._showExtras then
		t:_addGraphTarget()
		t:_addGraphAverage()
	end
	return t
end

function BarGraphModule:SetZIndex(ZIndex: number)
	self._barFrame.ZIndex = ZIndex
	self._lineFrame.ZIndex = ZIndex + 1
	
	if self._showExtras then
		self._targetLine.ZIndex = self._lineFrame.ZIndex
		self._averageLine.ZIndex = self._lineFrame.ZIndex
	end
end

function BarGraphModule:PlaceInParent(Parent, Size, Position)
	self._barFrame.Position = Position
	self._barFrame.Size = Size
	self._barFrame.Parent = Parent
	self._lineFrame.Position = Position
	self._lineFrame.Size = Size
	self._lineFrame.Parent = Parent
end

function BarGraphModule:SetAxisMax(_axisMax)
	self._axisMax = _axisMax
end

function BarGraphModule:SetValues(_values)
	self._values = _values
end

function BarGraphModule:SetAverage(_average)
	self._average = _average
end

function BarGraphModule:SetTarget(_target)
	self._target = _target
	self:_moveGraphTarget()
end

function BarGraphModule:_updateBarCount(CountValues)
	local List = {}
	local CountBars = #self._bars
	
	for i = 1, CountBars do
		if i <= CountBars then
			table.insert(List, self._bars[i])
		else
			self._bars[i].Destroy()
		end
	end
	for i1 = CountBars + 1, CountValues do
		table.insert(List, self:_makeNthBar(i1))
	end
	self._bars = List
end

function BarGraphModule:Render()
	local CountValues = #self._values
	self:_updateBarCount(CountValues)
	
	for i, value in ipairs(self._values) do
		self:_updateBar(i, value, CountValues)
	end
	if self._showExtras then
		self:_moveGraphAverage()
	end
end

function BarGraphModule:_addGraphTarget()
	-- upvalues: StatsUtilsModule (copy)
	local TargetLine = Instance.new("ImageLabel")
	TargetLine.Name = "TargetLine"
	TargetLine.Size = UDim2.new(1, 0, 0, StatsUtilsModule.GraphTargetLineInnerThickness)
	TargetLine.Image = "rbxasset://textures/ui/PerformanceStats/TargetLine.png"
	TargetLine.BackgroundTransparency = 1
	TargetLine.Parent = self._lineFrame
	TargetLine.ZIndex = self._lineFrame.ZIndex
	TargetLine.BorderSizePixel = 0
	TargetLine.Changed:connect(function()
		-- upvalues: self (copy)
		self:_updateTargetLineImageSize()
	end)
	self._targetLine = TargetLine
	self:_updateTargetLineImageSize()
end

function BarGraphModule:_updateTargetLineImageSize()
	self._targetLine.ImageRectSize = self._targetLine.AbsoluteSize
end

function BarGraphModule:_addGraphAverage()
	-- upvalues: StatsUtilsModule (copy)
	local AverageLine = Instance.new("Frame")
	AverageLine.Name = "AverageLine"
	AverageLine.Size = UDim2.new(1, 0, 0, StatsUtilsModule.GraphAverageLineInnerThickness)
	AverageLine.Parent = self._lineFrame
	AverageLine.ZIndex = self._lineFrame.ZIndex
	StatsUtilsModule.StyleAverageLine(AverageLine)
	self._averageLine = AverageLine
end

function BarGraphModule:_moveGraphTarget()
	-- upvalues: StatsUtilsModule (copy)
	if self._targetLine ~= nil then
		self._targetLine.Position = UDim2.new(0, 0, (self._axisMax - self._target) / self._axisMax, -StatsUtilsModule.GraphTargetLineInnerThickness / 2)
		
		return
	end
end

function BarGraphModule:_moveGraphAverage()
	-- upvalues: StatsUtilsModule (copy)
	if self._averageLine ~= nil then
		self._averageLine.Position = UDim2.new(0, 0, (self._axisMax - math.min(self._average, self._axisMax)) / self._axisMax, -StatsUtilsModule.GraphAverageLineTotalThickness / 2)
		
		return
	end
end

function BarGraphModule:_makeNthBar(p1: number)
	local Frame = Instance.new("Frame")
	Frame.Name = string.format("Bar_%d", p1 - 1)
	Frame.Parent = self._barFrame
	Frame.ZIndex = self._barFrame.ZIndex
	Frame.BorderSizePixel = 0
	
	return Frame
end

function BarGraphModule:_updateBar(p1: number, p2: number, CountValues: number)
	-- upvalues: StatsUtilsModule (copy)
	local Bar = self._bars[p1]
	local Largest = math.max(0, (math.min(p2, self._axisMax)))
	Bar.Position = UDim2.new((p1 - 1) / CountValues, 0, (self._axisMax - Largest) / self._axisMax, 0)
	Bar.Size = UDim2.new(1 / CountValues, 0, Largest / self._axisMax, 0)
	Bar.BackgroundColor3 = StatsUtilsModule.GetColorForValue(p2, self._target)
end

return BarGraphModule