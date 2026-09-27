local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)

return function()
	-- upvalues: signalsModule (ref), signalsReactModule (ref), getPlayButtonStoreModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(nil)
	local var7, var8 = signalsModule.createSignal(nil)
	local var9, var10 = signalsModule.createSignal(nil)
	local var11, var12 = signalsModule.createSignal(nil)
	local var13, var14 = signalsModule.createSignal(nil)
	local var15, var16 = signalsModule.createSignal(nil)
	local var17, var18 = signalsModule.createSignal(nil)
	local var19 = 0
	
	return {
		getIsOpen = var1,
		getIsChatOpen = getPlayButtonStoreModule(false).getIsActive,
		useIsOpen = function()
			-- upvalues: signalsReactModule (copy), var1 (ref)
			return signalsReactModule.useSignalState(var1)
		end,
		setIsOpen = var2,
		getFocusRequest = var9,
		requestFocus = function(p1, p2, p3)
			-- upvalues: var19 (write), var10 (ref)
			var19 += 1
			var10({ token = var19, position = p1, radius = p2, model = p3 })
		end,
		clearFocus = function()
			-- upvalues: var10 (ref)
			var10(nil)
		end,
		getWorldViewportRect = var3,
		setWorldViewportRect = var4,
		getWorldChatTop = var5,
		setWorldChatTop = var6,
		getWorldChatLeft = var7,
		setWorldChatLeft = var8,
		getChatResourceRequest = var11,
		consumeChatResourceRequest = function(p1)
			-- upvalues: var11 (ref), var12 (ref)
			local var20 = var11(false)
			
			if var20 ~= nil and var20.token == p1 then
				var12(nil)
			end
		end,
		requestAddToChat = function(p1, p2, p3)
			-- upvalues: var19 (write), var12 (ref)
			var19 += 1
			var12({
				action = "Add",
				token = var19,
				resource = p1,
				replacePath = p2,
				focusComposer = p3
			})
		end,
		requestRemoveFromChat = function(p1)
			-- upvalues: var19 (write), var12 (ref)
			var19 += 1
			var12({ action = "Remove", token = var19, resource = p1 })
		end,
		getChatComposerState = var13,
		setChatComposerState = var14,
		getPromptFailure = var15,
		reportPromptFailure = function(p1)
			-- upvalues: var19 (write), var16 (ref)
			var19 += 1
			var16({ token = var19, errorCode = p1 })
		end,
		getChipEvent = var17,
		reportChipEvent = function(p1, p2)
			-- upvalues: var19 (write), var18 (ref)
			var19 += 1
			var18({ token = var19, kind = p1, uris = p2 })
		end
	}
end