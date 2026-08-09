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
local signalsModule = require(parent.Signals)
local enableAudioPlaybackInApp = require(parent.MediaPlayback).enableAudioPlaybackInApp
local media = require(parent.MomentsCommon).Media
local _ = require(moments.Components.Feed.FeedTypes)
local createFeedMediaSourceModule = require(script.Parent.createFeedMediaSource)

local function _() --[[ line: 84 | named "shouldPauseWhenAppHidden" ]]
	-- upvalues: userInputService (ref)
	return userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

local function defaultCreateCoordinator(p0) --[[ line: 89 ]]
	-- upvalues: enableAudioPlaybackInApp (ref), coreGuiService (ref), httpService (ref), runService (ref), contentProviderService (ref), media (ref)
	enableAudioPlaybackInApp()
	local momentMediaAudioOutput = Instance.new("AudioDeviceOutput")
	momentMediaAudioOutput.Name = "MomentMediaAudioOutput"
	momentMediaAudioOutput.Parent = coreGuiService
	local folder = Instance.new("Folder")
	folder.Name = "MomentMediaRoot_" .. httpService:GenerateGUID(false)
	folder.Parent = coreGuiService
	local var13 = media.createMediaPreloadCoordinator(p0, media.selectPreloadPolicy(), media.mediaTelemetry.noopSink, momentMediaAudioOutput, {
		runService = runService,
		contentProvider = contentProviderService
	}, { parent = folder })
	
	return {
		provider = var13,
		dispose = function() --[[ line: 127 ]]
			-- upvalues: var13 (ref), momentMediaAudioOutput (ref), folder (ref)
			var13.dispose()
			momentMediaAudioOutput:Destroy()
			folder:Destroy()
		end
	}
end

return function(p1) --[[ line: 135 | named "MomentMediaCoordinatorProvider" ]]
	-- upvalues: defaultCreateCoordinator (ref), reactModule (ref), signalsModule (ref), userInputService (ref), var6 (write), createFeedMediaSourceModule (ref), media (ref)
	local pager = p1.pager
	local playbackActive = p1.playbackActive
	local createCoordinator = p1.createCoordinator or defaultCreateCoordinator
	local var15 = reactModule.useMemo(function() --[[ line: 152 ]]
		-- upvalues: signalsModule (copy), playbackActive (ref)
		local var19, var20 = signalsModule.createSignal(playbackActive)
		
		return { get = var19, set = var20 }
	end, {})
	local var16 = reactModule.useMemo(function() --[[ line: 156 ]]
		-- upvalues: signalsModule (copy)
		local var21, var22 = signalsModule.createSignal(true)
		
		return { get = var21, set = var22 }
	end, {})
	reactModule.useEffect(function() --[[ line: 161 ]]
		-- upvalues: var15 (ref), playbackActive (ref)
		var15.set(playbackActive)
	end, { playbackActive, var15 })
	reactModule.useEffect(function() --[[ line: 168 ]]
		-- upvalues: userInputService (copy), var16 (ref), var6 (copy)
		if userInputService:GetDeviceType() == Enum.DeviceType.Desktop then return end
		local function onHidden() --[[ line: 172 ]]
			-- upvalues: var16 (copy)
			var16.set(false)
		end
		
		local function onShown() --[[ line: 175 ]]
			-- upvalues: var16 (copy)
			var16.set(true)
		end
		
		local t = {}
		
		if var6 ~= nil then
			table.insert(t, var6.OnHide:Connect(onHidden))
			table.insert(t, var6.OnUnhide:Connect(onShown))
		end
		return function() --[[ line: 183 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var16 })
	local var17 = reactModule.useMemo(function() --[[ line: 194 ]]
		-- upvalues: var15 (ref), var16 (ref)
		return function(p2) --[[ line: 195 ]]
			-- upvalues: var15 (copy), var16 (copy)
			return var15.get(p2) and var16.get(p2)
		end
	end, { var15, var16 })
	local var18 = reactModule.useMemo(function() --[[ line: 203 ]]
		-- upvalues: createFeedMediaSourceModule (copy), pager (ref), var17 (ref), createCoordinator (ref)
		return createCoordinator(createFeedMediaSourceModule(pager, var17))
	end, { pager, createCoordinator, var17 })
	reactModule.useEffect(function() --[[ line: 210 ]]
		-- upvalues: var18 (ref)
		return function() --[[ line: 211 ]]
			-- upvalues: var18 (copy)
			var18.dispose()
		end
	end, { var18 })
	reactModule.useEffect(function() --[[ line: 216 ]]
		-- upvalues: p1 (ref), signalsModule (copy), var18 (ref)
		local onMediaItemFailed = p1.onMediaItemFailed
		
		if onMediaItemFailed == nil then
			return
		end
		local t = {}
		local var27 = false
		local var28 = signalsModule.createEffect(function(p3) --[[ line: 224 ]]
			-- upvalues: var18 (copy), t (ref), var27 (write), onMediaItemFailed (ref)
			for i, v in var18.provider.getControllerMap(p3) do
				local state = v.getState(p3)
				
				if state.readiness == "Failed" and not t[i] then
					t[i] = true
					local failureReason = state.failureReason
					task.defer(function() --[[ line: 231 ]]
						-- upvalues: var27 (copy), onMediaItemFailed (copy), i (ref), failureReason (ref)
						if not var27 then
							onMediaItemFailed(i, failureReason)
						end
					end)
				end
			end
		end)
		
		return function() --[[ line: 240 ]]
			-- upvalues: var27 (write), var28 (ref)
			var27 = true
			var28()
		end
	end, { var18, p1.onMediaItemFailed })
	
	return reactModule.createElement(media.MediaPreloadProvider.Provider, { controllerProvider = var18.provider }, p1.children)
end