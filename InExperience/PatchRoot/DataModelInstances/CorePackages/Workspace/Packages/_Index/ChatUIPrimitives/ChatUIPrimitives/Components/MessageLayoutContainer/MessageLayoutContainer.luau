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

local function _(p0, p1, p2) --[[ line: 30 | named "createSlotElementFactory" ]]
	-- upvalues: reactModule (ref)
	return function(p3) --[[ line: 35 ]]
		-- upvalues: reactModule (copy), p0 (ref), p1 (ref), p2 (ref)
		return reactModule.createElement(p0, {
			getMessageId = p3.getMessageId,
			getLayoutOrder = p3.getLayoutOrder,
			getMessagesMap = p1,
			fontFace = p2
		})
	end
end

local var10 = signalsModule.createSignal({})
local t = { left = UDim.new(0, 8), right = UDim.new(0, 8) }

return reactModule.memo(function(p4) --[[ line: 62 | named "MessageLayoutContainer" ]]
	-- upvalues: var10 (ref), reactModule (ref), signalsModule (ref), useMessagesMapModule (ref), bubbleEntryModule (ref), textLineEntryModule (ref), useMessagePoolModule (ref), signalsReactModule (ref), foundationModule (ref), bottomLockedScrollViewModule (ref), t (ref)
	local messagesSignal = p4.messagesSignal or var10
	local var13 = reactModule.useMemo(function() --[[ line: 66 ]]
		-- upvalues: signalsModule (copy), messagesSignal (ref)
		return signalsModule.createComputed(function(p5) --[[ line: 67 ]]
			-- upvalues: messagesSignal (copy)
			local t = {}
			
			for i, v in messagesSignal(p5) do
				t[#t + 1] = v.messageId
			end
			return t
		end)
	end, { messagesSignal })
	local var14 = useMessagesMapModule(messagesSignal)
	local var15 = if p4.layoutStyle == "bubble" then bubbleEntryModule else textLineEntryModule
	local var16 = signalsReactModule.useSignalState(useMessagePoolModule({
		messageIdsSignal = var13,
		createSlotElement = reactModule.useMemo(function() --[[ line: 85 ]]
			-- upvalues: var15 (ref), var14 (ref), p4 (ref), reactModule (copy)
			local fontFace = p4.fontFace
			
			return function(p6) --[[ line: 35 ]]
				-- upvalues: reactModule (copy), var15 (ref), var14 (ref), fontFace (ref)
				return reactModule.createElement(var15, {
					getMessageId = p6.getMessageId,
					getLayoutOrder = p6.getLayoutOrder,
					getMessagesMap = var14,
					fontFace = fontFace
				})
			end
		end, { var15, var14, p4.fontFace or false })
	}))
	
	return reactModule.createElement(foundationModule.View, {
		tag = "fill padding-y-xsmall",
		Size = p4.Size or UDim2.fromScale(1, 1)
	}, {
		scrollView = reactModule.createElement(bottomLockedScrollViewModule, {
			Size = UDim2.fromScale(1, 1),
			contentPadding = p4.contentPadding or t,
			children = reactModule.useMemo(function() --[[ line: 100 ]]
				-- upvalues: var16 (ref), reactModule (copy)
				local cloned = table.clone(var16)
				cloned["$layout"] = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				})
				
				return cloned
			end, { var16 }),
			onScroll = p4.onScroll
		})
	})
end)