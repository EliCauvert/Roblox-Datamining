local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local var5 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.Service) else nil
local constantsModule = require(chrome.Integrations.Party.Constants)
local useIsVoiceFocused = crossExperienceVoiceModule.Hooks.useIsVoiceFocused
local useIsVoiceConnected = crossExperienceVoiceModule.Hooks.useIsVoiceConnected

return function() --[[ line: 15 | named "PartyMicBinder" ]]
	-- upvalues: useIsVoiceFocused (ref), useIsVoiceConnected (ref), reactModule (ref), var5 (ref), constantsModule (ref), audioFocusManagementEngineFeature (ref)
	local var7 = useIsVoiceFocused()
	local var8 = useIsVoiceConnected()
	local var9 = reactModule.useMemo(function() --[[ line: 18 ]]
		-- upvalues: var5 (copy), constantsModule (copy)
		return if var5 then var5:integrations()[constantsModule.TOGGLE_MIC_INTEGRATION_ID] else nil
	end, {})
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: var9 (ref), var8 (ref), var7 (ref), audioFocusManagementEngineFeature (copy)
		if var9 then
			if var8 and (var7 or not audioFocusManagementEngineFeature) then
				var9.availability:available()
				
				return
			end
			var9.availability:unavailable()
		end
	end, { var8, var7, var9 })
	
	return nil
end