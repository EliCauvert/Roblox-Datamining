local playersService = game:GetService("Players")
local gameSettings = UserSettings().GameSettings
local coreGuiService = game:GetService("CoreGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local statsAggregatorManagerModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsAggregatorManager)
local statsButtonModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsButton)
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local statsViewerModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsViewer)
local var7 = require(coreGuiService.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit)()
local performanceStats = nil
local singleton = nil
local var10 = nil
local t = {}
local var12 = nil
local var13 = nil

if not var7 then
	performanceStats = Instance.new("Frame")
	performanceStats.Name = "PerformanceStats"
	singleton = statsAggregatorManagerModule.getSingleton()
	var10 = statsViewerModule.new()
	
	for i, v in ipairs(statsUtilsModule.AllStatTypes) do
		t[v] = statsButtonModule.new(v)
	end
end
function ShowMasterFrame() --[[ line: 48 ]]
	-- upvalues: performanceStats (write), coreGuiService (ref)
	performanceStats.Visible = true
	performanceStats.Parent = coreGuiService.RobloxGui
end

function HideMasterFrame() --[[ line: 53 ]]
	-- upvalues: performanceStats (write)
	performanceStats.Visible = false
	performanceStats.Parent = nil
end

function ConfigureMasterFrame() --[[ line: 59 ]]
	-- upvalues: performanceStats (write)
	performanceStats.Position = UDim2.new(0, 0, 0, 0)
	performanceStats.Size = UDim2.new(1, 0, 1, 0)
	performanceStats.Selectable = false
	performanceStats.BackgroundTransparency = 1
	performanceStats.Active = false
	performanceStats.ZIndex = 0
	HideMasterFrame()
end

function ConfigureStatButtonsInMasterFrame() --[[ line: 77 ]]
	-- upvalues: statsUtilsModule (ref)
	for i, v in ipairs(statsUtilsModule.AllStatTypes) do
		AddButton(v, i)
	end
end

function OnButtonToggled(p0) --[[ line: 84 ]]
	-- upvalues: t (write), var12 (write)
	var12 = if t[p0]._isSelected then p0 else nil
	UpdateButtonSelectedStates()
	UpdateViewerVisibility()
end

function UpdateButtonSelectedStates() --[[ line: 99 ]]
	-- upvalues: statsUtilsModule (ref), t (write), var12 (write)
	for i, v in ipairs(statsUtilsModule.AllStatTypes) do
		t[v]:SetIsSelected(v == var12)
	end
end

function UpdateViewerVisibility() --[[ line: 106 ]]
	-- upvalues: var12 (write), var10 (write), singleton (write), rbxAnalyticsService (ref)
	if var12 == nil then
		if var10:GetIsVisible() then
			var10:SetVisible(false)
			var10:SetStatsAggregator(nil)
			
			return
		end
	else
		local var14 = false
		
		if not var10:GetIsVisible() then
			var14 = true
			var10:SetVisible(true)
		end
		if var12 ~= var10:GetStatType() then
			var10:SetStatType(var12)
			var10:SetStatsAggregator(singleton:GetAggregator(var12))
			var14 = true
		end
		if var14 then
			rbxAnalyticsService:TrackEvent("Game", "Enlarge PerfStat", var12, 0)
		end
	end
end

function AddButton(p1, p2) --[[ line: 135 ]]
	-- upvalues: t (write), performanceStats (write), singleton (write), statsUtilsModule (ref)
	local var15 = t[p1]
	var15:SetParent(performanceStats)
	var15:SetStatsAggregator(singleton:GetAggregator(p1))
	local var16 = 1 / statsUtilsModule.NumButtonTypes
	var15:SetSizeAndPosition(UDim2.new(var16, 0, 0, statsUtilsModule.ButtonHeight), UDim2.new(var16 * (p2 - 1), 0, 0, 0))
	var15:SetToggleCallbackFunction(OnButtonToggled)
end

function ConfigureStatViewerInMasterFrame() --[[ line: 154 ]]
	-- upvalues: var10 (write), performanceStats (write), statsUtilsModule (ref)
	var10:SetParent(performanceStats)
	var10:SetSizeAndPosition(UDim2.new(0, statsUtilsModule.ViewerWidth, 0, statsUtilsModule.ViewerHeight), UDim2.new(1, -statsUtilsModule.ViewerWidth, 0, statsUtilsModule.ButtonHeight + statsUtilsModule.ViewerTopMargin))
end

if var7 then
	function CreatePerformanceStatsUI() --[[ line: 166 ]]
		-- upvalues: singleton (write), statsAggregatorManagerModule (ref), performanceStats (write), t (write), statsUtilsModule (ref), statsButtonModule (ref), var10 (write), statsViewerModule (ref), var12 (write)
		singleton = statsAggregatorManagerModule.getSingleton()
		singleton:StartListening()
		performanceStats = Instance.new("Frame")
		performanceStats.Name = "PerformanceStats"
		t = {}
		
		for i, v in statsUtilsModule.AllStatTypes do
			t[v] = statsButtonModule.new(v)
		end
		var10 = statsViewerModule.new()
		var12 = nil
		ConfigureMasterFrame()
		ConfigureStatButtonsInMasterFrame()
		ConfigureStatViewerInMasterFrame()
		UpdateButtonSelectedStates()
		UpdateViewerVisibility()
		ShowMasterFrame()
	end
	
	function DestroyPerformanceStatsUI() --[[ line: 192 ]]
		-- upvalues: var10 (write), statsUtilsModule (ref), t (write), performanceStats (write), var12 (write), singleton (write)
		if var10 then
			var10:OnPerformanceStatsShouldBeVisibleChanged()
		end
		for i, v in ipairs(statsUtilsModule.AllStatTypes) do
			local var17 = t[v]
			
			if var17 then
				var17:OnPerformanceStatsShouldBeVisibleChanged()
			end
		end
		if performanceStats then
			performanceStats:Destroy()
			performanceStats = nil
		end
		var10 = nil
		t = {}
		var12 = nil
		
		if singleton then
			singleton:StopListening()
		end
	end
	
	function UpdatePerformanceStatsVisibility() --[[ line: 218 ]]
		-- upvalues: statsUtilsModule (ref), performanceStats (write), rbxAnalyticsService (ref), var13 (write)
		local var18 = statsUtilsModule.PerformanceStatsShouldBeVisible()
		
		if var18 == (performanceStats ~= nil) then return end
		if var18 then
			CreatePerformanceStatsUI()
		else
			DestroyPerformanceStatsUI()
		end
		rbxAnalyticsService:TrackEvent("Game", if var18 then "Show PerfStats" else "Hide PerfStats", "", 0)
		
		if var18 then
			var13 = time()
			rbxAnalyticsService:ReportCounter("OpenPerformanceProfiler", 1)
			
			return
		elseif var13 then
			rbxAnalyticsService:ReportStats("TimeOpenPerformanceProfiler", time() - var13)
		end
	end
else
	function UpdatePerformanceStatsVisibility() --[[ line: 251 ]]
		-- upvalues: statsUtilsModule (ref), performanceStats (write), var10 (write), t (write), rbxAnalyticsService (ref), var13 (write)
		local var19 = statsUtilsModule.PerformanceStatsShouldBeVisible()
		
		if var19 == performanceStats.Visible then return end
		if var19 then
			ShowMasterFrame()
		else
			HideMasterFrame()
		end
		var10:OnPerformanceStatsShouldBeVisibleChanged()
		
		for i, v in ipairs(statsUtilsModule.AllStatTypes) do
			t[v]:OnPerformanceStatsShouldBeVisibleChanged()
		end
		rbxAnalyticsService:TrackEvent("Game", if var19 then "Show PerfStats" else "Hide PerfStats", "", 0)
		
		if var19 then
			var13 = time()
			rbxAnalyticsService:ReportCounter("OpenPerformanceProfiler", 1)
			
			return
		elseif var13 then
			rbxAnalyticsService:ReportStats("TimeOpenPerformanceProfiler", time() - var13)
		end
	end
end
gameSettings.PerformanceStatsVisibleChanged:connect(UpdatePerformanceStatsVisibility)

if not var7 then
	ConfigureMasterFrame()
	ConfigureStatButtonsInMasterFrame()
	ConfigureStatViewerInMasterFrame()
	UpdateButtonSelectedStates()
	UpdateViewerVisibility()
	UpdatePerformanceStatsVisibility()
end
spawn(function() --[[ line: 305 ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService.PlayerAdded:wait()
		localPlayer = playersService.LocalPlayer
	end
	UpdatePerformanceStatsVisibility()
end)