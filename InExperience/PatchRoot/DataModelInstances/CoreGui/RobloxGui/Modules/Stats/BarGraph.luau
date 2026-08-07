local statsUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Stats.StatsUtils)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 23 ]]
	-- upvalues: t (ref)
	local pSLineFrame = {}
	setmetatable(pSLineFrame, t)
	pSLineFrame._barFrame = Instance.new("Frame")
	pSLineFrame._barFrame.Name = "PS_BarFrame"
	pSLineFrame._barFrame.BackgroundTransparency = 1
	pSLineFrame._lineFrame = Instance.new("Frame")
	pSLineFrame._lineFrame.Name = "PS_LineFrame"
	pSLineFrame._lineFrame.BackgroundTransparency = 1
	pSLineFrame._showExtras = p0
	pSLineFrame._values = {}
	pSLineFrame._bars = {}
	pSLineFrame._average = 0
	pSLineFrame._target = 0
	
	if pSLineFrame._showExtras then
		pSLineFrame:_addGraphTarget()
		pSLineFrame:_addGraphAverage()
	end
	return pSLineFrame
end

function t:SetZIndex(p1) --[[ line: 53 ]]
	self._barFrame.ZIndex = p1
	self._lineFrame.ZIndex = p1 + 1
	
	if self._showExtras then
		self._targetLine.ZIndex = self._lineFrame.ZIndex
		self._averageLine.ZIndex = self._lineFrame.ZIndex
	end
end

function t:PlaceInParent(p2, p3, p4) --[[ line: 62 ]]
	self._barFrame.Position = p4
	self._barFrame.Size = p3
	self._barFrame.Parent = p2
	self._lineFrame.Position = p4
	self._lineFrame.Size = p3
	self._lineFrame.Parent = p2
end

function t:SetAxisMax(b) --[[ line: 71 ]]
	self._axisMax = b
end

function t:SetValues(p5) --[[ line: 75 ]]
	self._values = p5
end

function t:SetAverage(p6) --[[ line: 79 ]]
	self._average = p6
end

function t:SetTarget(p7) --[[ line: 83 ]]
	self._target = p7
	self:_moveGraphTarget()
end

function t:_updateBarCount(p8) --[[ line: 90 ]]
	local t = {}
	local barsCount = #self._bars
	
	for i = 1, barsCount do
		if i <= barsCount then
			table.insert(t, self._bars[i])
		else
			self._bars[i].Destroy()
		end
	end
	for i_1 = barsCount + 1, p8 do
		table.insert(t, self:_makeNthBar(i_1))
	end
	self._bars = t
end

function t:Render() --[[ line: 113 ]]
	local valuesCount = #self._values
	self:_updateBarCount(valuesCount)
	
	for i, v in ipairs(self._values) do
		self:_updateBar(i, v, valuesCount)
	end
	if self._showExtras then
		self:_moveGraphAverage()
	end
end

function t:_addGraphTarget() --[[ line: 128 ]]
	-- upvalues: statsUtilsModule (ref)
	local targetLine = Instance.new("ImageLabel")
	targetLine.Name = "TargetLine"
	targetLine.Size = UDim2.new(1, 0, 0, statsUtilsModule.GraphTargetLineInnerThickness)
	targetLine.Image = "rbxasset://textures/ui/PerformanceStats/TargetLine.png"
	targetLine.BackgroundTransparency = 1
	targetLine.Parent = self._lineFrame
	targetLine.ZIndex = self._lineFrame.ZIndex
	targetLine.BorderSizePixel = 0
	targetLine.Changed:connect(function() --[[ line: 140 ]]
		-- upvalues: self (ref)
		self:_updateTargetLineImageSize()
	end)
	self._targetLine = targetLine
	self:_updateTargetLineImageSize()
end

function t:_updateTargetLineImageSize() --[[ line: 148 ]]
	self._targetLine.ImageRectSize = self._targetLine.AbsoluteSize
end

function t:_addGraphAverage() --[[ line: 152 ]]
	-- upvalues: statsUtilsModule (ref)
	local averageLine = Instance.new("Frame")
	averageLine.Name = "AverageLine"
	averageLine.Size = UDim2.new(1, 0, 0, statsUtilsModule.GraphAverageLineInnerThickness)
	averageLine.Parent = self._lineFrame
	averageLine.ZIndex = self._lineFrame.ZIndex
	statsUtilsModule.StyleAverageLine(averageLine)
	self._averageLine = averageLine
end

function t:_moveGraphTarget() --[[ line: 166 ]]
	-- upvalues: statsUtilsModule (ref)
	if self._targetLine == nil then
		return
	end
	self._targetLine.Position = UDim2.new(0, 0, (self._axisMax - self._target) / self._axisMax, -statsUtilsModule.GraphTargetLineInnerThickness / 2)
end

function t:_moveGraphAverage() --[[ line: 177 ]]
	-- upvalues: statsUtilsModule (ref)
	if self._averageLine == nil then
		return
	end
	self._averageLine.Position = UDim2.new(0, 0, (self._axisMax - math.min(self._average, self._axisMax)) / self._axisMax, -statsUtilsModule.GraphAverageLineTotalThickness / 2)
end

function t:_makeNthBar(p9) --[[ line: 192 ]]
	local frame = Instance.new("Frame")
	frame.Name = string.format("Bar_%d", p9 - 1)
	frame.Parent = self._barFrame
	frame.ZIndex = self._barFrame.ZIndex
	frame.BorderSizePixel = 0
	
	return frame
end

function t:_updateBar(p10, p11, p12) --[[ line: 203 ]]
	-- upvalues: statsUtilsModule (ref)
	local var9 = self._bars[p10]
	local maxValue = math.max(0, math.min(p11, self._axisMax))
	var9.Position = UDim2.new((p10 - 1) / p12, 0, (self._axisMax - maxValue) / self._axisMax, 0)
	var9.Size = UDim2.new(1 / p12, 0, maxValue / self._axisMax, 0)
	var9.BackgroundColor3 = statsUtilsModule.GetColorForValue(p11, self._target)
end

return t