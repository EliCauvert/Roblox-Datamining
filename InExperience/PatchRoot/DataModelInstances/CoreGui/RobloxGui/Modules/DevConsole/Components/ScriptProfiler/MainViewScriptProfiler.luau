local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ScriptProfilerService = game:GetService("ScriptProfilerService")
local Players = game:GetService("Players")
local ImmutableModule = require(script.Parent.Parent.Parent.Immutable)
local Components = script.Parent.Parent.Parent.Components
local UtilAndTabModule = require(Components.UtilAndTab)
local BoxButtonModule = require(Components.BoxButton)
local DropDownModule = require(Components.DropDown)
local ProfilerViewModule = require(script.Parent.ProfilerView)
local ProfilerFunctionsViewModule = require(script.Parent.ProfilerFunctionsView)
local _ = require(script.Parent.ProfilerDataFormatV2)
local ProfilerExportViewModule = require(script.Parent.ProfilerExportView)
local MobileSettingsViewModule = require(script.Parent.MobileSettingsView)
local ProfilerUtilModule = require(script.Parent.ProfilerUtil)
local GetPluginFlagFunction = ProfilerUtilModule.getPluginFlag
local GetDurationsFunction = ProfilerUtilModule.getDurations
local FormatFrequencyFunction = ProfilerUtilModule.formatFrequency
local SetScriptProfilerStateModule = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerState)
local SetIsProfilingModule = require(script.Parent.Actions.SetIsProfiling)
local SetDataModule = require(script.Parent.Actions.SetData)
local SetThreadsModule = require(script.Parent.Actions.SetThreads)
local SetTimerStateModule = require(script.Parent.Actions.SetTimerState)
local ClearStateForNewProfilingSessionModule = require(script.Parent.Actions.ClearStateForNewProfilingSession)
local SetAverageModule = require(script.Parent.Actions.SetAverage)
local SetFrequencyModule = require(script.Parent.Actions.SetFrequency)
local SetDataViewModule = require(script.Parent.Actions.SetDataView)
local SetLiveUpdateModule = require(script.Parent.Actions.SetLiveUpdate)
local SetShowPluginsModule = require(script.Parent.Actions.SetShowPlugins)
local SetShowGCModule = require(script.Parent.Actions.SetShowGC)
local SetSearchDataModule = require(script.Parent.Actions.SetSearchData)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local SmallFrameHeight = ConstantsModule.UtilityBarFormatting.SmallFrameHeight
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local MainWindowHeader1 = ConstantsModule.DefaultFontSize.MainWindowHeader
local Text = ConstantsModule.Color.Text
local UnselectedGray = ConstantsModule.Color.UnselectedGray
local MainViewScriptProfiler = RoactModule.PureComponent:extend("MainViewScriptProfiler")
local ScriptProfilerShowPlugins2 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false)
local ScriptProfilerLiveUpdateIntervalMS = game:DefineFastInt("ScriptProfilerLiveUpdateIntervalMS", 1000)
local DropDownList = { "Callgraph", "Functions" }

local function annotateSearchFilterNodes(p1, p2, p3, p4: number, Key, p5) --[[ Line: 64 ]]
	-- upvalues: annotateSearchFilterNodes (copy)
	local Node = p1.Nodes[Key]
	
	if not Node.Children then
		p3[Key] = p4 > 0 and p2[p4] or p5
		
		return p4 > 0 and p2[p4]
	end
	local Children = Node.Children
	local Flag = false
	
	if p4 > 0 and p2[p4] then
		Flag = true
		p3[Key] = true
		
		for i, child in pairs(Children) do
			p3[child] = true
			annotateSearchFilterNodes(p1, p2, p3, i, child, true)
		end
		return Flag
	else
		for i1, child1 in pairs(Children) do
			local AnnotateSearchFilterNodesResult = annotateSearchFilterNodes(p1, p2, p3, i1, child1, p5)
			Flag = Flag or AnnotateSearchFilterNodesResult
		end
		if Flag or p5 then
			p3[Key] = true
		end
		return Flag
	end
end

local function generateSearchFilters(p6, Pattern) --[[ Line: 109 ]]
	-- upvalues: ProfilerUtilModule (copy), annotateSearchFilterNodes (copy)
	if Pattern == "" then
		return nil, nil
	end
	local Data = p6.data
	
	if not Data then
		return nil, nil
	end
	local Buffer = table.create(#Data.Functions, false)
	
	for i, _function in Data.Functions do
		local Name: string = ProfilerUtilModule.getName(Data, _function)
		
		if Name and string.find(Name, Pattern, 1, true) then
			Buffer[i] = true
		end
	end
	local Buffer1 = table.create(#Data.Nodes, false)
	
	for _, category in Data.Categories do
		local NodeId = category.NodeId
		local Node = Data.Nodes[NodeId]
		
		if not Node.Children then
			Buffer1[NodeId] = false
			continue
		end
		local v1 = false
		
		for i1, child in pairs(Node.Children) do
			local AnnotateSearchFilterNodesResult = annotateSearchFilterNodes(Data, Buffer, Buffer1, i1, child, false)
			v1 = v1 or AnnotateSearchFilterNodesResult
		end
		if v1 then
			Buffer1[NodeId] = true
		end
	end
	for i2, _function1 in Data.Functions do
		if Buffer[i2] ~= true and not ProfilerUtilModule.getName(Data, _function1) then
			local SourceName: string = ProfilerUtilModule.getSourceName(Data, _function1)
			
			if SourceName and string.find(SourceName, Pattern, 1, true) then
				Buffer[i2] = true
			end
		end
	end
	return Buffer, Buffer1
end

local function generatePluginDurationOffsets(GcNodeOffsets, p7) --[[ Line: 153 ]]
	-- upvalues: GetPluginFlagFunction (copy), GetDurationsFunction (copy)
	if not p7 then
		return {}, {}
	end
	assert(p7.Version == 2)
	local Buffer = table.create(#p7.Categories, 0)
	local Buffer1 = table.create(#p7.Categories, 0)
	local Total = 0
	local Total1 = 0
	
	for i, category in p7.Categories do
		local Amount = 0
		local Amount1 = 0
		local Children = p7.Nodes[category.NodeId].Children
		
		if Children then
			for i1, child in pairs(Children) do
				local _ = p7.Functions[i1]
				
				if GetPluginFlagFunction(p7, p7.Functions[i1]) then
					Amount += GetDurationsFunction(p7, child)
					
					if #GcNodeOffsets > 0 then
						Amount1 += GcNodeOffsets[child]
					end
				end
			end
		end
		Buffer[i] = Amount
		Buffer1[i] = Amount1
		Total += Amount
		Total1 += Amount1
	end
	Buffer.Total = Total
	Buffer1.Total = Total
	
	return Buffer, Buffer1
end

local function getGCOverhead(p8, TotalDurations, p9, NodeId, GCFuncId): number --[[ Line: 203 ]]
	-- upvalues: getGCOverhead (copy)
	local Node = p9.Nodes[NodeId]
	local Total = 0
	
	if Node.Children then
		for i, child in pairs(Node.Children) do
			local TotalDuration = if i == GCFuncId then p9.Nodes[child].TotalDuration else getGCOverhead(p8, TotalDurations, p9, child, GCFuncId)
			p8[i] += TotalDuration
			TotalDurations[child] = TotalDuration
			Total += TotalDuration
		end
	end
	return Total
end

local function generateGCOverheadOffsets(p10) --[[ Line: 231 ]]
	-- upvalues: getGCOverhead (copy)
	if not p10 or not p10.GCFuncId then
		return {}, {}
	end
	local GCFuncId = p10.GCFuncId
	local Buffer = table.create(#p10.Functions, 0)
	local Buffer1 = table.create(#p10.Nodes, 0)
	local Total = 0
	
	for _, category in p10.Categories do
		local NodeId = category.NodeId
		local GCOverhead: number = getGCOverhead(Buffer, Buffer1, p10, NodeId, GCFuncId)
		Total += GCOverhead
		Buffer1[NodeId] = GCOverhead
	end
	Buffer1.Total = Total
	
	return Buffer, Buffer1
end

function MainViewScriptProfiler.getActiveState(p11) --[[ Line: 259 ]]
	local IsClientView = p11.props.isClientView
	
	if p11.props.isClientView then
		return IsClientView, p11.props.client
	else
		return IsClientView, p11.props.server
	end
end

function MainViewScriptProfiler.getState(p11, p12) --[[ Line: 263 ]]
	return if p12 then p11.props.client else p11.props.server
end

function MainViewScriptProfiler.UpdateState(p11, p12, p13) --[[ Line: 267 ]]
	if p12 then
		p11.props.dispatchSetScriptProfilerState(nil, nil, p13, nil)
		
		return
	else
		p11.props.dispatchSetScriptProfilerState(nil, nil, nil, p13)
	end
end

local function OnNewProfilingData(p11, State, SerializedData) --[[ Line: 275 ]]
	-- upvalues: ScriptProfilerService (copy), generateGCOverheadOffsets (copy), ScriptProfilerShowPlugins2 (copy), generatePluginDurationOffsets (copy)
	p11.serializedData = SerializedData
	p11.data = ScriptProfilerService:DeserializeJSON(SerializedData)
	p11.gcFunctionOffsets, p11.gcNodeOffsets = generateGCOverheadOffsets(p11.data)
	
	if ScriptProfilerShowPlugins2 then
		p11.pluginOffsets, p11.pluginGCOffsets = generatePluginDurationOffsets(p11.gcNodeOffsets, p11.data)
	end
	local Buffer = table.create(if p11.data then #p11.data.Nodes else 0, false)
	table.move(State.expandedNodes, 1, if State.data then #State.data.Nodes else 0, 1, Buffer)
	p11.expandedNodes = Buffer
end

function MainViewScriptProfiler.init(p11) --[[ Line: 293 ]]
	-- upvalues: ScriptProfilerService (copy), Players (copy), ScriptProfilerLiveUpdateIntervalMS (copy), generateSearchFilters (copy), RoactModule (copy)
	local function _(p12, p13) --[[ Line: 294 | Named "StartScriptProfiling" ]]
		-- upvalues: ScriptProfilerService (upval), Players (upval)
		if p12 then
			ScriptProfilerService:ClientStart(Players.LocalPlayer, p13.frequency)
			
			return
		else
			ScriptProfilerService:ServerStart(p13.frequency)
		end
	end
	
	local _ = function(p12) --[[ Line: 302 | Named "StopScriptProfiling" ]]
		-- upvalues: ScriptProfilerService (upval), Players (upval)
		if p12 then
			ScriptProfilerService:ClientStop(Players.LocalPlayer)
		else
			ScriptProfilerService:ServerStop()
		end
		return nil
	end
	
	local _ = function(p12) --[[ Line: 311 | Named "RequestNewData" ]]
		-- upvalues: ScriptProfilerService (upval), Players (upval)
		if p12 then
			ScriptProfilerService:ClientRequestData(Players.LocalPlayer)
			
			return
		else
			ScriptProfilerService:ServerRequestData()
		end
	end
	
	local _ = function(p12) --[[ Line: 319 | Named "StopTimedProfiling" ]]
		-- upvalues: p11 (copy), ScriptProfilerService (upval), Players (upval)
		if p11:getState(p12).isProfiling then
			if p12 then
				ScriptProfilerService:ClientStop(Players.LocalPlayer)
			else
				ScriptProfilerService:ServerStop()
			end
			p11.props.dispatchSetIsProfiling(p12, false)
			
			if p12 then
				ScriptProfilerService:ClientRequestData(Players.LocalPlayer)
				
				return
			end
			ScriptProfilerService:ServerRequestData()
		end
	end
	
	function p11.onUtilTabHeightChanged(UtilTabHeight) --[[ Line: 331 ]]
		-- upvalues: p11 (copy)
		p11:setState({ utilTabHeight = UtilTabHeight })
	end
	
	local function UpdateTimedProfilingTimer(p12) --[[ Line: 337 ]]
		-- upvalues: p11 (copy)
		while task.wait(0.5) do
			local TimedProfilingCountdown: number = p11:getState(p12).timedProfilingCountdown
			
			if TimedProfilingCountdown <= 0 then break end
			p11.props.dispatchSetTimer(p12, { timedProfilingCountdown = TimedProfilingCountdown - 0.5 })
		end
	end
	
	local function LiveUpdate(p13) --[[ Line: 352 ]]
		-- upvalues: ScriptProfilerLiveUpdateIntervalMS (upval), p11 (copy), ScriptProfilerService (upval), Players (upval)
		while task.wait(ScriptProfilerLiveUpdateIntervalMS / 1000) do
			if not p11:getState(p13).liveUpdate then continue end
			if p13 then
				ScriptProfilerService:ClientRequestData(Players.LocalPlayer)
			else
				ScriptProfilerService:ServerRequestData()
			end
		end
	end
	
	function p11.onBeginProfile() --[[ Line: 362 ]]
		-- upvalues: p11 (copy), ScriptProfilerService (upval), Players (upval), UpdateTimedProfilingTimer (copy), LiveUpdate (copy)
		local ActiveState, ActiveState2 = p11:getActiveState()
		
		if ActiveState then
			ScriptProfilerService:ClientStart(Players.LocalPlayer, ActiveState2.frequency)
		else
			ScriptProfilerService:ServerStart(ActiveState2.frequency)
		end
		p11.props.dispatchSetIsProfiling(ActiveState, true)
		p11.props.dispatchClearStateForNewSession(ActiveState)
		local t = {}
		
		if ActiveState2.timedProfilingDuration > 0 then
			p11.props.dispatchSetTimer(ActiveState, {
				timedProfilingCountdown = ActiveState2.timedProfilingDuration
			})
			t.timedProfilingThread = task.delay(ActiveState2.timedProfilingDuration, function() --[[ Line: 375 ]]
				-- upvalues: ActiveState (copy), p11 (upval), ScriptProfilerService (upval), Players (upval)
				if p11:getState(ActiveState).isProfiling then
					if ActiveState then
						ScriptProfilerService:ClientStop(Players.LocalPlayer)
					else
						ScriptProfilerService:ServerStop()
					end
					p11.props.dispatchSetIsProfiling(ActiveState, false)
					
					if ActiveState then
						ScriptProfilerService:ClientRequestData(Players.LocalPlayer)
						
						return
					end
					ScriptProfilerService:ServerRequestData()
				end
			end)
			t.timedProfilingTimerThread = task.spawn(function() --[[ Line: 379 ]]
				-- upvalues: UpdateTimedProfilingTimer (upval), ActiveState (copy)
				UpdateTimedProfilingTimer(ActiveState)
			end)
		end
		t.liveUpdateThread = task.spawn(LiveUpdate, ActiveState)
		p11.props.dispatchSetThreads(ActiveState, t)
	end
	
	function p11.onEndProfile() --[[ Line: 389 ]]
		-- upvalues: p11 (copy), ScriptProfilerService (upval), Players (upval)
		local ActiveState, ActiveState2 = p11:getActiveState()
		
		if ActiveState then
			ScriptProfilerService:ClientStop(Players.LocalPlayer)
		else
			ScriptProfilerService:ServerStop()
		end
		local t = {}
		
		if ActiveState2.timedProfilingThread then
			task.cancel(ActiveState2.timedProfilingThread)
			t.timedProfilingThread = nil
		end
		if ActiveState2.timedProfilingTimerThread then
			task.cancel(ActiveState2.timedProfilingTimerThread)
			t.timedProfilingTimerThread = nil
		end
		if ActiveState2.liveUpdateThread then
			task.cancel(ActiveState2.liveUpdateThread)
			t.liveUpdateThread = nil
		end
		p11.props.dispatchSetThreads(ActiveState, {})
		p11.props.dispatchSetIsProfiling(ActiveState, false)
		
		if ActiveState then
			ScriptProfilerService:ClientRequestData(Players.LocalPlayer)
			
			return
		else
			ScriptProfilerService:ServerRequestData()
		end
	end
	
	function p11.toggleTimedProfiling() --[[ Line: 417 ]]
		-- upvalues: p11 (copy)
		local ActiveState, ActiveState2 = p11:getActiveState()
		local TimedProfilingDuration = ActiveState2.timedProfilingDuration
		p11.props.dispatchSetTimer(ActiveState, {
			timedProfilingDuration = if TimedProfilingDuration == 0 then 60 elseif TimedProfilingDuration == 60 then 300 elseif TimedProfilingDuration == 300 then 600 else 0
		})
	end
	
	function p11.toggleAverage() --[[ Line: 435 ]]
		-- upvalues: p11 (copy)
		local ActiveState, ActiveState2 = p11:getActiveState()
		local Average = ActiveState2.average
		p11.props.dispatchSetAverage(ActiveState, if Average == 0 then 1 elseif Average == 1 then 60 elseif Average == 60 then 300 elseif Average == 300 then 600 else 0)
	end
	
	function p11.toggleUnits() --[[ Line: 455 ]]
		-- upvalues: p11 (copy)
		p11.props.dispatchSetScriptProfilerState(nil, not p11.props.usePercentages, nil, nil)
	end
	
	function p11.toggleFrequency() --[[ Line: 459 ]]
		-- upvalues: p11 (copy)
		local ActiveState, ActiveState2 = p11:getActiveState()
		p11.props.dispatchSetFrequency(ActiveState, if ActiveState2.frequency == 1000 then 10000 else 1000)
	end
	
	function p11.onClientButton() --[[ Line: 473 ]]
		-- upvalues: p11 (copy)
		p11.props.dispatchSetScriptProfilerState(true)
	end
	
	function p11.onServerButton() --[[ Line: 477 ]]
		-- upvalues: p11 (copy)
		p11.props.dispatchSetScriptProfilerState(false)
	end
	
	function p11.dataViewDropDownCallback(p14) --[[ Line: 481 ]]
		-- upvalues: p11 (copy)
		local ActiveState, ActiveState2 = p11:getActiveState()
		p11.props.dispatchSetDataView(ActiveState, p14 ~= 1 and (p14 == 2 or ActiveState2.isFunctionsView))
	end
	
	function p11.onCheckboxChanged(p14, p15) --[[ Line: 495 ]]
		-- upvalues: p11 (copy)
		local IsClientView = p11.props.isClientView
		
		if p14 == "Live" then
			p11.props.dispatchSetLiveUpdate(IsClientView, p15)
			
			return
		end
		if p14 == "Plugins" then
			p11.props.dispatchSetShowPlugins(IsClientView, p15)
			
			return
		end
		if p14 == "GC" then
			p11.props.dispatchSetShowGC(IsClientView, p15)
		end
	end
	
	function p11.onSearchTermChanged(SearchTerm) --[[ Line: 507 ]]
		-- upvalues: p11 (copy), generateSearchFilters (upval)
		local ActiveState, ActiveState2 = p11:getActiveState()
		local SearchFilters, SearchFilters2 = generateSearchFilters(ActiveState2, SearchTerm)
		p11.props.dispatchSetSearchData(ActiveState, {
			searchTerm = SearchTerm,
			searchFilterFlat = SearchFilters or {},
			searchFilterGraph = SearchFilters2 or {}
		})
	end
	
	p11.utilRef = RoactModule.createRef()
	p11.state = { utilTabHeight = 0 }
end

function MainViewScriptProfiler.didMount(p13) --[[ Line: 525 ]]
	-- upvalues: ScriptProfilerService (copy), OnNewProfilingData (copy)
	p13:setState({ utilTabHeight = p13.utilRef.current.Size.Y.Offset })
	p13.scriptProfilerConnection = ScriptProfilerService.OnNewData:Connect(function(Player, JsonString) --[[ Line: 531 ]]
		-- upvalues: p13 (copy), OnNewProfilingData (upval)
		local HasPlayer = Player ~= nil
		local t = {}
		OnNewProfilingData(t, p13:getState(HasPlayer), JsonString)
		p13.props.dispatchSetData(HasPlayer, t)
	end)
end

function MainViewScriptProfiler.willUnmount(p13) --[[ Line: 543 ]]
	p13.scriptProfilerConnection:Disconnect()
	p13.scriptProfilerConnection = nil
end

function MainViewScriptProfiler.didUpdate(p13) --[[ Line: 548 ]]
	local Size = p13.utilRef.current.Size
	
	if Size.Y.Offset ~= p13.state.utilTabHeight then
		p13:setState({ utilTabHeight = Size.Y.Offset })
	end
end

local function _(p13) --[[ Line: 557 | Named "formatTimer" ]]
	-- upvalues: ProfilerUtilModule (copy)
	local FormatTimerResult = ProfilerUtilModule.formatTimer(p13)
	
	return if FormatTimerResult == "" then FormatTimerResult else ": " .. FormatTimerResult
end

function MainViewScriptProfiler.renderUtilButtons(p13, p14, IsSmallMatch, IsSmallMatch1) --[[ Line: 567 ]]
	-- upvalues: RoactModule (copy), BoxButtonModule (copy), FormatFrequencyFunction (copy), MainWindowHeader1 (copy), Text (copy), MainWindowHeader (copy), ConstantsModule (copy), UnselectedGray (copy), ProfilerUtilModule (copy), DropDownModule (copy), SmallFrameHeight (copy), DropDownList (copy)
	local IsProfiling = p14.isProfiling
	local List = {}
	table.insert(List, RoactModule.createElement(BoxButtonModule, {
		text = if IsProfiling then "Stop" else "Start",
		onClicked = IsProfiling and p13.onEndProfile or p13.onBeginProfile
	}))
	
	if not IsSmallMatch1 then
		table.insert(List, RoactModule.createElement(BoxButtonModule, {
			text = if p13.props.usePercentages then "Unit: %" else "Unit: ms",
			onClicked = p13.toggleUnits
		}))
	end
	if not IsSmallMatch1 then
		table.insert(List, RoactModule.createElement("TextButton", {
			Text = "Freq: " .. FormatFrequencyFunction(p14.frequency),
			TextSize = MainWindowHeader1,
			TextColor3 = Text,
			Font = MainWindowHeader,
			AutoButtonColor = true,
			BackgroundColor3 = if IsProfiling then ConstantsModule.Color.InactiveBox else UnselectedGray,
			BackgroundTransparency = 0,
			[RoactModule.Event.Activated] = function() --[[ Line: 608 ]]
				-- upvalues: IsProfiling (copy), p13 (copy)
				if not IsProfiling then
					p13.toggleFrequency()
				end
			end
		}))
	end
	if not IsSmallMatch1 then
		local FormatTimerResult = ProfilerUtilModule.formatTimer(if IsProfiling then p14.timedProfilingCountdown else p14.timedProfilingDuration)
		table.insert(List, RoactModule.createElement("TextButton", {
			Text = "Time" .. (if FormatTimerResult == "" then FormatTimerResult else ": " .. FormatTimerResult),
			TextSize = MainWindowHeader1,
			TextColor3 = Text,
			Font = MainWindowHeader,
			AutoButtonColor = true,
			BackgroundColor3 = if IsProfiling then ConstantsModule.Color.InactiveBox else UnselectedGray,
			BackgroundTransparency = 0,
			[RoactModule.Event.Activated] = function() --[[ Line: 631 ]]
				-- upvalues: IsProfiling (copy), p13 (copy)
				if not IsProfiling then
					p13.toggleTimedProfiling()
				end
			end
		}))
	end
	if not IsSmallMatch1 then
		local FormatTimerResult = ProfilerUtilModule.formatTimer(p14.average)
		table.insert(List, RoactModule.createElement("TextButton", {
			Text = "Average" .. (if FormatTimerResult == "" then FormatTimerResult else ": " .. FormatTimerResult),
			TextSize = MainWindowHeader1,
			TextColor3 = Text,
			Font = MainWindowHeader,
			AutoButtonColor = true,
			BackgroundColor3 = if IsProfiling then ConstantsModule.Color.InactiveBox else UnselectedGray,
			BackgroundTransparency = 0,
			[RoactModule.Event.Activated] = function() --[[ Line: 653 ]]
				-- upvalues: IsProfiling (copy), p13 (copy)
				if not IsProfiling then
					p13.toggleAverage()
				end
			end
		}))
	end
	if not IsSmallMatch1 then
		table.insert(List, RoactModule.createElement(BoxButtonModule, {
			text = "Export",
			onClicked = p13.props.dispatchStartExport
		}))
	end
	if not IsSmallMatch1 then
		table.insert(List, RoactModule.createElement(DropDownModule, {
			buttonSize = UDim2.new(0, 100, 0, SmallFrameHeight),
			dropDownList = DropDownList,
			selectedIndex = if p14.isFunctionsView then 2 else 1,
			onSelection = p13.dataViewDropDownCallback
		}))
	end
	if IsSmallMatch then
		table.insert(List, RoactModule.createElement(BoxButtonModule, {
			text = "More...",
			onClicked = function() --[[ Line: 689 ]]
				-- upvalues: p13 (copy)
				p13.props.dispatchShowMobileSettings()
			end
		}))
	end
	return List
end

function MainViewScriptProfiler.renderUtilAndTab(p13, p14, p15) --[[ Line: 699 ]]
	-- upvalues: RoactModule (copy), UtilAndTabModule (copy), ImmutableModule (copy)
	return RoactModule.createElement(UtilAndTabModule, ImmutableModule.JoinDictionaries({
		layoutOrder = 1,
		windowWidth = p13.props.size.X.Offset,
		formFactor = p13.props.formFactor,
		tabList = p13.props.tabList,
		refForParent = p13.utilRef,
		onHeightChanged = p13.onUtilTabHeightChanged
	}, p14), p15)
end

function MainViewScriptProfiler.renderExportView(p13) --[[ Line: 719 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), BoxButtonModule (copy), ProfilerExportViewModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = p13.props.size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, MainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = p13:renderUtilAndTab({}, {
			RoactModule.createElement(BoxButtonModule, {
				text = "Exit",
				onClicked = p13.props.dispatchFinishedExporting
			})
		}),
		ExportView = RoactModule.createElement(ProfilerExportViewModule, { size = UDim2.new(1, 0, 1, -p13.state.utilTabHeight) })
	})
end

function MainViewScriptProfiler.renderMobileSettingsUI(p13) --[[ Line: 748 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), BoxButtonModule (copy), MobileSettingsViewModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = p13.props.size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, MainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = p13:renderUtilAndTab({}, {
			RoactModule.createElement(BoxButtonModule, {
				text = "Export",
				onClicked = p13.props.dispatchStartExport
			}),
			RoactModule.createElement(BoxButtonModule, {
				text = "Exit",
				onClicked = p13.props.dispatchHideMobileSettings
			})
		}),
		MobileSettingsView = RoactModule.createElement(MobileSettingsViewModule, { size = UDim2.new(1, 0, 1, -p13.state.utilTabHeight) })
	})
end

function MainViewScriptProfiler.renderProfilerView(p13, IsClientView, p14, RenderUtilButtonsResult, OrderedCheckboxState) --[[ Line: 783 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), ProfilerFunctionsViewModule (copy), ProfilerViewModule (copy), ScriptProfilerShowPlugins2 (copy)
	local Data = p14.data
	local IsFunctionsView = p14.isFunctionsView
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = p13.props.size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, MainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = p13:renderUtilAndTab({
			isClientView = IsClientView,
			onClientButton = p13.onClientButton,
			onServerButton = p13.onServerButton,
			orderedCheckboxState = OrderedCheckboxState,
			onCheckboxChanged = p13.onCheckboxChanged,
			onSearchTermChanged = p13.onSearchTermChanged,
			searchTerm = p14.searchTerm
		}, RenderUtilButtonsResult),
		ProfilerView = RoactModule.createElement(if IsFunctionsView then ProfilerFunctionsViewModule else ProfilerViewModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -p13.state.utilTabHeight),
			searchFilter = if IsFunctionsView then p14.searchFilterFlat else p14.searchFilterGraph,
			data = Data,
			profiling = p14.isProfiling,
			showAsPercentages = p13.props.usePercentages,
			sessionLength = if Data and Data.SessionStartTime and Data.SessionEndTime then Data.SessionEndTime - Data.SessionStartTime else nil,
			rootNode = p14.rootNode,
			rootFunc = p14.rootFunc,
			rootNodeName = p14.rootNodeName,
			average = p14.average,
			showPlugins = p14.showPlugins or not ScriptProfilerShowPlugins2,
			pluginOffsets = p14.pluginOffsets,
			showGC = p14.showGC,
			gcFunctionOffsets = p14.gcFunctionOffsets,
			gcNodeOffsets = p14.gcNodeOffsets,
			pluginGCOffsets = p14.pluginGCOffsets,
			expandedNodes = if IsFunctionsView then nil else p14.expandedNodes
		})
	})
end

function MainViewScriptProfiler.render(p13) --[[ Line: 847 ]]
	-- upvalues: ConstantsModule (copy), ScriptProfilerShowPlugins2 (copy)
	if p13.props.isExporting then
		return p13:renderExportView()
	end
	if p13.props.isShowingMobileSettings then
		return p13:renderMobileSettingsUI()
	end
	local FormFactor = p13.props.formFactor
	local ActiveState, ActiveState2 = p13:getActiveState()
	local OrderedCheckboxState = {}
	local Count = 1
	local IsFormFactorMatch = FormFactor == ConstantsModule.FormFactor.Small
	
	if not IsFormFactorMatch then
		OrderedCheckboxState[1] = { name = "Live", state = ActiveState2.liveUpdate }
		
		if ScriptProfilerShowPlugins2 then
			Count += 1
			OrderedCheckboxState[Count] = { name = "Plugins", state = ActiveState2.showPlugins }
		end
		OrderedCheckboxState[Count + 1] = { name = "GC", state = ActiveState2.showGC }
	end
	return p13:renderProfilerView(ActiveState, ActiveState2, p13:renderUtilButtons(ActiveState2, IsFormFactorMatch, IsFormFactorMatch), OrderedCheckboxState)
end

return RoactRoduxModule.UNSTABLE_connect2(function(p13, _) --[[ Line: 882 | Named "mapStateToProps" ]]
	return {
		isClientView = p13.ScriptProfiler.isClientView,
		usePercentages = p13.ScriptProfiler.usePercentages,
		isExporting = p13.ScriptProfiler.isExporting,
		isShowingMobileSettings = p13.ScriptProfiler.isShowingMobileSettings,
		client = p13.ScriptProfiler.client,
		server = p13.ScriptProfiler.server
	}
end, function(Callback) --[[ Line: 894 | Named "mapDispatchToProps" ]]
	-- upvalues: SetScriptProfilerStateModule (copy), SetIsProfilingModule (copy), SetDataModule (copy), SetThreadsModule (copy), SetTimerStateModule (copy), ClearStateForNewProfilingSessionModule (copy), SetAverageModule (copy), SetFrequencyModule (copy), SetDataViewModule (copy), SetLiveUpdateModule (copy), SetShowPluginsModule (copy), SetShowGCModule (copy), SetSearchDataModule (copy)
	return {
		dispatchSetScriptProfilerState = function(p13, p14, p15, p16) --[[ Line: 896 ]]
			-- upvalues: Callback (copy), SetScriptProfilerStateModule (upval)
			Callback(SetScriptProfilerStateModule(p13, p14, p15, p16))
		end,
		dispatchSetIsProfiling = function(p13, p14) --[[ Line: 900 ]]
			-- upvalues: Callback (copy), SetIsProfilingModule (upval)
			Callback(SetIsProfilingModule(p13, p14))
		end,
		dispatchSetData = function(p13, p14) --[[ Line: 904 ]]
			-- upvalues: Callback (copy), SetDataModule (upval)
			Callback(SetDataModule(p13, p14))
		end,
		dispatchSetThreads = function(p13, p14) --[[ Line: 908 ]]
			-- upvalues: Callback (copy), SetThreadsModule (upval)
			Callback(SetThreadsModule(p13, p14))
		end,
		dispatchSetTimer = function(p13, p14) --[[ Line: 912 ]]
			-- upvalues: Callback (copy), SetTimerStateModule (upval)
			Callback(SetTimerStateModule(p13, p14))
		end,
		dispatchClearStateForNewSession = function(p13) --[[ Line: 916 ]]
			-- upvalues: Callback (copy), ClearStateForNewProfilingSessionModule (upval)
			Callback(ClearStateForNewProfilingSessionModule(p13))
		end,
		dispatchSetAverage = function(p13, p14) --[[ Line: 920 ]]
			-- upvalues: Callback (copy), SetAverageModule (upval)
			Callback(SetAverageModule(p13, p14))
		end,
		dispatchSetFrequency = function(p13, p14) --[[ Line: 924 ]]
			-- upvalues: Callback (copy), SetFrequencyModule (upval)
			Callback(SetFrequencyModule(p13, p14))
		end,
		dispatchSetDataView = function(p13, p14) --[[ Line: 928 ]]
			-- upvalues: Callback (copy), SetDataViewModule (upval)
			Callback(SetDataViewModule(p13, p14))
		end,
		dispatchSetLiveUpdate = function(p13, p14) --[[ Line: 932 ]]
			-- upvalues: Callback (copy), SetLiveUpdateModule (upval)
			Callback(SetLiveUpdateModule(p13, p14))
		end,
		dispatchSetShowPlugins = function(p13, p14) --[[ Line: 936 ]]
			-- upvalues: Callback (copy), SetShowPluginsModule (upval)
			Callback(SetShowPluginsModule(p13, p14))
		end,
		dispatchSetShowGC = function(p13, p14) --[[ Line: 940 ]]
			-- upvalues: Callback (copy), SetShowGCModule (upval)
			Callback(SetShowGCModule(p13, p14))
		end,
		dispatchSetSearchData = function(p13, p14) --[[ Line: 944 ]]
			-- upvalues: Callback (copy), SetSearchDataModule (upval)
			Callback(SetSearchDataModule(p13, p14))
		end,
		dispatchStartExport = function() --[[ Line: 948 ]]
			-- upvalues: Callback (copy), SetScriptProfilerStateModule (upval)
			Callback(SetScriptProfilerStateModule(nil, nil, nil, nil, true))
		end,
		dispatchFinishedExporting = function() --[[ Line: 952 ]]
			-- upvalues: Callback (copy), SetScriptProfilerStateModule (upval)
			Callback(SetScriptProfilerStateModule(nil, nil, nil, nil, false))
		end,
		dispatchShowMobileSettings = function() --[[ Line: 956 ]]
			-- upvalues: Callback (copy), SetScriptProfilerStateModule (upval)
			Callback(SetScriptProfilerStateModule(nil, nil, nil, nil, nil, true))
		end,
		dispatchHideMobileSettings = function() --[[ Line: 960 ]]
			-- upvalues: Callback (copy), SetScriptProfilerStateModule (upval)
			Callback(SetScriptProfilerStateModule(nil, nil, nil, nil, nil, false))
		end
	}
end)(MainViewScriptProfiler)