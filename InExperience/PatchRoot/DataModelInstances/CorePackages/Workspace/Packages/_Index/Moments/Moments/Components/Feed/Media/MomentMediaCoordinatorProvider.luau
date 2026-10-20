local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
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
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local EnableAudioPlaybackInAppFunction = require(Parent.MediaPlayback).enableAudioPlaybackInApp
local MomentsCommonModule = require(Parent.MomentsCommon)
local Media = MomentsCommonModule.Media
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local FFlagMomentsAutoplayAmpPolicy = require(Parent.SharedFlags).FFlagMomentsAutoplayAmpPolicy
local _ = require(Moments.Components.Feed.FeedTypes)
local CreateFeedMediaSourceModule = require(script.Parent.createFeedMediaSource)

local function _(): boolean
	-- upvalues: UserInputService (copy)
	return UserInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

local function defaultCreateCoordinator(p1)
	-- upvalues: EnableAudioPlaybackInAppFunction (copy), CoreGui (copy), HttpService (copy), RunService (copy), ContentProvider (copy), Media (copy)
	EnableAudioPlaybackInAppFunction()
	local MomentMediaAudioOutput = Instance.new("AudioDeviceOutput")
	MomentMediaAudioOutput.Name = "MomentMediaAudioOutput"
	MomentMediaAudioOutput.Parent = CoreGui
	local Folder = Instance.new("Folder")
	Folder.Name = "MomentMediaRoot_" .. HttpService:GenerateGUID(false)
	Folder.Parent = CoreGui
	local MediaPreloadCoordinator = Media.createMediaPreloadCoordinator(p1, Media.selectPreloadPolicy(), Media.mediaTelemetry.noopSink, MomentMediaAudioOutput, {
		runService = RunService,
		contentProvider = ContentProvider
	}, { parent = Folder })
	
	return {
		provider = MediaPreloadCoordinator,
		dispose = function()
			-- upvalues: MediaPreloadCoordinator (copy), MomentMediaAudioOutput (copy), Folder (copy)
			MediaPreloadCoordinator.dispose()
			MomentMediaAudioOutput:Destroy()
			Folder:Destroy()
		end
	}
end

return function(p1)
	-- upvalues: FFlagMomentsAutoplayAmpPolicy (copy), UseSignalStateFunction (copy), GetMomentsCapabilitiesFunction (copy), defaultCreateCoordinator (copy), ReactModule (copy), SignalsModule (copy), UserInputService (copy), AppLifecycleObserverService (ref), CreateFeedMediaSourceModule (copy), Media (copy)
	local Pager = p1.pager
	local UseSignalStateResult = if FFlagMomentsAutoplayAmpPolicy then UseSignalStateFunction(GetMomentsCapabilitiesFunction(false).getIsAutoPlayEnabled) else nil
	local PlaybackActive = p1.playbackActive
	local CreateCoordinator = p1.createCoordinator or defaultCreateCoordinator
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), PlaybackActive (copy)
		local Signal, Signal2 = SignalsModule.createSignal(PlaybackActive)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseMemoResult1 = if FFlagMomentsAutoplayAmpPolicy then ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseSignalStateResult (copy)
		local Signal, Signal2 = SignalsModule.createSignal(UseSignalStateResult)
		
		return { get = Signal, set = Signal2 }
	end, {}) else nil
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(true)
		
		return { get = Signal, set = Signal2 }
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), PlaybackActive (copy)
		UseMemoResult.set(PlaybackActive)
	end, { PlaybackActive, UseMemoResult })
	
	if FFlagMomentsAutoplayAmpPolicy then
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult1 (copy), UseSignalStateResult (copy)
			UseMemoResult1.set(UseSignalStateResult)
		end, { UseSignalStateResult, UseMemoResult1 })
	end
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseMemoResult2 (copy), AppLifecycleObserverService (upval)
		if UserInputService:GetDeviceType() == Enum.DeviceType.Desktop then return end
		local function onHidden()
			-- upvalues: UseMemoResult2 (upval)
			UseMemoResult2.set(false)
		end
		
		local function onShown()
			-- upvalues: UseMemoResult2 (upval)
			UseMemoResult2.set(true)
		end
		
		local List = {}
		
		if AppLifecycleObserverService ~= nil then
			table.insert(List, AppLifecycleObserverService.OnHide:Connect(onHidden))
			table.insert(List, AppLifecycleObserverService.OnUnhide:Connect(onShown))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { UseMemoResult2 })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult2 (copy)
		return function(p2)
			-- upvalues: UseMemoResult (upval), UseMemoResult2 (upval)
			return UseMemoResult.get(p2) and UseMemoResult2.get(p2)
		end
	end, { UseMemoResult, UseMemoResult2 })
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: CreateFeedMediaSourceModule (upval), Pager (copy), UseMemoResult3 (copy), FFlagMomentsAutoplayAmpPolicy (upval), UseMemoResult1 (copy), CreateCoordinator (copy)
		return CreateCoordinator((CreateFeedMediaSourceModule(Pager, UseMemoResult3, if FFlagMomentsAutoplayAmpPolicy then UseMemoResult1.get else nil)))
	end, {
		Pager,
		CreateCoordinator,
		UseMemoResult3,
		if FFlagMomentsAutoplayAmpPolicy then UseMemoResult1 else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult4 (copy)
		return function()
			-- upvalues: UseMemoResult4 (upval)
			UseMemoResult4.dispose()
		end
	end, { UseMemoResult4 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), SignalsModule (upval), UseMemoResult4 (copy)
		local OnMediaItemLoadAttemptedFunction = p1.onMediaItemLoadAttempted
		local OnMediaItemFailedFunction = p1.onMediaItemFailed
		
		if OnMediaItemLoadAttemptedFunction == nil and OnMediaItemFailedFunction == nil then return end
		local t = {}
		local t1 = {}
		local Flag = false
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: UseMemoResult4 (upval), OnMediaItemLoadAttemptedFunction (copy), t (copy), Flag (ref), OnMediaItemFailedFunction (copy), t1 (copy)
			for i, value in UseMemoResult4.provider.getControllerMap(p2) do
				if OnMediaItemLoadAttemptedFunction ~= nil and not t[i] then
					t[i] = true
					task.defer(function()
						-- upvalues: Flag (upval), OnMediaItemLoadAttemptedFunction (upval), i (copy)
						if not Flag then
							OnMediaItemLoadAttemptedFunction(i)
						end
					end)
				end
				local State = if OnMediaItemFailedFunction == nil then nil else value.getState(p2)
				
				if State ~= nil and State.readiness == "Failed" and not t1[i] then
					t1[i] = true
					local FailureReason = State.failureReason
					task.defer(function()
						-- upvalues: Flag (upval), OnMediaItemFailedFunction (upval), i (copy), FailureReason (copy)
						if not Flag then
							OnMediaItemFailedFunction(i, FailureReason)
						end
					end)
				end
			end
		end)
		
		return function()
			-- upvalues: Flag (ref), Effect (copy)
			Flag = true
			Effect()
		end
	end, {
		UseMemoResult4,
		p1.onMediaItemLoadAttempted,
		p1.onMediaItemFailed
	})
	
	return ReactModule.createElement(Media.MediaPreloadProvider.Provider, { controllerProvider = UseMemoResult4.provider }, p1.children)
end