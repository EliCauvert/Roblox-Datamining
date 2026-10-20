local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetTimeoutStatusStoreFunction = require(Parent.AvatarExperienceCommon).Stores.getTimeoutStatusStore
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagAXRefetchAvatarOnTimeout = require(Parent.AvatarExperienceFlags).FFlagAXRefetchAvatarOnTimeout

return function(Current, Callback)
	-- upvalues: GetTimeoutStatusStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), AvatarScreen (copy), FFlagAXRefetchAvatarOnTimeout (copy)
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
		-- upvalues: UseSignalStateResult (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), AvatarScreen (upval)
		if UseSignalStateResult and not UseRefResult.current and UseRefResult1.current and UseSignalStateResult.details then
			UseRefResult.current = true
			UseRefResult2.current.navigate(AvatarScreen.TimeoutStatusPrompt)
		end
	end, { UseSignalStateResult })
	
	if FFlagAXRefetchAvatarOnTimeout then
		ReactModule.useEffect(function()
			-- upvalues: Callback (copy), UseSignalStateResult1 (copy)
			if Callback and UseSignalStateResult1 then
				Callback()
			end
		end, { UseSignalStateResult1, Callback })
	end
end