local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)

return function()
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(nil)
	local var7, var8 = signalsModule.createSignal(nil)
	local var9 = 0
	
	return {
		getIsOpen = var1,
		useIsOpen = function()
			-- upvalues: signalsReactModule (copy), var1 (ref)
			return signalsReactModule.useSignalState(var1)
		end,
		setIsOpen = var2,
		getFocusRequest = var3,
		requestFocus = function(p1, p2)
			-- upvalues: var9 (write), var4 (ref)
			var9 += 1
			var4({ token = var9, position = p1, radius = p2 })
		end,
		getChatReferenceRequest = var5,
		requestAddToChat = function(p1)
			-- upvalues: var9 (write), var6 (ref)
			var9 += 1
			var6({ token = var9, reference = p1 })
		end,
		getChatComposerState = var7,
		setChatComposerState = var8
	}
end