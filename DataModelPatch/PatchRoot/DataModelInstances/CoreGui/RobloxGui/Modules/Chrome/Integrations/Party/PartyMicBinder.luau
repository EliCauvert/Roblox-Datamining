local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AudioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local CrossExperienceVoiceModule = require(CorePackages.Workspace.Packages.CrossExperienceVoice)
local ServiceModule = if require(CorePackages.Workspace.Packages.Chrome).Enabled() then require(Chrome.Service) else nil
local ConstantsModule = require(Chrome.Integrations.Party.Constants)
local UseIsVoiceFocusedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceFocused
local UseIsVoiceConnectedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceConnected

return function()
	-- upvalues: UseIsVoiceFocusedFunction (copy), UseIsVoiceConnectedFunction (copy), ReactModule (copy), ServiceModule (copy), ConstantsModule (copy), AudioFocusManagementEngineFeature (copy)
	local UseIsVoiceFocusedResult = UseIsVoiceFocusedFunction()
	local UseIsVoiceConnectedResult = UseIsVoiceConnectedFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ServiceModule (upval), ConstantsModule (upval)
		return if ServiceModule then ServiceModule:integrations()[ConstantsModule.TOGGLE_MIC_INTEGRATION_ID] else nil
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseIsVoiceConnectedResult (copy), UseIsVoiceFocusedResult (copy), AudioFocusManagementEngineFeature (upval)
		if UseMemoResult then
			if UseIsVoiceConnectedResult and (UseIsVoiceFocusedResult or not AudioFocusManagementEngineFeature) then
				UseMemoResult.availability:available()
				
				return
			end
			UseMemoResult.availability:unavailable()
		end
	end, {
		UseIsVoiceConnectedResult,
		UseIsVoiceFocusedResult,
		UseMemoResult
	})
	
	return nil
end