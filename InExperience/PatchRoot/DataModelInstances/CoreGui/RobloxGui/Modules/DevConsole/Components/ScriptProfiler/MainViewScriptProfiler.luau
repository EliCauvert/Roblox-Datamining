local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local scriptProfilerService = game:GetService("ScriptProfilerService")
local playersService = game:GetService("Players")
local immutableModule = require(script.Parent.Parent.Parent.Immutable)
local components = script.Parent.Parent.Parent.Components
local utilAndTabModule = require(components.UtilAndTab)
local boxButtonModule = require(components.BoxButton)
local dropDownModule = require(components.DropDown)
local profilerViewModule = require(script.Parent.ProfilerView)
local profilerFunctionsViewModule = require(script.Parent.ProfilerFunctionsView)
local _ = require(script.Parent.ProfilerDataFormatV2)
local profilerExportViewModule = require(script.Parent.ProfilerExportView)
local mobileSettingsViewModule = require(script.Parent.MobileSettingsView)
local profilerUtilModule = require(script.Parent.ProfilerUtil)
local getPluginFlag = profilerUtilModule.getPluginFlag
local getDurations = profilerUtilModule.getDurations
local formatFrequency = profilerUtilModule.formatFrequency
local setScriptProfilerStateModule = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerState)
local setIsProfilingModule = require(script.Parent.Actions.SetIsProfiling)
local setDataModule = require(script.Parent.Actions.SetData)
local setThreadsModule = require(script.Parent.Actions.SetThreads)
local setTimerStateModule = require(script.Parent.Actions.SetTimerState)
local clearStateForNewProfilingSessionModule = require(script.Parent.Actions.ClearStateForNewProfilingSession)
local setAverageModule = require(script.Parent.Actions.SetAverage)
local setFrequencyModule = require(script.Parent.Actions.SetFrequency)
local setDataViewModule = require(script.Parent.Actions.SetDataView)
local setLiveUpdateModule = require(script.Parent.Actions.SetLiveUpdate)
local setShowPluginsModule = require(script.Parent.Actions.SetShowPlugins)
local setShowGCModule = require(script.Parent.Actions.SetShowGC)
local setSearchDataModule = require(script.Parent.Actions.SetSearchData)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local smallFrameHeight = constantsModule.UtilityBarFormatting.SmallFrameHeight
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local mainWindowHeader_1 = constantsModule.DefaultFontSize.MainWindowHeader
local text = constantsModule.Color.Text
local unselectedGray = constantsModule.Color.UnselectedGray
local mainViewScriptProfiler = roactModule.PureComponent:extend("MainViewScriptProfiler")
local scriptProfilerShowPlugins2 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false)
local scriptProfilerLiveUpdateIntervalMS = game:DefineFastInt("ScriptProfilerLiveUpdateIntervalMS", 1000)
local list = { "Callgraph", "Functions" }

local function annotateSearchFilterNodes(p0, p1, p2, p3, p4, p5)
	-- upvalues: annotateSearchFilterNodes (ref)
	local var38 = p0.Nodes[p4]
	
	if not var38.Children then
		p2[p4] = if p3 > 0 then p1[p3] else p5
		
		return p3 > 0 and p1[p3]
	end
	local children = var38.Children
	local var39 = false
	
	if p3 > 0 and p1[p3] then
		var39 = true
		p2[p4] = true
		
		for i, v in pairs(children) do
			p2[v] = true
			annotateSearchFilterNodes(p0, p1, p2, i, v, true)
		end
		return var39
	else
		for i, v in pairs(children) do
			var39 = var39 or annotateSearchFilterNodes(p0, p1, p2, i, v, p5)
		end
		if var39 or p5 then
			p2[p4] = true
		end
		return var39
	end
end

local function generateSearchFilters(p6, p7)
	-- upvalues: profilerUtilModule (ref), annotateSearchFilterNodes (ref)
	if p7 == "" then
		return nil, nil
	end
	local data = p6.data
	
	if not data then
		return nil, nil
	end
	local list = table.create(#data.Functions, false)
	
	for i, v in data.Functions do
		local name = profilerUtilModule.getName(data, v)
		
		if name and string.find(name, p7, 1, true) then
			list[i] = true
		end
	end
	local nodeId, sourceName
	local list_1 = table.create(#data.Nodes, false)
	
	for i_1, v_1 in data.Categories do
		nodeId = v_1.NodeId
		sourceName = data.Nodes[nodeId]
		
		if not sourceName.Children then
			list_1[nodeId] = false
			continue
		end
		local var43 = false
		
		for i_2, v_2 in pairs(sourceName.Children) do
			var43 = var43 or annotateSearchFilterNodes(data, list, list_1, i_2, v_2, false)
		end
		if var43 then
			list_1[nodeId] = true
		end
	end
	for i_2, v_2 in data.Functions do
		if list[i_2] ~= true and not profilerUtilModule.getName(data, v_2) then
			sourceName = profilerUtilModule.getSourceName(data, v_2)
			
			if sourceName and string.find(sourceName, p7, 1, true) then
				list[i_2] = true
			end
		end
	end
	return list, list_1
end

local function generatePluginDurationOffsets(value, p8)
	-- upvalues: getPluginFlag (ref), getDurations (ref)
	if not p8 then
		return {}, {}
	end
	assert(p8.Version == 2)
	local list = table.create(#p8.Categories, 0)
	local list_1 = table.create(#p8.Categories, 0)
	local var47 = 0
	local var48 = 0
	
	for i, v in p8.Categories do
		local nodeId = p8.Nodes[v.NodeId]
		local var49 = 0
		local var50 = 0
		local children = nodeId.Children
		
		if children then
			for i_1, v_1 in pairs(children) do
				local _ = p8.Functions[i_1]
				
				if getPluginFlag(p8, p8.Functions[i_1]) then
					var49 += getDurations(p8, v_1)
					
					if #value > 0 then
						var50 += value[v_1]
					end
				end
			end
		end
		list[i] = var49
		list_1[i] = var50
		var47 += var49
		var48 += var50
	end
	list.Total = var47
	list_1.Total = var47
	
	return list, list_1
end

local function getGCOverhead(p9, p10, p11, p12, p13)
	-- upvalues: getGCOverhead (ref)
	local var51 = p11.Nodes[p12]
	local var52 = 0
	
	if var51.Children then
		for i, v in pairs(var51.Children) do
			local var53 = if i == p13 then p11.Nodes[v].TotalDuration else getGCOverhead(p9, p10, p11, v, p13)
			p9[i] += var53
			p10[v] = var53
			var52 += var53
		end
	end
	return var52
end

local function generateGCOverheadOffsets(value)
	-- upvalues: getGCOverhead (ref)
	if not value or not value.GCFuncId then
		return {}, {}
	end
	local GCFuncId = value.GCFuncId
	local list = table.create(#value.Functions, 0)
	local list_1 = table.create(#value.Nodes, 0)
	local var56 = 0
	
	for i, v in value.Categories do
		local nodeId = v.NodeId
		local var57 = getGCOverhead(list, list_1, value, nodeId, GCFuncId)
		var56 += var57
		list_1[nodeId] = var57
	end
	list_1.Total = var56
	
	return list, list_1
end

function mainViewScriptProfiler.getActiveState(p14)
	local isClientView = p14.props.isClientView
	
	if p14.props.isClientView then
		return isClientView, p14.props.client
	end
	return isClientView, p14.props.server
end

function mainViewScriptProfiler.getState(p15, p16)
	return if p16 then p15.props.client else p15.props.server
end

function mainViewScriptProfiler.UpdateState(p17, p18, p19)
	if p18 then
		p17.props.dispatchSetScriptProfilerState(nil, nil, p19, nil)
		
		return
	end
	p17.props.dispatchSetScriptProfilerState(nil, nil, nil, p19)
end

local function OnNewProfilingData(p20, p21, p22)
	-- upvalues: scriptProfilerService (ref), generateGCOverheadOffsets (ref), scriptProfilerShowPlugins2 (ref), generatePluginDurationOffsets (ref)
	p20.serializedData = p22
	p20.data = scriptProfilerService:DeserializeJSON(p22)
	local var58, var59 = generateGCOverheadOffsets(p20.data)
	p20.gcFunctionOffsets = var58
	p20.gcNodeOffsets = var59
	
	if scriptProfilerShowPlugins2 then
		local var60, var61 = generatePluginDurationOffsets(p20.gcNodeOffsets, p20.data)
		p20.pluginOffsets = var60
		p20.pluginGCOffsets = var61
	end
	local list = table.create(if p20.data then #p20.data.Nodes else 0, false)
	table.move(p21.expandedNodes, 1, if p21.data then #p21.data.Nodes else 0, 1, list)
	p20.expandedNodes = list
end

function mainViewScriptProfiler.init(p23)
	-- upvalues: scriptProfilerService (ref), playersService (ref), scriptProfilerLiveUpdateIntervalMS (ref), generateSearchFilters (ref), roactModule (ref)
	local function _(p24, p25)
		-- upvalues: scriptProfilerService (copy), playersService (copy)
		if p24 then
			scriptProfilerService:ClientStart(playersService.LocalPlayer, p25.frequency)
			
			return
		end
		scriptProfilerService:ServerStart(p25.frequency)
	end
	
	local _ = function(p26)
		-- upvalues: scriptProfilerService (copy), playersService (copy)
		if p26 then
			scriptProfilerService:ClientStop(playersService.LocalPlayer)
		else
			scriptProfilerService:ServerStop()
		end
		return nil
	end
	
	local _ = function(p27)
		-- upvalues: scriptProfilerService (copy), playersService (copy)
		if p27 then
			scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
			
			return
		end
		scriptProfilerService:ServerRequestData()
	end
	
	local _ = function(p28)
		-- upvalues: p23 (ref), scriptProfilerService (copy), playersService (copy)
		if p23:getState(p28).isProfiling then
			if p28 then
				scriptProfilerService:ClientStop(playersService.LocalPlayer)
			else
				scriptProfilerService:ServerStop()
			end
			local _ = nil
			p23.props.dispatchSetIsProfiling(p28, false)
			
			if p28 then
				scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
				
				return
			end
			scriptProfilerService:ServerRequestData()
		end
	end
	
	function p23.onUtilTabHeightChanged(p29)
		-- upvalues: p23 (ref)
		p23:setState({ utilTabHeight = p29 })
	end
	
	local function UpdateTimedProfilingTimer(p30)
		-- upvalues: p23 (ref)
		while task.wait(0.5) do
			local timedProfilingCountdown = p23:getState(p30).timedProfilingCountdown
			
			if timedProfilingCountdown <= 0 then break end
			p23.props.dispatchSetTimer(p30, { timedProfilingCountdown = timedProfilingCountdown - 0.5 })
		end
	end
	
	local function LiveUpdate(p31)
		-- upvalues: scriptProfilerLiveUpdateIntervalMS (copy), p23 (ref), scriptProfilerService (copy), playersService (copy)
		while task.wait(scriptProfilerLiveUpdateIntervalMS / 1000) do
			if not p23:getState(p31).liveUpdate then continue end
			if p31 then
				scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
			else
				scriptProfilerService:ServerRequestData()
			end
		end
	end
	
	function p23.onBeginProfile()
		-- upvalues: p23 (ref), scriptProfilerService (copy), playersService (copy), UpdateTimedProfilingTimer (ref), LiveUpdate (ref)
		local activeState, activeState_1 = p23:getActiveState()
		
		if activeState then
			scriptProfilerService:ClientStart(playersService.LocalPlayer, activeState_1.frequency)
		else
			scriptProfilerService:ServerStart(activeState_1.frequency)
		end
		p23.props.dispatchSetIsProfiling(activeState, true)
		p23.props.dispatchClearStateForNewSession(activeState)
		local t = {}
		
		if activeState_1.timedProfilingDuration > 0 then
			p23.props.dispatchSetTimer(activeState, {
				timedProfilingCountdown = activeState_1.timedProfilingDuration
			})
			t.timedProfilingThread = task.delay(activeState_1.timedProfilingDuration, function()
				-- upvalues: activeState (ref), p23 (copy), scriptProfilerService (copy), playersService (copy)
				if p23:getState(activeState).isProfiling then
					if activeState then
						scriptProfilerService:ClientStop(playersService.LocalPlayer)
					else
						scriptProfilerService:ServerStop()
					end
					local _ = nil
					p23.props.dispatchSetIsProfiling(activeState, false)
					
					if activeState then
						scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
						
						return
					end
					scriptProfilerService:ServerRequestData()
				end
			end)
			t.timedProfilingTimerThread = task.spawn(function()
				-- upvalues: UpdateTimedProfilingTimer (copy), activeState (ref)
				UpdateTimedProfilingTimer(activeState)
			end)
		end
		t.liveUpdateThread = task.spawn(LiveUpdate, activeState)
		p23.props.dispatchSetThreads(activeState, t)
	end
	
	function p23.onEndProfile()
		-- upvalues: p23 (ref), scriptProfilerService (copy), playersService (copy)
		local activeState, activeState_1 = p23:getActiveState()
		
		if activeState then
			scriptProfilerService:ClientStop(playersService.LocalPlayer)
		else
			scriptProfilerService:ServerStop()
		end
		local _ = nil
		local t = {}
		
		if activeState_1.timedProfilingThread then
			task.cancel(activeState_1.timedProfilingThread)
			t.timedProfilingThread = nil
		end
		if activeState_1.timedProfilingTimerThread then
			task.cancel(activeState_1.timedProfilingTimerThread)
			t.timedProfilingTimerThread = nil
		end
		if activeState_1.liveUpdateThread then
			task.cancel(activeState_1.liveUpdateThread)
			t.liveUpdateThread = nil
		end
		p23.props.dispatchSetThreads(activeState, {})
		p23.props.dispatchSetIsProfiling(activeState, false)
		
		if activeState then
			scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
			
			return
		end
		scriptProfilerService:ServerRequestData()
	end
	
	function p23.toggleTimedProfiling()
		-- upvalues: p23 (ref)
		local activeState, activeState_1 = p23:getActiveState()
		local timedProfilingDuration = activeState_1.timedProfilingDuration
		p23.props.dispatchSetTimer(activeState, {
			timedProfilingDuration = if timedProfilingDuration == 0 then 60 elseif timedProfilingDuration == 60 then 300 elseif timedProfilingDuration == 300 then 600 else 0
		})
	end
	
	function p23.toggleAverage()
		-- upvalues: p23 (ref)
		local activeState, activeState_1 = p23:getActiveState()
		local average = activeState_1.average
		p23.props.dispatchSetAverage(activeState, if average == 0 then 1 elseif average == 1 then 60 elseif average == 60 then 300 elseif average == 300 then 600 else 0)
	end
	
	function p23.toggleUnits()
		-- upvalues: p23 (ref)
		p23.props.dispatchSetScriptProfilerState(nil, not p23.props.usePercentages, nil, nil)
	end
	
	function p23.toggleFrequency()
		-- upvalues: p23 (ref)
		local activeState, activeState_1 = p23:getActiveState()
		p23.props.dispatchSetFrequency(activeState, if activeState_1.frequency == 1000 then 10000 else 1000)
	end
	
	function p23.onClientButton()
		-- upvalues: p23 (ref)
		p23.props.dispatchSetScriptProfilerState(true)
	end
	
	function p23.onServerButton()
		-- upvalues: p23 (ref)
		p23.props.dispatchSetScriptProfilerState(false)
	end
	
	function p23.dataViewDropDownCallback(p32)
		-- upvalues: p23 (ref)
		local activeState, activeState_1 = p23:getActiveState()
		local isFunctionsView = activeState_1.isFunctionsView
		
		if p32 == 1 then
			isFunctionsView = false
		elseif p32 == 2 then
			isFunctionsView = true
		end
		p23.props.dispatchSetDataView(activeState, isFunctionsView)
	end
	
	function p23.onCheckboxChanged(p33, p34)
		-- upvalues: p23 (ref)
		local isClientView = p23.props.isClientView
		
		if p33 == "Live" then
			p23.props.dispatchSetLiveUpdate(isClientView, p34)
			
			return
		elseif p33 == "Plugins" then
			p23.props.dispatchSetShowPlugins(isClientView, p34)
			
			return
		elseif p33 == "GC" then
			p23.props.dispatchSetShowGC(isClientView, p34)
		end
	end
	
	function p23.onSearchTermChanged(p35)
		-- upvalues: p23 (ref), generateSearchFilters (copy)
		local activeState, activeState_1 = p23:getActiveState()
		local var81, var82 = generateSearchFilters(activeState_1, p35)
		p23.props.dispatchSetSearchData(activeState, {
			searchTerm = p35,
			searchFilterFlat = var81 or {},
			searchFilterGraph = var82 or {}
		})
	end
	
	p23.utilRef = roactModule.createRef()
	p23.state = { utilTabHeight = 0 }
end

function mainViewScriptProfiler.didMount(p36)
	-- upvalues: scriptProfilerService (ref), OnNewProfilingData (ref)
	p36:setState({ utilTabHeight = p36.utilRef.current.Size.Y.Offset })
	p36.scriptProfilerConnection = scriptProfilerService.OnNewData:Connect(function(p37, p38)
		-- upvalues: p36 (ref), OnNewProfilingData (copy)
		local var83 = p37 ~= nil
		local t = {}
		OnNewProfilingData(t, p36:getState(var83), p38)
		p36.props.dispatchSetData(var83, t)
	end)
end

function mainViewScriptProfiler.willUnmount(p39)
	p39.scriptProfilerConnection:Disconnect()
	p39.scriptProfilerConnection = nil
end

function mainViewScriptProfiler.didUpdate(p40)
	local size = p40.utilRef.current.Size
	
	if size.Y.Offset ~= p40.state.utilTabHeight then
		p40:setState({ utilTabHeight = size.Y.Offset })
	end
end

local function _(p41)
	-- upvalues: profilerUtilModule (ref)
	local var85 = profilerUtilModule.formatTimer(p41)
	
	return if var85 == "" then var85 else ": " .. var85
end

function mainViewScriptProfiler.renderUtilButtons(p42, p43, p44, p45)
	-- upvalues: roactModule (ref), boxButtonModule (ref), formatFrequency (ref), mainWindowHeader_1 (ref), text (ref), mainWindowHeader (ref), constantsModule (ref), unselectedGray (ref), profilerUtilModule (ref), dropDownModule (ref), smallFrameHeight (ref), list (ref)
	local isProfiling = p43.isProfiling
	local t = {}
	table.insert(t, roactModule.createElement(boxButtonModule, {
		text = if isProfiling then "Stop" else "Start",
		onClicked = if isProfiling then p42.onEndProfile else p42.onBeginProfile
	}))
	
	if not p45 then
		table.insert(t, roactModule.createElement(boxButtonModule, {
			text = if p42.props.usePercentages then "Unit: %" else "Unit: ms",
			onClicked = p42.toggleUnits
		}))
	end
	if not p45 then
		table.insert(t, roactModule.createElement("TextButton", {
			Text = "Freq: " .. formatFrequency(p43.frequency),
			TextSize = mainWindowHeader_1,
			TextColor3 = text,
			Font = mainWindowHeader,
			AutoButtonColor = true,
			BackgroundColor3 = if isProfiling then constantsModule.Color.InactiveBox else unselectedGray,
			BackgroundTransparency = 0,
			[roactModule.Event.Activated] = function()
				-- upvalues: isProfiling (ref), p42 (ref)
				if not isProfiling then
					p42.toggleFrequency()
				end
			end
		}))
	end
	if not p45 then
		local var87 = t
		local createElement = roactModule.createElement
		local var88 = "TextButton"
		local t_1 = {}
		local var90 = profilerUtilModule.formatTimer(if isProfiling then p43.timedProfilingCountdown else p43.timedProfilingDuration)
		t_1.Text = "Time" .. (if var90 ~= "" then var90 else ": " .. var90)
		t_1.TextSize = mainWindowHeader_1
		t_1.TextColor3 = text
		t_1.Font = mainWindowHeader
		t_1.AutoButtonColor = true
		t_1.BackgroundColor3 = if isProfiling then constantsModule.Color.InactiveBox else unselectedGray
		t_1.BackgroundTransparency = 0
		
		t_1[roactModule.Event.Activated] = function()
			-- upvalues: isProfiling (ref), p42 (ref)
			if not isProfiling then
				p42.toggleTimedProfiling()
			end
		end
		
		table.insert(var87, createElement(var88, t_1))
	end
	if not p45 then
		local var91 = t
		local createElement = roactModule.createElement
		local var92 = "TextButton"
		local t_1 = {}
		local var94 = profilerUtilModule.formatTimer(p43.average)
		t_1.Text = "Average" .. (if var94 ~= "" then var94 else ": " .. var94)
		t_1.TextSize = mainWindowHeader_1
		t_1.TextColor3 = text
		t_1.Font = mainWindowHeader
		t_1.AutoButtonColor = true
		t_1.BackgroundColor3 = if isProfiling then constantsModule.Color.InactiveBox else unselectedGray
		t_1.BackgroundTransparency = 0
		
		t_1[roactModule.Event.Activated] = function()
			-- upvalues: isProfiling (ref), p42 (ref)
			if not isProfiling then
				p42.toggleAverage()
			end
		end
		
		table.insert(var91, createElement(var92, t_1))
	end
	if not p45 then
		table.insert(t, roactModule.createElement(boxButtonModule, {
			text = "Export",
			onClicked = p42.props.dispatchStartExport
		}))
	end
	if not p45 then
		table.insert(t, roactModule.createElement(dropDownModule, {
			buttonSize = UDim2.new(0, 100, 0, smallFrameHeight),
			dropDownList = list,
			selectedIndex = if p43.isFunctionsView then 2 else 1,
			onSelection = p42.dataViewDropDownCallback
		}))
	end
	if p44 then
		table.insert(t, roactModule.createElement(boxButtonModule, {
			text = "More...",
			onClicked = function()
				-- upvalues: p42 (ref)
				p42.props.dispatchShowMobileSettings()
			end
		}))
	end
	return t
end

function mainViewScriptProfiler.renderUtilAndTab(p46, p47, p48)
	-- upvalues: roactModule (ref), utilAndTabModule (ref), immutableModule (ref)
	return roactModule.createElement(utilAndTabModule, immutableModule.JoinDictionaries({
		layoutOrder = 1,
		windowWidth = p46.props.size.X.Offset,
		formFactor = p46.props.formFactor,
		tabList = p46.props.tabList,
		refForParent = p46.utilRef,
		onHeightChanged = p46.onUtilTabHeightChanged
	}, p47), p48)
end

function mainViewScriptProfiler.renderExportView(p49)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), boxButtonModule (ref), profilerExportViewModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = p49.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = p49:renderUtilAndTab({}, {
			roactModule.createElement(boxButtonModule, {
				text = "Exit",
				onClicked = p49.props.dispatchFinishedExporting
			})
		}),
		ExportView = roactModule.createElement(profilerExportViewModule, { size = UDim2.new(1, 0, 1, -p49.state.utilTabHeight) })
	})
end

function mainViewScriptProfiler.renderMobileSettingsUI(value)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), boxButtonModule (ref), mobileSettingsViewModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = value.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = value:renderUtilAndTab({}, {
			roactModule.createElement(boxButtonModule, {
				text = "Export",
				onClicked = value.props.dispatchStartExport
			}),
			roactModule.createElement(boxButtonModule, {
				text = "Exit",
				onClicked = value.props.dispatchHideMobileSettings
			})
		}),
		MobileSettingsView = roactModule.createElement(mobileSettingsViewModule, { size = UDim2.new(1, 0, 1, -value.state.utilTabHeight) })
	})
end

function mainViewScriptProfiler.renderProfilerView(p50, p51, p52, p53, p54)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), profilerFunctionsViewModule (ref), profilerViewModule (ref), scriptProfilerShowPlugins2 (ref)
	local isProfiling = p52.isProfiling
	local data = p52.data
	local isFunctionsView = p52.isFunctionsView
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = p50.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = p50:renderUtilAndTab({
			isClientView = p51,
			onClientButton = p50.onClientButton,
			onServerButton = p50.onServerButton,
			orderedCheckboxState = p54,
			onCheckboxChanged = p50.onCheckboxChanged,
			onSearchTermChanged = p50.onSearchTermChanged,
			searchTerm = p52.searchTerm
		}, p53),
		ProfilerView = roactModule.createElement(if isFunctionsView then profilerFunctionsViewModule else profilerViewModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -p50.state.utilTabHeight),
			searchFilter = if isFunctionsView then p52.searchFilterFlat else p52.searchFilterGraph,
			data = data,
			profiling = isProfiling,
			showAsPercentages = p50.props.usePercentages,
			sessionLength = if data and data.SessionStartTime and data.SessionEndTime then data.SessionEndTime - data.SessionStartTime else nil,
			rootNode = p52.rootNode,
			rootFunc = p52.rootFunc,
			rootNodeName = p52.rootNodeName,
			average = p52.average,
			showPlugins = p52.showPlugins or not scriptProfilerShowPlugins2,
			pluginOffsets = p52.pluginOffsets,
			showGC = p52.showGC,
			gcFunctionOffsets = p52.gcFunctionOffsets,
			gcNodeOffsets = p52.gcNodeOffsets,
			pluginGCOffsets = p52.pluginGCOffsets,
			expandedNodes = if isFunctionsView then nil else p52.expandedNodes
		})
	})
end

function mainViewScriptProfiler.render(p55)
	-- upvalues: constantsModule (ref), scriptProfilerShowPlugins2 (ref)
	if p55.props.isExporting then
		return p55:renderExportView()
	elseif p55.props.isShowingMobileSettings then
		return p55:renderMobileSettingsUI()
	end
	local formFactor = p55.props.formFactor
	local activeState, activeState_1 = p55:getActiveState()
	local t = {}
	local var98 = 1
	local var99 = formFactor == constantsModule.FormFactor.Small
	
	if not var99 then
		t[1] = { name = "Live", state = activeState_1.liveUpdate }
		
		if scriptProfilerShowPlugins2 then
			var98 += 1
			t[var98] = { name = "Plugins", state = activeState_1.showPlugins }
		end
		t[var98 + 1] = { name = "GC", state = activeState_1.showGC }
	end
	return p55:renderProfilerView(activeState, activeState_1, p55:renderUtilButtons(activeState_1, var99, var99), t)
end

return roactRoduxModule.UNSTABLE_connect2(function(p56, _)
	return {
		isClientView = p56.ScriptProfiler.isClientView,
		usePercentages = p56.ScriptProfiler.usePercentages,
		isExporting = p56.ScriptProfiler.isExporting,
		isShowingMobileSettings = p56.ScriptProfiler.isShowingMobileSettings,
		client = p56.ScriptProfiler.client,
		server = p56.ScriptProfiler.server
	}
end, function(p57)
	-- upvalues: setScriptProfilerStateModule (ref), setIsProfilingModule (ref), setDataModule (ref), setThreadsModule (ref), setTimerStateModule (ref), clearStateForNewProfilingSessionModule (ref), setAverageModule (ref), setFrequencyModule (ref), setDataViewModule (ref), setLiveUpdateModule (ref), setShowPluginsModule (ref), setShowGCModule (ref), setSearchDataModule (ref)
	return {
		dispatchSetScriptProfilerState = function(value, p58, p59, p60)
			-- upvalues: p57 (ref), setScriptProfilerStateModule (copy)
			p57(setScriptProfilerStateModule(value, p58, p59, p60))
		end,
		dispatchSetIsProfiling = function(value, p61)
			-- upvalues: p57 (ref), setIsProfilingModule (copy)
			p57(setIsProfilingModule(value, p61))
		end,
		dispatchSetData = function(value, p62)
			-- upvalues: p57 (ref), setDataModule (copy)
			p57(setDataModule(value, p62))
		end,
		dispatchSetThreads = function(value, p63)
			-- upvalues: p57 (ref), setThreadsModule (copy)
			p57(setThreadsModule(value, p63))
		end,
		dispatchSetTimer = function(value, p64)
			-- upvalues: p57 (ref), setTimerStateModule (copy)
			p57(setTimerStateModule(value, p64))
		end,
		dispatchClearStateForNewSession = function(p65)
			-- upvalues: p57 (ref), clearStateForNewProfilingSessionModule (copy)
			p57(clearStateForNewProfilingSessionModule(p65))
		end,
		dispatchSetAverage = function(value, p66)
			-- upvalues: p57 (ref), setAverageModule (copy)
			p57(setAverageModule(value, p66))
		end,
		dispatchSetFrequency = function(value, p67)
			-- upvalues: p57 (ref), setFrequencyModule (copy)
			p57(setFrequencyModule(value, p67))
		end,
		dispatchSetDataView = function(value, p68)
			-- upvalues: p57 (ref), setDataViewModule (copy)
			p57(setDataViewModule(value, p68))
		end,
		dispatchSetLiveUpdate = function(value, p69)
			-- upvalues: p57 (ref), setLiveUpdateModule (copy)
			p57(setLiveUpdateModule(value, p69))
		end,
		dispatchSetShowPlugins = function(value, p70)
			-- upvalues: p57 (ref), setShowPluginsModule (copy)
			p57(setShowPluginsModule(value, p70))
		end,
		dispatchSetShowGC = function(value, p71)
			-- upvalues: p57 (ref), setShowGCModule (copy)
			p57(setShowGCModule(value, p71))
		end,
		dispatchSetSearchData = function(value, p72)
			-- upvalues: p57 (ref), setSearchDataModule (copy)
			p57(setSearchDataModule(value, p72))
		end,
		dispatchStartExport = function()
			-- upvalues: p57 (ref), setScriptProfilerStateModule (copy)
			p57(setScriptProfilerStateModule(nil, nil, nil, nil, true))
		end,
		dispatchFinishedExporting = function()
			-- upvalues: p57 (ref), setScriptProfilerStateModule (copy)
			p57(setScriptProfilerStateModule(nil, nil, nil, nil, false))
		end,
		dispatchShowMobileSettings = function()
			-- upvalues: p57 (ref), setScriptProfilerStateModule (copy)
			p57(setScriptProfilerStateModule(nil, nil, nil, nil, nil, true))
		end,
		dispatchHideMobileSettings = function()
			-- upvalues: p57 (ref), setScriptProfilerStateModule (copy)
			p57(setScriptProfilerStateModule(nil, nil, nil, nil, nil, false))
		end
	}
end)(mainViewScriptProfiler)