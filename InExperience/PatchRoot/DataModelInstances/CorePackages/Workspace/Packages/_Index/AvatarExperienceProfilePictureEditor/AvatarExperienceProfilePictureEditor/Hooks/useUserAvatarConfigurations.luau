local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local HttpRequestModule = require(Parent.HttpRequest)
local ConstantsModule = require(AvatarExperienceProfilePictureEditor.Constants)
local _ = require(AvatarExperienceProfilePictureEditor.Shared.parseCloseupCameraConfig)
local _ = require(AvatarExperienceProfilePictureEditor.Common.Enums)
local UserAvatarConfigurationsApiModule = require(AvatarExperienceProfilePictureEditor.Api.userAvatarConfigurationsApi)
local UserAvatarConfigurationsCacheModule = require(AvatarExperienceProfilePictureEditor.Api.userAvatarConfigurationsCache)
local ProfileRefreshSignal = require(Parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local config = {
	emoteAssetId = nil,
	distanceScale = ConstantsModule.DefaultDistanceScale,
	yRotDeg = ConstantsModule.DefaultYRotDeg,
	fieldOfViewDeg = ConstantsModule.DefaultFieldOfViewDeg
}
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 33 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(Current, p1) --[[ Line: 43 | Named "useUserAvatarConfigurations" ]]
	-- upvalues: UserAvatarConfigurationsApiModule (copy), UseSignalStateFunction (copy), ProfileRefreshSignal (copy), ReactModule (copy), config (copy), UserAvatarConfigurationsCacheModule (copy), ConfigResult (copy)
	local NoP4: boolean = not p1 or p1.listenToProfileRefreshSignal ~= false
	local SelectionTypes = if p1 then p1.selectionTypes else UserAvatarConfigurationsApiModule.DEFAULT_SELECTION_TYPES
	local UseSignalStateResult = UseSignalStateFunction(ProfileRefreshSignal.getProfileRefreshSignal)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(0)
	ReactModule.useEffect(function() --[[ Line: 58 ]]
		-- upvalues: NoP4 (copy), UseSignalStateResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		if not NoP4 then return end
		if UseRefResult.current < UseSignalStateResult then
			UseRefResult.current = UseSignalStateResult
			UseStateResult2(function(p2: number): number --[[ Line: 64 ]]
				return p2 + 1
			end)
		end
	end, { NoP4, UseSignalStateResult })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(config)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(UseStateResult)
	ReactModule.useEffect(function() --[[ Line: 78 ]]
		-- upvalues: Current (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult (copy), UseStateResult2_1 (copy), config (upval), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UserAvatarConfigurationsCacheModule (upval), ConfigResult (upval), SelectionTypes (copy)
		local Flag = false
		
		if Current == nil then
			UseRefResult1.current = false
			UseRefResult2.current = nil
			UseRefResult3.current = UseStateResult
			UseStateResult2_1(config)
			UseStateResult2_2(nil)
			UseStateResult2_3(false)
			
			return
		end
		if UseRefResult2.current ~= Current then
			UseRefResult1.current = false
			UseRefResult2.current = Current
			UseStateResult2_1(config)
			UseStateResult2_2(nil)
		end
		if UseRefResult3.current ~= UseStateResult then
			UserAvatarConfigurationsCacheModule.invalidate(Current)
			UseRefResult3.current = UseStateResult
		end
		if not UseRefResult1.current then
			UseStateResult2_3(true)
		end
		UserAvatarConfigurationsCacheModule.fetchCached(ConfigResult, Current, SelectionTypes):andThen(function(Result) --[[ Line: 109 ]]
			-- upvalues: Flag (ref), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseRefResult1 (upval), UseStateResult2_3 (upval)
			if not Flag then
				UseStateResult2_1(Result.parsed.closeupCameraConfig)
				UseStateResult2_2(Result.parsed.profileFrameAssetId)
				UseRefResult1.current = true
				UseStateResult2_3(false)
				
				return
			end
		end):catch(function(_) --[[ Line: 119 ]]
			-- upvalues: Flag (ref), UseRefResult1 (upval), UseStateResult2_3 (upval)
			if not Flag then
				UseRefResult1.current = true
				UseStateResult2_3(false)
				
				return
			end
		end)
		
		return function() --[[ Line: 128 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { Current, UseStateResult, SelectionTypes })
	
	return UseStateResult1, UseStateResult3, UseStateResult4
end