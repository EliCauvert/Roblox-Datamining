local CoreGui = game:GetService("CoreGui")
local StatsUtilsModule = require(CoreGui.RobloxGui.Modules.Stats.StatsUtils)
local BarGraphModule = require(CoreGui.RobloxGui.Modules.Stats.BarGraph)
local StatsAnnotatedGraphModule = {}
StatsAnnotatedGraphModule.__index = StatsAnnotatedGraphModule

function StatsAnnotatedGraphModule.new(_statType, _isMaximized) --[[ Line: 24 ]]
	-- upvalues: StatsAnnotatedGraphModule (copy), StatsUtilsModule (copy), BarGraphModule (copy)
	local t = {}
	setmetatable(t, StatsAnnotatedGraphModule)
	t._statType = _statType
	t._statMaxName = StatsUtilsModule.StatMaxNames[_statType]
	t._isMaximized = _isMaximized
	t._values = {}
	t._average = 0
	t._target = 0
	t._axisMax = 0
	t._frame = Instance.new("Frame")
	t._frame.Name = "PS_AnnotatedGraph"
	t._frame.BackgroundTransparency = 1
	t._frame.ZIndex = StatsUtilsModule.GraphZIndex
	t._topLabel = Instance.new("TextLabel")
	t._topLabel.Name = "PS_TopAxisLabel"
	t._topLabel.Parent = t._frame
	t._topLabel.TextXAlignment = Enum.TextXAlignment.Left
	t._topLabel.TextYAlignment = Enum.TextYAlignment.Top
	t._topLabel.FontSize = StatsUtilsModule.PanelGraphFontSize
	t._bottomLabel = Instance.new("TextLabel")
	t._bottomLabel.Name = "PS_BottomAxisLabel"
	t._bottomLabel.Parent = t._frame
	t._bottomLabel.TextXAlignment = Enum.TextXAlignment.Left
	t._bottomLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	t._bottomLabel.FontSize = StatsUtilsModule.PanelGraphFontSize
	t._graph = BarGraphModule.new(_isMaximized)
	StatsUtilsModule.StyleTextWidget(t._topLabel)
	StatsUtilsModule.StyleTextWidget(t._bottomLabel)
	t:_layoutElements()
	
	return t
end

function StatsAnnotatedGraphModule:SetZIndex(ZIndex) --[[ Line: 71 ]]
	self._frame.ZIndex = ZIndex
	self._topLabel.ZIndex = ZIndex
	self._bottomLabel.ZIndex = ZIndex
	self._graph:SetZIndex(ZIndex)
end

function StatsAnnotatedGraphModule:_layoutElements() --[[ Line: 78 ]]
	local XOffset = nil
	if self._isMaximized then
		XOffset = 30
		self._topLabel.Visible = true
		self._bottomLabel.Visible = true
	else
		XOffset = 0
		self._topLabel.Visible = false
		self._bottomLabel.Visible = false
	end
	local _UDim2 = UDim2.new(0, 10, 0, 10)
	local _UDim2_1 = UDim2.new(1, -(20 + XOffset), 1, -20)
	local _UDim2_2 = UDim2.new(1, -(10 + XOffset), 0, 10)
	local _UDim2_3 = UDim2.new(1, -(10 + XOffset), 0.666, 10)
	local _UDim2_4 = UDim2.new(0, XOffset, 0.333, -20)
	self._topLabel.Size = UDim2.new(0, XOffset, 0.333, -20)
	self._topLabel.Position = _UDim2_2
	self._bottomLabel.Size = _UDim2_4
	self._bottomLabel.Position = _UDim2_3
	self._graph:PlaceInParent(self._frame, _UDim2_1, _UDim2)
end

function StatsAnnotatedGraphModule:PlaceInParent(Parent, Size, Position) --[[ Line: 108 ]]
	self._frame.Position = Position
	self._frame.Size = Size
	self._frame.Parent = Parent
end

function StatsAnnotatedGraphModule:_getTarget() --[[ Line: 114 ]]
	if self._performanceStats == nil then
		return 0
	else
		local StatMaxName = self._performanceStats:FindFirstChild(self._statMaxName)
		
		return if StatMaxName == nil then 0 else StatMaxName:GetValue()
	end
end

function StatsAnnotatedGraphModule:_render() --[[ Line: 128 ]]
	self._graph:SetAxisMax(self._axisMax)
	self._graph:SetValues(self._values)
	self._graph:SetAverage(self._average)
	self._graph:SetTarget(self._target)
	self._graph:Render()
	self._topLabel.Text = string.format("%.2f", self._axisMax)
	self._bottomLabel.Text = string.format("%.2f", 0)
end

function StatsAnnotatedGraphModule:_calculateAxisMax() --[[ Line: 140 ]]
	local ScaledTarget = self._target * 2
	local RecursiveGetOrderOfMagnitudeResult = self:_recursiveGetOrderOfMagnitude(1, ScaledTarget)
	self._axisMax = math.floor(0.5 + ScaledTarget / RecursiveGetOrderOfMagnitudeResult) * RecursiveGetOrderOfMagnitudeResult
end

function StatsAnnotatedGraphModule:SetStatsAggregator(_aggregator) --[[ Line: 150 ]]
	if self._aggregator then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		self._aggregator = nil
	end
	self._aggregator = _aggregator
	self:_refreshVisibility()
end

function StatsAnnotatedGraphModule:_stopListening() --[[ Line: 162 ]]
	if self._aggregator == nil then return end
	if self._listenerId ~= nil then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		
		return
	end
end

function StatsAnnotatedGraphModule:_startListening() --[[ Line: 175 ]]
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		self._listenerId = self._aggregator:AddListener(function() --[[ Line: 184 ]]
			-- upvalues: self (copy)
			self:_updateValuesAndRender()
		end)
		
		return
	end
end

function StatsAnnotatedGraphModule._shouldBeVisible(p1) --[[ Line: 189 ]]
	-- upvalues: StatsUtilsModule (copy)
	return if StatsUtilsModule.PerformanceStatsShouldBeVisible() then p1._frame.Visible else false
end

function StatsAnnotatedGraphModule:SetVisible(Visible) --[[ Line: 197 ]]
	self._frame.Visible = Visible
	self:_refreshVisibility()
end

function StatsAnnotatedGraphModule:_refreshVisibility() --[[ Line: 202 ]]
	if self:_shouldBeVisible() then
		self:_startListening()
		self:_updateValuesAndRender()
		
		return
	else
		self:_stopListening()
	end
end

function StatsAnnotatedGraphModule:OnPerformanceStatsShouldBeVisibleChanged() --[[ Line: 211 ]]
	self:_refreshVisibility()
end

function StatsAnnotatedGraphModule._recursiveGetOrderOfMagnitude(p1, p2: number, ScaledTarget) --[[ Line: 215 ]]
	return if ScaledTarget < p2 then p1:_recursiveGetOrderOfMagnitude(p2 / 10, ScaledTarget) elseif ScaledTarget <= p2 * 10 then p2 else p1:_recursiveGetOrderOfMagnitude(p2 * 10, ScaledTarget)
end

function StatsAnnotatedGraphModule:_updateValuesAndRender() --[[ Line: 227 ]]
	self._values = {}
	self._average = 0
	self._target = 0
	
	if self._aggregator ~= nil then
		self._values = self._aggregator:GetValues()
		self._average = self._aggregator:GetAverage()
		self._target = self._aggregator:GetTarget()
	end
	self:_calculateAxisMax()
	self:_render()
end

return StatsAnnotatedGraphModule