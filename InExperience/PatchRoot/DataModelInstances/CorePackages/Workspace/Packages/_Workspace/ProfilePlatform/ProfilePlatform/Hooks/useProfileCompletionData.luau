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

return function()
	-- upvalues: reactModule (ref), createProfileCompletionPromptsConfig (ref), fetchPrompts (ref), profileCompletionResolveLatestSduiEntry (ref), getSduiApiStore (ref), enumsModule (ref), signalsReactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: createProfileCompletionPromptsConfig (copy)
		return createProfileCompletionPromptsConfig()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fetchPrompts (copy), var1 (ref)
		fetchPrompts(var1, true)
	end, { var1 })
	
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p1)
		-- upvalues: profileCompletionResolveLatestSduiEntry (copy), getSduiApiStore (copy), enumsModule (copy)
		if not profileCompletionResolveLatestSduiEntry then
			return getSduiApiStore().getRootConfig(enumsModule.Components.ProfileCompletion, p1)
		end
		local var2 = getSduiApiStore().getData(enumsModule.Components.ProfileCompletion).data(p1)
		
		if not var2 then
			return nil
		end
		local config = nil
		local var3 = 0
		
		for i, v in var2 do
			if v and v.config then
				local dataUpdatedTimestamp = v.dataUpdatedTimestamp or 0
				
				if not config or var3 < dataUpdatedTimestamp then
					config = v.config
					var3 = dataUpdatedTimestamp
				end
			end
		end
		return config
	end, {})), reactModule.useCallback(function()
		-- upvalues: fetchPrompts (copy), createProfileCompletionPromptsConfig (copy)
		fetchPrompts(createProfileCompletionPromptsConfig(), true)
	end, {})
end