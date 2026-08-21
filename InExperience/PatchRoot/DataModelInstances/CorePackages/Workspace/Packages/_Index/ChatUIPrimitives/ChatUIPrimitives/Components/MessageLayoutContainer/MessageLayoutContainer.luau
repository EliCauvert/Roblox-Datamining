local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local useMessagePoolModule = require(script.Parent.useMessagePool)
local useMessagesMapModule = require(script.Parent.useMessagesMap)
local bottomLockedScrollViewModule = require(script.Parent.BottomLockedScrollView)
local textLineEntryModule = require(script.Parent.TextLineEntry)
local bubbleEntryModule = require(script.Parent.BubbleEntry)
local _ = require(chatUIPrimitives.Types)

local function _(p0, p1) --[[ line: 29 | named "createSlotElementFactory" ]]
	-- upvalues: reactModule (ref)
	return function(p2) --[[ line: 33 ]]
		-- upvalues: reactModule (copy), p0 (ref), p1 (ref)
		return reactModule.createElement(p0, {
			getMessageId = p2.getMessageId,
			getLayoutOrder = p2.getLayoutOrder,
			getMessagesMap = p1
		})
	end
end

local var10 = signalsModule.createSignal({})
local t = { left = UDim.new(0, 8), right = UDim.new(0, 8) }

return reactModule.memo(function(p3) --[[ line: 57 | named "MessageLayoutContainer" ]]
	-- upvalues: var10 (ref), reactModule (ref), signalsModule (ref), useMessagesMapModule (ref), bubbleEntryModule (ref), textLineEntryModule (ref), useMessagePoolModule (ref), signalsReactModule (ref), foundationModule (ref), bottomLockedScrollViewModule (ref), t (ref)
	local messagesSignal = p3.messagesSignal or var10
	local var13 = reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: signalsModule (copy), messagesSignal (ref)
		return signalsModule.createComputed(function(p4) --[[ line: 62 ]]
			-- upvalues: messagesSignal (copy)
			local t = {}
			
			for i, v in messagesSignal(p4) do
				t[#t + 1] = v.messageId
			end
			return t
		end)
	end, { messagesSignal })
	local var14 = useMessagesMapModule(messagesSignal)
	local var15 = if p3.layoutStyle == "bubble" then bubbleEntryModule else textLineEntryModule
	local var16 = signalsReactModule.useSignalState(useMessagePoolModule({
		messageIdsSignal = var13,
		createSlotElement = reactModule.useMemo(function() --[[ line: 80 ]]
			-- upvalues: var15 (ref), var14 (ref), reactModule (copy)
			return function(p5) --[[ line: 33 ]]
				-- upvalues: reactModule (copy), var15 (ref), var14 (ref)
				return reactModule.createElement(var15, {
					getMessageId = p5.getMessageId,
					getLayoutOrder = p5.getLayoutOrder,
					getMessagesMap = var14
				})
			end
		end, { var15, var14 })
	}))
	
	return reactModule.createElement(foundationModule.View, {
		tag = "fill padding-y-xsmall",
		Size = p3.Size or UDim2.fromScale(1, 1)
	}, {
		scrollView = reactModule.createElement(bottomLockedScrollViewModule, {
			Size = UDim2.fromScale(1, 1),
			contentPadding = p3.contentPadding or t,
			children = reactModule.useMemo(function() --[[ line: 95 ]]
				-- upvalues: var16 (ref), reactModule (copy)
				local cloned = table.clone(var16)
				cloned["$layout"] = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				})
				
				return cloned
			end, { var16 }),
			onScroll = p3.onScroll
		})
	})
end)