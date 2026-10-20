local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)

return function()
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy), GetPlayButtonStoreModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	local Signal6, Signal2_5 = SignalsModule.createSignal(nil)
	local Signal7, Signal2_6 = SignalsModule.createSignal(nil)
	local Signal8, Signal2_7 = SignalsModule.createSignal(nil)
	local Signal9, Signal2_8 = SignalsModule.createSignal(nil)
	local Token = 0
	
	return {
		getIsOpen = Signal,
		getIsChatOpen = GetPlayButtonStoreModule(false).getIsActive,
		useIsOpen = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		setIsOpen = Signal2,
		getFocusRequest = Signal5,
		requestFocus = function(Position, Radius, Model)
			-- upvalues: Token (ref), Signal2_4 (copy)
			Token += 1
			Signal2_4({
				token = Token,
				position = Position,
				radius = Radius,
				model = Model
			})
		end,
		clearFocus = function()
			-- upvalues: Signal2_4 (copy)
			Signal2_4(nil)
		end,
		getWorldViewportRect = Signal1,
		setWorldViewportRect = Signal2_1,
		getWorldChatTop = Signal3,
		setWorldChatTop = Signal2_2,
		getWorldChatLeft = Signal4,
		setWorldChatLeft = Signal2_3,
		getChatResourceRequest = Signal6,
		consumeChatResourceRequest = function(Token)
			-- upvalues: Signal6 (copy), Signal2_5 (copy)
			local SignalResult = Signal6(false)
			
			if SignalResult ~= nil and SignalResult.token == Token then
				Signal2_5(nil)
			end
		end,
		requestAddToChat = function(Resource, ReplacePath, FocusComposer)
			-- upvalues: Token (ref), Signal2_5 (copy)
			Token += 1
			Signal2_5({
				action = "Add",
				token = Token,
				resource = Resource,
				replacePath = ReplacePath,
				focusComposer = FocusComposer
			})
		end,
		requestRemoveFromChat = function(Resource)
			-- upvalues: Token (ref), Signal2_5 (copy)
			Token += 1
			Signal2_5({ action = "Remove", token = Token, resource = Resource })
		end,
		getChatComposerState = Signal7,
		setChatComposerState = Signal2_6,
		getPromptFailure = Signal8,
		reportPromptFailure = function(ErrorCode)
			-- upvalues: Token (ref), Signal2_7 (copy)
			Token += 1
			Signal2_7({ token = Token, errorCode = ErrorCode })
		end,
		getChipEvent = Signal9,
		reportChipEvent = function(Kind, Uris)
			-- upvalues: Token (ref), Signal2_8 (copy)
			Token += 1
			Signal2_8({ token = Token, kind = Kind, uris = Uris })
		end
	}
end