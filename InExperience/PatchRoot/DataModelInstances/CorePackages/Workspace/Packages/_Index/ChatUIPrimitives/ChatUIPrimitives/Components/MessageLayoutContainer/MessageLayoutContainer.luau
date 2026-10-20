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

local function _(p1, p2, FontFace, SelectableRows, SelectionCursor, IsTranslationSettingEnabled, p3, ReportLatestUsername)
	-- upvalues: ReactModule (copy)
	return function(p4)
		-- upvalues: ReactModule (upval), p1 (copy), p2 (copy), FontFace (copy), SelectableRows (copy), SelectionCursor (copy), IsTranslationSettingEnabled (copy), p3 (copy), ReportLatestUsername (copy)
		return ReactModule.createElement(p1, {
			getMessageId = p4.getMessageId,
			getLayoutOrder = p4.getLayoutOrder,
			getMessagesMap = p2,
			fontFace = FontFace,
			selectableRows = SelectableRows,
			selectionCursor = SelectionCursor,
			isTranslationSettingEnabled = IsTranslationSettingEnabled,
			getLatestMessageId = p3,
			reportLatestUsername = ReportLatestUsername
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
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), SignalsModule (upval), UseMemoResult (copy)
		return if p1.selectableRows then SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval)
			local UseMemoResultResult = UseMemoResult(p2)
			
			return UseMemoResultResult[#UseMemoResultResult]
		end) else nil
	end, { UseMemoResult, p1.selectableRows })
	local UseMessagesMapModuleResult = UseMessagesMapModule(MessagesSignal)
	local BubbleEntryModule1 = if p1.layoutStyle == "bubble" then BubbleEntryModule else TextLineEntryModule
	local UseSignalStateResult = SignalsReactModule.useSignalState((UseMessagePoolModule({
		messageIdsSignal = UseMemoResult,
		createSlotElement = ReactModule.useMemo(function()
			-- upvalues: BubbleEntryModule1 (copy), UseMessagesMapModuleResult (copy), p1 (copy), UseMemoResult1 (copy), ReactModule (upval)
			local FontFace = p1.fontFace
			local SelectableRows = p1.selectableRows
			local SelectionCursor = p1.selectionCursor
			local IsTranslationSettingEnabled = p1.isTranslationSettingEnabled
			local OnLatestUsernameChanged = p1.onLatestUsernameChanged
			
			return function(p2)
				-- upvalues: ReactModule (upval), BubbleEntryModule1 (copy), UseMessagesMapModuleResult (copy), FontFace (copy), SelectableRows (copy), SelectionCursor (copy), IsTranslationSettingEnabled (copy), UseMemoResult1 (copy), OnLatestUsernameChanged (copy)
				return ReactModule.createElement(BubbleEntryModule1, {
					getMessageId = p2.getMessageId,
					getLayoutOrder = p2.getLayoutOrder,
					getMessagesMap = UseMessagesMapModuleResult,
					fontFace = FontFace,
					selectableRows = SelectableRows,
					selectionCursor = SelectionCursor,
					isTranslationSettingEnabled = IsTranslationSettingEnabled,
					getLatestMessageId = UseMemoResult1,
					reportLatestUsername = OnLatestUsernameChanged
				})
			end
		end, {
			BubbleEntryModule1, UseMessagesMapModuleResult, p1.fontFace or false,
			p1.selectableRows or false, p1.selectionCursor or false,
			p1.isTranslationSettingEnabled or false, UseMemoResult1,
			p1.onLatestUsernameChanged or false
		})
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
			end, { UseSignalStateResult }),
			onScroll = p1.onScroll,
			selectableRows = p1.selectableRows
		})
	})
end)