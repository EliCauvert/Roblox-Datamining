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

local function annotateSearchFilterNodes(p1, p2, p3, p4, p5, p6)
	-- upvalues: annotateSearchFilterNodes (ref)
	local var1 = p1.Nodes[p5]
	
	if not var1.Children then
		p3[p5] = if p4 > 0 then p2[p4] else p6
		
		return p4 > 0 and p2[p4]
	end
	local children = var1.Children
	local var2 = false
	
	if p4 > 0 and p2[p4] then
		var2 = true
		p3[p5] = true
		
		for i, v in pairs(children) do
			p3[v] = true
			annotateSearchFilterNodes(p1, p2, p3, i, v, true)
		end
		return var2
	else
		for i, v in pairs(children) do
			var2 = var2 or annotateSearchFilterNodes(p1, p2, p3, i, v, p6)
		end
		if var2 or p6 then
			p3[p5] = true
		end
		return var2
	end
end

local function generateSearchFilters(p7, p8)
	-- upvalues: profilerUtilModule (ref), annotateSearchFilterNodes (ref)
	if p8 == "" then
		return nil, nil
	end
	local data = p7.data
	
	if not data then
		return nil, nil
	end
	local list = table.create(#data.Functions, false)
	
	for i, v in data.Functions do
		local name = profilerUtilModule.getName(data, v)
		
		if name and string.find(name, p8, 1, true) then
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
		local var3 = false
		
		for i_2, v_2 in pairs(sourceName.Children) do
			var3 = var3 or annotateSearchFilterNodes(data, list, list_1, i_2, v_2, false)
		end
		if var3 then
			list_1[nodeId] = true
		end
	end
	for i_2, v_2 in data.Functions do
		if list[i_2] ~= true and not profilerUtilModule.getName(data, v_2) then
			sourceName = profilerUtilModule.getSourceName(data, v_2)
			
			if sourceName and string.find(sourceName, p8, 1, true) then
				list[i_2] = true
			end
		end
	end
	return list, list_1
end

local function generatePluginDurationOffsets(value, p9)
	-- upvalues: getPluginFlag (ref), getDurations (ref)
	if not p9 then
		return {}, {}
	end
	assert(p9.Version == 2)
	local list = table.create(#p9.Categories, 0)
	local list_1 = table.create(#p9.Categories, 0)
	local var4 = 0
	local var5 = 0
	
	for i, v in p9.Categories do
		local nodeId = p9.Nodes[v.NodeId]
		local var6 = 0
		local var7 = 0
		local children = nodeId.Children
		
		if children then
			for i_1, v_1 in pairs(children) do
				local _ = p9.Functions[i_1]
				
				if getPluginFlag(p9, p9.Functions[i_1]) then
					var6 += getDurations(p9, v_1)
					
					if #value > 0 then
						var7 += value[v_1]
					end
				end
			end
		end
		list[i] = var6
		list_1[i] = var7
		var4 += var6
		var5 += var7
	end
	list.Total = var4
	list_1.Total = var4
	
	return list, list_1
end

local function getGCOverhead(p10, p11, p12, p13, p14)
	-- upvalues: getGCOverhead (ref)
	local var8 = p12.Nodes[p13]
	local var9 = 0
	
	if var8.Children then
		for i, v in pairs(var8.Children) do
			local var10 = if i == p14 then p12.Nodes[v].TotalDuration else getGCOverhead(p10, p11, p12, v, p14)
			p10[i] += var10
			p11[v] = var10
			var9 += var10
		end
	end
	return var9
end

local function generateGCOverheadOffsets(value)
	-- upvalues: getGCOverhead (ref)
	if not value or not value.GCFuncId then
		return {}, {}
	end
	local GCFuncId = value.GCFuncId
	local list = table.create(#value.Functions, 0)
	local list_1 = table.create(#value.Nodes, 0)
	local var11 = 0
	
	for i, v in value.Categories do
		local nodeId = v.NodeId
		local var12 = getGCOverhead(list, list_1, value, nodeId, GCFuncId)
		var11 += var12
		list_1[nodeId] = var12
	end
	list_1.Total = var11
	
	return list, list_1
end

function mainViewScriptProfiler.getActiveState(p15)
	local isClientView = p15.props.isClientView
	
	if p15.props.isClientView then
		return isClientView, p15.props.client
	end
	return isClientView, p15.props.server
end

function mainViewScriptProfiler.getState(p15, p16)
	return if p16 then p15.props.client else p15.props.server
end

function mainViewScriptProfiler.UpdateState(p15, p16, p17)
	if p16 then
		p15.props.dispatchSetScriptProfilerState(nil, nil, p17, nil)
		
		return
	end
	p15.props.dispatchSetScriptProfilerState(nil, nil, nil, p17)
end

local function OnNewProfilingData(p15, p16, p17)
	-- upvalues: scriptProfilerService (ref), generateGCOverheadOffsets (ref), scriptProfilerShowPlugins2 (ref), generatePluginDurationOffsets (ref)
	p15.serializedData = p17
	p15.data = scriptProfilerService:DeserializeJSON(p17)
	local var13, var14 = generateGCOverheadOffsets(p15.data)
	p15.gcFunctionOffsets = var13
	p15.gcNodeOffsets = var14
	
	if scriptProfilerShowPlugins2 then
		local var15, var16 = generatePluginDurationOffsets(p15.gcNodeOffsets, p15.data)
		p15.pluginOffsets = var15
		p15.pluginGCOffsets = var16
	end
	local list = table.create(if p15.data then #p15.data.Nodes else 0, false)
	table.move(p16.expandedNodes, 1, if p16.data then #p16.data.Nodes else 0, 1, list)
	p15.expandedNodes = list
end

function mainViewScriptProfiler.init(p15)
	-- upvalues: scriptProfilerService (ref), playersService (ref), scriptProfilerLiveUpdateIntervalMS (ref), generateSearchFilters (ref), roactModule (ref)
	local function _(p16, p17)
		-- upvalues: scriptProfilerService (copy), playersService (copy)
		if p16 then
			scriptProfilerService:ClientStart(playersService.LocalPlayer, p17.frequency)
			
			return
		end
		scriptProfilerService:ServerStart(p17.frequency)
	end
	
	local _ = function(p16)
		-- upvalues: scriptProfilerService (copy), playersService (copy)
		if p16 then
			scriptProfilerService:ClientStop(playersService.LocalPlayer)
		else
			scriptProfilerService:ServerStop()
		end
		return nil
	end
	
	local _ = function(p16)
		-- upvalues: scriptProfilerService (copy), playersService (copy)
		if p16 then
			scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
			
			return
		end
		scriptProfilerService:ServerRequestData()
	end
	
	local _ = function(p16)
		-- upvalues: p15 (ref), scriptProfilerService (copy), playersService (copy)
		if p15:getState(p16).isProfiling then
			if p16 then
				scriptProfilerService:ClientStop(playersService.LocalPlayer)
			else
				scriptProfilerService:ServerStop()
			end
			local _ = nil
			p15.props.dispatchSetIsProfiling(p16, false)
			
			if p16 then
				scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
				
				return
			end
			scriptProfilerService:ServerRequestData()
		end
	end
	
	function p23.onUtilTabHeightChanged(p16)
		-- upvalues: p15 (ref)
		p15:setState({ utilTabHeight = p16 })
	end
	
	local function UpdateTimedProfilingTimer(p16)
		-- upvalues: p15 (ref)
		while task.wait(0.5) do
			local timedProfilingCountdown = p15:getState(p16).timedProfilingCountdown
			
			if timedProfilingCountdown <= 0 then break end
			p15.props.dispatchSetTimer(p16, { timedProfilingCountdown = timedProfilingCountdown - 0.5 })
		end
	end
	
	local function LiveUpdate(p17)
		-- upvalues: scriptProfilerLiveUpdateIntervalMS (copy), p15 (ref), scriptProfilerService (copy), playersService (copy)
		while task.wait(scriptProfilerLiveUpdateIntervalMS / 1000) do
			if not p15:getState(p17).liveUpdate then continue end
			if p17 then
				scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
			else
				scriptProfilerService:ServerRequestData()
			end
		end
	end
	
	function p23.onBeginProfile()
		-- upvalues: p15 (ref), scriptProfilerService (copy), playersService (copy), UpdateTimedProfilingTimer (ref), LiveUpdate (ref)
		local activeState, activeState_1 = p15:getActiveState()
		
		if activeState then
			scriptProfilerService:ClientStart(playersService.LocalPlayer, activeState_1.frequency)
		else
			scriptProfilerService:ServerStart(activeState_1.frequency)
		end
		p15.props.dispatchSetIsProfiling(activeState, true)
		p15.props.dispatchClearStateForNewSession(activeState)
		local t = {}
		
		if activeState_1.timedProfilingDuration > 0 then
			p15.props.dispatchSetTimer(activeState, {
				timedProfilingCountdown = activeState_1.timedProfilingDuration
			})
			t.timedProfilingThread = task.delay(activeState_1.timedProfilingDuration, function()
				-- upvalues: activeState (ref), p15 (copy), scriptProfilerService (copy), playersService (copy)
				if p15:getState(activeState).isProfiling then
					if activeState then
						scriptProfilerService:ClientStop(playersService.LocalPlayer)
					else
						scriptProfilerService:ServerStop()
					end
					local _ = nil
					p15.props.dispatchSetIsProfiling(activeState, false)
					
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
		p15.props.dispatchSetThreads(activeState, t)
	end
	
	function p23.onEndProfile()
		-- upvalues: p15 (ref), scriptProfilerService (copy), playersService (copy)
		local activeState, activeState_1 = p15:getActiveState()
		
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
		p15.props.dispatchSetThreads(activeState, {})
		p15.props.dispatchSetIsProfiling(activeState, false)
		
		if activeState then
			scriptProfilerService:ClientRequestData(playersService.LocalPlayer)
			
			return
		end
		scriptProfilerService:ServerRequestData()
	end
	
	function p23.toggleTimedProfiling()
		-- upvalues: p15 (ref)
		local activeState, activeState_1 = p15:getActiveState()
		local timedProfilingDuration = activeState_1.timedProfilingDuration
		p15.props.dispatchSetTimer(activeState, {
			timedProfilingDuration = if timedProfilingDuration == 0 then 60 elseif timedProfilingDuration == 60 then 300 elseif timedProfilingDuration == 300 then 600 else 0
		})
	end
	
	function p23.toggleAverage()
		-- upvalues: p15 (ref)
		local activeState, activeState_1 = p15:getActiveState()
		local average = activeState_1.average
		p15.props.dispatchSetAverage(activeState, if average == 0 then 1 elseif average == 1 then 60 elseif average == 60 then 300 elseif average == 300 then 600 else 0)
	end
	
	function p23.toggleUnits()
		-- upvalues: p15 (ref)
		p15.props.dispatchSetScriptProfilerState(nil, not p15.props.usePercentages, nil, nil)
	end
	
	function p23.toggleFrequency()
		-- upvalues: p15 (ref)
		local activeState, activeState_1 = p15:getActiveState()
		p15.props.dispatchSetFrequency(activeState, if activeState_1.frequency == 1000 then 10000 else 1000)
	end
	
	function p23.onClientButton()
		-- upvalues: p15 (ref)
		p15.props.dispatchSetScriptProfilerState(true)
	end
	
	function p23.onServerButton()
		-- upvalues: p15 (ref)
		p15.props.dispatchSetScriptProfilerState(false)
	end
	
	function p23.dataViewDropDownCallback(p18)
		-- upvalues: p15 (ref)
		local activeState, activeState_1 = p15:getActiveState()
		local isFunctionsView = activeState_1.isFunctionsView
		
		if p18 == 1 then
			isFunctionsView = false
		elseif p18 == 2 then
			isFunctionsView = true
		end
		p15.props.dispatchSetDataView(activeState, isFunctionsView)
	end
	
	function p23.onCheckboxChanged(p18, p19)
		-- upvalues: p15 (ref)
		local isClientView = p15.props.isClientView
		
		if p18 == "Live" then
			p15.props.dispatchSetLiveUpdate(isClientView, p19)
			
			return
		elseif p18 == "Plugins" then
			p15.props.dispatchSetShowPlugins(isClientView, p19)
			
			return
		elseif p18 == "GC" then
			p15.props.dispatchSetShowGC(isClientView, p19)
		end
	end
	
	function p23.onSearchTermChanged(p18)
		-- upvalues: p15 (ref), generateSearchFilters (copy)
		local activeState, activeState_1 = p15:getActiveState()
		local var13, var14 = generateSearchFilters(activeState_1, p18)
		p15.props.dispatchSetSearchData(activeState, {
			searchTerm = p18,
			searchFilterFlat = var13 or {},
			searchFilterGraph = var14 or {}
		})
	end
	
	p15.utilRef = roactModule.createRef()
	p15.state = { utilTabHeight = 0 }
end

function mainViewScriptProfiler.didMount(p17)
	-- upvalues: scriptProfilerService (ref), OnNewProfilingData (ref)
	p17:setState({ utilTabHeight = p17.utilRef.current.Size.Y.Offset })
	p17.scriptProfilerConnection = scriptProfilerService.OnNewData:Connect(function(p18, p19)
		-- upvalues: p17 (ref), OnNewProfilingData (copy)
		local var13 = p18 ~= nil
		local t = {}
		OnNewProfilingData(t, p17:getState(var13), p19)
		p17.props.dispatchSetData(var13, t)
	end)
end

function mainViewScriptProfiler.willUnmount(p17)
	p17.scriptProfilerConnection:Disconnect()
	p17.scriptProfilerConnection = nil
end

function mainViewScriptProfiler.didUpdate(p17)
	local size = p17.utilRef.current.Size
	
	if size.Y.Offset ~= p17.state.utilTabHeight then
		p17:setState({ utilTabHeight = size.Y.Offset })
	end
end

local function _(p17)
	-- upvalues: profilerUtilModule (ref)
	local var13 = profilerUtilModule.formatTimer(p17)
	
	return if var13 == "" then var13 else ": " .. var85
end

function mainViewScriptProfiler.renderUtilButtons(p17, p18, p19, p20)
	-- upvalues: roactModule (ref), boxButtonModule (ref), formatFrequency (ref), mainWindowHeader_1 (ref), text (ref), mainWindowHeader (ref), constantsModule (ref), unselectedGray (ref), profilerUtilModule (ref), dropDownModule (ref), smallFrameHeight (ref), list (ref)
	local isProfiling = p18.isProfiling
	local t = {}
	table.insert(t, roactModule.createElement(boxButtonModule, {
		text = if isProfiling then "Stop" else "Start",
		onClicked = if isProfiling then p17.onEndProfile else p17.onBeginProfile
	}))
	
	if not p20 then
		table.insert(t, roactModule.createElement(boxButtonModule, {
			text = if p17.props.usePercentages then "Unit: %" else "Unit: ms",
			onClicked = p17.toggleUnits
		}))
	end
	if not p20 then
		table.insert(t, roactModule.createElement("TextButton", {
			Text = "Freq: " .. formatFrequency(p18.frequency),
			TextSize = mainWindowHeader_1,
			TextColor3 = text,
			Font = mainWindowHeader,
			AutoButtonColor = true,
			BackgroundColor3 = if isProfiling then constantsModule.Color.InactiveBox else unselectedGray,
			BackgroundTransparency = 0,
			[roactModule.Event.Activated] = function()
				-- upvalues: isProfiling (ref), p17 (ref)
				if not isProfiling then
					p17.toggleFrequency()
				end
			end
		}))
	end
	if not p20 then
		local var13 = t
		local createElement = roactModule.createElement
		local var14 = "TextButton"
		local t_1 = {}
		local var15 = profilerUtilModule.formatTimer(if isProfiling then p18.timedProfilingCountdown else p18.timedProfilingDuration)
		t_1.Text = "Time" .. (if var15 ~= "" then var15 else ": " .. var90)
		t_1.TextSize = mainWindowHeader_1
		t_1.TextColor3 = text
		t_1.Font = mainWindowHeader
		t_1.AutoButtonColor = true
		t_1.BackgroundColor3 = if isProfiling then constantsModule.Color.InactiveBox else unselectedGray
		t_1.BackgroundTransparency = 0
		
		t_1[roactModule.Event.Activated] = function()
			-- upvalues: isProfiling (ref), p17 (ref)
			if not isProfiling then
				p17.toggleTimedProfiling()
			end
		end
		
		table.insert(var13, createElement(var14, t_1))
	end
	if not p20 then
		local var16 = t
		local createElement = roactModule.createElement
		local var17 = "TextButton"
		local t_1 = {}
		local var18 = profilerUtilModule.formatTimer(p18.average)
		t_1.Text = "Average" .. (if var18 ~= "" then var18 else ": " .. var94)
		t_1.TextSize = mainWindowHeader_1
		t_1.TextColor3 = text
		t_1.Font = mainWindowHeader
		t_1.AutoButtonColor = true
		t_1.BackgroundColor3 = if isProfiling then constantsModule.Color.InactiveBox else unselectedGray
		t_1.BackgroundTransparency = 0
		
		t_1[roactModule.Event.Activated] = function()
			-- upvalues: isProfiling (ref), p17 (ref)
			if not isProfiling then
				p17.toggleAverage()
			end
		end
		
		table.insert(var16, createElement(var17, t_1))
	end
	if not p20 then
		table.insert(t, roactModule.createElement(boxButtonModule, {
			text = "Export",
			onClicked = p17.props.dispatchStartExport
		}))
	end
	if not p20 then
		table.insert(t, roactModule.createElement(dropDownModule, {
			buttonSize = UDim2.new(0, 100, 0, smallFrameHeight),
			dropDownList = list,
			selectedIndex = if p18.isFunctionsView then 2 else 1,
			onSelection = p17.dataViewDropDownCallback
		}))
	end
	if p19 then
		table.insert(t, roactModule.createElement(boxButtonModule, {
			text = "More...",
			onClicked = function()
				-- upvalues: p17 (ref)
				p17.props.dispatchShowMobileSettings()
			end
		}))
	end
	return t
end

function mainViewScriptProfiler.renderUtilAndTab(p17, p18, p19)
	-- upvalues: roactModule (ref), utilAndTabModule (ref), immutableModule (ref)
	return roactModule.createElement(utilAndTabModule, immutableModule.JoinDictionaries({
		layoutOrder = 1,
		windowWidth = p17.props.size.X.Offset,
		formFactor = p17.props.formFactor,
		tabList = p17.props.tabList,
		refForParent = p17.utilRef,
		onHeightChanged = p17.onUtilTabHeightChanged
	}, p18), p19)
end

function mainViewScriptProfiler.renderExportView(p17)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), boxButtonModule (ref), profilerExportViewModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = p17.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = p17:renderUtilAndTab({}, {
			roactModule.createElement(boxButtonModule, {
				text = "Exit",
				onClicked = p17.props.dispatchFinishedExporting
			})
		}),
		ExportView = roactModule.createElement(profilerExportViewModule, { size = UDim2.new(1, 0, 1, -p17.state.utilTabHeight) })
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

function mainViewScriptProfiler.renderProfilerView(p17, p18, p19, p20, p21)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), profilerFunctionsViewModule (ref), profilerViewModule (ref), scriptProfilerShowPlugins2 (ref)
	local isProfiling = p19.isProfiling
	local data = p19.data
	local isFunctionsView = p19.isFunctionsView
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = p17.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = p17:renderUtilAndTab({
			isClientView = p18,
			onClientButton = p17.onClientButton,
			onServerButton = p17.onServerButton,
			orderedCheckboxState = p21,
			onCheckboxChanged = p17.onCheckboxChanged,
			onSearchTermChanged = p17.onSearchTermChanged,
			searchTerm = p19.searchTerm
		}, p20),
		ProfilerView = roactModule.createElement(if isFunctionsView then profilerFunctionsViewModule else profilerViewModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -p17.state.utilTabHeight),
			searchFilter = if isFunctionsView then p19.searchFilterFlat else p19.searchFilterGraph,
			data = data,
			profiling = isProfiling,
			showAsPercentages = p17.props.usePercentages,
			sessionLength = if data and data.SessionStartTime and data.SessionEndTime then data.SessionEndTime - data.SessionStartTime else nil,
			rootNode = p19.rootNode,
			rootFunc = p19.rootFunc,
			rootNodeName = p19.rootNodeName,
			average = p19.average,
			showPlugins = p19.showPlugins or not scriptProfilerShowPlugins2,
			pluginOffsets = p19.pluginOffsets,
			showGC = p19.showGC,
			gcFunctionOffsets = p19.gcFunctionOffsets,
			gcNodeOffsets = p19.gcNodeOffsets,
			pluginGCOffsets = p19.pluginGCOffsets,
			expandedNodes = if isFunctionsView then nil else p19.expandedNodes
		})
	})
end

function mainViewScriptProfiler.render(p17)
	-- upvalues: constantsModule (ref), scriptProfilerShowPlugins2 (ref)
	if p17.props.isExporting then
		return p17:renderExportView()
	elseif p17.props.isShowingMobileSettings then
		return p17:renderMobileSettingsUI()
	end
	local formFactor = p17.props.formFactor
	local activeState, activeState_1 = p17:getActiveState()
	local t = {}
	local var13 = 1
	local var14 = formFactor == constantsModule.FormFactor.Small
	
	if not var14 then
		t[1] = { name = "Live", state = activeState_1.liveUpdate }
		
		if scriptProfilerShowPlugins2 then
			var13 += 1
			t[var13] = { name = "Plugins", state = activeState_1.showPlugins }
		end
		t[var13 + 1] = { name = "GC", state = activeState_1.showGC }
	end
	return p17:renderProfilerView(activeState, activeState_1, p17:renderUtilButtons(activeState_1, var14, var14), t)
end

return roactRoduxModule.UNSTABLE_connect2(function(p17, _)
	return {
		isClientView = p17.ScriptProfiler.isClientView,
		usePercentages = p17.ScriptProfiler.usePercentages,
		isExporting = p17.ScriptProfiler.isExporting,
		isShowingMobileSettings = p17.ScriptProfiler.isShowingMobileSettings,
		client = p17.ScriptProfiler.client,
		server = p17.ScriptProfiler.server
	}
end, function(p17)
	-- upvalues: setScriptProfilerStateModule (ref), setIsProfilingModule (ref), setDataModule (ref), setThreadsModule (ref), setTimerStateModule (ref), clearStateForNewProfilingSessionModule (ref), setAverageModule (ref), setFrequencyModule (ref), setDataViewModule (ref), setLiveUpdateModule (ref), setShowPluginsModule (ref), setShowGCModule (ref), setSearchDataModule (ref)
	return {
		dispatchSetScriptProfilerState = function(value, p18, p19, p20)
			-- upvalues: p17 (ref), setScriptProfilerStateModule (copy)
			p17(setScriptProfilerStateModule(value, p18, p19, p20))
		end,
		dispatchSetIsProfiling = function(value, p18)
			-- upvalues: p17 (ref), setIsProfilingModule (copy)
			p17(setIsProfilingModule(value, p18))
		end,
		dispatchSetData = function(value, p18)
			-- upvalues: p17 (ref), setDataModule (copy)
			p17(setDataModule(value, p18))
		end,
		dispatchSetThreads = function(value, p18)
			-- upvalues: p17 (ref), setThreadsModule (copy)
			p17(setThreadsModule(value, p18))
		end,
		dispatchSetTimer = function(value, p18)
			-- upvalues: p17 (ref), setTimerStateModule (copy)
			p17(setTimerStateModule(value, p18))
		end,
		dispatchClearStateForNewSession = function(p18)
			-- upvalues: p17 (ref), clearStateForNewProfilingSessionModule (copy)
			p17(clearStateForNewProfilingSessionModule(p18))
		end,
		dispatchSetAverage = function(value, p18)
			-- upvalues: p17 (ref), setAverageModule (copy)
			p17(setAverageModule(value, p18))
		end,
		dispatchSetFrequency = function(value, p18)
			-- upvalues: p17 (ref), setFrequencyModule (copy)
			p17(setFrequencyModule(value, p18))
		end,
		dispatchSetDataView = function(value, p18)
			-- upvalues: p17 (ref), setDataViewModule (copy)
			p17(setDataViewModule(value, p18))
		end,
		dispatchSetLiveUpdate = function(value, p18)
			-- upvalues: p17 (ref), setLiveUpdateModule (copy)
			p17(setLiveUpdateModule(value, p18))
		end,
		dispatchSetShowPlugins = function(value, p18)
			-- upvalues: p17 (ref), setShowPluginsModule (copy)
			p17(setShowPluginsModule(value, p18))
		end,
		dispatchSetShowGC = function(value, p18)
			-- upvalues: p17 (ref), setShowGCModule (copy)
			p17(setShowGCModule(value, p18))
		end,
		dispatchSetSearchData = function(value, p18)
			-- upvalues: p17 (ref), setSearchDataModule (copy)
			p17(setSearchDataModule(value, p18))
		end,
		dispatchStartExport = function()
			-- upvalues: p17 (ref), setScriptProfilerStateModule (copy)
			p17(setScriptProfilerStateModule(nil, nil, nil, nil, true))
		end,
		dispatchFinishedExporting = function()
			-- upvalues: p17 (ref), setScriptProfilerStateModule (copy)
			p17(setScriptProfilerStateModule(nil, nil, nil, nil, false))
		end,
		dispatchShowMobileSettings = function()
			-- upvalues: p17 (ref), setScriptProfilerStateModule (copy)
			p17(setScriptProfilerStateModule(nil, nil, nil, nil, nil, true))
		end,
		dispatchHideMobileSettings = function()
			-- upvalues: p17 (ref), setScriptProfilerStateModule (copy)
			p17(setScriptProfilerStateModule(nil, nil, nil, nil, nil, false))
		end
	}
end)(mainViewScriptProfiler)