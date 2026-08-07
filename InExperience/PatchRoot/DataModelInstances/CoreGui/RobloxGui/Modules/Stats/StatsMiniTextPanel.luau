local uDim2 = UDim2.new(0, 10, 0.15, 0)
local uDim2_1 = UDim2.new(1, -20, 0.4, 0)
local uDim2_2 = UDim2.new(0, 10, 0.55, 0)
local uDim2_3 = UDim2.new(1, -20, 0.3, 0)
local coreGuiService = game:GetService("CoreGui")
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local _ = require(coreGuiService.RobloxGui.Modules.Stats.StatsAggregator)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 43 ]]
	-- upvalues: t (ref), statsUtilsModule (ref), uDim2_1 (ref), uDim2 (ref), uDim2_3 (ref), uDim2_2 (ref)
	local valueLabel = {}
	setmetatable(valueLabel, t)
	valueLabel._statType = p0
	valueLabel._frame = Instance.new("Frame")
	valueLabel._frame.Name = "StatsMiniTextPanelClass"
	valueLabel._frame.BackgroundTransparency = 1
	valueLabel._frame.ZIndex = statsUtilsModule.TextZIndex
	valueLabel._titleLabel = Instance.new("TextLabel")
	valueLabel._titleLabel.Name = "TitleLabel"
	valueLabel._valueLabel = Instance.new("TextLabel")
	valueLabel._valueLabel.Name = "ValueLabel"
	statsUtilsModule.StyleTextWidget(valueLabel._titleLabel)
	statsUtilsModule.StyleTextWidget(valueLabel._valueLabel)
	valueLabel._titleLabel.FontSize = statsUtilsModule.MiniPanelTitleFontSize
	valueLabel._titleLabel.Text = valueLabel:_getTitle()
	valueLabel._titleLabel.Parent = valueLabel._frame
	valueLabel._titleLabel.Size = uDim2_1
	valueLabel._titleLabel.Position = uDim2
	valueLabel._titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	valueLabel._valueLabel.FontSize = statsUtilsModule.MiniPanelValueFontSize
	valueLabel._valueLabel.Text = "0"
	valueLabel._valueLabel.Parent = valueLabel._frame
	valueLabel._valueLabel.Size = uDim2_3
	valueLabel._valueLabel.Position = uDim2_2
	valueLabel._valueLabel.TextXAlignment = Enum.TextXAlignment.Left
	
	return valueLabel
end

function t:SetZIndex(p1) --[[ line: 80 ]]
	self._frame.ZIndex = p1
	self._titleLabel.ZIndex = p1
	self.ZIndex = p1
end

function t:_getTitle() --[[ line: 86 ]]
	-- upvalues: statsUtilsModule (ref)
	return statsUtilsModule.TypeToShortName[self._statType]
end

function t:PlaceInParent(p2, p3, p4) --[[ line: 90 ]]
	self._frame.Position = p4
	self._frame.Size = p3
	self._frame.Parent = p2
end

function t:SetStatsAggregator(p5) --[[ line: 96 ]]
	if self._aggregator then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		self._aggregator = nil
	end
	self._aggregator = p5
	self:_refreshVisibility()
end

function t:SetVisible(p6) --[[ line: 108 ]]
	self.frame.Visible = p6
	self:_refreshVisibility()
end

function t:_shouldBeVisible() --[[ line: 113 ]]
	-- upvalues: statsUtilsModule (ref)
	return if statsUtilsModule.PerformanceStatsShouldBeVisible() then self._frame.Visible else false
end

function t:_refreshVisibility() --[[ line: 122 ]]
	if self:_shouldBeVisible() then
		self:_startListening()
		self:_updateFromAggregator()
		
		return
	end
	self:_stopListening()
end

function t:_stopListening() --[[ line: 131 ]]
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		return
	end
	self._aggregator:RemoveListener(self._listenerId)
	self._listenerId = nil
end

function t:_startListening() --[[ line: 144 ]]
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		self._listenerId = self._aggregator:AddListener(function() --[[ line: 153 ]]
			-- upvalues: self (ref)
			self:_updateFromAggregator()
		end)
		
		return
	end
end

function t:OnPerformanceStatsShouldBeVisibleChanged() --[[ line: 158 ]]
	self:_refreshVisibility()
end

function t:_updateFromAggregator() --[[ line: 162 ]]
	-- upvalues: statsUtilsModule (ref)
	self._valueLabel.Text = statsUtilsModule.FormatTypedValue(if self._aggregator ~= nil then 0 else self._aggregator:GetLatestValue(), self._statType)
end

return t