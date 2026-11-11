local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.SduiCoreSystem)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local CreateProfileCompletionPromptsConfigFunction = require(Parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local FetchPromptsFunction = require(Parent.ServerTriggeredModals).fetchPrompts

return function()
	-- upvalues: ReactModule (copy), CreateProfileCompletionPromptsConfigFunction (copy), FetchPromptsFunction (copy), GetSduiApiStoreFunction (copy), EnumsModule (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateProfileCompletionPromptsConfigFunction (upval)
		return CreateProfileCompletionPromptsConfigFunction()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FetchPromptsFunction (upval), UseMemoResult (copy)
		FetchPromptsFunction(UseMemoResult, true)
	end, { UseMemoResult })
	
	return SignalsReactModule.useSignalState((ReactModule.useCallback(function(p1)
		-- upvalues: GetSduiApiStoreFunction (upval), EnumsModule (upval)
		return (GetSduiApiStoreFunction().getRootConfig(EnumsModule.Components.ProfileCompletion, p1))
	end, {}))), (ReactModule.useCallback(function()
		-- upvalues: FetchPromptsFunction (upval), CreateProfileCompletionPromptsConfigFunction (upval)
		FetchPromptsFunction(CreateProfileCompletionPromptsConfigFunction(), true)
	end, {}))
end