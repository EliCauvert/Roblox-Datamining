local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local ContentProvider = game:GetService("ContentProvider")
local UserInputService = game:GetService("UserInputService")
local AppLifecycleObserverService = nil
pcall(function() --[[ Line: 10 ]]
	-- upvalues: AppLifecycleObserverService (ref)
	AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
end)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local EnableAudioPlaybackInAppFunction = require(Parent.MediaPlayback).enableAudioPlaybackInApp
local MomentsCommonModule = require(Parent.MomentsCommon)
local Media = MomentsCommonModule.Media
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local ToMediaItemModule = require(Parent.Moments.ToMediaItem)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsAutoplayAmpPolicy = SharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local FFlagProfileMomentsVideoPlaybackFix = SharedFlagsModule.FFlagProfileMomentsVideoPlaybackFix
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

local function _(): boolean --[[ Line: 52 | Named "shouldPauseWhenAppHidden" ]]
	-- upvalues: UserInputService (copy)
	return UserInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

local function defaultCreateCoordinator(p1, MasterVolume) --[[ Line: 56 ]]
	-- upvalues: EnableAudioPlaybackInAppFunction (copy), CoreGui (copy), FFlagProfileMomentsVideoPlaybackFix (copy), FFlagMomentsOptimisticProfilePending (copy), RunService (copy), ContentProvider (copy), Media (copy)
	EnableAudioPlaybackInAppFunction()
	local ProfileMomentsAudioOutput = Instance.new("AudioDeviceOutput")
	ProfileMomentsAudioOutput.Name = "ProfileMomentsAudioOutput"
	ProfileMomentsAudioOutput.Parent = CoreGui
	local ProfileMomentsMediaHost = if FFlagProfileMomentsVideoPlaybackFix or FFlagMomentsOptimisticProfilePending then Instance.new("Folder") else nil
	
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
	local Flag = false
	
	return {
		provider = MediaPreloadCoordinator,
		dispose = function() --[[ Line: 94 ]]
			-- upvalues: Flag (ref), MediaPreloadCoordinator (copy), ProfileMomentsAudioOutput (copy), ProfileMomentsMediaHost (copy)
			if Flag then return end
			Flag = true
			MediaPreloadCoordinator.dispose()
			ProfileMomentsAudioOutput:Destroy()
			
			if ProfileMomentsMediaHost ~= nil then
				ProfileMomentsMediaHost:Destroy()
			end
		end
	}
end

return function(p1) --[[ Line: 119 | Named "MomentsCarouselMediaProvider" ]]
	-- upvalues: FFlagMomentsAutoplayAmpPolicy (copy), UseSignalStateFunction (copy), GetMomentsCapabilitiesFunction (copy), ReactModule (copy), SignalsModule (copy), UserInputService (copy), AppLifecycleObserverService (ref), ToMediaItemModule (copy), defaultCreateCoordinator (copy), Media (copy)
	local ActiveIndex = p1.activeIndex
	local PlaybackActive = p1.playbackActive
	local UseSignalStateResult = if FFlagMomentsAutoplayAmpPolicy then UseSignalStateFunction(GetMomentsCapabilitiesFunction(false).getIsAutoPlayEnabled) else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 128 ]]
		-- upvalues: SignalsModule (upval), ActiveIndex (copy)
		local Signal, Signal2 = SignalsModule.createSignal(ActiveIndex)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 133 ]]
		-- upvalues: SignalsModule (upval), PlaybackActive (copy)
		local Signal, Signal2 = SignalsModule.createSignal(PlaybackActive)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseMemoResult2 = if FFlagMomentsAutoplayAmpPolicy then ReactModule.useMemo(function() --[[ Line: 139 ]]
		-- upvalues: SignalsModule (upval), UseSignalStateResult (copy)
		local Signal, Signal2 = SignalsModule.createSignal(UseSignalStateResult)
		
		return { get = Signal, set = Signal2 }
	end, {}) else nil
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 146 ]]
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(true)
		
		return { get = Signal, set = Signal2 }
	end, {})
	ReactModule.useEffect(function() --[[ Line: 151 ]]
		-- upvalues: UseMemoResult (copy), ActiveIndex (copy)
		UseMemoResult.set(ActiveIndex)
	end, { ActiveIndex, UseMemoResult })
	ReactModule.useEffect(function() --[[ Line: 155 ]]
		-- upvalues: UseMemoResult1 (copy), PlaybackActive (copy)
		UseMemoResult1.set(PlaybackActive)
	end, { PlaybackActive, UseMemoResult1 })
	
	if FFlagMomentsAutoplayAmpPolicy then
		ReactModule.useEffect(function() --[[ Line: 160 ]]
			-- upvalues: UseMemoResult2 (copy), UseSignalStateResult (copy)
			UseMemoResult2.set(UseSignalStateResult)
		end, { UseSignalStateResult, UseMemoResult2 })
	end
	ReactModule.useEffect(function() --[[ Line: 165 ]]
		-- upvalues: UserInputService (upval), AppLifecycleObserverService (upval), UseMemoResult3 (copy)
		if UserInputService:GetDeviceType() == Enum.DeviceType.Desktop or AppLifecycleObserverService == nil then return end
		local Connections = {
			AppLifecycleObserverService.OnHide:Connect(function() --[[ Line: 169 | Named "onHidden" ]]
				-- upvalues: UseMemoResult3 (upval)
				UseMemoResult3.set(false)
			end),
			AppLifecycleObserverService.OnUnhide:Connect(function() --[[ Line: 172 | Named "onShown" ]]
				-- upvalues: UseMemoResult3 (upval)
				UseMemoResult3.set(true)
			end)
		}
		
		return function() --[[ Line: 179 ]]
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { UseMemoResult3 })
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 186 ]]
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
	local UseMemoResult5 = ReactModule.useMemo(function() --[[ Line: 200 ]]
		-- upvalues: UseMemoResult1 (copy), UseMemoResult3 (copy)
		return function(p2) --[[ Line: 201 ]]
			-- upvalues: UseMemoResult1 (upval), UseMemoResult3 (upval)
			return UseMemoResult1.get(p2) and UseMemoResult3.get(p2)
		end
	end, { UseMemoResult1, UseMemoResult3 })
	local UseMemoResult6 = ReactModule.useMemo(function() --[[ Line: 206 ]]
		-- upvalues: UseMemoResult (copy), UseMemoResult4 (copy), UseMemoResult5 (copy), FFlagMomentsAutoplayAmpPolicy (upval), UseMemoResult2 (copy)
		return {
			getActiveIndex = UseMemoResult.get,
			getItems = function(_) --[[ Line: 209 ]]
				-- upvalues: UseMemoResult4 (upval)
				return UseMemoResult4
			end,
			getPlaybackActive = UseMemoResult5,
			getCanAutoPlay = if FFlagMomentsAutoplayAmpPolicy then UseMemoResult2.get else nil
		}
	end, {
		UseMemoResult4,
		UseMemoResult,
		UseMemoResult5,
		if FFlagMomentsAutoplayAmpPolicy then UseMemoResult2 else nil
	})
	local CreateCoordinator = p1.createCoordinator or defaultCreateCoordinator
	local UseMemoResult7 = ReactModule.useMemo(function() --[[ Line: 226 ]]
		-- upvalues: CreateCoordinator (copy), UseMemoResult6 (copy)
		return CreateCoordinator(UseMemoResult6, 0)
	end, { UseMemoResult6, CreateCoordinator, 0 })
	ReactModule.useEffect(function() --[[ Line: 230 ]]
		-- upvalues: UseMemoResult7 (copy)
		return function() --[[ Line: 231 ]]
			-- upvalues: UseMemoResult7 (upval)
			UseMemoResult7.dispose()
		end
	end, { UseMemoResult7 })
	ReactModule.useImperativeHandle(p1.handoffRef, function() --[[ Line: 235 ]]
		-- upvalues: UseMemoResult7 (copy)
		return { release = UseMemoResult7.dispose }
	end, { UseMemoResult7 })
	
	return ReactModule.createElement(Media.MediaPreloadProvider.Provider, { controllerProvider = UseMemoResult7.provider }, p1.children)
end