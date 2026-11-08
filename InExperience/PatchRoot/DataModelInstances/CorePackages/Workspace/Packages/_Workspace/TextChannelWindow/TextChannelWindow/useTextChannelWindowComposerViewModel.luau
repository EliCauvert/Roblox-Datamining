local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local AutocompleteModule = require(Parent.ChatUIPrimitives.Autocomplete)
local _ = require(Parent.ChatUIPrimitives.MessageComposer)
local LoggerModule = require(script.Parent.Logger)
local SendMessageDraftModule = require(script.Parent.TextChannelWindowExpressionTray.sendMessageDraft)
local FFlagExpChatTextChannelWindowDictationHandsFreeModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowDictationHandsFree)

return function(p1)
	-- upvalues: ReactModule (copy), SendMessageDraftModule (copy), AutocompleteModule (copy), FFlagExpChatTextChannelWindowDictationHandsFreeModule (copy), ResponsiveModule (copy), LoggerModule (copy)
	local CanChat = p1.canChat
	local CanChatFreely = p1.canChatFreely
	local TargetChannel = p1.targetChannel
	local DisabledOverlay = p1.disabledOverlay
	local OnSend = p1.onSend
	local WindowName = p1.windowName
	local IsUsePreferredInputResultMatch: boolean = if FFlagExpChatTextChannelWindowDictationHandsFreeModule then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional else false
	local NoIsUsePreferredInputResultMatch: boolean = FFlagExpChatTextChannelWindowDictationHandsFreeModule and not IsUsePreferredInputResultMatch
	
	return {
		maximumCharacterLimit = 200,
		chatAvailability = ReactModule.useMemo(function()
			-- upvalues: CanChat (copy), DisabledOverlay (copy)
			return {
				canSend = CanChat,
				upsell = if CanChat then nil else DisabledOverlay
			}
		end, { CanChat, DisabledOverlay }),
		messageDelivery = ReactModule.useMemo(function()
			-- upvalues: SendMessageDraftModule (upval), TargetChannel (copy), CanChatFreely (copy), OnSend (copy)
			return {
				sendMessageDraft = function(p2)
					-- upvalues: SendMessageDraftModule (upval), TargetChannel (upval), CanChatFreely (upval), OnSend (upval)
					SendMessageDraftModule(p2, TargetChannel, CanChatFreely, OnSend)
				end
			}
		end, { OnSend, TargetChannel, CanChatFreely }),
		autocomplete = ReactModule.useMemo(function()
			-- upvalues: AutocompleteModule (upval)
			return {
				sources = {
					AutocompleteModule.BuiltIn.Emoji({ id = "textChannelWindowEmoji" })
				}
			}
		end, {}),
		expressionTray = p1.expressionTray,
		dictation = ReactModule.useMemo(function()
			-- upvalues: WindowName (copy), LoggerModule (upval), NoIsUsePreferredInputResultMatch (copy)
			return {
				surfaceName = WindowName,
				logger = LoggerModule,
				handsFreeEnabled = NoIsUsePreferredInputResultMatch
			}
		end, { WindowName, NoIsUsePreferredInputResultMatch }),
		placeholderText = p1.placeholderText,
		textBoxRef = p1.textBoxRef,
		fontFace = p1.fontFace
	}
end