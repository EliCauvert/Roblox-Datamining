local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local contentProviderService = game:GetService("ContentProvider")
local userInputService = game:GetService("UserInputService")
local var6 = nil
pcall(function() --[[ line: 30 ]]
	-- upvalues: var6 (write)
	var6 = game:GetService("AppLifecycleObserverService")
end)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local enableAudioPlaybackInApp = require(parent.MediaPlayback).enableAudioPlaybackInApp
local media = require(parent.MomentsCommon).Media
local fFlagMomentsAutoplayAmpPolicy = sharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local _ = require(moments.Components.Feed.FeedTypes)
local createFeedMediaSourceModule = require(script.Parent.createFeedMediaSource)

local function _() --[[ line: 87 | named "shouldPauseWhenAppHidden" ]]
	-- upvalues: userInputService (ref)
	return userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

local function defaultCreateCoordinator(p0) --[[ line: 92 ]]
	-- upvalues: enableAudioPlaybackInApp (ref), coreGuiService (ref), httpService (ref), runService (ref), contentProviderService (ref), media (ref)
	enableAudioPlaybackInApp()
	local momentMediaAudioOutput = Instance.new("AudioDeviceOutput")
	momentMediaAudioOutput.Name = "MomentMediaAudioOutput"
	momentMediaAudioOutput.Parent = coreGuiService
	local folder = Instance.new("Folder")
	folder.Name = "MomentMediaRoot_" .. httpService:GenerateGUID(false)
	folder.Parent = coreGuiService
	local var14 = media.createMediaPreloadCoordinator(p0, media.selectPreloadPolicy(), media.mediaTelemetry.noopSink, momentMediaAudioOutput, {
		runService = runService,
		contentProvider = contentProviderService
	}, { parent = folder })
	
	return {
		provider = var14,
		dispose = function() --[[ line: 130 ]]
			-- upvalues: var14 (ref), momentMediaAudioOutput (ref), folder (ref)
			var14.dispose()
			momentMediaAudioOutput:Destroy()
			folder:Destroy()
		end
	}
end

return function(p1) --[[ line: 138 | named "MomentMediaCoordinatorProvider" ]]
	-- upvalues: fFlagMomentsAutoplayAmpPolicy (ref), useAppPolicy (ref), defaultCreateCoordinator (ref), reactModule (ref), signalsModule (ref), userInputService (ref), var6 (write), createFeedMediaSourceModule (ref), media (ref)
	local pager = p1.pager
	local var15 = if fFlagMomentsAutoplayAmpPolicy then useAppPolicy(function(p2) --[[ line: 141 ]]
		return p2.getMomentsCanAutoPlay()
	end) else nil
	local playbackActive = p1.playbackActive
	local createCoordinator = p1.createCoordinator or defaultCreateCoordinator
	local var17 = reactModule.useMemo(function() --[[ line: 162 ]]
		-- upvalues: signalsModule (copy), playbackActive (ref)
		local var22, var23 = signalsModule.createSignal(playbackActive)
		
		return { get = var22, set = var23 }
	end, {})
	local var18 = if fFlagMomentsAutoplayAmpPolicy then reactModule.useMemo(function() --[[ line: 168 ]]
		-- upvalues: signalsModule (copy), var15 (ref)
		local var24, var25 = signalsModule.createSignal(var15)
		
		return { get = var24, set = var25 }
	end, {}) else nil
	local var19 = reactModule.useMemo(function() --[[ line: 173 ]]
		-- upvalues: signalsModule (copy)
		local var26, var27 = signalsModule.createSignal(true)
		
		return { get = var26, set = var27 }
	end, {})
	reactModule.useEffect(function() --[[ line: 178 ]]
		-- upvalues: var17 (ref), playbackActive (ref)
		var17.set(playbackActive)
	end, { playbackActive, var17 })
	
	if fFlagMomentsAutoplayAmpPolicy then
		reactModule.useEffect(function() --[[ line: 182 ]]
			-- upvalues: var18 (ref), var15 (ref)
			var18.set(var15)
		end, { var15, var18 })
	end
	reactModule.useEffect(function() --[[ line: 190 ]]
		-- upvalues: userInputService (copy), var19 (ref), var6 (copy)
		if userInputService:GetDeviceType() == Enum.DeviceType.Desktop then return end
		local function onHidden() --[[ line: 194 ]]
			-- upvalues: var19 (copy)
			var19.set(false)
		end
		
		local function onShown() --[[ line: 197 ]]
			-- upvalues: var19 (copy)
			var19.set(true)
		end
		
		local t = {}
		
		if var6 ~= nil then
			table.insert(t, var6.OnHide:Connect(onHidden))
			table.insert(t, var6.OnUnhide:Connect(onShown))
		end
		return function() --[[ line: 205 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var19 })
	local var20 = reactModule.useMemo(function() --[[ line: 216 ]]
		-- upvalues: var17 (ref), var19 (ref)
		return function(p3) --[[ line: 217 ]]
			-- upvalues: var17 (copy), var19 (copy)
			return var17.get(p3) and var19.get(p3)
		end
	end, { var17, var19 })
	local var21 = reactModule.useMemo(function() --[[ line: 225 ]]
		-- upvalues: createFeedMediaSourceModule (copy), pager (ref), var20 (ref), fFlagMomentsAutoplayAmpPolicy (copy), var18 (ref), createCoordinator (ref)
		return createCoordinator(createFeedMediaSourceModule(pager, var20, if fFlagMomentsAutoplayAmpPolicy then var18.get else nil))
	end, {
		pager,
		createCoordinator,
		var20,
		if fFlagMomentsAutoplayAmpPolicy then var18 else nil
	})
	reactModule.useEffect(function() --[[ line: 241 ]]
		-- upvalues: var21 (ref)
		return function() --[[ line: 242 ]]
			-- upvalues: var21 (copy)
			var21.dispose()
		end
	end, { var21 })
	reactModule.useEffect(function() --[[ line: 247 ]]
		-- upvalues: p1 (ref), signalsModule (copy), var21 (ref)
		local onMediaItemFailed = p1.onMediaItemFailed
		
		if onMediaItemFailed == nil then
			return
		end
		local t = {}
		local var32 = false
		local var33 = signalsModule.createEffect(function(p4) --[[ line: 255 ]]
			-- upvalues: var21 (copy), t (ref), var32 (write), onMediaItemFailed (ref)
			for i, v in var21.provider.getControllerMap(p4) do
				local state = v.getState(p4)
				
				if state.readiness == "Failed" and not t[i] then
					t[i] = true
					local failureReason = state.failureReason
					task.defer(function() --[[ line: 262 ]]
						-- upvalues: var32 (copy), onMediaItemFailed (copy), i (ref), failureReason (ref)
						if not var32 then
							onMediaItemFailed(i, failureReason)
						end
					end)
				end
			end
		end)
		
		return function() --[[ line: 271 ]]
			-- upvalues: var32 (write), var33 (ref)
			var32 = true
			var33()
		end
	end, { var21, p1.onMediaItemFailed })
	
	return reactModule.createElement(media.MediaPreloadProvider.Provider, { controllerProvider = var21.provider }, p1.children)
end