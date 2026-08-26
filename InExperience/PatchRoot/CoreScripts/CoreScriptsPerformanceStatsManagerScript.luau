local playersService = game:GetService("Players")
local gameSettings = UserSettings().GameSettings
local coreGuiService = game:GetService("CoreGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local statsAggregatorManagerModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsAggregatorManager)
local statsButtonModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsButton)
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local statsViewerModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsViewer)
local var1 = require(coreGuiService.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit)()
local performanceStats = nil
local singleton = nil
local var2 = nil
local t = {}
local var3 = nil
local var4 = nil

if not var1 then
	performanceStats = Instance.new("Frame")
	performanceStats.Name = "PerformanceStats"
	singleton = statsAggregatorManagerModule.getSingleton()
	var2 = statsViewerModule.new()
	
	for i, v in ipairs(statsUtilsModule.AllStatTypes) do
		t[v] = statsButtonModule.new(v)
	end
end
function ShowMasterFrame()
	-- upvalues: performanceStats (write), coreGuiService (ref)
	performanceStats.Visible = true
	performanceStats.Parent = coreGuiService.RobloxGui
end

function HideMasterFrame()
	-- upvalues: performanceStats (write)
	performanceStats.Visible = false
	performanceStats.Parent = nil
end

function ConfigureMasterFrame()
	-- upvalues: performanceStats (write)
	performanceStats.Position = UDim2.new(0, 0, 0, 0)
	performanceStats.Size = UDim2.new(1, 0, 1, 0)
	performanceStats.Selectable = false
	performanceStats.BackgroundTransparency = 1
	performanceStats.Active = false
	performanceStats.ZIndex = 0
	HideMasterFrame()
end

function ConfigureStatButtonsInMasterFrame()
	-- upvalues: statsUtilsModule (ref)
	for i, v in ipairs(statsUtilsModule.AllStatTypes) do
		AddButton(v, i)
	end
end

function OnButtonToggled(p1)
	-- upvalues: t (write), var3 (write)
	var3 = if t[p1]._isSelected then p1 else nil
	UpdateButtonSelectedStates()
	UpdateViewerVisibility()
end

function UpdateButtonSelectedStates()
	-- upvalues: statsUtilsModule (ref), t (write), var3 (write)
	for i, v in ipairs(statsUtilsModule.AllStatTypes) do
		t[v]:SetIsSelected(v == var3)
	end
end

function UpdateViewerVisibility()
	-- upvalues: var3 (write), var2 (write), singleton (write), rbxAnalyticsService (ref)
	if var3 == nil then
		if var2:GetIsVisible() then
			var2:SetVisible(false)
			var2:SetStatsAggregator(nil)
			
			return
		end
	else
		local var5 = false
		
		if not var2:GetIsVisible() then
			var5 = true
			var2:SetVisible(true)
		end
		if var3 ~= var2:GetStatType() then
			var2:SetStatType(var3)
			var2:SetStatsAggregator(singleton:GetAggregator(var3))
			var5 = true
		end
		if var5 then
			rbxAnalyticsService:TrackEvent("Game", "Enlarge PerfStat", var3, 0)
		end
	end
end

function AddButton(p1, p2)
	-- upvalues: t (write), performanceStats (write), singleton (write), statsUtilsModule (ref)
	local var5 = t[p1]
	var5:SetParent(performanceStats)
	var5:SetStatsAggregator(singleton:GetAggregator(p1))
	local var6 = 1 / statsUtilsModule.NumButtonTypes
	var5:SetSizeAndPosition(UDim2.new(var6, 0, 0, statsUtilsModule.ButtonHeight), UDim2.new(var6 * (p2 - 1), 0, 0, 0))
	var5:SetToggleCallbackFunction(OnButtonToggled)
end

function ConfigureStatViewerInMasterFrame()
	-- upvalues: var2 (write), performanceStats (write), statsUtilsModule (ref)
	var2:SetParent(performanceStats)
	var2:SetSizeAndPosition(UDim2.new(0, statsUtilsModule.ViewerWidth, 0, statsUtilsModule.ViewerHeight), UDim2.new(1, -statsUtilsModule.ViewerWidth, 0, statsUtilsModule.ButtonHeight + statsUtilsModule.ViewerTopMargin))
end

if var1 then
	function CreatePerformanceStatsUI()
		-- upvalues: singleton (write), statsAggregatorManagerModule (ref), performanceStats (write), t (write), statsUtilsModule (ref), statsButtonModule (ref), var2 (write), statsViewerModule (ref), var3 (write)
		singleton = statsAggregatorManagerModule.getSingleton()
		singleton:StartListening()
		performanceStats = Instance.new("Frame")
		performanceStats.Name = "PerformanceStats"
		t = {}
		
		for i, v in statsUtilsModule.AllStatTypes do
			t[v] = statsButtonModule.new(v)
		end
		var2 = statsViewerModule.new()
		var3 = nil
		ConfigureMasterFrame()
		ConfigureStatButtonsInMasterFrame()
		ConfigureStatViewerInMasterFrame()
		UpdateButtonSelectedStates()
		UpdateViewerVisibility()
		ShowMasterFrame()
	end
	
	function DestroyPerformanceStatsUI()
		-- upvalues: var2 (write), statsUtilsModule (ref), t (write), performanceStats (write), var3 (write), singleton (write)
		if var2 then
			var2:OnPerformanceStatsShouldBeVisibleChanged()
		end
		for i, v in ipairs(statsUtilsModule.AllStatTypes) do
			local var5 = t[v]
			
			if var5 then
				var5:OnPerformanceStatsShouldBeVisibleChanged()
			end
		end
		if performanceStats then
			performanceStats:Destroy()
			performanceStats = nil
		end
		var2 = nil
		t = {}
		var3 = nil
		
		if singleton then
			singleton:StopListening()
		end
	end
	
	function UpdatePerformanceStatsVisibility()
		-- upvalues: statsUtilsModule (ref), performanceStats (write), rbxAnalyticsService (ref), var4 (write)
		local var6 = statsUtilsModule.PerformanceStatsShouldBeVisible()
		
		if var6 == (performanceStats ~= nil) then return end
		if var6 then
			CreatePerformanceStatsUI()
		else
			DestroyPerformanceStatsUI()
		end
		rbxAnalyticsService:TrackEvent("Game", if var6 then "Show PerfStats" else "Hide PerfStats", "", 0)
		
		if var6 then
			var4 = time()
			rbxAnalyticsService:ReportCounter("OpenPerformanceProfiler", 1)
			
			return
		elseif var4 then
			rbxAnalyticsService:ReportStats("TimeOpenPerformanceProfiler", time() - var4)
		end
	end
else
	function UpdatePerformanceStatsVisibility()
		-- upvalues: statsUtilsModule (ref), performanceStats (write), var2 (write), t (write), rbxAnalyticsService (ref), var4 (write)
		local var6 = statsUtilsModule.PerformanceStatsShouldBeVisible()
		
		if var6 == performanceStats.Visible then return end
		if var6 then
			ShowMasterFrame()
		else
			HideMasterFrame()
		end
		var2:OnPerformanceStatsShouldBeVisibleChanged()
		
		for i, v in ipairs(statsUtilsModule.AllStatTypes) do
			t[v]:OnPerformanceStatsShouldBeVisibleChanged()
		end
		rbxAnalyticsService:TrackEvent("Game", if var6 then "Show PerfStats" else "Hide PerfStats", "", 0)
		
		if var6 then
			var4 = time()
			rbxAnalyticsService:ReportCounter("OpenPerformanceProfiler", 1)
			
			return
		elseif var4 then
			rbxAnalyticsService:ReportStats("TimeOpenPerformanceProfiler", time() - var4)
		end
	end
end
gameSettings.PerformanceStatsVisibleChanged:connect(UpdatePerformanceStatsVisibility)

if not var1 then
	ConfigureMasterFrame()
	ConfigureStatButtonsInMasterFrame()
	ConfigureStatViewerInMasterFrame()
	UpdateButtonSelectedStates()
	UpdateViewerVisibility()
	UpdatePerformanceStatsVisibility()
end
spawn(function()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService.PlayerAdded:wait()
		localPlayer = playersService.LocalPlayer
	end
	UpdatePerformanceStatsVisibility()
end)