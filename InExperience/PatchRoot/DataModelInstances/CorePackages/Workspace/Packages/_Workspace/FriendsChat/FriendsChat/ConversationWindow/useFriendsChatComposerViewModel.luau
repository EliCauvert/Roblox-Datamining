local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local AutocompleteModule = require(Parent.ChatUIPrimitives.Autocomplete)
local _ = require(Parent.ChatUIPrimitives.MessageComposer)
local MessageDraftModelModule = require(Parent.ChatUIPrimitives.MessageDraftModel)
local FFlagFriendsChatVoiceTypingModule = require(FriendsChat.Flags.FFlagFriendsChatVoiceTyping)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

return function(p1)
	-- upvalues: ReactModule (copy), MessageDraftModelModule (copy), AutocompleteModule (copy), FFlagFriendsChatVoiceTypingModule (copy), NewResult (copy)
	local CanLocalUserChat = p1.canLocalUserChat
	local TimeoutOverlay = p1.timeoutOverlay
	local OnSendFunction = p1.onSend
	local OnFocusGainedFunction = p1.onFocusGained
	local OnFocusLostFunction = p1.onFocusLost
	
	return {
		chatAvailability = ReactModule.useMemo(function()
			-- upvalues: CanLocalUserChat (copy), TimeoutOverlay (copy)
			return {
				canSend = CanLocalUserChat,
				reason = if CanLocalUserChat then nil else "timedOut",
				upsell = TimeoutOverlay
			}
		end, { CanLocalUserChat, TimeoutOverlay }),
		messageDelivery = ReactModule.useMemo(function()
			-- upvalues: MessageDraftModelModule (upval), OnSendFunction (copy)
			return {
				sendMessageDraft = function(p2)
					-- upvalues: MessageDraftModelModule (upval), OnSendFunction (upval)
					local PlainText = MessageDraftModelModule.toPlainText(p2)
					
					if PlainText ~= nil then
						OnSendFunction(PlainText)
					end
				end
			}
		end, { OnSendFunction }),
		autocomplete = ReactModule.useMemo(function()
			-- upvalues: AutocompleteModule (upval)
			return {
				sources = {
					AutocompleteModule.BuiltIn.Emoji({ id = "friendsChatEmoji" })
				}
			}
		end, {}),
		dictation = if FFlagFriendsChatVoiceTypingModule then ReactModule.useMemo(function()
			-- upvalues: NewResult (upval)
			return { surfaceName = "FriendsChat", logger = NewResult }
		end, {}) else nil,
		onFocusChanged = ReactModule.useCallback(function(p2)
			-- upvalues: OnFocusGainedFunction (copy), OnFocusLostFunction (copy)
			if p2 then
				OnFocusGainedFunction()
				
				return
			else
				OnFocusLostFunction()
			end
		end, { OnFocusGainedFunction, OnFocusLostFunction }),
		placeholderText = p1.placeholderText,
		maximumCharacterLimit = p1.maximumCharacterLimit,
		textBoxRef = p1.textBoxRef,
		navigationTargetRef = p1.navigationTargetRef,
		transparency = p1.transparency
	}
end