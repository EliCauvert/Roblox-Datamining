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

local function _(p1, p2, p3)
	-- upvalues: reactModule (ref)
	return function(p4)
		-- upvalues: reactModule (copy), p1 (ref), p2 (ref), p3 (ref)
		return reactModule.createElement(p1, {
			getMessageId = p4.getMessageId,
			getLayoutOrder = p4.getLayoutOrder,
			getMessagesMap = p2,
			fontFace = p3
		})
	end
end

local var1 = signalsModule.createSignal({})
local t = { left = UDim.new(0, 8), right = UDim.new(0, 8) }

return reactModule.memo(function(p1)
	-- upvalues: var1 (ref), reactModule (ref), signalsModule (ref), useMessagesMapModule (ref), bubbleEntryModule (ref), textLineEntryModule (ref), useMessagePoolModule (ref), signalsReactModule (ref), foundationModule (ref), bottomLockedScrollViewModule (ref), t (ref)
	local messagesSignal = p1.messagesSignal or var1
	local var2 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), messagesSignal (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: messagesSignal (copy)
			local t = {}
			
			for i, v in messagesSignal(p2) do
				t[#t + 1] = v.messageId
			end
			return t
		end)
	end, { messagesSignal })
	local var3 = useMessagesMapModule(messagesSignal)
	local var4 = if p1.layoutStyle == "bubble" then bubbleEntryModule else textLineEntryModule
	local var5 = signalsReactModule.useSignalState(useMessagePoolModule({
		messageIdsSignal = var2,
		createSlotElement = reactModule.useMemo(function()
			-- upvalues: var4 (ref), var3 (ref), p1 (ref), reactModule (copy)
			local fontFace = p1.fontFace
			
			return function(p2)
				-- upvalues: reactModule (copy), var4 (ref), var3 (ref), fontFace (ref)
				return reactModule.createElement(var4, {
					getMessageId = p2.getMessageId,
					getLayoutOrder = p2.getLayoutOrder,
					getMessagesMap = var3,
					fontFace = fontFace
				})
			end
		end, { var4, var3, p1.fontFace or false })
	}))
	
	return reactModule.createElement(foundationModule.View, {
		tag = "fill padding-y-xsmall",
		Size = p1.Size or UDim2.fromScale(1, 1)
	}, {
		scrollView = reactModule.createElement(bottomLockedScrollViewModule, {
			Size = UDim2.fromScale(1, 1),
			contentPadding = p1.contentPadding or t,
			children = reactModule.useMemo(function()
				-- upvalues: var5 (ref), reactModule (copy)
				local cloned = table.clone(var5)
				cloned["$layout"] = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				})
				
				return cloned
			end, { var5 }),
			onScroll = p1.onScroll
		})
	})
end)