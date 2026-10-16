local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local LearnMorePartialModalContainerModule = require(script.Parent.LearnMorePartialModalContainer)
local LoggerModule = require(script.Parent.Logger)
local t = {}

return function(p1) --[[ Line: 18 | Named "LearnMorePartialModalScreen" ]]
	-- upvalues: CryoModule (copy), t (copy), UseEffectOnMountFunction (copy), LoggerModule (copy), UseCallbackFunction (copy), ReactModule (copy), LearnMorePartialModalContainerModule (copy)
	local Navigation = CryoModule.Dictionary.union(t, p1).navigation
	assert(type(Navigation) ~= "nil", "LearnMorePartialModalScreen should be wrapped with React Navigation")
	local ConversationIdParam = Navigation and (Navigation.getParam and Navigation.getParam("conversationId", nil))
	UseEffectOnMountFunction(function() --[[ Line: 24 ]]
		-- upvalues: LoggerModule (upval)
		LoggerModule:info("LearnMorePartialModalScreen mounted")
	end)
	
	return ReactModule.createElement(LearnMorePartialModalContainerModule, {
		conversationId = ConversationIdParam,
		onDismissed = UseCallbackFunction(function() --[[ Line: 28 ]]
			-- upvalues: Navigation (copy)
			Navigation.goBack()
		end, { Navigation })
	})
end