local CoreGui = game:GetService("CoreGui")
local StatsUtilsModule = require(CoreGui.RobloxGui.Modules.Stats.StatsUtils)
local StatsTextPanelModule = require(CoreGui.RobloxGui.Modules.Stats.StatsTextPanel)
local StatsAnnotatedGraphModule = require(CoreGui.RobloxGui.Modules.Stats.StatsAnnotatedGraph)
local _UDim2 = UDim2.new(0, 0, 0, 0)
local _UDim2_1 = UDim2.new(0.4, 0, 1, 0)
local _UDim2_2 = UDim2.new(0.4, 0, 0, 0)
local _UDim2_3 = UDim2.new(0.6, 0, 1, 0)
local StatsViewerModule = {}
StatsViewerModule.__index = StatsViewerModule

function StatsViewerModule.new()
	-- upvalues: StatsViewerModule (copy), StatsUtilsModule (copy)
	local t = {}
	setmetatable(t, StatsViewerModule)
	t._frameImageLabel = Instance.new("ImageLabel")
	t._frameImageLabel.Name = "PS_Viewer"
	t._frameImageLabel.Image = "rbxasset://textures/ui/PerformanceStats/BackgroundRounded.png"
	t._frameImageLabel.ScaleType = Enum.ScaleType.Slice
	t._frameImageLabel.SliceCenter = Rect.new(10, 10, 22, 22)
	t._frameImageLabel.BackgroundTransparency = 1
	t._frameImageLabel.ImageColor3 = StatsUtilsModule.NormalColor
	t._frameImageLabel.ImageTransparency = StatsUtilsModule.Transparency
	t._textPanel = nil
	t._statType = nil
	t._graph = nil
	
	return t
end

function StatsViewerModule:OnPerformanceStatsShouldBeVisibleChanged()
	if self._graph then
		self._graph:OnPerformanceStatsShouldBeVisibleChanged()
	end
	if self._textPanel then
		self._textPanel:OnPerformanceStatsShouldBeVisibleChanged()
	end
end

function StatsViewerModule:GetIsVisible()
	return self._frameImageLabel.Visible
end

function StatsViewerModule:GetStatType()
	return self._statType
end

function StatsViewerModule:SetSizeAndPosition(Size, Position)
	self._frameImageLabel.Size = Size
	self._frameImageLabel.Position = Position
end

function StatsViewerModule:SetParent(Parent)
	self._frameImageLabel.Parent = Parent
end

function StatsViewerModule:SetVisible(Visible)
	self._frameImageLabel.Visible = Visible
	
	if self._graph then
		self._graph:SetVisible(Visible)
	end
	if self._textPanel then
		self._textPanel:SetVisible(Visible)
	end
end

function StatsViewerModule:SetStatType(_statType)
	-- upvalues: StatsTextPanelModule (copy), _UDim2_1 (copy), _UDim2 (copy), StatsAnnotatedGraphModule (copy), _UDim2_3 (copy), _UDim2_2 (copy), StatsUtilsModule (copy)
	self._statType = _statType
	self._frameImageLabel:ClearAllChildren()
	
	if self._textPanel then
		self._textPanel:SetVisible(false)
		self._textPanel = nil
	end
	self._textPanel = StatsTextPanelModule.new(_statType)
	self._textPanel:PlaceInParent(self._frameImageLabel, _UDim2_1, _UDim2)
	self._graph = StatsAnnotatedGraphModule.new(_statType, true)
	self._graph:PlaceInParent(self._frameImageLabel, _UDim2_3, _UDim2_2)
	self._textPanel:SetZIndex(StatsUtilsModule.TextZIndex)
	self._graph:SetZIndex(StatsUtilsModule.GraphZIndex)
	self._graph:SetVisible(self._frameImageLabel.Visible)
	self._textPanel:SetVisible(self._frameImageLabel.Visible)
	self:_applyStatsAggregator()
end

function StatsViewerModule:_applyStatsAggregator()
	if self._aggregator == nil then return end
	if self._textPanel then
		self._textPanel:SetStatsAggregator(self._aggregator)
	end
	if self._graph then
		self._graph:SetStatsAggregator(self._aggregator)
	end
end

function StatsViewerModule:SetStatsAggregator(_aggregator)
	self._aggregator = _aggregator
	self:_applyStatsAggregator()
end

return StatsViewerModule