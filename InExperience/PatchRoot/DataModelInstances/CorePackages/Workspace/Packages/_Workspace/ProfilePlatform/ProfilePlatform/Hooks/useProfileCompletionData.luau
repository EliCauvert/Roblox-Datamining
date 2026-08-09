local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local _ = require(parent.SduiCoreSystem)
local enumsModule = require(profilePlatform.Common.Enums)
local createProfileCompletionPromptsConfig = require(parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local fetchPrompts = require(parent.ServerTriggeredModals).fetchPrompts

return function() --[[ line: 26 | named "useProfileCompletionData" ]]
	-- upvalues: reactModule (ref), createProfileCompletionPromptsConfig (ref), fetchPrompts (ref), getSduiApiStore (ref), enumsModule (ref), signalsReactModule (ref)
	local var5 = reactModule.useMemo(function() --[[ line: 27 ]]
		-- upvalues: createProfileCompletionPromptsConfig (copy)
		return createProfileCompletionPromptsConfig()
	end, {})
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: fetchPrompts (copy), var5 (ref)
		fetchPrompts(var5, true)
	end, { var5 })
	
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p0) --[[ line: 39 ]]
		-- upvalues: getSduiApiStore (copy), enumsModule (copy)
		return getSduiApiStore().getRootConfig(enumsModule.Components.ProfileCompletion, p0)
	end, {})), reactModule.useCallback(function() --[[ line: 35 ]]
		-- upvalues: fetchPrompts (copy), createProfileCompletionPromptsConfig (copy)
		fetchPrompts(createProfileCompletionPromptsConfig(), true)
	end, {})
end