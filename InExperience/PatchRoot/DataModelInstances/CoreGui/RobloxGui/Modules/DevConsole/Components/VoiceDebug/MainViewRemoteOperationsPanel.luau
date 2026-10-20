local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local FilterChipModule = require(Components.FilterChip)
local InfoBannerModule = require(Components.InfoBanner)
local MergeObservedNamesModule = require(Components.MergeObservedNames)
local OperationRowModule = require(Components.OperationRow)
local VirtualListModule = require(Components.VirtualList)
local CollapsibleSectionModule = require(script.Parent.CollapsibleSection)
local VoiceDebugOperationLabelsModule = require(script.Parent.VoiceDebugOperationLabels)

local function mergeChronologically(Sent, Received)
	local Buffer = table.create(#Sent + #Received)
	local Count = 1
	local Count1 = 1
	while Count <= #Sent or Count1 <= #Received do
		if Count <= #Sent and (#Received < Count1 or Sent[Count].timestampSeconds <= Received[Count1].timestampSeconds) then
			local SentEntry = Sent[Count]
			Buffer[#Buffer + 1] = {
				tag = "snt",
				name = SentEntry.name,
				timestampSeconds = SentEntry.timestampSeconds,
				timestampText = SentEntry.timestampText
			}
			Count += 1
		else
			local ReceivedEntry = Received[Count1]
			Buffer[#Buffer + 1] = {
				tag = "srv",
				name = ReceivedEntry.name,
				timestampSeconds = ReceivedEntry.timestampSeconds,
				timestampText = ReceivedEntry.timestampText
			}
			Count1 += 1
		end
	end
	return Buffer
end

local RemoteOperationsPanel = RoactModule.Component:extend("RemoteOperationsPanel")

function RemoteOperationsPanel.init(p1)
	-- upvalues: MergeObservedNamesModule (copy)
	local ObservedNames = {}
	local RemoteOperations = p1.props.remoteOperations or {}
	MergeObservedNamesModule(RemoteOperations.sent or {}, ObservedNames, "name")
	MergeObservedNamesModule(RemoteOperations.received or {}, ObservedNames, "name")
	p1.state = { observedNames = ObservedNames, excludedNames = {} }
	
	function p1.onChipActivated(p2)
		-- upvalues: p1 (copy)
		p1:setState(function(p3)
			-- upvalues: p2 (copy)
			local Copy = table.clone(p3.excludedNames)
			Copy[p2] = not Copy[p2] or nil
			
			return { excludedNames = Copy }
		end)
	end
end

function RemoteOperationsPanel.didUpdate(p1, p2)
	-- upvalues: MergeObservedNamesModule (copy)
	if p2.remoteOperations == p1.props.remoteOperations then return end
	local RemoteOperations = p1.props.remoteOperations or {}
	local Copy = table.clone(p1.state.observedNames)
	local Name = MergeObservedNamesModule(RemoteOperations.sent or {}, Copy, "name")
	local Name1 = MergeObservedNamesModule(RemoteOperations.received or {}, Copy, "name")
	
	if Name or Name1 then
		p1:setState({ observedNames = Copy })
	end
end

function RemoteOperationsPanel.render(p1)
	-- upvalues: mergeChronologically (copy), RoactModule (copy), FilterChipModule (copy), VoiceDebugOperationLabelsModule (copy), CollapsibleSectionModule (copy), InfoBannerModule (copy), VirtualListModule (copy), OperationRowModule (copy)
	local RemoteOperations = p1.props.remoteOperations or {}
	local LayoutOrder = p1.props.layoutOrder
	local ExcludedNames = p1.state.excludedNames
	local MergeChronologicallyResult = mergeChronologically(RemoteOperations.sent or {}, RemoteOperations.received or {})
	local Items = {}
	
	for i = #MergeChronologicallyResult, 1, -1 do
		local MergeChronologicallyResultEntry = MergeChronologicallyResult[i]
		
		if not ExcludedNames[MergeChronologicallyResultEntry.name] then
			Items[#Items + 1] = MergeChronologicallyResultEntry
		end
	end
	local Elements = {}
	local LayoutOrder1 = 0
	
	for observedName in p1.state.observedNames do
		LayoutOrder1 += 1
		Elements["chip" .. observedName] = RoactModule.createElement(FilterChipModule, {
			name = VoiceDebugOperationLabelsModule.labelForEventName(observedName),
			isOn = not ExcludedNames[observedName],
			layoutOrder = LayoutOrder1,
			onActivated = function()
				-- upvalues: p1 (copy), observedName (copy)
				p1.onChipActivated(observedName)
			end
		})
	end
	local HasSent = RemoteOperations.sent ~= nil
	local IsReceivedCaptureEnabled = RemoteOperations.receivedCaptureEnabled == true
	local IsSentCaptureEnabled = RemoteOperations.sentCaptureEnabled == true
	
	return RoactModule.createElement(CollapsibleSectionModule, { title = "Message Log", layoutOrder = LayoutOrder }, {
		Banner = HasSent and not IsReceivedCaptureEnabled and RoactModule.createElement(InfoBannerModule, {
			layoutOrder = 1,
			text = "Remote operation capture is off (FFlag::VoiceMetricsDataEnabled). Enable it to see sent/received events here."
		}) or (HasSent and not IsSentCaptureEnabled and RoactModule.createElement(InfoBannerModule, {
			layoutOrder = 1,
			text = "Sent-event capture is off (FFlag::VoiceChatEventReplicatorWrapperEnabled). Received events are still shown below."
		}) or nil),
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
			items = Items,
			renderItem = function(p2, LayoutOrder)
				-- upvalues: RoactModule (upval), OperationRowModule (upval), VoiceDebugOperationLabelsModule (upval)
				return RoactModule.createElement(OperationRowModule, {
					timestampText = p2.timestampText,
					tag = p2.tag,
					name = VoiceDebugOperationLabelsModule.labelForEventName(p2.name),
					layoutOrder = LayoutOrder
				})
			end,
			size = UDim2.new(1, 0, 0, #Items > 0 and math.min(#Items * 22, 280) or 44),
			emptyText = if #MergeChronologicallyResult > 0 then "No messages match filter." else "No messages observed yet."
		})
	})
end

RemoteOperationsPanel._mergeChronologically = mergeChronologically

return RemoteOperationsPanel