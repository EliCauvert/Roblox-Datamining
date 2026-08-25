local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local contentProviderService = game:GetService("ContentProvider")
local userInputService = game:GetService("UserInputService")
local var5 = nil
pcall(function()
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
local fFlagMomentsCarouselVideoHandoff = sharedFlagsModule.FFlagMomentsCarouselVideoHandoff
local fFlagProfileMomentsMuteCarouselAudioModule = require(profilePlatform.Flags.FFlagProfileMomentsMuteCarouselAudio)

local function _()
	-- upvalues: userInputService (ref)
	return userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

local function defaultCreateCoordinator(p0, p1)
	-- upvalues: enableAudioPlaybackInApp (ref), coreGuiService (ref), fFlagProfileMomentsVideoPlaybackFix (ref), runService (ref), contentProviderService (ref), media (ref), fFlagMomentsCarouselVideoHandoff (ref)
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
	local var15 = false
	
	return {
		provider = var14,
		dispose = function()
			-- upvalues: fFlagMomentsCarouselVideoHandoff (copy), var15 (write), var14 (ref), profileMomentsAudioOutput (ref), profileMomentsMediaHost (ref)
			if fFlagMomentsCarouselVideoHandoff then
				if var15 then return end
				var15 = true
			end
			var14.dispose()
			profileMomentsAudioOutput:Destroy()
			
			if profileMomentsMediaHost ~= nil then
				profileMomentsMediaHost:Destroy()
			end
		end
	}
end

return function(p2)
	-- upvalues: fFlagMomentsAutoplayAmpPolicy (ref), useAppPolicy (ref), reactModule (ref), signalsModule (ref), userInputService (ref), var5 (write), toMediaItemModule (ref), defaultCreateCoordinator (ref), fFlagProfileMomentsMuteCarouselAudioModule (ref), fFlagMomentsCarouselVideoHandoff (ref), media (ref)
	local activeIndex = p2.activeIndex
	local playbackActive = p2.playbackActive
	local var16 = if fFlagMomentsAutoplayAmpPolicy then useAppPolicy(function(p3)
		return p3.getMomentsCanAutoPlay()
	end) else nil
	local var17 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), activeIndex (ref)
		local var27, var28 = signalsModule.createSignal(activeIndex)
		
		return { get = var27, set = var28 }
	end, {})
	local var18 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), playbackActive (ref)
		local var29, var30 = signalsModule.createSignal(playbackActive)
		
		return { get = var29, set = var30 }
	end, {})
	local var19 = if fFlagMomentsAutoplayAmpPolicy then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var16 (ref)
		local var31, var32 = signalsModule.createSignal(var16)
		
		return { get = var31, set = var32 }
	end, {}) else nil
	local var20 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local var33, var34 = signalsModule.createSignal(true)
		
		return { get = var33, set = var34 }
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), activeIndex (ref)
		var17.set(activeIndex)
	end, { activeIndex, var17 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), playbackActive (ref)
		var18.set(playbackActive)
	end, { playbackActive, var18 })
	
	if fFlagMomentsAutoplayAmpPolicy then
		reactModule.useEffect(function()
			-- upvalues: var19 (ref), var16 (ref)
			var19.set(var16)
		end, { var16, var19 })
	end
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var5 (copy), var20 (ref)
		if userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop and var5 ~= nil then
			local list = {
				var5.OnHide:Connect(function()
					-- upvalues: var20 (copy)
					var20.set(false)
				end),
				var5.OnUnhide:Connect(function()
					-- upvalues: var20 (copy)
					var20.set(true)
				end)
			}
			
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { var20 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), toMediaItemModule (copy)
		local t = {}
		
		for i, v in p2.moments do
			local var37 = toMediaItemModule({ kind = "moment", moment = v })
			
			if var37 ~= nil then
				var37.cornerRadius = p2.mediaCornerRadius
				table.insert(t, var37)
			end
		end
		return t
	end, { p2.moments, p2.mediaCornerRadius })
	local var22 = reactModule.useMemo(function()
		-- upvalues: var18 (ref), var20 (ref)
		return function(p4)
			-- upvalues: var18 (copy), var20 (copy)
			return var18.get(p4) and var20.get(p4)
		end
	end, { var18, var20 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), var21 (ref), var22 (ref), fFlagMomentsAutoplayAmpPolicy (copy), var19 (ref)
		return {
			getActiveIndex = var17.get,
			getItems = function(_)
				-- upvalues: var21 (copy)
				return var21
			end,
			getPlaybackActive = var22,
			getCanAutoPlay = if fFlagMomentsAutoplayAmpPolicy then var19.get else nil
		}
	end, {
		var21,
		var17,
		var22,
		if fFlagMomentsAutoplayAmpPolicy then var19 else nil
	})
	local createCoordinator = p2.createCoordinator or defaultCreateCoordinator
	local var25 = if fFlagProfileMomentsMuteCarouselAudioModule then 0 else nil
	local var26 = reactModule.useMemo(function()
		-- upvalues: createCoordinator (ref), var23 (ref), var25 (ref)
		return createCoordinator(var23, var25)
	end, { var23, createCoordinator, var25 })
	reactModule.useEffect(function()
		-- upvalues: var26 (ref)
		return function()
			-- upvalues: var26 (copy)
			var26.dispose()
		end
	end, { var26 })
	
	if fFlagMomentsCarouselVideoHandoff then
		reactModule.useImperativeHandle(p2.handoffRef, function()
			-- upvalues: var26 (ref)
			return { release = var26.dispose }
		end, { var26 })
	end
	return reactModule.createElement(media.MediaPreloadProvider.Provider, { controllerProvider = var26.provider }, p2.children)
end