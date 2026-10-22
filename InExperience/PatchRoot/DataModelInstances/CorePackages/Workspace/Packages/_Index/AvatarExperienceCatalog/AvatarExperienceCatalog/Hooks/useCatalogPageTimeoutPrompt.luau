local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local GetTimeoutStatusStoreFunction = AvatarExperienceCommonModule.Stores.getTimeoutStatusStore
local ShowAvatarChangeFeatureRestrictionFunction = AvatarExperienceCommonModule.Utils.showAvatarChangeFeatureRestriction
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagAXUseUFRForTimeoutPromptInApp = require(Parent.AvatarExperienceFlags).FFlagAXUseUFRForTimeoutPromptInApp

return function(Current, Callback)
	-- upvalues: GetTimeoutStatusStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), FFlagAXUseUFRForTimeoutPromptInApp (copy), ShowAvatarChangeFeatureRestrictionFunction (copy), AvatarScreen (copy)
	local TimeoutStatusStore = GetTimeoutStatusStoreFunction()
	local UseSignalStateResult = UseSignalStateFunction(TimeoutStatusStore.getStatus)
	local UseSignalStateResult1 = UseSignalStateFunction(TimeoutStatusStore.getIsTimedOut)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(Current)
	UseRefResult2.current = Current
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), TimeoutStatusStore (copy)
		if not UseRefResult1.current then
			UseRefResult1.current = true
			TimeoutStatusStore.fetchStatus()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseRefResult (copy), UseRefResult1 (copy), FFlagAXUseUFRForTimeoutPromptInApp (upval), ShowAvatarChangeFeatureRestrictionFunction (upval), UseRefResult2 (copy), AvatarScreen (upval)
		if UseSignalStateResult and not UseRefResult.current and UseRefResult1.current and UseSignalStateResult.details then
			UseRefResult.current = true
			
			if FFlagAXUseUFRForTimeoutPromptInApp then
				ShowAvatarChangeFeatureRestrictionFunction()
				
				return
			end
			UseRefResult2.current.navigate(AvatarScreen.TimeoutStatusPrompt)
		end
	end, { UseSignalStateResult })
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), UseSignalStateResult1 (copy)
		if Callback and UseSignalStateResult1 then
			Callback()
		end
	end, { UseSignalStateResult1, Callback })
end