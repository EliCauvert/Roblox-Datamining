local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local contentProviderService = game:GetService("ContentProvider")
local userInputService = game:GetService("UserInputService")
local var4 = nil
pcall(function() --[[ line: 10 ]]
	-- upvalues: var4 (write)
	var4 = game:GetService("AppLifecycleObserverService")
end)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local enableAudioPlaybackInApp = require(parent.MediaPlayback).enableAudioPlaybackInApp
local media = require(parent.MomentsCommon).Media
local _ = require(parent.DataHydration.MomentsStoreTypes)
local toMediaItemModule = require(parent.Moments.ToMediaItem)
local fFlagProfileMomentsVideoPlaybackFix = require(parent.SharedFlags).FFlagProfileMomentsVideoPlaybackFix

local function _() --[[ line: 36 | named "shouldPauseWhenAppHidden" ]]
	-- upvalues: userInputService (ref)
	return userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop
end

return function(p0) --[[ line: 48 | named "MomentsCarouselMediaProvider" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), userInputService (ref), var4 (write), toMediaItemModule (ref), enableAudioPlaybackInApp (ref), coreGuiService (ref), fFlagProfileMomentsVideoPlaybackFix (ref), runService (ref), contentProviderService (ref), media (ref)
	local activeIndex = p0.activeIndex
	local playbackActive = p0.playbackActive
	local var8 = reactModule.useMemo(function() --[[ line: 54 ]]
		-- upvalues: signalsModule (copy), activeIndex (ref)
		local var15, var16 = signalsModule.createSignal(activeIndex)
		
		return { get = var15, set = var16 }
	end, {})
	local var9 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: signalsModule (copy), playbackActive (ref)
		local var17, var18 = signalsModule.createSignal(playbackActive)
		
		return { get = var17, set = var18 }
	end, {})
	local var10 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: signalsModule (copy)
		local var19, var20 = signalsModule.createSignal(true)
		
		return { get = var19, set = var20 }
	end, {})
	reactModule.useEffect(function() --[[ line: 70 ]]
		-- upvalues: var8 (ref), activeIndex (ref)
		var8.set(activeIndex)
	end, { activeIndex, var8 })
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: var9 (ref), playbackActive (ref)
		var9.set(playbackActive)
	end, { playbackActive, var9 })
	reactModule.useEffect(function() --[[ line: 78 ]]
		-- upvalues: userInputService (copy), var4 (copy), var10 (ref)
		if userInputService:GetDeviceType() ~= Enum.DeviceType.Desktop and var4 ~= nil then
			local list = {
				var4.OnHide:Connect(function() --[[ line: 82 | named "onHidden" ]]
					-- upvalues: var10 (copy)
					var10.set(false)
				end),
				var4.OnUnhide:Connect(function() --[[ line: 85 | named "onShown" ]]
					-- upvalues: var10 (copy)
					var10.set(true)
				end)
			}
			
			return function() --[[ line: 92 ]]
				-- upvalues: list (ref)
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { var10 })
	local var11 = reactModule.useMemo(function() --[[ line: 99 ]]
		-- upvalues: p0 (ref), toMediaItemModule (copy)
		local t = {}
		
		for i, v in p0.moments do
			local var23 = toMediaItemModule({ kind = "moment", moment = v })
			
			if var23 ~= nil then
				var23.cornerRadius = p0.mediaCornerRadius
				table.insert(t, var23)
			end
		end
		return t
	end, { p0.moments, p0.mediaCornerRadius })
	local var12 = reactModule.useMemo(function() --[[ line: 113 ]]
		-- upvalues: var9 (ref), var10 (ref)
		return function(p1) --[[ line: 114 ]]
			-- upvalues: var9 (copy), var10 (copy)
			return var9.get(p1) and var10.get(p1)
		end
	end, { var9, var10 })
	local var13 = reactModule.useMemo(function() --[[ line: 119 ]]
		-- upvalues: var8 (ref), var11 (ref), var12 (ref)
		return {
			getActiveIndex = var8.get,
			getItems = function(_) --[[ line: 122 ]]
				-- upvalues: var11 (copy)
				return var11
			end,
			getPlaybackActive = var12
		}
	end, { var11, var8, var12 })
	local var14 = reactModule.useMemo(function() --[[ line: 129 ]]
		-- upvalues: enableAudioPlaybackInApp (copy), coreGuiService (copy), fFlagProfileMomentsVideoPlaybackFix (copy), runService (copy), contentProviderService (copy), media (copy), var13 (ref)
		enableAudioPlaybackInApp()
		local profileMomentsAudioOutput = Instance.new("AudioDeviceOutput")
		profileMomentsAudioOutput.Name = "ProfileMomentsAudioOutput"
		profileMomentsAudioOutput.Parent = coreGuiService
		local profileMomentsMediaHost = if fFlagProfileMomentsVideoPlaybackFix then Instance.new("Folder") else nil
		
		if profileMomentsMediaHost ~= nil then
			profileMomentsMediaHost.Name = "ProfileMomentsMediaHost"
			profileMomentsMediaHost.Parent = coreGuiService
		end
		local var26 = media.createMediaPreloadCoordinator(var13, media.selectPreloadPolicy(), media.mediaTelemetry.noopSink, profileMomentsAudioOutput, {
			runService = runService,
			contentProvider = contentProviderService
		}, { parent = profileMomentsMediaHost })
		
		return {
			provider = var26,
			dispose = function() --[[ line: 162 ]]
				-- upvalues: var26 (ref), profileMomentsAudioOutput (ref), profileMomentsMediaHost (ref)
				var26.dispose()
				profileMomentsAudioOutput:Destroy()
				
				if profileMomentsMediaHost ~= nil then
					profileMomentsMediaHost:Destroy()
				end
			end
		}
	end, { var13 })
	reactModule.useEffect(function() --[[ line: 172 ]]
		-- upvalues: var14 (ref)
		return function() --[[ line: 173 ]]
			-- upvalues: var14 (copy)
			var14.dispose()
		end
	end, { var14 })
	
	return reactModule.createElement(media.MediaPreloadProvider.Provider, { controllerProvider = var14.provider }, p0.children)
end