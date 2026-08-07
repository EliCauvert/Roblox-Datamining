local coreGuiService = game:GetService("CoreGui")
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local barGraphModule = require(coreGuiService.RobloxGui.Modules.Stats.BarGraph)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 24 ]]
	-- upvalues: t (ref), statsUtilsModule (ref), barGraphModule (ref)
	local pSBottomAxisLabel = {}
	setmetatable(pSBottomAxisLabel, t)
	pSBottomAxisLabel._statType = p0
	pSBottomAxisLabel._statMaxName = statsUtilsModule.StatMaxNames[p0]
	pSBottomAxisLabel._isMaximized = p1
	pSBottomAxisLabel._values = {}
	pSBottomAxisLabel._average = 0
	pSBottomAxisLabel._target = 0
	pSBottomAxisLabel._axisMax = 0
	pSBottomAxisLabel._frame = Instance.new("Frame")
	pSBottomAxisLabel._frame.Name = "PS_AnnotatedGraph"
	pSBottomAxisLabel._frame.BackgroundTransparency = 1
	pSBottomAxisLabel._frame.ZIndex = statsUtilsModule.GraphZIndex
	pSBottomAxisLabel._topLabel = Instance.new("TextLabel")
	pSBottomAxisLabel._topLabel.Name = "PS_TopAxisLabel"
	pSBottomAxisLabel._topLabel.Parent = pSBottomAxisLabel._frame
	pSBottomAxisLabel._topLabel.TextXAlignment = Enum.TextXAlignment.Left
	pSBottomAxisLabel._topLabel.TextYAlignment = Enum.TextYAlignment.Top
	pSBottomAxisLabel._topLabel.FontSize = statsUtilsModule.PanelGraphFontSize
	pSBottomAxisLabel._bottomLabel = Instance.new("TextLabel")
	pSBottomAxisLabel._bottomLabel.Name = "PS_BottomAxisLabel"
	pSBottomAxisLabel._bottomLabel.Parent = pSBottomAxisLabel._frame
	pSBottomAxisLabel._bottomLabel.TextXAlignment = Enum.TextXAlignment.Left
	pSBottomAxisLabel._bottomLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	pSBottomAxisLabel._bottomLabel.FontSize = statsUtilsModule.PanelGraphFontSize
	pSBottomAxisLabel._graph = barGraphModule.new(p1)
	statsUtilsModule.StyleTextWidget(pSBottomAxisLabel._topLabel)
	statsUtilsModule.StyleTextWidget(pSBottomAxisLabel._bottomLabel)
	pSBottomAxisLabel:_layoutElements()
	
	return pSBottomAxisLabel
end

function t:SetZIndex(p2) --[[ line: 71 ]]
	self._frame.ZIndex = p2
	self._topLabel.ZIndex = p2
	self._bottomLabel.ZIndex = p2
	self._graph:SetZIndex(p2)
end

function t:_layoutElements() --[[ line: 78 ]]
	local var5
	local _ = nil
	
	if self._isMaximized then
		var5 = 30
		self._topLabel.Visible = true
		self._bottomLabel.Visible = true
	else
		var5 = 0
		self._topLabel.Visible = false
		self._bottomLabel.Visible = false
	end
	local uDim2 = UDim2.new(0, 10, 0, 10)
	local uDim2_1 = UDim2.new(1, -(20 + var5), 1, -20)
	local uDim2_2 = UDim2.new(1, -(10 + var5), 0, 10)
	local uDim2_3 = UDim2.new(0, var5, 0.333, -20)
	local uDim2_4 = UDim2.new(1, -(10 + var5), 0.666, 10)
	local uDim2_5 = UDim2.new(0, var5, 0.333, -20)
	self._topLabel.Size = uDim2_3
	self._topLabel.Position = uDim2_2
	self._bottomLabel.Size = uDim2_5
	self._bottomLabel.Position = uDim2_4
	self._graph:PlaceInParent(self._frame, uDim2_1, uDim2)
end

function t:PlaceInParent(p3, p4, p5) --[[ line: 108 ]]
	self._frame.Position = p5
	self._frame.Size = p4
	self._frame.Parent = p3
end

function t:_getTarget() --[[ line: 114 ]]
	if self._performanceStats == nil then
		return 0
	end
	local statMaxName = self._performanceStats:FindFirstChild(self._statMaxName)
	
	return if statMaxName == nil then 0 else statMaxName:GetValue()
end

function t:_render() --[[ line: 128 ]]
	self._graph:SetAxisMax(self._axisMax)
	self._graph:SetValues(self._values)
	self._graph:SetAverage(self._average)
	self._graph:SetTarget(self._target)
	self._graph:Render()
	self._topLabel.Text = string.format("%.2f", self._axisMax)
	self._bottomLabel.Text = string.format("%.2f", 0)
end

function t:_calculateAxisMax() --[[ line: 140 ]]
	local var13 = self._target * 2
	local var14 = self:_recursiveGetOrderOfMagnitude(1, var13)
	self._axisMax = math.floor(0.5 + var13 / var14) * var14
end

function t:SetStatsAggregator(p6) --[[ line: 150 ]]
	if self._aggregator then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		self._aggregator = nil
	end
	self._aggregator = p6
	self:_refreshVisibility()
end

function t:_stopListening() --[[ line: 162 ]]
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		return
	end
	self._aggregator:RemoveListener(self._listenerId)
	self._listenerId = nil
end

function t:_startListening() --[[ line: 175 ]]
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		self._listenerId = self._aggregator:AddListener(function() --[[ line: 184 ]]
			-- upvalues: self (ref)
			self:_updateValuesAndRender()
		end)
		
		return
	end
end

function t:_shouldBeVisible() --[[ line: 189 ]]
	-- upvalues: statsUtilsModule (ref)
	return if statsUtilsModule.PerformanceStatsShouldBeVisible() then self._frame.Visible else false
end

function t:SetVisible(p7) --[[ line: 197 ]]
	self._frame.Visible = p7
	self:_refreshVisibility()
end

function t:_refreshVisibility() --[[ line: 202 ]]
	if self:_shouldBeVisible() then
		self:_startListening()
		self:_updateValuesAndRender()
		
		return
	end
	self:_stopListening()
end

function t:OnPerformanceStatsShouldBeVisibleChanged() --[[ line: 211 ]]
	self:_refreshVisibility()
end

function t:_recursiveGetOrderOfMagnitude(p8, p9) --[[ line: 215 ]]
	return if p9 < p8 then self:_recursiveGetOrderOfMagnitude(p8 / 10, p9) elseif p9 <= p8 * 10 then p8 else self:_recursiveGetOrderOfMagnitude(p8 * 10, p9)
end

function t:_updateValuesAndRender() --[[ line: 227 ]]
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

return t