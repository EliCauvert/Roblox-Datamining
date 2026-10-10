local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(chatUIPrimitives.Types)
local useStableSignalModule = require(chatUIPrimitives.Hooks.useStableSignal)
local shouldOfferTranslationModule = require(chatUIPrimitives.Translation.shouldOfferTranslation)

return function(value, p1, p2)
	-- upvalues: useStableSignalModule (ref), reactModule (ref), signalsReactModule (ref), shouldOfferTranslationModule (ref)
	local var1, var2 = useStableSignalModule(true)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2(true)
	end, { p1, var2 })
	
	return {
		isOffered = reactModule.useMemo(function()
			-- upvalues: value (ref), shouldOfferTranslationModule (copy), p2 (ref)
			return value ~= nil and shouldOfferTranslationModule(value, p2)
		end, { value, p2 }),
		shouldShowTranslation = signalsReactModule.useSignalState(var1),
		onToggle = reactModule.useCallback(function()
			-- upvalues: var2 (ref), var1 (ref)
			var2(not var1())
		end, { var1, var2 })
	}
end