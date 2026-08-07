local coreGuiService = game:GetService("CoreGui")
local _ = game:GetService("CorePackages")
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local _ = require(coreGuiService.RobloxGui.Modules.Stats.StatsAggregator)
local decoratedValueLabelModule = require(coreGuiService.RobloxGui.Modules.Stats.DecoratedValueLabel)
local textPanelTopMarginPix = statsUtilsModule.TextPanelTopMarginPix
local uDim2 = UDim2.new(0, statsUtilsModule.TextPanelLeftMarginPix, 0, textPanelTopMarginPix)
textPanelTopMarginPix += statsUtilsModule.TextPanelTitleHeightY
local uDim2_1 = UDim2.new(0, statsUtilsModule.TextPanelLeftMarginPix, 0, textPanelTopMarginPix)
textPanelTopMarginPix += statsUtilsModule.TextPanelLegendItemHeightY
local uDim2_2 = UDim2.new(0, statsUtilsModule.TextPanelLeftMarginPix, 0, textPanelTopMarginPix)
local uDim2_3 = UDim2.new(0, statsUtilsModule.TextPanelLeftMarginPix, 0, textPanelTopMarginPix + statsUtilsModule.TextPanelLegendItemHeightY)
local uDim2_4 = UDim2.new(1, -statsUtilsModule.TextPanelLeftMarginPix * 2, 0, statsUtilsModule.TextPanelTitleHeightY)
local uDim2_5 = UDim2.new(1, -statsUtilsModule.TextPanelLeftMarginPix * 2, 0, statsUtilsModule.TextPanelLegendItemHeightY)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 59 ]]
	-- upvalues: t (ref), statsUtilsModule (ref), uDim2_4 (ref), uDim2 (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._statType = p0
	t_1._frame = Instance.new("Frame")
	t_1._frame.BackgroundTransparency = 1
	t_1._frame.ZIndex = statsUtilsModule.TextZIndex
	t_1._titleLabel = Instance.new("TextLabel")
	statsUtilsModule.StyleTextWidget(t_1._titleLabel)
	t_1._titleLabel.FontSize = statsUtilsModule.PanelTitleFontSize
	t_1._titleLabel.Text = t_1:_getTitle()
	t_1._titleLabel.Parent = t_1._frame
	t_1._titleLabel.Size = uDim2_4
	t_1._titleLabel.Position = uDim2
	t_1._titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	t_1._titleLabel.TextYAlignment = Enum.TextYAlignment.Top
	t_1:_addCurrentValueWidget()
	t_1:_addTargetValueWidget()
	t_1:_addAverageValueWidget()
	
	return t_1
end

function t:_getTarget() --[[ line: 92 ]]
	if self._performanceStats == nil then
		return 0
	end
	local statMaxName = self._performanceStats:FindFirstChild(self._statMaxName)
	
	return if statMaxName == nil then 0 else statMaxName:GetValue()
end

function t:_addCurrentValueWidget() --[[ line: 108 ]]
	-- upvalues: decoratedValueLabelModule (ref), uDim2_5 (ref), uDim2_1 (ref), statsUtilsModule (ref)
	self._currentValueWidget = decoratedValueLabelModule.new(self._statType, "Current")
	self._currentValueWidget:PlaceInParent(self._frame, uDim2_5, uDim2_1)
	local decorationFrame = self._currentValueWidget:GetDecorationFrame()
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Position = UDim2.new(0.5, -statsUtilsModule.OvalKeySize / 2, 0.5, -statsUtilsModule.OvalKeySize / 2)
	imageLabel.Size = UDim2.new(0, statsUtilsModule.OvalKeySize, 0, statsUtilsModule.OvalKeySize)
	imageLabel.Parent = decorationFrame
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxasset://textures/ui/PerformanceStats/OvalKey.png"
	imageLabel.BorderSizePixel = 0
	self._currentValueDecoration = imageLabel
end

function t:_addTargetValueWidget() --[[ line: 129 ]]
	-- upvalues: decoratedValueLabelModule (ref), uDim2_5 (ref), uDim2_2 (ref), statsUtilsModule (ref)
	self._targetValueWidget = decoratedValueLabelModule.new(self._statType, "Target")
	self._targetValueWidget:PlaceInParent(self._frame, uDim2_5, uDim2_2)
	local decorationFrame = self._targetValueWidget:GetDecorationFrame()
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Position = UDim2.new(0.5, -statsUtilsModule.TargetKeyWidth / 2, 0.5, -statsUtilsModule.TargetKeyHeight / 2)
	imageLabel.Size = UDim2.new(0, statsUtilsModule.TargetKeyWidth, 0, statsUtilsModule.TargetKeyHeight)
	imageLabel.Parent = decorationFrame
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxasset://textures/ui/PerformanceStats/TargetKey.png"
end

function t:_addAverageValueWidget() --[[ line: 148 ]]
	-- upvalues: decoratedValueLabelModule (ref), uDim2_5 (ref), uDim2_3 (ref), statsUtilsModule (ref)
	self._averageValueWidget = decoratedValueLabelModule.new(self._statType, "Average")
	self._averageValueWidget:PlaceInParent(self._frame, uDim2_5, uDim2_3)
	local decorationFrame = self._averageValueWidget:GetDecorationFrame()
	local frame = Instance.new("Frame")
	frame.Position = UDim2.new(0, 0, 0.5, -statsUtilsModule.GraphAverageLineTotalThickness / 2)
	frame.Size = UDim2.new(1, 0, 0, statsUtilsModule.GraphAverageLineInnerThickness)
	frame.Parent = decorationFrame
	statsUtilsModule.StyleAverageLine(frame)
end

function t:_getTitle() --[[ line: 165 ]]
	-- upvalues: statsUtilsModule (ref)
	return statsUtilsModule.TypeToName[self._statType]
end

function t:PlaceInParent(p1, p2, p3) --[[ line: 169 ]]
	self._frame.Position = p3
	self._frame.Size = p2
	self._frame.Parent = p1
end

function t:SetStatsAggregator(p4) --[[ line: 176 ]]
	if self._aggregator then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		self._aggregator = nil
	end
	self._aggregator = p4
	self:_refreshVisibility()
end

function t:SetVisible(p5) --[[ line: 188 ]]
	self._frame.Visible = p5
	self:_refreshVisibility()
end

function t:_shouldBeVisible() --[[ line: 193 ]]
	-- upvalues: statsUtilsModule (ref)
	return if statsUtilsModule.PerformanceStatsShouldBeVisible() then self._frame.Visible else false
end

function t:_refreshVisibility() --[[ line: 201 ]]
	if self:_shouldBeVisible() then
		self:_startListening()
		self:_updateFromAggregator()
		
		return
	end
	self:_stopListening()
end

function t:OnPerformanceStatsShouldBeVisibleChanged() --[[ line: 210 ]]
	self:_refreshVisibility()
end

function t:_stopListening() --[[ line: 214 ]]
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		return
	end
	self._aggregator:RemoveListener(self._listenerId)
	self._listenerId = nil
end

function t:_startListening() --[[ line: 227 ]]
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		self._listenerId = self._aggregator:AddListener(function() --[[ line: 236 ]]
			-- upvalues: self (ref)
			self:_updateFromAggregator()
		end)
		
		return
	end
end

function t:_updateFromAggregator() --[[ line: 241 ]]
	-- upvalues: statsUtilsModule (ref)
	local var18 = 0
	local var19 = 0
	local var20 = 0
	
	if self._aggregator ~= nil then
		var18 = self._aggregator:GetLatestValue()
		var19 = self._aggregator:GetAverage()
		var20 = self._aggregator:GetTarget()
	end
	self._currentValueWidget:SetValue(var18)
	self._targetValueWidget:SetValue(var20)
	self._averageValueWidget:SetValue(var19)
	self._currentValueDecoration.ImageColor3 = statsUtilsModule.GetColorForValue(var18, var20)
end

function t:SetZIndex(p6) --[[ line: 260 ]]
	self._frame.ZIndex = p6
	self._titleLabel.ZIndex = p6
	self._currentValueWidget:SetZIndex(p6)
	self._averageValueWidget:SetZIndex(p6)
end

return t