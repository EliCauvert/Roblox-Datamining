local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local viewRecyclerModule = require(parent.ViewRecycler)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local bubbleItemFrameModule = require(script.Parent.Bubble.BubbleItemFrame)
local messageBubbleItemModule = require(script.Parent.Bubble.MessageBubbleItem)
local inlineItemFrameModule = require(script.Parent.Inline.InlineItemFrame)
local messageInlineItemModule = require(script.Parent.Inline.MessageInlineItem)
local timestampItemModule = require(script.Parent.TimestampItem)
local groupMessagesModule = require(script.Parent.groupMessages)
local projectMessageEnvelopeModule = require(script.Parent.projectMessageEnvelope)
local useMessageListLayoutModule = require(script.Parent.useMessageListLayout)
local usePropSignalModule = require(chatUIPrimitives.Hooks.usePropSignal)
local _ = require(script.Parent.Parent.Types)
local t = { BackgroundTransparency = 1 }

local function getRowKey(p1)
	return p1.id
end

local function _(p1, p2)
	-- upvalues: viewRecyclerModule (ref), reactModule (ref)
	return viewRecyclerModule.createRecyclableView(function(p3)
		-- upvalues: reactModule (copy), p2 (ref), p1 (ref)
		return reactModule.createElement(p2, {}, {
			Item = reactModule.createElement(p1, { itemSignal = p3.itemSignal })
		})
	end)
end

local var1 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: reactModule (ref), inlineItemFrameModule (ref), messageInlineItemModule (ref)
	return reactModule.createElement(inlineItemFrameModule, {}, {
		Item = reactModule.createElement(messageInlineItemModule, { itemSignal = p1.itemSignal })
	})
end)
local var2 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: reactModule (ref), inlineItemFrameModule (ref), timestampItemModule (ref)
	return reactModule.createElement(inlineItemFrameModule, {}, {
		Item = reactModule.createElement(timestampItemModule, { itemSignal = p1.itemSignal })
	})
end)
local var3 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: reactModule (ref), bubbleItemFrameModule (ref), messageBubbleItemModule (ref)
	return reactModule.createElement(bubbleItemFrameModule, {}, {
		Item = reactModule.createElement(messageBubbleItemModule, { itemSignal = p1.itemSignal })
	})
end)
local var4 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: reactModule (ref), bubbleItemFrameModule (ref), timestampItemModule (ref)
	return reactModule.createElement(bubbleItemFrameModule, {}, {
		Item = reactModule.createElement(timestampItemModule, { itemSignal = p1.itemSignal })
	})
end)

return function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), projectMessageEnvelopeModule (ref), usePropSignalModule (ref), groupMessagesModule (ref), signalsReactModule (ref), var3 (ref), var1 (ref), var4 (ref), var2 (ref), getRowKey (ref), useMessageListLayoutModule (ref), viewRecyclerModule (ref), t (ref)
	local var5 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref), projectMessageEnvelopeModule (copy)
		local t = {}
		
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy), t (write), projectMessageEnvelopeModule (copy)
			local t_1 = {}
			local t_2 = {}
			
			for i, v in p1.getMessageEnvelopes(p2) do
				local stableId = t[v.stableId]
				local var6 = if stableId == nil or stableId.source ~= v then projectMessageEnvelopeModule(v) else stableId.rendered
				t_1[v.stableId] = { source = v, rendered = var6 }
				table.insert(t_2, var6)
			end
			t = t_1
			
			return t_2
		end)
	end, { p1.getMessageEnvelopes })
	local var6 = usePropSignalModule(p1.maxGroupSize)
	local var7 = usePropSignalModule(p1.maxGroupGapMs)
	local var8 = usePropSignalModule(p1.groupingEnabled)
	local var9 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var5 (ref), var8 (ref), groupMessagesModule (copy), var6 (ref), var7 (ref)
		local t = {}
		
		return signalsModule.createComputed(function(p2)
			-- upvalues: var5 (copy), var8 (copy), groupMessagesModule (copy), t (write), var6 (copy), var7 (copy)
			local var10 = var5(p2)
			local var11 = if var8(p2) == false then groupMessagesModule.ungroupedRows(var10, t) else groupMessagesModule.groupMessages(var10, var6(p2), var7(p2), t)
			t = var11
			
			return var11
		end)
	end, { var5, var6, var7, var8 }))
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var3 (copy), var1 (copy), var4 (copy), var2 (copy)
		if p2.kind == "message" then
			if p1.displayMode == "bubble" then
				return var3
			elseif p1.displayMode == "inline" then
				return var1
			end
			error("Invalid display mode: " .. p8.displayMode)
		elseif p2.kind == "timestamp" then
			if p1.displayMode == "bubble" then
				return var4
			elseif p1.displayMode == "inline" then
				return var2
			end
			error("Invalid display mode: " .. p8.displayMode)
		end
		error("Invalid row kind: " .. p11.kind)
	end, { p1.displayMode })
	local var11 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), getRowKey (copy)
		return { items = var9, getItemKey = getRowKey }
	end, { var9 })
	local var12 = useMessageListLayoutModule()
	
	return {
		listProps = reactModule.useMemo(function()
			-- upvalues: viewRecyclerModule (copy), t (copy), var11 (ref), var12 (ref), var10 (ref)
			local cloned = table.clone(viewRecyclerModule.ChatPreset.create())
			cloned.scrollingFrameProps = t
			cloned.data = var11
			cloned.layout = var12
			cloned.axis = viewRecyclerModule.Axis.Y
			cloned.itemType = var10
			
			return cloned
		end, { var11, var12, var10 })
	}
end