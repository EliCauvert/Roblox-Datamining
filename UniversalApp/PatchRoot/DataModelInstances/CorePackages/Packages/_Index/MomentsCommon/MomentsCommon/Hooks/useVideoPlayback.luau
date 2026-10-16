local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseToggleStateModule = require(MomentsCommon.Hooks.useToggleState)
local SignalModule = require(MomentsCommon.Utils.Signal)
local _ = require(MomentsCommon.Types)
local config = {
	autoplay = false,
	looping = false,
	playbackRegion = NumberRange.new(0, 1e999)
}

return function(p1, VideoContent, p2) --[[ Line: 41 | Named "useVideoPlayback" ]]
	-- upvalues: CryoModule (copy), config (copy), UseRefFunction (copy), UseToggleStateModule (copy), UseStateFunction (copy), SignalModule (copy), UseCallbackFunction (copy), UseEffectFunction (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p2 or {})
	local UseRefResult = UseRefFunction(nil)
	local UseToggleStateModuleResult = UseToggleStateModule(false)
	local UseToggleStateModuleResult1 = UseToggleStateModule(UnionResult.autoplay)
	local UseToggleStateModuleResult2 = UseToggleStateModule(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(0)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(0)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(0)
	local UseRefResult1 = UseRefFunction(SignalModule.new())
	local UseRefResult2 = UseRefFunction(SignalModule.new())
	local UseCallbackResult = UseCallbackFunction(function(p3) --[[ Line: 64 ]]
		-- upvalues: UseRefResult (copy), UnionResult (copy), UseStateResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.TimePosition = math.clamp(p3 + UnionResult.playbackRegion.Min, 0, UseStateResult)
		end
	end, { UseStateResult, UnionResult.playbackRegion })
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 72 ]]
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UnionResult (copy), UseToggleStateModuleResult2 (copy), UseStateResult2_2 (copy), UseStateResult2 (copy)
		local Current = UseRefResult.current
		
		if Current then
			UseRefResult2.current:fire()
			local MaxDelta = UnionResult.playbackRegion.Max - UnionResult.playbackRegion.Min
			Current.Volume = if UseToggleStateModuleResult2.enabled then 0 else 0.2
			UseStateResult2_2((math.min(MaxDelta, Current.TimeLength)))
			UseStateResult2(Current.TimeLength)
		end
	end, {
		UnionResult.playbackRegion,
		UseToggleStateModuleResult2.enabled
	})
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 83 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), UseStateResult2_3 (copy), UnionResult (copy), UseStateResult2_1 (copy)
		if not p1 then return end
		local Current = UseRefResult.current
		
		if Current then
			UseStateResult2_3(Current.TimePosition - UnionResult.playbackRegion.Min)
			UseStateResult2_1(Current.TimePosition)
		end
	end, { p1, UnionResult.playbackRegion })
	local UseCallbackResult3 = UseCallbackFunction(function() --[[ Line: 95 ]]
		-- upvalues: UseRefResult (copy), UnionResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			UseRefResult.current.TimePosition = UnionResult.playbackRegion.Min
			UseRefResult1.current:fire()
			
			return
		end
	end, { UnionResult.playbackRegion })
	UseEffectFunction(function() --[[ Line: 106 ]]
		-- upvalues: UseRefResult (copy), VideoContent (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		if VideoContent then
			Current.VideoContent = VideoContent
		end
	end, { UseToggleStateModuleResult.enabled, VideoContent })
	UseEffectFunction(function() --[[ Line: 117 ]]
		-- upvalues: UseRefResult (copy), UseCallbackResult1 (copy), UseCallbackResult2 (copy), UseCallbackResult3 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local LoadedConnection = Current.Loaded:Connect(UseCallbackResult1)
		local RenderSteppedConnection = game:GetService("RunService").RenderStepped:Connect(UseCallbackResult2)
		local DidLoopConnection = Current.DidLoop:Connect(UseCallbackResult3)
		
		return function() --[[ Line: 127 ]]
			-- upvalues: LoadedConnection (copy), RenderSteppedConnection (copy), DidLoopConnection (copy)
			LoadedConnection:Disconnect()
			RenderSteppedConnection:Disconnect()
			DidLoopConnection:Disconnect()
		end
	end, {
		UseToggleStateModuleResult.enabled,
		UseCallbackResult2,
		UseCallbackResult1,
		UseCallbackResult3
	})
	UseEffectFunction(function() --[[ Line: 134 ]]
		-- upvalues: UseRefResult (copy), UnionResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.Looped = UnionResult.looping
		end
	end, { UseToggleStateModuleResult.enabled, UnionResult.looping })
	UseEffectFunction(function() --[[ Line: 141 ]]
		-- upvalues: UseRefResult (copy), UseToggleStateModuleResult1 (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.Playing = UseToggleStateModuleResult1.enabled
		end
	end, {
		UseToggleStateModuleResult.enabled,
		UseToggleStateModuleResult1.enabled
	})
	UseEffectFunction(function() --[[ Line: 148 ]]
		-- upvalues: UseRefResult (copy), UseToggleStateModuleResult2 (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.Volume = if UseToggleStateModuleResult2.enabled then 0 else 0.2
		end
	end, {
		UseToggleStateModuleResult.enabled,
		UseToggleStateModuleResult2.enabled
	})
	UseEffectFunction(function() --[[ Line: 155 ]]
		-- upvalues: UseRefResult (copy), UseStateResult1 (ref), UnionResult (copy), UseToggleStateModuleResult1 (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		if UnionResult.playbackRegion.Max + 0.001 <= UseStateResult1 then
			if UseToggleStateModuleResult1.enabled then
				if UnionResult.looping then
					Current.TimePosition = UnionResult.playbackRegion.Min
					UseRefResult1.current:fire()
				else
					UseToggleStateModuleResult1.disable()
				end
			else
				UseStateResult1 = UnionResult.playbackRegion.Max
			end
		end
		if UseStateResult1 < UnionResult.playbackRegion.Min - 0.001 then
			Current.TimePosition = UnionResult.playbackRegion.Min
		end
	end, {
		UseStateResult1,
		UnionResult.playbackRegion,
		UnionResult.looping,
		UseToggleStateModuleResult1.disable
	})
	UseEffectFunction(function() --[[ Line: 182 ]]
		-- upvalues: UseRefResult (copy), UnionResult (copy), UseStateResult2_2 (copy)
		local Current = UseRefResult.current
		
		if Current then
			UseStateResult2_2((math.min(UnionResult.playbackRegion.Max - UnionResult.playbackRegion.Min, Current.TimeLength)))
		end
	end, { UnionResult.playbackRegion })
	
	return {
		timeline = {
			duration = UseStateResult3,
			elapsed = UseStateResult4,
			seek = UseCallbackResult,
			timeLength = UseStateResult,
			timePosition = UseStateResult1
		},
		playback = {
			isPlaying = UseToggleStateModuleResult1.enabled,
			pause = UseToggleStateModuleResult1.disable,
			play = UseToggleStateModuleResult1.enable,
			toggle = UseToggleStateModuleResult1.toggle
		},
		volume = {
			isMuted = UseToggleStateModuleResult2.enabled,
			mute = UseToggleStateModuleResult2.enable,
			unmute = UseToggleStateModuleResult2.disable,
			toggle = UseToggleStateModuleResult2.toggle
		},
		onVideoDidLoopSignalRef = UseRefResult1,
		onVideoLoadedSignalRef = UseRefResult2,
		ref = UseRefResult,
		updateRef = UseCallbackFunction(function(Current) --[[ Line: 190 ]]
			-- upvalues: UseToggleStateModuleResult (copy), UseRefResult (copy)
			UseToggleStateModuleResult.toggle()
			UseRefResult.current = Current
		end, { UseToggleStateModuleResult.toggle })
	}
end