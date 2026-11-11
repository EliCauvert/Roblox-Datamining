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
local EnableAudioPlaybackInAppFunction = require(Parent.MediaPlayback).enableAudioPlaybackInApp
local Media = require(Parent.MomentsCommon).Media
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
	-- upvalues: defaultCreateCoordinator (copy), ReactModule (copy), SignalsModule (copy), UserInputService (copy), AppLifecycleObserverService (ref), CreateFeedMediaSourceModule (copy), Media (copy)
	local Pager = p1.pager
	local PlaybackActive = p1.playbackActive
	local CreateCoordinator = p1.createCoordinator or defaultCreateCoordinator
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), PlaybackActive (copy)
		local Signal, Signal2 = SignalsModule.createSignal(PlaybackActive)
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(true)
		
		return { get = Signal, set = Signal2 }
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), PlaybackActive (copy)
		UseMemoResult.set(PlaybackActive)
	end, { PlaybackActive, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseMemoResult1 (copy), AppLifecycleObserverService (upval)
		if UserInputService:GetDeviceType() == Enum.DeviceType.Desktop then return end
		local function onHidden()
			-- upvalues: UseMemoResult1 (upval)
			UseMemoResult1.set(false)
		end
		
		local function onShown()
			-- upvalues: UseMemoResult1 (upval)
			UseMemoResult1.set(true)
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
	end, { UseMemoResult1 })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy)
		return function(p2)
			-- upvalues: UseMemoResult (upval), UseMemoResult1 (upval)
			return UseMemoResult.get(p2) and UseMemoResult1.get(p2)
		end
	end, { UseMemoResult, UseMemoResult1 })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: CreateFeedMediaSourceModule (upval), Pager (copy), UseMemoResult2 (copy), CreateCoordinator (copy)
		return CreateCoordinator((CreateFeedMediaSourceModule(Pager, UseMemoResult2)))
	end, { Pager, CreateCoordinator, UseMemoResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult3 (copy)
		return function()
			-- upvalues: UseMemoResult3 (upval)
			UseMemoResult3.dispose()
		end
	end, { UseMemoResult3 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), SignalsModule (upval), UseMemoResult3 (copy)
		local OnMediaItemFailedFunction = p1.onMediaItemFailed
		
		if OnMediaItemFailedFunction == nil then return end
		local t = {}
		local Flag = false
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: UseMemoResult3 (upval), t (copy), Flag (ref), OnMediaItemFailedFunction (copy)
			for i, value in UseMemoResult3.provider.getControllerMap(p2) do
				local State = value.getState(p2)
				
				if State.readiness == "Failed" and not t[i] then
					t[i] = true
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
	end, { UseMemoResult3, p1.onMediaItemFailed })
	
	return ReactModule.createElement(Media.MediaPreloadProvider.Provider, { controllerProvider = UseMemoResult3.provider }, p1.children)
end