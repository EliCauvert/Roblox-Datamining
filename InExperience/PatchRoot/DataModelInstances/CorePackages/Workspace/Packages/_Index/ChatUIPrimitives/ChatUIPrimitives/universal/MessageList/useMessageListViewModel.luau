local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(Parent.Signals)
local BubbleItemFrameModule = require(script.Parent.Bubble.BubbleItemFrame)
local MessageBubbleItemModule = require(script.Parent.Bubble.MessageBubbleItem)
local InlineItemFrameModule = require(script.Parent.Inline.InlineItemFrame)
local MessageInlineItemModule = require(script.Parent.Inline.MessageInlineItem)
local TimestampItemModule = require(script.Parent.TimestampItem)
local GroupMessagesModule = require(script.Parent.groupMessages)
local ProjectMessageEnvelopeModule = require(script.Parent.projectMessageEnvelope)
local UseMessageListLayoutModule = require(script.Parent.useMessageListLayout)
local UsePropSignalModule = require(ChatUIPrimitives.Hooks.usePropSignal)
local _ = require(script.Parent.Parent.Types)
local ScrollingFrameProps = { BackgroundTransparency = 1 }

local function getRowKey(p1)
	return p1.id
end

local config = {
	hideWhilePending = true,
	readiness = ViewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
}

local function _(p1, p2)
	-- upvalues: ViewRecyclerModule (copy), ReactModule (copy), config (copy)
	return ViewRecyclerModule.createRecyclableView(function(p3)
		-- upvalues: ReactModule (upval), p2 (copy), p1 (copy)
		return ReactModule.createElement(p2, {}, {
			Item = ReactModule.createElement(p1, { itemSignal = p3.itemSignal })
		})
	end, config)
end

local RecyclableView = ViewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: ReactModule (copy), InlineItemFrameModule (copy), MessageInlineItemModule (copy)
	return ReactModule.createElement(InlineItemFrameModule, {}, {
		Item = ReactModule.createElement(MessageInlineItemModule, { itemSignal = p1.itemSignal })
	})
end, config)
local RecyclableView1 = ViewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: ReactModule (copy), InlineItemFrameModule (copy), TimestampItemModule (copy)
	return ReactModule.createElement(InlineItemFrameModule, {}, {
		Item = ReactModule.createElement(TimestampItemModule, { itemSignal = p1.itemSignal })
	})
end, config)
local RecyclableView2 = ViewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: ReactModule (copy), BubbleItemFrameModule (copy), MessageBubbleItemModule (copy)
	return ReactModule.createElement(BubbleItemFrameModule, {}, {
		Item = ReactModule.createElement(MessageBubbleItemModule, { itemSignal = p1.itemSignal })
	})
end, config)
local RecyclableView3 = ViewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: ReactModule (copy), BubbleItemFrameModule (copy), TimestampItemModule (copy)
	return ReactModule.createElement(BubbleItemFrameModule, {}, {
		Item = ReactModule.createElement(TimestampItemModule, { itemSignal = p1.itemSignal })
	})
end, config)

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), ProjectMessageEnvelopeModule (copy), UsePropSignalModule (copy), GroupMessagesModule (copy), SignalsReactModule (copy), RecyclableView2 (copy), RecyclableView (copy), RecyclableView3 (copy), RecyclableView1 (copy), getRowKey (copy), UseMessageListLayoutModule (copy), ViewRecyclerModule (copy), ScrollingFrameProps (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), ProjectMessageEnvelopeModule (upval)
		local t = {}
		
		return SignalsModule.createComputed(function(p2)
			-- upvalues: p1 (upval), t (ref), ProjectMessageEnvelopeModule (upval)
			local t1 = {}
			local List = {}
			
			for _, Source in p1.getMessageEnvelopes(p2) do
				local Entry = t[Source.stableId]
				local ProjectMessageEnvelopeModuleResult = if Entry == nil or Entry.source ~= Source then ProjectMessageEnvelopeModule(Source) else Entry.rendered
				t1[Source.stableId] = {
					source = Source,
					rendered = ProjectMessageEnvelopeModuleResult
				}
				table.insert(List, ProjectMessageEnvelopeModuleResult)
			end
			t = t1
			
			return List
		end)
	end, { p1.getMessageEnvelopes })
	local UsePropSignalModuleResult = UsePropSignalModule(p1.maxGroupSize)
	local UsePropSignalModuleResult1 = UsePropSignalModule(p1.maxGroupGapMs)
	local UsePropSignalModuleResult2 = UsePropSignalModule(p1.groupingEnabled)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), UsePropSignalModuleResult2 (copy), GroupMessagesModule (upval), UsePropSignalModuleResult (copy), UsePropSignalModuleResult1 (copy)
		local t = {}
		
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval), UsePropSignalModuleResult2 (upval), GroupMessagesModule (upval), t (ref), UsePropSignalModuleResult (upval), UsePropSignalModuleResult1 (upval)
			local UseMemoResultResult = UseMemoResult(p2)
			local UngroupedRowsResult = if UsePropSignalModuleResult2(p2) == false then GroupMessagesModule.ungroupedRows(UseMemoResultResult, t) else GroupMessagesModule.groupMessages(UseMemoResultResult, UsePropSignalModuleResult(p2), UsePropSignalModuleResult1(p2), t)
			t = UngroupedRowsResult
			
			return UngroupedRowsResult
		end)
	end, {
		UseMemoResult,
		UsePropSignalModuleResult,
		UsePropSignalModuleResult1,
		UsePropSignalModuleResult2
	})))
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), RecyclableView2 (upval), RecyclableView (upval), RecyclableView3 (upval), RecyclableView1 (upval)
		if p2.kind == "message" then
			if p1.displayMode == "bubble" then
				return RecyclableView2
			end
			if p1.displayMode == "inline" then
				return RecyclableView
			end
			error("Invalid display mode: " .. p1.displayMode)
		elseif p2.kind == "timestamp" then
			if p1.displayMode == "bubble" then
				return RecyclableView3
			end
			if p1.displayMode == "inline" then
				return RecyclableView1
			end
			error("Invalid display mode: " .. p1.displayMode)
		end
		error("Invalid row kind: " .. p2.kind)
	end, { p1.displayMode })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), getRowKey (upval)
		return { items = UseSignalStateResult, getItemKey = getRowKey }
	end, { UseSignalStateResult })
	local UseMessageListLayoutModuleResult = UseMessageListLayoutModule()
	
	return {
		listProps = ReactModule.useMemo(function()
			-- upvalues: ViewRecyclerModule (upval), ScrollingFrameProps (upval), UseMemoResult1 (copy), UseMessageListLayoutModuleResult (copy), UseResult (copy)
			local Copy = table.clone(ViewRecyclerModule.ChatPreset.create())
			Copy.scrollingFrameProps = ScrollingFrameProps
			Copy.data = UseMemoResult1
			Copy.layout = UseMessageListLayoutModuleResult
			Copy.axis = ViewRecyclerModule.Axis.Y
			Copy.itemType = UseResult
			
			return Copy
		end, {
			UseMemoResult1,
			UseMessageListLayoutModuleResult,
			UseResult
		})
	}
end