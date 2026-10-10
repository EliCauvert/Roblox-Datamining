local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local filterChipModule = require(components.FilterChip)
local infoBannerModule = require(components.InfoBanner)
local mergeObservedNamesModule = require(components.MergeObservedNames)
local operationRowModule = require(components.OperationRow)
local virtualListModule = require(components.VirtualList)
local collapsibleSectionModule = require(script.Parent.CollapsibleSection)
local voiceDebugOperationLabelsModule = require(script.Parent.VoiceDebugOperationLabels)

local function filterOperations(p1, p2, p3)
	local t = {}
	
	for i, v in p1 do
		if p3 then
			if v.operationType == "ClientCullingOperation" then
				t[#t + 1] = v
			end
		elseif v.operationType ~= "ClientCullingOperation" and not p2[v.operationType] then
			t[#t + 1] = v
		end
	end
	return t
end

local function isChipOn(p4, p5, p6)
	return if p4 == "ClientCullingOperation" then p6 else not p6 and not p5[p4]
end

local function nextChipState(p4, p5)
	if p4 == "ClientCullingOperation" then
		return {
			excludedNames = p5.excludedNames,
			showCullingExclusively = not p5.showCullingExclusively
		}
	end
	local cloned = table.clone(p5.excludedNames)
	
	if p5.showCullingExclusively then
		cloned[p4] = nil
	else
		cloned[p4] = not cloned[p4] or nil
	end
	return { showCullingExclusively = false, excludedNames = cloned }
end

local clientOperationQueuePanel = roactModule.Component:extend("ClientOperationQueuePanel")

function clientOperationQueuePanel.init(p4)
	-- upvalues: mergeObservedNamesModule (ref), nextChipState (ref)
	local t = {}
	mergeObservedNamesModule((p4.props.remoteOperations or {}).operations or {}, t, "operationType")
	p4.state = {
		showCullingExclusively = false,
		observedNames = t,
		excludedNames = {}
	}
	
	function p8.onChipActivated(p5)
		-- upvalues: p4 (ref), nextChipState (copy)
		p4:setState(function(p6)
			-- upvalues: nextChipState (copy), p5 (ref)
			return nextChipState(p5, p6)
		end)
	end
end

function clientOperationQueuePanel.didUpdate(p4, p5)
	-- upvalues: mergeObservedNamesModule (ref)
	if p5.remoteOperations == p4.props.remoteOperations then return end
	local cloned = table.clone(p4.state.observedNames)
	
	if mergeObservedNamesModule((p4.props.remoteOperations or {}).operations or {}, cloned, "operationType") then
		p4:setState({ observedNames = cloned })
	end
end

function clientOperationQueuePanel.render(p4)
	-- upvalues: filterOperations (ref), roactModule (ref), filterChipModule (ref), voiceDebugOperationLabelsModule (ref), collapsibleSectionModule (ref), infoBannerModule (ref), virtualListModule (ref), operationRowModule (ref)
	local remoteOperations = p4.props.remoteOperations or {}
	local layoutOrder = p4.props.layoutOrder
	local excludedNames = p4.state.excludedNames
	local showCullingExclusively = p4.state.showCullingExclusively
	local var1 = filterOperations(remoteOperations.operations or {}, excludedNames, showCullingExclusively)
	table.sort(var1, function(p5, p6)
		return p6.timestampSeconds < p5.timestampSeconds
	end)
	local t = {}
	local var2 = 0
	
	for i in p4.state.observedNames do
		var2 += 1
		t["chip" .. i] = roactModule.createElement(filterChipModule, {
			name = voiceDebugOperationLabelsModule.labelForOperationType(i),
			isOn = if i == "ClientCullingOperation" then showCullingExclusively else not showCullingExclusively and not excludedNames[i],
			layoutOrder = var2,
			onActivated = function()
				-- upvalues: p4 (ref), i (ref)
				p4.onChipActivated(i)
			end
		})
	end
	local var3
	local var4 = remoteOperations.operations ~= nil
	local var5 = remoteOperations.opQueueCaptureEnabled == true
	local createElement = roactModule.createElement
	local t_1 = { title = "Client Activity", layoutOrder = layoutOrder }
	local t_2 = {}
	
	if var4 and not var5 then
		var3 = roactModule.createElement(infoBannerModule, {
			layoutOrder = 1,
			text = "Operation capture is off (FFlag::VoiceMetricsDataEnabled). Enable it to see executed operations here."
		}) or nil
	end
	t_2.CaptureNotice = var3
	t_2.Filters = roactModule.createElement("Frame", {
		LayoutOrder = 2,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Wraps = true,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		}),
		Chips = roactModule.createFragment(t)
	})
	t_2.List = roactModule.createElement(virtualListModule, {
		rowHeight = 22,
		layoutOrder = 3,
		emptyText = "No activity observed yet.",
		items = var1,
		renderItem = function(p5, p6)
			-- upvalues: voiceDebugOperationLabelsModule (copy), roactModule (copy), operationRowModule (copy)
			return roactModule.createElement(operationRowModule, {
				tag = "op",
				timestampText = p5.timestampText,
				name = voiceDebugOperationLabelsModule.labelForOperationType(p5.operationType) .. ": " .. voiceDebugOperationLabelsModule.humanizeName(p5.name:match("::(.+)$") or p5.name),
				layoutOrder = p6
			})
		end,
		size = UDim2.new(1, 0, 0, #var1 > 0 and math.min(#var1 * 22, 320) or 44)
	})
	
	return createElement(collapsibleSectionModule, t_1, t_2)
end

clientOperationQueuePanel._filterOperations = filterOperations
clientOperationQueuePanel._isChipOn = isChipOn
clientOperationQueuePanel._nextChipState = nextChipState

return clientOperationQueuePanel