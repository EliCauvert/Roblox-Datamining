local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local contentProviderService = game:GetService("ContentProvider")
local userInputService = game:GetService("UserInputService")
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("AppLifecycleObserverService")
end)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local enableAudioPlaybackInApp = require(parent.MediaPlayback).enableAudioPlaybackInApp
local momentsCommonModule = require(parent.MomentsCommon)
local media = momentsCommonModule.Media
local getMomentsCapabilities = momentsCommonModule.Stores.GetMomentsCapabilities
local fFlagMomentsAutoplayAmpPolicy = sharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local _ = require(moments.Components.Feed.FeedTypes)
local createFeedMediaSourceModule = require(script.Parent.createFeedMediaSource)

local function _()
	-- upvalues: userInputService (ref)
	return userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

local function defaultCreateCoordinator(p1)
	-- upvalues: enableAudioPlaybackInApp (ref), coreGuiService (ref), httpService (ref), runService (ref), contentProviderService (ref), media (ref)
	enableAudioPlaybackInApp()
	local momentMediaAudioOutput = Instance.new("AudioDeviceOutput")
	momentMediaAudioOutput.Name = "MomentMediaAudioOutput"
	momentMediaAudioOutput.Parent = coreGuiService
	local folder = Instance.new("Folder")
	folder.Name = "MomentMediaRoot_" .. httpService:GenerateGUID(false)
	folder.Parent = coreGuiService
	local var2 = media.createMediaPreloadCoordinator(p1, media.selectPreloadPolicy(), media.mediaTelemetry.noopSink, momentMediaAudioOutput, {
		runService = runService,
		contentProvider = contentProviderService
	}, { parent = folder })
	
	return {
		provider = var2,
		dispose = function()
			-- upvalues: var2 (ref), momentMediaAudioOutput (ref), folder (ref)
			var2.dispose()
			momentMediaAudioOutput:Destroy()
			folder:Destroy()
		end
	}
end

return function(p1)
	-- upvalues: fFlagMomentsAutoplayAmpPolicy (ref), useSignalState (ref), getMomentsCapabilities (ref), defaultCreateCoordinator (ref), reactModule (ref), signalsModule (ref), userInputService (ref), var1 (write), createFeedMediaSourceModule (ref), media (ref)
	local pager = p1.pager
	local var2 = if fFlagMomentsAutoplayAmpPolicy then useSignalState(getMomentsCapabilities(false).getIsAutoPlayEnabled) else nil
	local playbackActive = p1.playbackActive
	local createCoordinator = p1.createCoordinator or defaultCreateCoordinator
	local var3 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), playbackActive (ref)
		local var4, var5 = signalsModule.createSignal(playbackActive)
		
		return { get = var4, set = var5 }
	end, {})
	local var4 = if fFlagMomentsAutoplayAmpPolicy then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var2 (ref)
		local var5, var6 = signalsModule.createSignal(var2)
		
		return { get = var5, set = var6 }
	end, {}) else nil
	local var5 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local var6, var7 = signalsModule.createSignal(true)
		
		return { get = var6, set = var7 }
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), playbackActive (ref)
		var3.set(playbackActive)
	end, { playbackActive, var3 })
	
	if fFlagMomentsAutoplayAmpPolicy then
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), var2 (ref)
			var4.set(var2)
		end, { var2, var4 })
	end
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var5 (ref), var1 (copy)
		if userInputService:GetDeviceType() == Enum.DeviceType.Desktop then return end
		local function onHidden()
			-- upvalues: var5 (copy)
			var5.set(false)
		end
		
		local function onShown()
			-- upvalues: var5 (copy)
			var5.set(true)
		end
		
		local t = {}
		
		if var1 ~= nil then
			table.insert(t, var1.OnHide:Connect(onHidden))
			table.insert(t, var1.OnUnhide:Connect(onShown))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var5 })
	local var6 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var5 (ref)
		return function(p2)
			-- upvalues: var3 (copy), var5 (copy)
			return var3.get(p2) and var5.get(p2)
		end
	end, { var3, var5 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: createFeedMediaSourceModule (copy), pager (ref), var6 (ref), fFlagMomentsAutoplayAmpPolicy (copy), var4 (ref), createCoordinator (ref)
		return createCoordinator(createFeedMediaSourceModule(pager, var6, if fFlagMomentsAutoplayAmpPolicy then var4.get else nil))
	end, {
		pager,
		createCoordinator,
		var6,
		if fFlagMomentsAutoplayAmpPolicy then var4 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		return function()
			-- upvalues: var7 (copy)
			var7.dispose()
		end
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), signalsModule (copy), var7 (ref)
		local onMediaItemLoadAttempted = p1.onMediaItemLoadAttempted
		local onMediaItemFailed = p1.onMediaItemFailed
		
		if onMediaItemLoadAttempted == nil and onMediaItemFailed == nil then
			return
		end
		local t = {}
		local t_1 = {}
		local var8 = false
		local var9 = signalsModule.createEffect(function(p2)
			-- upvalues: var7 (copy), onMediaItemLoadAttempted (ref), t (ref), var8 (write), onMediaItemFailed (ref), t_1 (ref)
			for i, v in var7.provider.getControllerMap(p2) do
				if onMediaItemLoadAttempted ~= nil and not t[i] then
					t[i] = true
					task.defer(function()
						-- upvalues: var8 (copy), onMediaItemLoadAttempted (copy), i (ref)
						if not var8 then
							onMediaItemLoadAttempted(i)
						end
					end)
				end
				local var10 = if onMediaItemFailed ~= nil then nil else v.getState(p2)
				
				if var10 ~= nil and var10.readiness == "Failed" and not t_1[i] then
					t_1[i] = true
					local failureReason = var10.failureReason
					task.defer(function()
						-- upvalues: var8 (copy), onMediaItemFailed (copy), i (ref), failureReason (ref)
						if not var8 then
							onMediaItemFailed(i, failureReason)
						end
					end)
				end
			end
		end)
		
		return function()
			-- upvalues: var8 (write), var9 (ref)
			var8 = true
			var9()
		end
	end, { var7, p1.onMediaItemLoadAttempted, p1.onMediaItemFailed })
	
	return reactModule.createElement(media.MediaPreloadProvider.Provider, { controllerProvider = var7.provider }, p1.children)
end