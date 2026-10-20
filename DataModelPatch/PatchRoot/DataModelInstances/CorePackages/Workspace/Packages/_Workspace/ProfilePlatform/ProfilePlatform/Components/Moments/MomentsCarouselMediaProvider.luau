local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local ContentProvider = game:GetService("ContentProvider")
local UserInputService = game:GetService("UserInputService")
local AppLifecycleObserverService = nil
pcall(function()
	-- upvalues: AppLifecycleObserverService (ref)
	AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
end)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local EnableAudioPlaybackInAppFunction = require(Parent.MediaPlayback).enableAudioPlaybackInApp
local Media = require(Parent.MomentsCommon).Media
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local ToMediaItemModule = require(Parent.Moments.ToMediaItem)
local FFlagProfileMomentsVideoPlaybackFix = require(Parent.SharedFlags).FFlagProfileMomentsVideoPlaybackFix
local FFlagProfileMomentsMuteCarouselAudioModule = require(ProfilePlatform.Flags.FFlagProfileMomentsMuteCarouselAudio)

local function _(): boolean
	-- upvalues: UserInputService (copy)
	return UserInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

local function defaultCreateCoordinator(p1, MasterVolume)
	-- upvalues: EnableAudioPlaybackInAppFunction (copy), CoreGui (copy), FFlagProfileMomentsVideoPlaybackFix (copy), RunService (copy), ContentProvider (copy), Media (copy)
	EnableAudioPlaybackInAppFunction()
	local ProfileMomentsAudioOutput = Instance.new("AudioDeviceOutput")
	ProfileMomentsAudioOutput.Name = "ProfileMomentsAudioOutput"
	ProfileMomentsAudioOutput.Parent = CoreGui
	local ProfileMomentsMediaHost = if FFlagProfileMomentsVideoPlaybackFix then Instance.new("Folder") else nil
	
	if ProfileMomentsMediaHost ~= nil then
		ProfileMomentsMediaHost.Name = "ProfileMomentsMediaHost"
		ProfileMomentsMediaHost.Parent = CoreGui
	end
	local MediaPreloadCoordinator = Media.createMediaPreloadCoordinator(p1, Media.selectPreloadPolicy(), Media.mediaTelemetry.noopSink, ProfileMomentsAudioOutput, {
		runService = RunService,
		contentProvider = ContentProvider
	}, {
		parent = ProfileMomentsMediaHost,
		masterVolume = MasterVolume
	})
	
	return {
		provider = MediaPreloadCoordinator,
		dispose = function()
			-- upvalues: MediaPreloadCoordinator (copy), ProfileMomentsAudioOutput (copy), ProfileMomentsMediaHost (copy)
			MediaPreloadCoordinator.dispose()
			ProfileMomentsAudioOutput:Destroy()
			
			if ProfileMomentsMediaHost ~= nil then
				ProfileMomentsMediaHost:Destroy()
			end
		end
	}
end

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), UserInputService (copy), AppLifecycleObserverService (ref), ToMediaItemModule (copy), defaultCreateCoordinator (copy), FFlagProfileMomentsMuteCarouselAudioModule (copy), Media (copy)
	local ActiveIndex = p1.activeIndex
	local PlaybackActive = p1.playbackActive
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), ActiveIndex (copy)
		local Signal, Signal2 = SignalsModule.createSignal(ActiveIndex)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), PlaybackActive (copy)
		local Signal, Signal2 = SignalsModule.createSignal(PlaybackActive)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(true)
		
		return { get = Signal, set = Signal2 }
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), ActiveIndex (copy)
		UseMemoResult.set(ActiveIndex)
	end, { ActiveIndex, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy), PlaybackActive (copy)
		UseMemoResult1.set(PlaybackActive)
	end, { PlaybackActive, UseMemoResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), AppLifecycleObserverService (upval), UseMemoResult2 (copy)
		if UserInputService:GetDeviceType() == Enum.DeviceType.Desktop or AppLifecycleObserverService == nil then return end
		local Connections = {
			AppLifecycleObserverService.OnHide:Connect(function()
				-- upvalues: UseMemoResult2 (upval)
				UseMemoResult2.set(false)
			end),
			AppLifecycleObserverService.OnUnhide:Connect(function()
				-- upvalues: UseMemoResult2 (upval)
				UseMemoResult2.set(true)
			end)
		}
		
		return function()
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { UseMemoResult2 })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ToMediaItemModule (upval)
		local List = {}
		
		for _, moment in p1.moments do
			local MediaItemModule = ToMediaItemModule({ kind = "moment", moment = moment })
			
			if MediaItemModule ~= nil then
				MediaItemModule.cornerRadius = p1.mediaCornerRadius
				table.insert(List, MediaItemModule)
			end
		end
		return List
	end, { p1.moments, p1.mediaCornerRadius })
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy), UseMemoResult2 (copy)
		return function(p2)
			-- upvalues: UseMemoResult1 (upval), UseMemoResult2 (upval)
			return UseMemoResult1.get(p2) and UseMemoResult2.get(p2)
		end
	end, { UseMemoResult1, UseMemoResult2 })
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult3 (copy), UseMemoResult4 (copy)
		return {
			getActiveIndex = UseMemoResult.get,
			getItems = function(_)
				-- upvalues: UseMemoResult3 (upval)
				return UseMemoResult3
			end,
			getPlaybackActive = UseMemoResult4
		}
	end, { UseMemoResult3, UseMemoResult, UseMemoResult4 })
	local CreateCoordinator = p1.createCoordinator or defaultCreateCoordinator
	local v1 = if FFlagProfileMomentsMuteCarouselAudioModule then 0 else nil
	local UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: CreateCoordinator (copy), UseMemoResult5 (copy), v1 (copy)
		return CreateCoordinator(UseMemoResult5, v1)
	end, { UseMemoResult5, CreateCoordinator, v1 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult6 (copy)
		return function()
			-- upvalues: UseMemoResult6 (upval)
			UseMemoResult6.dispose()
		end
	end, { UseMemoResult6 })
	
	return ReactModule.createElement(Media.MediaPreloadProvider.Provider, { controllerProvider = UseMemoResult6.provider }, p1.children)
end