local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local FilterChipModule = require(Components.FilterChip)
local InfoBannerModule = require(Components.InfoBanner)
local MergeObservedNamesModule = require(Components.MergeObservedNames)
local OperationRowModule = require(Components.OperationRow)
local VirtualListModule = require(Components.VirtualList)
local CollapsibleSectionModule = require(script.Parent.CollapsibleSection)
local VoiceDebugOperationLabelsModule = require(script.Parent.VoiceDebugOperationLabels)

local function filterOperations(Operations, ExcludedNames, ShowCullingExclusively)
	local t = {}
	
	for _, operation in Operations do
		if ShowCullingExclusively then
			if operation.operationType == "ClientCullingOperation" then
				t[#t + 1] = operation
			end
		elseif operation.operationType ~= "ClientCullingOperation" and not ExcludedNames[operation.operationType] then
			t[#t + 1] = operation
		end
	end
	return t
end

local function isChipOn(p1, p2, p3)
	return if p1 == "ClientCullingOperation" then p3 else not p3 and not p2[p1]
end

local function nextChipState(Key, State)
	if Key == "ClientCullingOperation" then
		return {
			excludedNames = State.excludedNames,
			showCullingExclusively = not State.showCullingExclusively
		}
	end
	local Copy = table.clone(State.excludedNames)
	
	if State.showCullingExclusively then
		Copy[Key] = nil
	else
		Copy[Key] = not Copy[Key] or nil
	end
	return { showCullingExclusively = false, excludedNames = Copy }
end

local ClientOperationQueuePanel = RoactModule.Component:extend("ClientOperationQueuePanel")

function ClientOperationQueuePanel.init(p1)
	-- upvalues: MergeObservedNamesModule (copy), nextChipState (copy)
	local ObservedNames = {}
	MergeObservedNamesModule((p1.props.remoteOperations or {}).operations or {}, ObservedNames, "operationType")
	p1.state = {
		showCullingExclusively = false,
		observedNames = ObservedNames,
		excludedNames = {}
	}
	
	function p1.onChipActivated(Key)
		-- upvalues: p1 (copy), nextChipState (upval)
		p1:setState(function(p2)
			-- upvalues: nextChipState (upval), Key (copy)
			return (nextChipState(Key, p2))
		end)
	end
end

function ClientOperationQueuePanel.didUpdate(p1, p2)
	-- upvalues: MergeObservedNamesModule (copy)
	if p2.remoteOperations == p1.props.remoteOperations then return end
	local Copy = table.clone(p1.state.observedNames)
	
	if MergeObservedNamesModule((p1.props.remoteOperations or {}).operations or {}, Copy, "operationType") then
		p1:setState({ observedNames = Copy })
	end
end

function ClientOperationQueuePanel.render(p1)
	-- upvalues: filterOperations (copy), RoactModule (copy), FilterChipModule (copy), VoiceDebugOperationLabelsModule (copy), CollapsibleSectionModule (copy), InfoBannerModule (copy), VirtualListModule (copy), OperationRowModule (copy)
	local RemoteOperations = p1.props.remoteOperations or {}
	local LayoutOrder = p1.props.layoutOrder
	local ExcludedNames = p1.state.excludedNames
	local ShowCullingExclusively = p1.state.showCullingExclusively
	local FilterOperationsResult = filterOperations(RemoteOperations.operations or {}, ExcludedNames, ShowCullingExclusively)
	table.sort(FilterOperationsResult, function(A, B): boolean
		return B.timestampSeconds < A.timestampSeconds
	end)
	local Elements = {}
	local LayoutOrder1 = 0
	
	for observedName in p1.state.observedNames do
		LayoutOrder1 += 1
		Elements["chip" .. observedName] = RoactModule.createElement(FilterChipModule, {
			name = VoiceDebugOperationLabelsModule.labelForOperationType(observedName),
			isOn = if observedName == "ClientCullingOperation" then ShowCullingExclusively else not ShowCullingExclusively and not ExcludedNames[observedName],
			layoutOrder = LayoutOrder1,
			onActivated = function()
				-- upvalues: p1 (copy), observedName (copy)
				p1.onChipActivated(observedName)
			end
		})
	end
	local IsOpQueueCaptureEnabled = RemoteOperations.opQueueCaptureEnabled == true
	
	return RoactModule.createElement(CollapsibleSectionModule, { title = "Client Activity", layoutOrder = LayoutOrder }, {
		CaptureNotice = RemoteOperations.operations ~= nil and not IsOpQueueCaptureEnabled and RoactModule.createElement(InfoBannerModule, {
			layoutOrder = 1,
			text = "Operation capture is off (FFlag::VoiceMetricsDataEnabled). Enable it to see executed operations here."
		}) or nil,
		Filters = RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				Wraps = true,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			Chips = RoactModule.createFragment(Elements)
		}),
		List = RoactModule.createElement(VirtualListModule, {
			rowHeight = 22,
			layoutOrder = 3,
			emptyText = "No activity observed yet.",
			items = FilterOperationsResult,
			renderItem = function(p2, LayoutOrder)
				-- upvalues: VoiceDebugOperationLabelsModule (upval), RoactModule (upval), OperationRowModule (upval)
				return RoactModule.createElement(OperationRowModule, {
					tag = "op",
					timestampText = p2.timestampText,
					name = VoiceDebugOperationLabelsModule.labelForOperationType(p2.operationType) .. ": " .. VoiceDebugOperationLabelsModule.humanizeName(p2.name:match("::(.+)$") or p2.name),
					layoutOrder = LayoutOrder
				})
			end,
			size = UDim2.new(1, 0, 0, #FilterOperationsResult > 0 and math.min(#FilterOperationsResult * 22, 320) or 44)
		})
	})
end

ClientOperationQueuePanel._filterOperations = filterOperations
ClientOperationQueuePanel._isChipOn = isChipOn
ClientOperationQueuePanel._nextChipState = nextChipState

return ClientOperationQueuePanel