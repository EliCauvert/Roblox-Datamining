local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local contentProviderService = game:GetService("ContentProvider")
local userInputService = game:GetService("UserInputService")
local var5 = nil
pcall(function() --[[ line: 10 ]]
	-- upvalues: var5 (write)
	var5 = game:GetService("AppLifecycleObserverService")
end)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local enableAudioPlaybackInApp = require(parent.MediaPlayback).enableAudioPlaybackInApp
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local media = require(parent.MomentsCommon).Media
local _ = require(parent.DataHydration.MomentsStoreTypes)
local toMediaItemModule = require(parent.Moments.ToMediaItem)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMomentsAutoplayAmpPolicy = sharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local fFlagProfileMomentsVideoPlaybackFix = sharedFlagsModule.FFlagProfileMomentsVideoPlaybackFix
local fFlagProfileMomentsMuteCarouselAudioModule = require(profilePlatform.Flags.FFlagProfileMomentsMuteCarouselAudio)

local function _() --[[ line: 43 | named "shouldPauseWhenAppHidden" ]]
	-- upvalues: userInputService (ref)
	return userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

local function defaultCreateCoordinator(p0, p1) --[[ line: 47 ]]
	-- upvalues: enableAudioPlaybackInApp (ref), coreGuiService (ref), fFlagProfileMomentsVideoPlaybackFix (ref), runService (ref), contentProviderService (ref), media (ref)
	enableAudioPlaybackInApp()
	local profileMomentsAudioOutput = Instance.new("AudioDeviceOutput")
	profileMomentsAudioOutput.Name = "ProfileMomentsAudioOutput"
	profileMomentsAudioOutput.Parent = coreGuiService
	local profileMomentsMediaHost = if fFlagProfileMomentsVideoPlaybackFix then Instance.new("Folder") else nil
	
	if profileMomentsMediaHost ~= nil then
		profileMomentsMediaHost.Name = "ProfileMomentsMediaHost"
		profileMomentsMediaHost.Parent = coreGuiService
	end
	local var14 = media.createMediaPreloadCoordinator(p0, media.selectPreloadPolicy(), media.mediaTelemetry.noopSink, profileMomentsAudioOutput, {
		runService = runService,
		contentProvider = contentProviderService
	}, { parent = profileMomentsMediaHost, masterVolume = p1 })
	
	return {
		provider = var14,
		dispose = function() --[[ line: 80 ]]
			-- upvalues: var14 (ref), profileMomentsAudioOutput (ref), profileMomentsMediaHost (ref)
			var14.dispose()
			profileMomentsAudioOutput:Destroy()
			
			if profileMomentsMediaHost ~= nil then
				profileMomentsMediaHost:Destroy()
			end
		end
	}
end

return function(p2) --[[ line: 100 | named "MomentsCarouselMediaProvider" ]]
	-- upvalues: fFlagMomentsAutoplayAmpPolicy (ref), useAppPolicy (ref), reactModule (ref), signalsModule (ref), userInputService (ref), var5 (write), toMediaItemModule (ref), defaultCreateCoordinator (ref), fFlagProfileMomentsMuteCarouselAudioModule (ref), media (ref)
	local activeIndex = p2.activeIndex
	local playbackActive = p2.playbackActive
	local var15 = if fFlagMomentsAutoplayAmpPolicy then useAppPolicy(function(p3) --[[ line: 104 ]]
		return p3.getMomentsCanAutoPlay()
	end) else nil
	local var16 = reactModule.useMemo(function() --[[ line: 111 ]]
		-- upvalues: signalsModule (copy), activeIndex (ref)
		local var26, var27 = signalsModule.createSignal(activeIndex)
		
		return { get = var26, set = var27 }
	end, {})
	local var17 = reactModule.useMemo(function() --[[ line: 116 ]]
		-- upvalues: signalsModule (copy), playbackActive (ref)
		local var28, var29 = signalsModule.createSignal(playbackActive)
		
		return { get = var28, set = var29 }
	end, {})
	local var18 = if fFlagMomentsAutoplayAmpPolicy then reactModule.useMemo(function() --[[ line: 122 ]]
		-- upvalues: signalsModule (copy), var15 (ref)
		local var30, var31 = signalsModule.createSignal(var15)
		
		return { get = var30, set = var31 }
	end, {}) else nil
	local var19 = reactModule.useMemo(function() --[[ line: 129 ]]
		-- upvalues: signalsModule (copy)
		local var32, var33 = signalsModule.createSignal(true)
		
		return { get = var32, set = var33 }
	end, {})
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: var16 (ref), activeIndex (ref)
		var16.set(activeIndex)
	end, { activeIndex, var16 })
	reactModule.useEffect(function() --[[ line: 138 ]]
		-- upvalues: var17 (ref), playbackActive (ref)
		var17.set(playbackActive)
	end, { playbackActive, var17 })
	
	if fFlagMomentsAutoplayAmpPolicy then
		reactModule.useEffect(function() --[[ line: 143 ]]
			-- upvalues: var18 (ref), var15 (ref)
			var18.set(var15)
		end, { var15, var18 })
	end
	reactModule.useEffect(function() --[[ line: 148 ]]
		-- upvalues: userInputService (copy), var5 (copy), var19 (ref)
		if userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop and var5 ~= nil then
			local list = {
				var5.OnHide:Connect(function() --[[ line: 152 | named "onHidden" ]]
					-- upvalues: var19 (copy)
					var19.set(false)
				end),
				var5.OnUnhide:Connect(function() --[[ line: 155 | named "onShown" ]]
					-- upvalues: var19 (copy)
					var19.set(true)
				end)
			}
			
			return function() --[[ line: 162 ]]
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { var19 })
	local var20 = reactModule.useMemo(function() --[[ line: 169 ]]
		-- upvalues: p2 (ref), toMediaItemModule (copy)
		local t = {}
		
		for i, v in p2.moments do
			local var36 = toMediaItemModule({ kind = "moment", moment = v })
			
			if var36 ~= nil then
				var36.cornerRadius = p2.mediaCornerRadius
				table.insert(t, var36)
			end
		end
		return t
	end, { p2.moments, p2.mediaCornerRadius })
	local var21 = reactModule.useMemo(function() --[[ line: 183 ]]
		-- upvalues: var17 (ref), var19 (ref)
		return function(p4) --[[ line: 184 ]]
			-- upvalues: var17 (copy), var19 (copy)
			return var17.get(p4) and var19.get(p4)
		end
	end, { var17, var19 })
	local var22 = reactModule.useMemo(function() --[[ line: 189 ]]
		-- upvalues: var16 (ref), var20 (ref), var21 (ref), fFlagMomentsAutoplayAmpPolicy (copy), var18 (ref)
		return {
			getActiveIndex = var16.get,
			getItems = function(_) --[[ line: 192 ]]
				-- upvalues: var20 (copy)
				return var20
			end,
			getPlaybackActive = var21,
			getCanAutoPlay = if fFlagMomentsAutoplayAmpPolicy then var18.get else nil
		}
	end, {
		var20,
		var16,
		var21,
		if fFlagMomentsAutoplayAmpPolicy then var18 else nil
	})
	local createCoordinator = p2.createCoordinator or defaultCreateCoordinator
	local var24 = if fFlagProfileMomentsMuteCarouselAudioModule then 0 else nil
	local var25 = reactModule.useMemo(function() --[[ line: 210 ]]
		-- upvalues: createCoordinator (ref), var22 (ref), var24 (ref)
		return createCoordinator(var22, var24)
	end, { var22, createCoordinator, var24 })
	reactModule.useEffect(function() --[[ line: 214 ]]
		-- upvalues: var25 (ref)
		return function() --[[ line: 215 ]]
			-- upvalues: var25 (copy)
			var25.dispose()
		end
	end, { var25 })
	
	return reactModule.createElement(media.MediaPreloadProvider.Provider, { controllerProvider = var25.provider }, p2.children)
end