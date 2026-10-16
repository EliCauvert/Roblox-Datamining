local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.SduiCoreSystem)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local CreateProfileCompletionPromptsConfigFunction = require(Parent.ProfilePlatformCommon).Utils.createProfileCompletionPromptsConfig
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local FetchPromptsFunction = require(Parent.ServerTriggeredModals).fetchPrompts

return function() --[[ Line: 26 | Named "useProfileCompletionData" ]]
	-- upvalues: ReactModule (copy), CreateProfileCompletionPromptsConfigFunction (copy), FetchPromptsFunction (copy), GetSduiApiStoreFunction (copy), EnumsModule (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 27 ]]
		-- upvalues: CreateProfileCompletionPromptsConfigFunction (upval)
		return CreateProfileCompletionPromptsConfigFunction()
	end, {})
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: FetchPromptsFunction (upval), UseMemoResult (copy)
		FetchPromptsFunction(UseMemoResult, true)
	end, { UseMemoResult })
	
	return SignalsReactModule.useSignalState((ReactModule.useCallback(function(p1) --[[ Line: 39 ]]
		-- upvalues: GetSduiApiStoreFunction (upval), EnumsModule (upval)
		local DataResult = GetSduiApiStoreFunction().getData(EnumsModule.Components.ProfileCompletion).data(p1)
		
		if not DataResult then
			return nil
		end
		local v1 = nil
		local v2 = 0
		
		for _, value in DataResult do
			if value and value.config then
				local DataUpdatedTimestamp = value.dataUpdatedTimestamp or 0
				
				if not v1 or v2 < DataUpdatedTimestamp then
					v1 = value.config
					v2 = DataUpdatedTimestamp
				end
			end
		end
		return v1
	end, {}))), (ReactModule.useCallback(function() --[[ Line: 35 ]]
		-- upvalues: FetchPromptsFunction (upval), CreateProfileCompletionPromptsConfigFunction (upval)
		FetchPromptsFunction(CreateProfileCompletionPromptsConfigFunction(), true)
	end, {}))
end