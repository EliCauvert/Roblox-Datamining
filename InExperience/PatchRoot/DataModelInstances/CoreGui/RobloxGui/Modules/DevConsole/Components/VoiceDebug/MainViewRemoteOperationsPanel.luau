local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local filterChipModule = require(components.FilterChip)
local infoBannerModule = require(components.InfoBanner)
local mergeObservedNamesModule = require(components.MergeObservedNames)
local operationRowModule = require(components.OperationRow)
local virtualListModule = require(components.VirtualList)
local collapsibleSectionModule = require(script.Parent.CollapsibleSection)
local voiceDebugOperationLabelsModule = require(script.Parent.VoiceDebugOperationLabels)

local function mergeChronologically(p1, p2)
	local list = table.create(#p1 + #p2)
	local var1 = 1
	local var2 = 1
	while var1 <= #p1 or var2 <= #p2 do
		if var1 <= #p1 and (#p2 < var2 or p1[var1].timestampSeconds <= p2[var2].timestampSeconds) then
			local var3 = p1[var1]
			list[#list + 1] = {
				tag = "snt",
				name = var3.name,
				timestampSeconds = var3.timestampSeconds,
				timestampText = var3.timestampText
			}
			var1 += 1
		else
			local var4 = p2[var2]
			list[#list + 1] = {
				tag = "srv",
				name = var4.name,
				timestampSeconds = var4.timestampSeconds,
				timestampText = var4.timestampText
			}
			var2 += 1
		end
	end
	return list
end

local remoteOperationsPanel = roactModule.Component:extend("RemoteOperationsPanel")

function remoteOperationsPanel.init(p3)
	-- upvalues: mergeObservedNamesModule (ref)
	local t = {}
	local remoteOperations = p3.props.remoteOperations or {}
	mergeObservedNamesModule(remoteOperations.sent or {}, t, "name")
	mergeObservedNamesModule(remoteOperations.received or {}, t, "name")
	p3.state = { observedNames = t, excludedNames = {} }
	
	function p2.onChipActivated(p4)
		-- upvalues: p3 (ref)
		p3:setState(function(p5)
			-- upvalues: p4 (ref)
			local cloned = table.clone(p5.excludedNames)
			cloned[p4] = not cloned[p4] or nil
			
			return { excludedNames = cloned }
		end)
	end
end

function remoteOperationsPanel.didUpdate(p3, p4)
	-- upvalues: mergeObservedNamesModule (ref)
	if p4.remoteOperations == p3.props.remoteOperations then return end
	local remoteOperations = p3.props.remoteOperations or {}
	local cloned = table.clone(p3.state.observedNames)
	
	if mergeObservedNamesModule(remoteOperations.sent or {}, cloned, "name") or mergeObservedNamesModule(remoteOperations.received or {}, cloned, "name") then
		p3:setState({ observedNames = cloned })
	end
end

function remoteOperationsPanel.render(p3)
	-- upvalues: mergeChronologically (ref), roactModule (ref), filterChipModule (ref), voiceDebugOperationLabelsModule (ref), collapsibleSectionModule (ref), infoBannerModule (ref), virtualListModule (ref), operationRowModule (ref)
	local remoteOperations = p3.props.remoteOperations or {}
	local layoutOrder = p3.props.layoutOrder
	local excludedNames = p3.state.excludedNames
	local var5 = mergeChronologically(remoteOperations.sent or {}, remoteOperations.received or {})
	local t = {}
	
	for i = #var5, 1, -1 do
		local var6 = var5[i]
		
		if not excludedNames[var6.name] then
			t[#t + 1] = var6
		end
	end
	local t_1 = {}
	local var7 = 0
	
	for i_1 in p3.state.observedNames do
		var7 += 1
		t_1["chip" .. i_1] = roactModule.createElement(filterChipModule, {
			name = voiceDebugOperationLabelsModule.labelForEventName(i_1),
			isOn = not excludedNames[i_1],
			layoutOrder = var7,
			onActivated = function()
				-- upvalues: p3 (ref), i_1 (ref)
				p3.onChipActivated(i_1)
			end
		})
	end
	local var8
	local var9 = remoteOperations.sent ~= nil
	local var10 = remoteOperations.receivedCaptureEnabled == true
	local var11 = remoteOperations.sentCaptureEnabled == true
	local createElement = roactModule.createElement
	local t_2 = { title = "Message Log", layoutOrder = layoutOrder }
	local t_3 = {}
	
	if var9 and not var10 then
		var8 = roactModule.createElement(infoBannerModule, {
			layoutOrder = 1,
			text = "Remote operation capture is off (FFlag::VoiceMetricsDataEnabled). Enable it to see sent/received events here."
		})
		
		if not var8 then
			if var9 and not var11 then
				var8 = roactModule.createElement(infoBannerModule, {
					layoutOrder = 1,
					text = "Sent-event capture is off (FFlag::VoiceChatEventReplicatorWrapperEnabled). Received events are still shown below."
				}) or nil
			end
		end
		t_3.Banner = var8
		t_3.Filters = roactModule.createElement("Frame", {
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
			Chips = roactModule.createFragment(t_1)
		})
		t_3.List = roactModule.createElement(virtualListModule, {
			rowHeight = 22,
			layoutOrder = 3,
			items = t,
			renderItem = function(p4, p5)
				-- upvalues: roactModule (copy), operationRowModule (copy), voiceDebugOperationLabelsModule (copy)
				return roactModule.createElement(operationRowModule, {
					timestampText = p4.timestampText,
					tag = p4.tag,
					name = voiceDebugOperationLabelsModule.labelForEventName(p4.name),
					layoutOrder = p5
				})
			end,
			size = UDim2.new(1, 0, 0, #t > 0 and math.min(#t * 22, 280) or 44),
			emptyText = if #var5 > 0 then "No messages match filter." else "No messages observed yet."
		})
		
		return createElement(collapsibleSectionModule, t_2, t_3)
	end
end

remoteOperationsPanel._mergeChronologically = mergeChronologically

return remoteOperationsPanel