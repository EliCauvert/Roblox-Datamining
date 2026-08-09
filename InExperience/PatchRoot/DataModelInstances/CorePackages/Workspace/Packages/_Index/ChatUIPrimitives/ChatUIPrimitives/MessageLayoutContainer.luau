local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local useMessagePoolModule = require(script.Parent.useMessagePool)
local useMessagesMapModule = require(script.Parent.useMessagesMap)
local bottomLockedScrollViewModule = require(script.Parent.BottomLockedScrollView)
local textLineEntryModule = require(script.Parent.TextLineEntry)
local bubbleEntryModule = require(script.Parent.BubbleEntry)
local _ = require(script.Parent.Types)

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

local var9 = signalsModule.createSignal({})
local t = { left = UDim.new(0, 8), right = UDim.new(0, 8) }

return reactModule.memo(function(p3) --[[ line: 56 | named "MessageLayoutContainer" ]]
	-- upvalues: var9 (ref), reactModule (ref), signalsModule (ref), useMessagesMapModule (ref), bubbleEntryModule (ref), textLineEntryModule (ref), useMessagePoolModule (ref), signalsReactModule (ref), foundationModule (ref), bottomLockedScrollViewModule (ref), t (ref)
	local messagesSignal = p3.messagesSignal or var9
	local var12 = reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: signalsModule (copy), messagesSignal (ref)
		return signalsModule.createComputed(function(p4) --[[ line: 62 ]]
			-- upvalues: messagesSignal (copy)
			local t = {}
			
			for i, v in messagesSignal(p4) do
				t[#t + 1] = v.messageId
			end
			return t
		end)
	end, {})
	local var13 = useMessagesMapModule(messagesSignal)
	local var14 = if p3.layoutStyle == "bubble" then bubbleEntryModule else textLineEntryModule
	
	return reactModule.createElement(foundationModule.View, {
		tag = "fill padding-y-xsmall",
		Size = p3.Size or UDim2.fromScale(1, 1)
	}, {
		scrollView = reactModule.createElement(bottomLockedScrollViewModule, {
			Size = UDim2.fromScale(1, 1),
			contentPadding = p3.contentPadding or t,
			children = signalsReactModule.useSignalState(useMessagePoolModule({
				messageIdsSignal = var12,
				createSlotElement = function(p5) --[[ line: 33 ]]
					-- upvalues: reactModule (copy), var14 (ref), var13 (ref)
					return reactModule.createElement(var14, {
						getMessageId = p5.getMessageId,
						getLayoutOrder = p5.getLayoutOrder,
						getMessagesMap = var13
					})
				end
			}))
		})
	})
end)