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
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(p1, p2)
	-- upvalues: userAvatarConfigurationsApiModule (ref), useSignalState (ref), profileRefreshSignal (ref), reactModule (ref), t (ref), userAvatarConfigurationsCacheModule (ref), var1 (ref)
	local var2
	if p2 then
		var2 = p2.listenToProfileRefreshSignal ~= false
	end
	local var3 = if p2 then p2.selectionTypes else userAvatarConfigurationsApiModule.DEFAULT_SELECTION_TYPES
	local var4 = useSignalState(profileRefreshSignal.getProfileRefreshSignal)
	local var5, var6 = reactModule.useState(0)
	local var7 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref), var7 (ref), var6 (ref)
		if not var2 then return end
		if var7.current < var4 then
			var7.current = var4
			var6(function(p3)
				return p3 + 1
			end)
		end
	end, { var2, var4 })
	local var8, var9 = reactModule.useState(t)
	local var10, var11 = reactModule.useState(nil)
	local var12, var13 = reactModule.useState(true)
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useRef(var5)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var14 (ref), var15 (ref), var16 (ref), var5 (ref), var9 (ref), t (copy), var11 (ref), var13 (ref), userAvatarConfigurationsCacheModule (copy), var1 (copy), var3 (ref)
		local var17 = false
		
		if p1 == nil then
			var14.current = false
			var15.current = nil
			var16.current = var5
			var9(t)
			var11(nil)
			var13(false)
			
			return
		elseif var15.current ~= p1 then
			var14.current = false
			var15.current = p1
			var9(t)
			var11(nil)
		end
		if var16.current ~= var5 then
			userAvatarConfigurationsCacheModule.invalidate(p1)
			var16.current = var5
		end
		if not var14.current then
			var13(true)
		end
		userAvatarConfigurationsCacheModule.fetchCached(var1, p1, var3):andThen(function(p3)
			-- upvalues: var17 (write), var9 (copy), var11 (copy), var14 (copy), var13 (copy)
			if var17 then
				return
			end
			var9(p3.parsed.closeupCameraConfig)
			var11(p3.parsed.profileFrameAssetId)
			var14.current = true
			var13(false)
		end):catch(function(_)
			-- upvalues: var17 (write), var14 (copy), var13 (copy)
			if var17 then
				return
			end
			var14.current = true
			var13(false)
		end)
		
		return function()
			-- upvalues: var17 (write)
			var17 = true
		end
	end, { p1, var5, var3 })
	
	return var8, var10, var12
end