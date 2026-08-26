local coreGuiService = game:GetService("CoreGui")
local styleWidgetsModule = require(coreGuiService.RobloxGui.Modules.StyleWidgets)
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local statsMiniTextPanelModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsMiniTextPanel)
local statsAnnotatedGraphModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsAnnotatedGraph)
local uDim2 = UDim2.new(0, 0, 0, 0)
local uDim2_1 = UDim2.new(0.5, 0, 1, -styleWidgetsModule.TabSelectionHeight)
local uDim2_2 = UDim2.new(0.5, 0, 0, 0)
local uDim2_3 = UDim2.new(0.5, 0, 1, -styleWidgetsModule.TabSelectionHeight)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref), statsUtilsModule (ref), statsMiniTextPanelModule (ref), uDim2_1 (ref), uDim2 (ref), statsAnnotatedGraphModule (ref), uDim2_3 (ref), uDim2_2 (ref), styleWidgetsModule (ref)
	local pSButton = {}
	setmetatable(pSButton, t)
	pSButton._statType = p1
	pSButton._button = Instance.new("TextButton")
	pSButton._button.Name = "PS_Button"
	pSButton._button.Text = ""
	statsUtilsModule.StyleButton(pSButton._button)
	pSButton._textPanel = statsMiniTextPanelModule.new(p1)
	pSButton._textPanel:PlaceInParent(pSButton._button, uDim2_1, uDim2)
	pSButton._graph = statsAnnotatedGraphModule.new(p1, false)
	pSButton._graph:PlaceInParent(pSButton._button, uDim2_3, uDim2_2)
	pSButton._textPanel:SetZIndex(statsUtilsModule.TextZIndex)
	pSButton._graph:SetZIndex(statsUtilsModule.GraphZIndex)
	pSButton._tabSelection = styleWidgetsModule.MakeTabSelectionWidget(pSButton._button)
	pSButton._isSelected = false
	pSButton:_updateTabSelectionState()
	
	return pSButton
end

function t:OnPerformanceStatsShouldBeVisibleChanged()
	if self._graph then
		self._graph:OnPerformanceStatsShouldBeVisibleChanged()
	end
	if self._textPanel then
		self._textPanel:OnPerformanceStatsShouldBeVisibleChanged()
	end
end

function t:SetToggleCallbackFunction(p1)
	self._button.MouseButton1Click:connect(function()
		-- upvalues: p1 (ref), self (ref)
		p1(self._statType)
	end)
end

function t:SetSizeAndPosition(p1, p2)
	self._button.Size = p1
	self._button.Position = p2
end

function t:SetIsSelected(p1)
	self._isSelected = p1
	self:_updateTabSelectionState()
end

function t:_updateTabSelectionState()
	self._tabSelection.Visible = self._isSelected
end

function t:SetParent(p1)
	self._button.Parent = p1
end

function t:SetStatsAggregator(p1)
	self._textPanel:SetStatsAggregator(p1)
	self._graph:SetStatsAggregator(p1)
end

return t