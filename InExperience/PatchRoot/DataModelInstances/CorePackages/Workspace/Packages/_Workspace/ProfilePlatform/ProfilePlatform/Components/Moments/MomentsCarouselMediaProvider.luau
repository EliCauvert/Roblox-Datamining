local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local contentProviderService = game:GetService("ContentProvider")
local userInputService = game:GetService("UserInputService")
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("AppLifecycleObserverService")
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

local function defaultCreateCoordinator(p1, p2)
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
	local var2 = media.createMediaPreloadCoordinator(p1, media.selectPreloadPolicy(), media.mediaTelemetry.noopSink, profileMomentsAudioOutput, {
		runService = runService,
		contentProvider = contentProviderService
	}, { parent = profileMomentsMediaHost, masterVolume = p2 })
	local var3 = false
	
	return {
		provider = var2,
		dispose = function()
			-- upvalues: fFlagMomentsCarouselVideoHandoff (copy), var3 (write), var2 (ref), profileMomentsAudioOutput (ref), profileMomentsMediaHost (ref)
			if fFlagMomentsCarouselVideoHandoff then
				if var3 then return end
				var3 = true
			end
			var2.dispose()
			profileMomentsAudioOutput:Destroy()
			
			if profileMomentsMediaHost ~= nil then
				profileMomentsMediaHost:Destroy()
			end
		end
	}
end

return function(p1)
	-- upvalues: fFlagMomentsAutoplayAmpPolicy (ref), useAppPolicy (ref), reactModule (ref), signalsModule (ref), userInputService (ref), var1 (write), toMediaItemModule (ref), defaultCreateCoordinator (ref), fFlagProfileMomentsMuteCarouselAudioModule (ref), fFlagMomentsCarouselVideoHandoff (ref), media (ref)
	local activeIndex = p1.activeIndex
	local playbackActive = p1.playbackActive
	local var2 = if fFlagMomentsAutoplayAmpPolicy then useAppPolicy(function(p2)
		return p2.getMomentsCanAutoPlay()
	end) else nil
	local var3 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), activeIndex (ref)
		local var4, var5 = signalsModule.createSignal(activeIndex)
		
		return { get = var4, set = var5 }
	end, {})
	local var4 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), playbackActive (ref)
		local var5, var6 = signalsModule.createSignal(playbackActive)
		
		return { get = var5, set = var6 }
	end, {})
	local var5 = if fFlagMomentsAutoplayAmpPolicy then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var2 (ref)
		local var6, var7 = signalsModule.createSignal(var2)
		
		return { get = var6, set = var7 }
	end, {}) else nil
	local var6 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local var7, var8 = signalsModule.createSignal(true)
		
		return { get = var7, set = var8 }
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), activeIndex (ref)
		var3.set(activeIndex)
	end, { activeIndex, var3 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), playbackActive (ref)
		var4.set(playbackActive)
	end, { playbackActive, var4 })
	
	if fFlagMomentsAutoplayAmpPolicy then
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), var2 (ref)
			var5.set(var2)
		end, { var2, var5 })
	end
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var1 (copy), var6 (ref)
		if userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop and var1 ~= nil then
			local list = {
				var1.OnHide:Connect(function()
					-- upvalues: var6 (copy)
					var6.set(false)
				end),
				var1.OnUnhide:Connect(function()
					-- upvalues: var6 (copy)
					var6.set(true)
				end)
			}
			
			return function()
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { var6 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), toMediaItemModule (copy)
		local t = {}
		
		for i, v in p1.moments do
			local var8 = toMediaItemModule({ kind = "moment", moment = v })
			
			if var8 ~= nil then
				var8.cornerRadius = p1.mediaCornerRadius
				table.insert(t, var8)
			end
		end
		return t
	end, { p1.moments, p1.mediaCornerRadius })
	local var9 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var6 (ref)
		return function(p2)
			-- upvalues: var4 (copy), var6 (copy)
			return var4.get(p2) and var6.get(p2)
		end
	end, { var4, var6 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var7 (ref), var9 (ref), fFlagMomentsAutoplayAmpPolicy (copy), var5 (ref)
		return {
			getActiveIndex = var3.get,
			getItems = function(_)
				-- upvalues: var7 (copy)
				return var7
			end,
			getPlaybackActive = var9,
			getCanAutoPlay = if fFlagMomentsAutoplayAmpPolicy then var5.get else nil
		}
	end, {
		var7,
		var3,
		var9,
		if fFlagMomentsAutoplayAmpPolicy then var5 else nil
	})
	local createCoordinator = p1.createCoordinator or defaultCreateCoordinator
	local var11 = if fFlagProfileMomentsMuteCarouselAudioModule then 0 else nil
	local var12 = reactModule.useMemo(function()
		-- upvalues: createCoordinator (ref), var10 (ref), var11 (ref)
		return createCoordinator(var10, var11)
	end, { var10, createCoordinator, var11 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		return function()
			-- upvalues: var12 (copy)
			var12.dispose()
		end
	end, { var12 })
	
	if fFlagMomentsCarouselVideoHandoff then
		reactModule.useImperativeHandle(p1.handoffRef, function()
			-- upvalues: var12 (ref)
			return { release = var12.dispose }
		end, { var12 })
	end
	return reactModule.createElement(media.MediaPreloadProvider.Provider, { controllerProvider = var12.provider }, p1.children)
end