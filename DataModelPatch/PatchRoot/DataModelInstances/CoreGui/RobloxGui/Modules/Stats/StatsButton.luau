local CoreGui = game:GetService("CoreGui")
local StyleWidgetsModule = require(CoreGui.RobloxGui.Modules.StyleWidgets)
local StatsUtilsModule = require(CoreGui.RobloxGui.Modules.Stats.StatsUtils)
local StatsMiniTextPanelModule = require(CoreGui.RobloxGui.Modules.Stats.StatsMiniTextPanel)
local StatsAnnotatedGraphModule = require(CoreGui.RobloxGui.Modules.Stats.StatsAnnotatedGraph)
local _UDim2 = UDim2.new(0, 0, 0, 0)
local _UDim2_1 = UDim2.new(0.5, 0, 1, -StyleWidgetsModule.TabSelectionHeight)
local _UDim2_2 = UDim2.new(0.5, 0, 0, 0)
local _UDim2_3 = UDim2.new(0.5, 0, 1, -StyleWidgetsModule.TabSelectionHeight)
local StatsButtonModule = {}
StatsButtonModule.__index = StatsButtonModule

function StatsButtonModule.new(StatType)
	-- upvalues: StatsButtonModule (copy), StatsUtilsModule (copy), StatsMiniTextPanelModule (copy), _UDim2_1 (copy), _UDim2 (copy), StatsAnnotatedGraphModule (copy), _UDim2_3 (copy), _UDim2_2 (copy), StyleWidgetsModule (copy)
	local t = {}
	setmetatable(t, StatsButtonModule)
	t._statType = StatType
	t._button = Instance.new("TextButton")
	t._button.Name = "PS_Button"
	t._button.Text = ""
	StatsUtilsModule.StyleButton(t._button)
	t._textPanel = StatsMiniTextPanelModule.new(StatType)
	t._textPanel:PlaceInParent(t._button, _UDim2_1, _UDim2)
	t._graph = StatsAnnotatedGraphModule.new(StatType, false)
	t._graph:PlaceInParent(t._button, _UDim2_3, _UDim2_2)
	t._textPanel:SetZIndex(StatsUtilsModule.TextZIndex)
	t._graph:SetZIndex(StatsUtilsModule.GraphZIndex)
	t._tabSelection = StyleWidgetsModule.MakeTabSelectionWidget(t._button)
	t._isSelected = false
	t:_updateTabSelectionState()
	
	return t
end

function StatsButtonModule:OnPerformanceStatsShouldBeVisibleChanged()
	if self._graph then
		self._graph:OnPerformanceStatsShouldBeVisibleChanged()
	end
	if self._textPanel then
		self._textPanel:OnPerformanceStatsShouldBeVisibleChanged()
	end
end

function StatsButtonModule:SetToggleCallbackFunction(Callback)
	self._button.MouseButton1Click:connect(function()
		-- upvalues: Callback (copy), self (copy)
		Callback(self._statType)
	end)
end

function StatsButtonModule:SetSizeAndPosition(Size, Position)
	self._button.Size = Size
	self._button.Position = Position
end

function StatsButtonModule:SetIsSelected(_isSelected)
	self._isSelected = _isSelected
	self:_updateTabSelectionState()
end

function StatsButtonModule:_updateTabSelectionState()
	self._tabSelection.Visible = self._isSelected
end

function StatsButtonModule:SetParent(Parent)
	self._button.Parent = Parent
end

function StatsButtonModule:SetStatsAggregator(p1)
	self._textPanel:SetStatsAggregator(p1)
	self._graph:SetStatsAggregator(p1)
end

return StatsButtonModule