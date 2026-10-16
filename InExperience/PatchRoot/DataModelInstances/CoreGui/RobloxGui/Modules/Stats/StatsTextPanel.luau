local CoreGui = game:GetService("CoreGui")
local _ = game:GetService("CorePackages")
local StatsUtilsModule = require(CoreGui.RobloxGui.Modules.Stats.StatsUtils)
local _ = require(CoreGui.RobloxGui.Modules.Stats.StatsAggregator)
local DecoratedValueLabelModule = require(CoreGui.RobloxGui.Modules.Stats.DecoratedValueLabel)
local TextPanelTopMarginPix = StatsUtilsModule.TextPanelTopMarginPix
local _UDim2 = UDim2.new(0, StatsUtilsModule.TextPanelLeftMarginPix, 0, TextPanelTopMarginPix)
local NewTextPanelTopMarginPix = TextPanelTopMarginPix + StatsUtilsModule.TextPanelTitleHeightY
local _UDim2_1 = UDim2.new(0, StatsUtilsModule.TextPanelLeftMarginPix, 0, NewTextPanelTopMarginPix)
local NewNewTextPanelTopMarginPix = NewTextPanelTopMarginPix + StatsUtilsModule.TextPanelLegendItemHeightY
local _UDim2_2 = UDim2.new(0, StatsUtilsModule.TextPanelLeftMarginPix, 0, NewNewTextPanelTopMarginPix)
local _UDim2_3 = UDim2.new(0, StatsUtilsModule.TextPanelLeftMarginPix, 0, NewNewTextPanelTopMarginPix + StatsUtilsModule.TextPanelLegendItemHeightY)
local _UDim2_4 = UDim2.new(1, -StatsUtilsModule.TextPanelLeftMarginPix * 2, 0, StatsUtilsModule.TextPanelTitleHeightY)
local _UDim2_5 = UDim2.new(1, -StatsUtilsModule.TextPanelLeftMarginPix * 2, 0, StatsUtilsModule.TextPanelLegendItemHeightY)
local StatsTextPanelModule = {}
StatsTextPanelModule.__index = StatsTextPanelModule

function StatsTextPanelModule.new(StatType) --[[ Line: 59 ]]
	-- upvalues: StatsTextPanelModule (copy), StatsUtilsModule (copy), _UDim2_4 (copy), _UDim2 (copy)
	local t = {}
	setmetatable(t, StatsTextPanelModule)
	t._statType = StatType
	t._frame = Instance.new("Frame")
	t._frame.BackgroundTransparency = 1
	t._frame.ZIndex = StatsUtilsModule.TextZIndex
	t._titleLabel = Instance.new("TextLabel")
	StatsUtilsModule.StyleTextWidget(t._titleLabel)
	t._titleLabel.FontSize = StatsUtilsModule.PanelTitleFontSize
	t._titleLabel.Text = t:_getTitle()
	t._titleLabel.Parent = t._frame
	t._titleLabel.Size = _UDim2_4
	t._titleLabel.Position = _UDim2
	t._titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	t._titleLabel.TextYAlignment = Enum.TextYAlignment.Top
	t:_addCurrentValueWidget()
	t:_addTargetValueWidget()
	t:_addAverageValueWidget()
	
	return t
end

function StatsTextPanelModule:_getTarget() --[[ Line: 92 ]]
	if self._performanceStats == nil then
		return 0
	else
		local StatMaxName = self._performanceStats:FindFirstChild(self._statMaxName)
		
		return if StatMaxName == nil then 0 else StatMaxName:GetValue()
	end
end

function StatsTextPanelModule:_addCurrentValueWidget() --[[ Line: 108 ]]
	-- upvalues: DecoratedValueLabelModule (copy), _UDim2_5 (copy), _UDim2_1 (copy), StatsUtilsModule (copy)
	self._currentValueWidget = DecoratedValueLabelModule.new(self._statType, "Current")
	self._currentValueWidget:PlaceInParent(self._frame, _UDim2_5, _UDim2_1)
	local DecorationFrame = self._currentValueWidget:GetDecorationFrame()
	local Image = Instance.new("ImageLabel")
	Image.Position = UDim2.new(0.5, -StatsUtilsModule.OvalKeySize / 2, 0.5, -StatsUtilsModule.OvalKeySize / 2)
	Image.Size = UDim2.new(0, StatsUtilsModule.OvalKeySize, 0, StatsUtilsModule.OvalKeySize)
	Image.Parent = DecorationFrame
	Image.BackgroundTransparency = 1
	Image.Image = "rbxasset://textures/ui/PerformanceStats/OvalKey.png"
	Image.BorderSizePixel = 0
	self._currentValueDecoration = Image
end

function StatsTextPanelModule:_addTargetValueWidget() --[[ Line: 129 ]]
	-- upvalues: DecoratedValueLabelModule (copy), _UDim2_5 (copy), _UDim2_2 (copy), StatsUtilsModule (copy)
	self._targetValueWidget = DecoratedValueLabelModule.new(self._statType, "Target")
	self._targetValueWidget:PlaceInParent(self._frame, _UDim2_5, _UDim2_2)
	local DecorationFrame = self._targetValueWidget:GetDecorationFrame()
	local Image = Instance.new("ImageLabel")
	Image.Position = UDim2.new(0.5, -StatsUtilsModule.TargetKeyWidth / 2, 0.5, -StatsUtilsModule.TargetKeyHeight / 2)
	Image.Size = UDim2.new(0, StatsUtilsModule.TargetKeyWidth, 0, StatsUtilsModule.TargetKeyHeight)
	Image.Parent = DecorationFrame
	Image.BackgroundTransparency = 1
	Image.Image = "rbxasset://textures/ui/PerformanceStats/TargetKey.png"
end

function StatsTextPanelModule:_addAverageValueWidget() --[[ Line: 148 ]]
	-- upvalues: DecoratedValueLabelModule (copy), _UDim2_5 (copy), _UDim2_3 (copy), StatsUtilsModule (copy)
	self._averageValueWidget = DecoratedValueLabelModule.new(self._statType, "Average")
	self._averageValueWidget:PlaceInParent(self._frame, _UDim2_5, _UDim2_3)
	local DecorationFrame = self._averageValueWidget:GetDecorationFrame()
	local Frame = Instance.new("Frame")
	Frame.Position = UDim2.new(0, 0, 0.5, -StatsUtilsModule.GraphAverageLineTotalThickness / 2)
	Frame.Size = UDim2.new(1, 0, 0, StatsUtilsModule.GraphAverageLineInnerThickness)
	Frame.Parent = DecorationFrame
	StatsUtilsModule.StyleAverageLine(Frame)
end

function StatsTextPanelModule:_getTitle() --[[ Line: 165 ]]
	-- upvalues: StatsUtilsModule (copy)
	return StatsUtilsModule.TypeToName[self._statType]
end

function StatsTextPanelModule:PlaceInParent(Parent, Size, Position) --[[ Line: 169 ]]
	self._frame.Position = Position
	self._frame.Size = Size
	self._frame.Parent = Parent
end

function StatsTextPanelModule:SetStatsAggregator(_aggregator) --[[ Line: 176 ]]
	if self._aggregator then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		self._aggregator = nil
	end
	self._aggregator = _aggregator
	self:_refreshVisibility()
end

function StatsTextPanelModule:SetVisible(Visible) --[[ Line: 188 ]]
	self._frame.Visible = Visible
	self:_refreshVisibility()
end

function StatsTextPanelModule._shouldBeVisible(p1) --[[ Line: 193 ]]
	-- upvalues: StatsUtilsModule (copy)
	return if StatsUtilsModule.PerformanceStatsShouldBeVisible() then p1._frame.Visible else false
end

function StatsTextPanelModule:_refreshVisibility() --[[ Line: 201 ]]
	if self:_shouldBeVisible() then
		self:_startListening()
		self:_updateFromAggregator()
		
		return
	else
		self:_stopListening()
	end
end

function StatsTextPanelModule:OnPerformanceStatsShouldBeVisibleChanged() --[[ Line: 210 ]]
	self:_refreshVisibility()
end

function StatsTextPanelModule:_stopListening() --[[ Line: 214 ]]
	if self._aggregator == nil then return end
	if self._listenerId ~= nil then
		self._aggregator:RemoveListener(self._listenerId)
		self._listenerId = nil
		
		return
	end
end

function StatsTextPanelModule:_startListening() --[[ Line: 227 ]]
	if self._aggregator == nil then return end
	if self._listenerId == nil then
		self._listenerId = self._aggregator:AddListener(function() --[[ Line: 236 ]]
			-- upvalues: self (copy)
			self:_updateFromAggregator()
		end)
		
		return
	end
end

function StatsTextPanelModule:_updateFromAggregator() --[[ Line: 241 ]]
	-- upvalues: StatsUtilsModule (copy)
	local LatestValue = 0
	local Average = 0
	local Target = 0
	
	if self._aggregator ~= nil then
		LatestValue = self._aggregator:GetLatestValue()
		Average = self._aggregator:GetAverage()
		Target = self._aggregator:GetTarget()
	end
	self._currentValueWidget:SetValue(LatestValue)
	self._targetValueWidget:SetValue(Target)
	self._averageValueWidget:SetValue(Average)
	self._currentValueDecoration.ImageColor3 = StatsUtilsModule.GetColorForValue(LatestValue, Target)
end

function StatsTextPanelModule:SetZIndex(ZIndex) --[[ Line: 260 ]]
	self._frame.ZIndex = ZIndex
	self._titleLabel.ZIndex = ZIndex
	self._currentValueWidget:SetZIndex(ZIndex)
	self._averageValueWidget:SetZIndex(ZIndex)
end

return StatsTextPanelModule