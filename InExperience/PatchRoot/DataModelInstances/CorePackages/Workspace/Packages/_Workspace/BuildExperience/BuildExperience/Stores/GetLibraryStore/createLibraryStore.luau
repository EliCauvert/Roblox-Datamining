local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)

return function()
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy), GetPlayButtonStoreModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal(false)
	local Signal6, Signal2_5 = SignalsModule.createSignal(false)
	local Callback = nil
	local Signal7, Signal2_6 = SignalsModule.createSignal(nil)
	local Signal8, Signal2_7 = SignalsModule.createSignal(nil)
	local Signal9, Signal2_8 = SignalsModule.createSignal(nil)
	local Signal10, Signal2_9 = SignalsModule.createSignal(nil)
	local Signal11, Signal2_10 = SignalsModule.createSignal(nil)
	local Token = 0
	
	local function requestRemoveAllFromChat(Resources)
		-- upvalues: Token (ref), Signal2_7 (copy)
		if #Resources ~= 0 then
			Token += 1
			Signal2_7({
				action = "Remove",
				token = Token,
				resources = Resources,
				replacePaths = {}
			})
			
			return
		end
	end
	
	return {
		getIsOpen = Signal,
		getIsChatOpen = GetPlayButtonStoreModule(false).getIsActive,
		useIsOpen = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		setIsOpen = Signal2,
		getFocusRequest = Signal7,
		requestFocus = function(Position, Radius, Model)
			-- upvalues: Token (ref), Signal2_6 (copy), Signal (copy)
			Token += 1
			Signal2_6({
				token = Token,
				position = Position,
				radius = Radius,
				model = Model,
				isInWorld = not Signal(false) or nil
			})
		end,
		clearFocus = function()
			-- upvalues: Signal2_6 (copy)
			Signal2_6(nil)
		end,
		getWorldViewportRect = Signal1,
		setWorldViewportRect = Signal2_1,
		getWorldChatTop = Signal3,
		setWorldChatTop = Signal2_2,
		getWorldChatLeft = Signal4,
		setWorldChatLeft = Signal2_3,
		getWorldCutoutTransitioning = Signal5,
		setWorldCutoutTransitioning = Signal2_4,
		getWorldCameraSettling = Signal6,
		setWorldCameraSettling = Signal2_5,
		isWorldItem = function(p1)
			-- upvalues: Callback (ref)
			return Callback ~= nil and Callback(p1)
		end,
		setWorldItemResolver = function(Value)
			-- upvalues: Callback (ref)
			Callback = Value
		end,
		getChatResourceRequest = Signal8,
		consumeChatResourceRequest = function(Token)
			-- upvalues: Signal8 (copy), Signal2_7 (copy)
			local SignalResult = Signal8(false)
			
			if SignalResult ~= nil and SignalResult.token == Token then
				Signal2_7(nil)
			end
		end,
		requestAddToChat = function(p1, p2, FocusComposer)
			-- upvalues: Token (ref), Signal2_7 (copy)
			local Resources = { p1 }
			local T = if p2 == nil then {} else { p2 }
			
			if #Resources ~= 0 then
				Token += 1
				Signal2_7({
					action = "Add",
					token = Token,
					resources = Resources,
					replacePaths = T,
					focusComposer = FocusComposer
				})
				
				return
			end
		end,
		requestRemoveFromChat = function(p1)
			-- upvalues: requestRemoveAllFromChat (copy)
			requestRemoveAllFromChat({ p1 })
		end,
		requestAddAllToChat = function(Resources, ReplacePaths, FocusComposer)
			-- upvalues: Token (ref), Signal2_7 (copy)
			if #Resources ~= 0 then
				Token += 1
				Signal2_7({
					action = "Add",
					token = Token,
					resources = Resources,
					replacePaths = ReplacePaths,
					focusComposer = FocusComposer
				})
				
				return
			end
		end,
		requestRemoveAllFromChat = requestRemoveAllFromChat,
		getChatComposerState = Signal9,
		setChatComposerState = Signal2_8,
		getPromptFailure = Signal10,
		reportPromptFailure = function(ErrorCode)
			-- upvalues: Token (ref), Signal2_9 (copy)
			Token += 1
			Signal2_9({ token = Token, errorCode = ErrorCode })
		end,
		getChipEvent = Signal11,
		reportChipEvent = function(Kind, Uris)
			-- upvalues: Token (ref), Signal2_10 (copy)
			Token += 1
			Signal2_10({ token = Token, kind = Kind, uris = Uris })
		end
	}
end