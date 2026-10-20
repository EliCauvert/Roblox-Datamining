local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(ChatUIPrimitives.Types)
local UseStableSignalModule = require(ChatUIPrimitives.Hooks.useStableSignal)
local ShouldOfferTranslationModule = require(ChatUIPrimitives.Translation.shouldOfferTranslation)

return function(p1, p2, p3)
	-- upvalues: UseStableSignalModule (copy), ReactModule (copy), SignalsReactModule (copy), ShouldOfferTranslationModule (copy)
	local UseStableSignalModuleResult, UseStableSignalModuleResult2 = UseStableSignalModule(true)
	ReactModule.useEffect(function()
		-- upvalues: UseStableSignalModuleResult2 (copy)
		UseStableSignalModuleResult2(true)
	end, { p2, UseStableSignalModuleResult2 })
	
	return {
		isOffered = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ShouldOfferTranslationModule (upval), p3 (copy)
			return p1 ~= nil and ShouldOfferTranslationModule(p1, p3)
		end, { p1, p3 }),
		shouldShowTranslation = SignalsReactModule.useSignalState(UseStableSignalModuleResult),
		onToggle = ReactModule.useCallback(function()
			-- upvalues: UseStableSignalModuleResult2 (copy), UseStableSignalModuleResult (copy)
			UseStableSignalModuleResult2(not UseStableSignalModuleResult())
		end, {
			UseStableSignalModuleResult,
			UseStableSignalModuleResult2
		})
	}
end