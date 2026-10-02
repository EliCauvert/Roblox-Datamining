local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local viewRecyclerModule = require(parent.ViewRecycler)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local messageBubbleItemModule = require(script.Parent.MessageBubbleItem)
local messageInlineItemModule = require(script.Parent.MessageInlineItem)
local timestampItemModule = require(script.Parent.TimestampItem)
local groupMessagesModule = require(script.Parent.groupMessages)
local useMessageListLayoutModule = require(script.Parent.useMessageListLayout)
local usePropSignalModule = require(chatUIPrimitives.Hooks.usePropSignal)
local _ = require(script.Parent.Parent.Types)
local t = { BackgroundTransparency = 1 }

local function getRowKey(p1)
	return p1.id
end

local function _(p1)
	-- upvalues: viewRecyclerModule (ref), reactModule (ref)
	return viewRecyclerModule.createRecyclableView(function(p2)
		-- upvalues: reactModule (copy), p1 (ref)
		return reactModule.createElement(p1, { itemSignal = p2.itemSignal })
	end)
end

local var1 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: reactModule (ref), timestampItemModule (ref)
	return reactModule.createElement(timestampItemModule, { itemSignal = p1.itemSignal })
end)
local var2 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: reactModule (ref), messageInlineItemModule (ref)
	return reactModule.createElement(messageInlineItemModule, { itemSignal = p1.itemSignal })
end)
local var3 = viewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: reactModule (ref), messageBubbleItemModule (ref)
	return reactModule.createElement(messageBubbleItemModule, { itemSignal = p1.itemSignal })
end)

return function(p1)
	-- upvalues: usePropSignalModule (ref), reactModule (ref), signalsModule (ref), groupMessagesModule (ref), signalsReactModule (ref), var3 (ref), var2 (ref), var1 (ref), getRowKey (ref), useMessageListLayoutModule (ref), viewRecyclerModule (ref), t (ref)
	local getMessages = p1.getMessages
	local var4 = usePropSignalModule(p1.maxGroupSize)
	local var5 = usePropSignalModule(p1.maxGroupGapMs)
	local var6 = usePropSignalModule(p1.groupingEnabled)
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getMessages (ref), var6 (ref), groupMessagesModule (copy), var4 (ref), var5 (ref)
		local t = {}
		
		return signalsModule.createComputed(function(p2)
			-- upvalues: getMessages (copy), var6 (copy), groupMessagesModule (copy), t (write), var4 (copy), var5 (copy)
			local var8 = getMessages(p2)
			local var9 = if var6(p2) == false then groupMessagesModule.ungroupedRows(var8, t) else groupMessagesModule.groupMessages(var8, var4(p2), var5(p2), t)
			t = var9
			
			return var9
		end)
	end, { getMessages, var4, var5, var6 }))
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var3 (copy), var2 (copy), var1 (copy)
		if p2.kind == "message" then
			if p1.displayMode == "bubble" then
				return var3
			elseif p1.displayMode == "inline" then
				return var2
			end
			error("Invalid display mode: " .. p6.displayMode)
		elseif p2.kind == "timestamp" then
			return var1
		end
		error("Invalid row kind: " .. p8.kind)
	end, { p1.displayMode })
	local var9 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), getRowKey (copy)
		return { items = var7, getItemKey = getRowKey }
	end, { var7 })
	local var10 = useMessageListLayoutModule()
	
	return {
		listProps = reactModule.useMemo(function()
			-- upvalues: viewRecyclerModule (copy), t (copy), var9 (ref), var10 (ref), var8 (ref)
			local cloned = table.clone(viewRecyclerModule.ChatPreset.create())
			cloned.scrollingFrameProps = t
			cloned.data = var9
			cloned.layout = var10
			cloned.axis = viewRecyclerModule.Axis.Y
			cloned.itemType = var8
			
			return cloned
		end, { var9, var10, var8 })
	}
end