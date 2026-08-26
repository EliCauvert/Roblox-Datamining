local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local var1 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.Service) else nil
local constantsModule = require(chrome.Integrations.Party.Constants)
local useIsVoiceFocused = crossExperienceVoiceModule.Hooks.useIsVoiceFocused
local useIsVoiceConnected = crossExperienceVoiceModule.Hooks.useIsVoiceConnected

return function()
	-- upvalues: useIsVoiceFocused (ref), useIsVoiceConnected (ref), reactModule (ref), var1 (ref), constantsModule (ref), audioFocusManagementEngineFeature (ref)
	local var2 = useIsVoiceFocused()
	local var3 = useIsVoiceConnected()
	local var4 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), constantsModule (copy)
		return if var1 then var1:integrations()[constantsModule.TOGGLE_MIC_INTEGRATION_ID] else nil
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref), var2 (ref), audioFocusManagementEngineFeature (copy)
		if var4 then
			if var3 and (var2 or not audioFocusManagementEngineFeature) then
				var4.availability:available()
				
				return
			end
			var4.availability:unavailable()
		end
	end, { var3, var2, var4 })
	
	return nil
end