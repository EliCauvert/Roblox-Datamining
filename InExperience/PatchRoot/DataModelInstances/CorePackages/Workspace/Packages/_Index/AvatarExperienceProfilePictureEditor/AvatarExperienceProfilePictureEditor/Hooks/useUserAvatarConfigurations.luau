local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local httpRequestModule = require(parent.HttpRequest)
local profilePlatformCommonModule = require(parent.ProfilePlatformCommon)
local signalsReactModule = require(parent.SignalsReact)
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local _ = require(avatarExperienceProfilePictureEditor.Shared.parseCloseupCameraConfig)
local _ = require(avatarExperienceProfilePictureEditor.Common.Enums)
local userAvatarConfigurationsApiModule = require(avatarExperienceProfilePictureEditor.Api.userAvatarConfigurationsApi)
local userAvatarConfigurationsCacheModule = require(avatarExperienceProfilePictureEditor.Api.userAvatarConfigurationsCache)
local profileRefreshSignal = profilePlatformCommonModule.Signals.ProfileRefreshSignal
local useSignalState = signalsReactModule.useSignalState
local t = {
	emoteAssetId = nil,
	distanceScale = constantsModule.DefaultDistanceScale,
	yRotDeg = constantsModule.DefaultYRotDeg,
	fieldOfViewDeg = constantsModule.DefaultFieldOfViewDeg
}
local var9 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 33 ]]
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
	end
})

return function(p3, p4) --[[ line: 43 | named "useUserAvatarConfigurations" ]]
	-- upvalues: userAvatarConfigurationsApiModule (ref), useSignalState (ref), profileRefreshSignal (ref), reactModule (ref), t (ref), userAvatarConfigurationsCacheModule (ref), var9 (ref)
	local var10
	if p4 then
		var10 = p4.listenToProfileRefreshSignal ~= false
	end
	local var11 = if p4 then p4.selectionTypes else userAvatarConfigurationsApiModule.DEFAULT_SELECTION_TYPES
	local var12 = useSignalState(profileRefreshSignal.getProfileRefreshSignal)
	local var13, var14 = reactModule.useState(0)
	local var15 = reactModule.useRef(0)
	reactModule.useEffect(function() --[[ line: 58 ]]
		-- upvalues: var10 (ref), var12 (ref), var15 (ref), var14 (ref)
		if not var10 then return end
		if var15.current < var12 then
			var15.current = var12
			var14(function(p5) --[[ line: 64 ]]
				return p5 + 1
			end)
		end
	end, { var10, var12 })
	local var16, var17 = reactModule.useState(t)
	local var18, var19 = reactModule.useState(nil)
	local var20, var21 = reactModule.useState(true)
	local var22 = reactModule.useRef(false)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(var13)
	reactModule.useEffect(function() --[[ line: 78 ]]
		-- upvalues: p3 (ref), var22 (ref), var23 (ref), var24 (ref), var13 (ref), var17 (ref), t (copy), var19 (ref), var21 (ref), userAvatarConfigurationsCacheModule (copy), var9 (copy), var11 (ref)
		local var25 = false
		
		if p3 == nil then
			var22.current = false
			var23.current = nil
			var24.current = var13
			var17(t)
			var19(nil)
			var21(false)
			
			return
		elseif var23.current ~= p3 then
			var22.current = false
			var23.current = p3
			var17(t)
			var19(nil)
		end
		if var24.current ~= var13 then
			userAvatarConfigurationsCacheModule.invalidate(p3)
			var24.current = var13
		end
		if not var22.current then
			var21(true)
		end
		userAvatarConfigurationsCacheModule.fetchCached(var9, p3, var11):andThen(function(p6) --[[ line: 109 ]]
			-- upvalues: var25 (write), var17 (copy), var19 (copy), var22 (copy), var21 (copy)
			if var25 then
				return
			end
			var17(p6.parsed.closeupCameraConfig)
			var19(p6.parsed.profileFrameAssetId)
			var22.current = true
			var21(false)
		end):catch(function(_) --[[ line: 119 ]]
			-- upvalues: var25 (write), var22 (copy), var21 (copy)
			if var25 then
				return
			end
			var22.current = true
			var21(false)
		end)
		
		return function() --[[ line: 128 ]]
			-- upvalues: var25 (write)
			var25 = true
		end
	end, { p3, var13, var11 })
	
	return var16, var18, var20
end