local coreGuiService = game:GetService("CoreGui")
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local statsTextPanelModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsTextPanel)
local statsAnnotatedGraphModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsAnnotatedGraph)
local uDim2 = UDim2.new(0, 0, 0, 0)
local uDim2_1 = UDim2.new(0.4, 0, 1, 0)
local uDim2_2 = UDim2.new(0.4, 0, 0, 0)
local uDim2_3 = UDim2.new(0.6, 0, 1, 0)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), statsUtilsModule (ref)
	local pSViewer = {}
	setmetatable(pSViewer, t)
	pSViewer._frameImageLabel = Instance.new("ImageLabel")
	pSViewer._frameImageLabel.Name = "PS_Viewer"
	pSViewer._frameImageLabel.Image = "rbxasset://textures/ui/PerformanceStats/BackgroundRounded.png"
	pSViewer._frameImageLabel.ScaleType = Enum.ScaleType.Slice
	pSViewer._frameImageLabel.SliceCenter = Rect.new(10, 10, 22, 22)
	pSViewer._frameImageLabel.BackgroundTransparency = 1
	pSViewer._frameImageLabel.ImageColor3 = statsUtilsModule.NormalColor
	pSViewer._frameImageLabel.ImageTransparency = statsUtilsModule.Transparency
	pSViewer._textPanel = nil
	pSViewer._statType = nil
	pSViewer._graph = nil
	
	return pSViewer
end

function t:OnPerformanceStatsShouldBeVisibleChanged()
	if self._graph then
		self._graph:OnPerformanceStatsShouldBeVisibleChanged()
	end
	if self._textPanel then
		self._textPanel:OnPerformanceStatsShouldBeVisibleChanged()
	end
end

function t:GetIsVisible()
	return self._frameImageLabel.Visible
end

function t:GetStatType()
	return self._statType
end

function t:SetSizeAndPosition(p1, p2)
	self._frameImageLabel.Size = p1
	self._frameImageLabel.Position = p2
end

function t:SetParent(p1)
	self._frameImageLabel.Parent = p1
end

function t:SetVisible(p1)
	self._frameImageLabel.Visible = p1
	
	if self._graph then
		self._graph:SetVisible(p1)
	end
	if self._textPanel then
		self._textPanel:SetVisible(p1)
	end
end

function t:SetStatType(p1)
	-- upvalues: statsTextPanelModule (ref), uDim2_1 (ref), uDim2 (ref), statsAnnotatedGraphModule (ref), uDim2_3 (ref), uDim2_2 (ref), statsUtilsModule (ref)
	self._statType = p1
	self._frameImageLabel:ClearAllChildren()
	
	if self._textPanel then
		self._textPanel:SetVisible(false)
		self._textPanel = nil
	end
	self._textPanel = statsTextPanelModule.new(p1)
	self._textPanel:PlaceInParent(self._frameImageLabel, uDim2_1, uDim2)
	self._graph = statsAnnotatedGraphModule.new(p1, true)
	self._graph:PlaceInParent(self._frameImageLabel, uDim2_3, uDim2_2)
	self._textPanel:SetZIndex(statsUtilsModule.TextZIndex)
	self._graph:SetZIndex(statsUtilsModule.GraphZIndex)
	self._graph:SetVisible(self._frameImageLabel.Visible)
	self._textPanel:SetVisible(self._frameImageLabel.Visible)
	self:_applyStatsAggregator()
end

function t:_applyStatsAggregator()
	if self._aggregator == nil then return end
	if self._textPanel then
		self._textPanel:SetStatsAggregator(self._aggregator)
	end
	if self._graph then
		self._graph:SetStatsAggregator(self._aggregator)
	end
end

function t:SetStatsAggregator(p1)
	self._aggregator = p1
	self:_applyStatsAggregator()
end

return t