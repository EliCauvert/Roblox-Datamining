local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local _ = require(parent.SduiCoreSystem)
local enumsModule = require(profilePlatform.Common.Enums)
local createProfileCompletionPromptsConfig = require(parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local serverTriggeredModalsModule = require(parent.ServerTriggeredModals)
local profileCompletionResolveLatestSduiEntry = game:DefineFastFlag("ProfileCompletionResolveLatestSduiEntry", false)
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local fetchPrompts = serverTriggeredModalsModule.fetchPrompts

return function() --[[ line: 29 | named "useProfileCompletionData" ]]
	-- upvalues: reactModule (ref), createProfileCompletionPromptsConfig (ref), fetchPrompts (ref), profileCompletionResolveLatestSduiEntry (ref), getSduiApiStore (ref), enumsModule (ref), signalsReactModule (ref)
	local var7 = reactModule.useMemo(function() --[[ line: 30 ]]
		-- upvalues: createProfileCompletionPromptsConfig (copy)
		return createProfileCompletionPromptsConfig()
	end, {})
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: fetchPrompts (copy), var7 (ref)
		fetchPrompts(var7, true)
	end, { var7 })
	
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p0) --[[ line: 42 ]]
		-- upvalues: profileCompletionResolveLatestSduiEntry (copy), getSduiApiStore (copy), enumsModule (copy)
		if not profileCompletionResolveLatestSduiEntry then
			return getSduiApiStore().getRootConfig(enumsModule.Components.ProfileCompletion, p0)
		end
		local var8 = getSduiApiStore().getData(enumsModule.Components.ProfileCompletion).data(p0)
		
		if not var8 then
			return nil
		end
		local config = nil
		local var9 = 0
		
		for i, v in var8 do
			if v and v.config then
				local dataUpdatedTimestamp = v.dataUpdatedTimestamp or 0
				
				if not config or var9 < dataUpdatedTimestamp then
					config = v.config
					var9 = dataUpdatedTimestamp
				end
			end
		end
		return config
	end, {})), reactModule.useCallback(function() --[[ line: 38 ]]
		-- upvalues: fetchPrompts (copy), createProfileCompletionPromptsConfig (copy)
		fetchPrompts(createProfileCompletionPromptsConfig(), true)
	end, {})
end