local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local UseMessagePoolModule = require(script.Parent.useMessagePool)
local UseMessagesMapModule = require(script.Parent.useMessagesMap)
local BottomLockedScrollViewModule = require(script.Parent.BottomLockedScrollView)
local TextLineEntryModule = require(script.Parent.TextLineEntry)
local BubbleEntryModule = require(script.Parent.BubbleEntry)
local _ = require(ChatUIPrimitives.Types)

local function _(p1, p2)
	-- upvalues: ReactModule (copy)
	return function(p3)
		-- upvalues: ReactModule (upval), p1 (copy), p2 (copy)
		return ReactModule.createElement(p1, {
			getMessageId = p3.getMessageId,
			getLayoutOrder = p3.getLayoutOrder,
			getMessagesMap = p2
		})
	end
end

local Signal = SignalsModule.createSignal({})
local config = { left = UDim.new(0, 8), right = UDim.new(0, 8) }

return ReactModule.memo(function(p1)
	-- upvalues: Signal (copy), ReactModule (copy), SignalsModule (copy), UseMessagesMapModule (copy), BubbleEntryModule (copy), TextLineEntryModule (copy), UseMessagePoolModule (copy), SignalsReactModule (copy), FoundationModule (copy), BottomLockedScrollViewModule (copy), config (copy)
	local MessagesSignal = p1.messagesSignal or Signal
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), MessagesSignal (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: MessagesSignal (upval)
			local MessageIds = {}
			
			for _, value in MessagesSignal(p2) do
				MessageIds[#MessageIds + 1] = value.messageId
			end
			return MessageIds
		end)
	end, { MessagesSignal })
	local UseMessagesMapModuleResult = UseMessagesMapModule(MessagesSignal)
	local BubbleEntryModule1 = if p1.layoutStyle == "bubble" then BubbleEntryModule else TextLineEntryModule
	local UseSignalStateResult = SignalsReactModule.useSignalState((UseMessagePoolModule({
		messageIdsSignal = UseMemoResult,
		createSlotElement = ReactModule.useMemo(function()
			-- upvalues: BubbleEntryModule1 (copy), UseMessagesMapModuleResult (copy), ReactModule (upval)
			return function(p2)
				-- upvalues: ReactModule (upval), BubbleEntryModule1 (copy), UseMessagesMapModuleResult (copy)
				return ReactModule.createElement(BubbleEntryModule1, {
					getMessageId = p2.getMessageId,
					getLayoutOrder = p2.getLayoutOrder,
					getMessagesMap = UseMessagesMapModuleResult
				})
			end
		end, { BubbleEntryModule1, UseMessagesMapModuleResult })
	})))
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "fill padding-y-xsmall",
		Size = p1.Size or UDim2.fromScale(1, 1)
	}, {
		scrollView = ReactModule.createElement(BottomLockedScrollViewModule, {
			Size = UDim2.fromScale(1, 1),
			contentPadding = p1.contentPadding or config,
			children = ReactModule.useMemo(function()
				-- upvalues: UseSignalStateResult (copy), ReactModule (upval)
				local Copy = table.clone(UseSignalStateResult)
				Copy["$layout"] = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				})
				
				return Copy
			end, { UseSignalStateResult })
		})
	})
end)