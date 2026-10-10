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

local function _(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: reactModule (ref)
	return function(p9)
		-- upvalues: reactModule (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), p8 (ref)
		return reactModule.createElement(p1, {
			getMessageId = p9.getMessageId,
			getLayoutOrder = p9.getLayoutOrder,
			getMessagesMap = p2,
			fontFace = p3,
			selectableRows = p4,
			selectionCursor = p5,
			isTranslationSettingEnabled = p6,
			getLatestMessageId = p7,
			reportLatestUsername = p8
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
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), signalsModule (copy), var2 (ref)
		return if p1.selectableRows then signalsModule.createComputed(function(p2)
			-- upvalues: var2 (copy)
			local var4 = var2(p2)
			
			return var4[#var4]
		end) else nil
	end, { var2, p1.selectableRows })
	local var4 = useMessagesMapModule(messagesSignal)
	local var5 = if p1.layoutStyle == "bubble" then bubbleEntryModule else textLineEntryModule
	local var6 = signalsReactModule.useSignalState(useMessagePoolModule({
		messageIdsSignal = var2,
		createSlotElement = reactModule.useMemo(function()
			-- upvalues: var5 (ref), var4 (ref), p1 (ref), var3 (ref), reactModule (copy)
			local fontFace = p1.fontFace
			local selectableRows = p1.selectableRows
			local selectionCursor = p1.selectionCursor
			local isTranslationSettingEnabled = p1.isTranslationSettingEnabled
			local onLatestUsernameChanged = p1.onLatestUsernameChanged
			
			return function(p2)
				-- upvalues: reactModule (copy), var5 (ref), var4 (ref), fontFace (ref), selectableRows (ref), selectionCursor (ref), isTranslationSettingEnabled (ref), var3 (ref), onLatestUsernameChanged (ref)
				return reactModule.createElement(var5, {
					getMessageId = p2.getMessageId,
					getLayoutOrder = p2.getLayoutOrder,
					getMessagesMap = var4,
					fontFace = fontFace,
					selectableRows = selectableRows,
					selectionCursor = selectionCursor,
					isTranslationSettingEnabled = isTranslationSettingEnabled,
					getLatestMessageId = var3,
					reportLatestUsername = onLatestUsernameChanged
				})
			end
		end, {
			var5, var4, p1.fontFace or false, p1.selectableRows or false,
			p1.selectionCursor or false, p1.isTranslationSettingEnabled or false, var3,
			p1.onLatestUsernameChanged or false
		})
	}))
	
	return reactModule.createElement(foundationModule.View, {
		tag = "fill padding-y-xsmall",
		Size = p1.Size or UDim2.fromScale(1, 1)
	}, {
		scrollView = reactModule.createElement(bottomLockedScrollViewModule, {
			Size = UDim2.fromScale(1, 1),
			contentPadding = p1.contentPadding or t,
			children = reactModule.useMemo(function()
				-- upvalues: var6 (ref), reactModule (copy)
				local cloned = table.clone(var6)
				cloned["$layout"] = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				})
				
				return cloned
			end, { var6 }),
			onScroll = p1.onScroll,
			selectableRows = p1.selectableRows
		})
	})
end)