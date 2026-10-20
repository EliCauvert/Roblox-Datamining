local _UDim2 = UDim2.new(0, 10, 0.15, 0)
local _UDim2_1 = UDim2.new(1, -20, 0.4, 0)
local _UDim2_2 = UDim2.new(0, 10, 0.55, 0)
local _UDim2_3 = UDim2.new(1, -20, 0.3, 0)
local CoreGui = game:GetService("CoreGui")
local StatsUtilsModule = require(CoreGui.RobloxGui.Modules.Stats.StatsUtils)
local _ = require(CoreGui.RobloxGui.Modules.Stats.StatsAggregator)
local StatsMiniTextPanelModule = {}
StatsMiniTextPanelModule.__index = StatsMiniTextPanelModule

function StatsMiniTextPanelModule.new(_statType)
	-- upvalues: StatsMiniTextPanelModule (copy), StatsUtilsModule (copy), _UDim2_1 (copy), _UDim2 (copy), _UDim2_3 (copy), _UDim2_2 (copy)
	local t = {}
	setmetatable(t, StatsMiniTextPanelModule)
	t._statType = _statType
	t._frame = Instance.new("Frame")
	t._frame.Name = "StatsMiniTextPanelClass"
	t._frame.BackgroundTransparency = 1
	t._frame.ZIndex = StatsUtilsModule.TextZIndex
	t._titleLabel = Instance.new("TextLabel")
	t._titleLabel.Name = "TitleLabel"
	t._valueLabel = Instance.new("TextLabel")
	t._valueLabel.Name = "ValueLabel"
	StatsUtilsModule.StyleTextWidget(t._titleLabel)
	StatsUtilsModule.StyleTextWidget(t._valueLabel)
	t._titleLabel.FontSize = StatsUtilsModule.MiniPanelTitleFontSize
	t._titleLabel.Text = t:_getTitle()
	t._titleLabel.Parent = t._frame
	t._titleLabel.Size = _UDim2_1
	t._titleLabel.Position = _UDim2
	t._titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	t._valueLabel.FontSize = StatsUtilsModule.MiniPanelValueFontSize
	t._valueLabel.Text = "0"
	t._valueLabel.Parent = t._frame
	t._valueLabel.Size = _UDim2_3
	t._valueLabel.Position = _UDim2_2
	t._valueLabel.TextXAlignment = Enum.TextXAlignment.Left
	
	return t
end

function StatsMiniTextPanelModule:SetZIndex(ZIndex)
	self._frame.ZIndex = ZIndex
	self._titleLabel.ZIndex = ZIndex
	self.ZIndex = ZIndex
end

function StatsMiniTextPanelModule:_getTitle()
	-- upvalues: StatsUtilsModule (copy)
	return StatsUtilsModule.TypeToShortName[self._statType]
end

function StatsMiniTextPanelModule:PlaceInParent(Parent, Size, Position)
	self._frame.Position = Position
	self._frame.Size = Size
	self._frame.Parent = Parent
end

function StatsMiniTextPanelModule:SetStatsAggregator(_aggregator)
	if self._aggregator then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		self._aggregator = nil
	end
	self._aggregator = _aggregator
	self:_refreshVisibility()
end

function StatsMiniTextPanelModule:SetVisible(Visible)
	self.frame.Visible = Visible
	self:_refreshVisibility()
end

function StatsMiniTextPanelModule._shouldBeVisible(p1)
	-- upvalues: StatsUtilsModule (copy)
	return if StatsUtilsModule.PerformanceStatsShouldBeVisible() then p1._frame.Visible else false
end

function StatsMiniTextPanelModule:_refreshVisibility()
	if self:_shouldBeVisible() then
		self:_startListening()
		self:_updateFromAggregator()
		
		return
	else
		self:_stopListening()
	end
end

function StatsMiniTextPanelModule:_stopListening()
	if self._aggregator == nil then return end
	if self._listenerId ~= nil then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		
		return
	end
end

function StatsMiniTextPanelModule:_startListening()
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		self._listenerId = self._aggregator:AddListener(function()
			-- upvalues: self (copy)
			self:_updateFromAggregator()
		end)
		
		return
	end
end

function StatsMiniTextPanelModule:OnPerformanceStatsShouldBeVisibleChanged()
	self:_refreshVisibility()
end

function StatsMiniTextPanelModule:_updateFromAggregator()
	-- upvalues: StatsUtilsModule (copy)
	self._valueLabel.Text = StatsUtilsModule.FormatTypedValue(if self._aggregator == nil then 0 else self._aggregator:GetLatestValue(), self._statType)
end

return StatsMiniTextPanelModule