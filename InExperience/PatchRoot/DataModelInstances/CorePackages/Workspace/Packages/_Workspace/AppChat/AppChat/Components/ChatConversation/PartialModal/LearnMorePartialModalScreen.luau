local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local learnMorePartialModalContainerModule = require(script.Parent.LearnMorePartialModalContainer)
local loggerModule = require(script.Parent.Logger)
local t = {}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useEffectOnMount (ref), loggerModule (ref), useCallback (ref), reactModule (ref), learnMorePartialModalContainerModule (ref)
	local navigation = cryoModule.Dictionary.union(t, p1).navigation
	assert(type(navigation) ~= "nil", "LearnMorePartialModalScreen should be wrapped with React Navigation")
	local conversationId = navigation and (navigation.getParam and navigation.getParam("conversationId", nil))
	useEffectOnMount(function()
		-- upvalues: loggerModule (copy)
		loggerModule:info("LearnMorePartialModalScreen mounted")
	end)
	
	return reactModule.createElement(learnMorePartialModalContainerModule, {
		conversationId = conversationId,
		onDismissed = useCallback(function()
			-- upvalues: navigation (ref)
			navigation.goBack()
		end, { navigation })
	})
end