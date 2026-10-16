local Players = game:GetService("Players")
local GameSettings = UserSettings().GameSettings
local CoreGui = game:GetService("CoreGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local StatsAggregatorManagerModule = require(CoreGui.RobloxGui.Modules.Stats.StatsAggregatorManager)
local StatsButtonModule = require(CoreGui.RobloxGui.Modules.Stats.StatsButton)
local StatsUtilsModule = require(CoreGui.RobloxGui.Modules.Stats.StatsUtils)
local StatsViewerModule = require(CoreGui.RobloxGui.Modules.Stats.StatsViewer)
local v1 = require(CoreGui.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit)()
local PerformanceStats = nil
local Singleton = nil
local NewResult = nil
local NewResults = {}
local Label = nil
local CurrentTime = nil

if not v1 then
	PerformanceStats = Instance.new("Frame")
	PerformanceStats.Name = "PerformanceStats"
	Singleton = StatsAggregatorManagerModule.getSingleton()
	NewResult = StatsViewerModule.new()
	
	for _, allStatType in ipairs(StatsUtilsModule.AllStatTypes) do
		NewResults[allStatType] = StatsButtonModule.new(allStatType)
	end
end
function ShowMasterFrame() --[[ Line: 48 ]]
	-- upvalues: PerformanceStats (ref), CoreGui (copy)
	PerformanceStats.Visible = true
	PerformanceStats.Parent = CoreGui.RobloxGui
end

function HideMasterFrame() --[[ Line: 53 ]]
	-- upvalues: PerformanceStats (ref)
	PerformanceStats.Visible = false
	PerformanceStats.Parent = nil
end

function ConfigureMasterFrame() --[[ Line: 59 ]]
	-- upvalues: PerformanceStats (ref)
	PerformanceStats.Position = UDim2.new(0, 0, 0, 0)
	PerformanceStats.Size = UDim2.new(1, 0, 1, 0)
	PerformanceStats.Selectable = false
	PerformanceStats.BackgroundTransparency = 1
	PerformanceStats.Active = false
	PerformanceStats.ZIndex = 0
	HideMasterFrame()
end

function ConfigureStatButtonsInMasterFrame() --[[ Line: 77 ]]
	-- upvalues: StatsUtilsModule (copy)
	for i, allStatType in ipairs(StatsUtilsModule.AllStatTypes) do
		AddButton(allStatType, i)
	end
end

function OnButtonToggled(p1) --[[ Line: 84 ]]
	-- upvalues: NewResults (ref), Label (ref)
	Label = if not NewResults[p1]._isSelected then p1 else nil
	UpdateButtonSelectedStates()
	UpdateViewerVisibility()
end

function UpdateButtonSelectedStates() --[[ Line: 99 ]]
	-- upvalues: StatsUtilsModule (copy), NewResults (ref), Label (ref)
	for _, allStatType in ipairs(StatsUtilsModule.AllStatTypes) do
		NewResults[allStatType]:SetIsSelected(allStatType == Label)
	end
end

function UpdateViewerVisibility() --[[ Line: 106 ]]
	-- upvalues: Label (ref), NewResult (ref), Singleton (ref), RbxAnalyticsService (copy)
	if Label ~= nil then
		local Flag = false
		
		if not NewResult:GetIsVisible() then
			Flag = true
			NewResult:SetVisible(true)
		end
		if Label ~= NewResult:GetStatType() then
			NewResult:SetStatType(Label)
			NewResult:SetStatsAggregator(Singleton:GetAggregator(Label))
			Flag = true
		end
		if Flag then
			RbxAnalyticsService:TrackEvent("Game", "Enlarge PerfStat", Label, 0)
		end
	elseif NewResult:GetIsVisible() then
		NewResult:SetVisible(false)
		NewResult:SetStatsAggregator(nil)
		
		return
	end
end

function AddButton(p1, p2: number) --[[ Line: 135 ]]
	-- upvalues: NewResults (ref), PerformanceStats (ref), Singleton (ref), StatsUtilsModule (copy)
	local NewResult = NewResults[p1]
	NewResult:SetParent(PerformanceStats)
	NewResult:SetStatsAggregator(Singleton:GetAggregator(p1))
	local XScale = 1 / StatsUtilsModule.NumButtonTypes
	NewResult:SetSizeAndPosition(UDim2.new(XScale, 0, 0, StatsUtilsModule.ButtonHeight), (UDim2.new(XScale * (p2 - 1), 0, 0, 0)))
	NewResult:SetToggleCallbackFunction(OnButtonToggled)
end

function ConfigureStatViewerInMasterFrame() --[[ Line: 154 ]]
	-- upvalues: NewResult (ref), PerformanceStats (ref), StatsUtilsModule (copy)
	NewResult:SetParent(PerformanceStats)
	NewResult:SetSizeAndPosition(UDim2.new(0, StatsUtilsModule.ViewerWidth, 0, StatsUtilsModule.ViewerHeight), (UDim2.new(1, -StatsUtilsModule.ViewerWidth, 0, StatsUtilsModule.ButtonHeight + StatsUtilsModule.ViewerTopMargin)))
end

if v1 then
	function CreatePerformanceStatsUI() --[[ Line: 166 ]]
		-- upvalues: Singleton (ref), StatsAggregatorManagerModule (copy), PerformanceStats (ref), NewResults (ref), StatsUtilsModule (copy), StatsButtonModule (copy), NewResult (ref), StatsViewerModule (copy), Label (ref)
		Singleton = StatsAggregatorManagerModule.getSingleton()
		Singleton:StartListening()
		PerformanceStats = Instance.new("Frame")
		PerformanceStats.Name = "PerformanceStats"
		NewResults = {}
		
		for _, allStatType in StatsUtilsModule.AllStatTypes do
			NewResults[allStatType] = StatsButtonModule.new(allStatType)
		end
		NewResult = StatsViewerModule.new()
		Label = nil
		ConfigureMasterFrame()
		ConfigureStatButtonsInMasterFrame()
		ConfigureStatViewerInMasterFrame()
		UpdateButtonSelectedStates()
		UpdateViewerVisibility()
		ShowMasterFrame()
	end
	
	function DestroyPerformanceStatsUI() --[[ Line: 192 ]]
		-- upvalues: NewResult (ref), StatsUtilsModule (copy), NewResults (ref), PerformanceStats (ref), Label (ref), Singleton (ref)
		if NewResult then
			NewResult:OnPerformanceStatsShouldBeVisibleChanged()
		end
		for _, allStatType in ipairs(StatsUtilsModule.AllStatTypes) do
			local NewResult1 = NewResults[allStatType]
			
			if NewResult1 then
				NewResult1:OnPerformanceStatsShouldBeVisibleChanged()
			end
		end
		if PerformanceStats then
			PerformanceStats:Destroy()
			PerformanceStats = nil
		end
		NewResult = nil
		NewResults = {}
		Label = nil
		
		if Singleton then
			Singleton:StopListening()
		end
	end
	
	function UpdatePerformanceStatsVisibility() --[[ Line: 218 ]]
		-- upvalues: StatsUtilsModule (copy), PerformanceStats (ref), RbxAnalyticsService (copy), CurrentTime (ref)
		local PerformanceStatsShouldBeVisibleResult = StatsUtilsModule.PerformanceStatsShouldBeVisible()
		
		if PerformanceStatsShouldBeVisibleResult == (PerformanceStats ~= nil) then return end
		if PerformanceStatsShouldBeVisibleResult then
			CreatePerformanceStatsUI()
		else
			DestroyPerformanceStatsUI()
		end
		RbxAnalyticsService:TrackEvent("Game", if PerformanceStatsShouldBeVisibleResult then "Show PerfStats" else "Hide PerfStats", "", 0)
		
		if PerformanceStatsShouldBeVisibleResult then
			CurrentTime = time()
			RbxAnalyticsService:ReportCounter("OpenPerformanceProfiler", 1)
			
			return
		end
		if CurrentTime then
			RbxAnalyticsService:ReportStats("TimeOpenPerformanceProfiler", time() - CurrentTime)
		end
	end
else
	function UpdatePerformanceStatsVisibility() --[[ Line: 251 ]]
		-- upvalues: StatsUtilsModule (copy), PerformanceStats (ref), NewResult (ref), NewResults (ref), RbxAnalyticsService (copy), CurrentTime (ref)
		local PerformanceStatsShouldBeVisibleResult = StatsUtilsModule.PerformanceStatsShouldBeVisible()
		
		if PerformanceStatsShouldBeVisibleResult == PerformanceStats.Visible then return end
		if PerformanceStatsShouldBeVisibleResult then
			ShowMasterFrame()
		else
			HideMasterFrame()
		end
		NewResult:OnPerformanceStatsShouldBeVisibleChanged()
		
		for _, allStatType in ipairs(StatsUtilsModule.AllStatTypes) do
			NewResults[allStatType]:OnPerformanceStatsShouldBeVisibleChanged()
		end
		RbxAnalyticsService:TrackEvent("Game", if PerformanceStatsShouldBeVisibleResult then "Show PerfStats" else "Hide PerfStats", "", 0)
		
		if PerformanceStatsShouldBeVisibleResult then
			CurrentTime = time()
			RbxAnalyticsService:ReportCounter("OpenPerformanceProfiler", 1)
			
			return
		end
		if CurrentTime then
			RbxAnalyticsService:ReportStats("TimeOpenPerformanceProfiler", time() - CurrentTime)
		end
	end
end
GameSettings.PerformanceStatsVisibleChanged:connect(UpdatePerformanceStatsVisibility)

if not v1 then
	ConfigureMasterFrame()
	ConfigureStatButtonsInMasterFrame()
	ConfigureStatViewerInMasterFrame()
	UpdateButtonSelectedStates()
	UpdateViewerVisibility()
	UpdatePerformanceStatsVisibility()
end
spawn(function() --[[ Line: 305 ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	while not LocalPlayer do
		Players.PlayerAdded:wait()
		LocalPlayer = Players.LocalPlayer
	end
	UpdatePerformanceStatsVisibility()
end)