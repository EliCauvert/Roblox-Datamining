local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local ReactModule = require(MomentsCreationFlow.Parent.React)
local UseEffectFunction = ReactModule.useEffect
local ConstantsModule = require(MomentsCreationFlow.Constants)
local LocalPlayer = game:GetService("Players").LocalPlayer
local SegmentSelectorWidth = ConstantsModule.AudioWaveform.SegmentSelectorWidth
local WaveformWidth = ConstantsModule.AudioWaveform.WaveformWidth
local WaveformPadding = ConstantsModule.AudioWaveform.WaveformPadding

local function _(p1): string --[[ Line: 18 | Named "assetIdAsContent" ]]
	return `rbxassetid://{p1}`
end

local function normalizeWaveform(WaveformAsync) --[[ Line: 22 ]]
	local Largest = 0
	local List = {}
	
	for _, value in WaveformAsync do
		local Largest1 = math.max(0, value)
		table.insert(List, Largest1)
		Largest = math.max(Largest, Largest1)
	end
	if Largest == 0 then
		return List
	end
	local List1 = {}
	
	for _, value1 in List do
		table.insert(List1, value1 / Largest)
	end
	return List1
end

return function(p1, p2) --[[ Line: 47 | Named "useAudioWaveform" ]]
	-- upvalues: ReactModule (copy), SegmentSelectorWidth (copy), WaveformWidth (copy), WaveformPadding (copy), UseEffectFunction (copy), LocalPlayer (copy), normalizeWaveform (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 51 ]]
		-- upvalues: SegmentSelectorWidth (upval), WaveformWidth (upval), WaveformPadding (upval), p2 (copy)
		return SegmentSelectorWidth / (WaveformWidth + WaveformPadding) / p2
	end, { p2 })
	local UseMemoResult1 = ReactModule.useMemo(function(): string --[[ Line: 55 ]]
		-- upvalues: p1 (copy)
		return `rbxassetid://{p1}`
	end, { p1 })
	UseEffectFunction(function() --[[ Line: 59 ]]
		-- upvalues: UseMemoResult1 (copy), UseRefResult (copy), LocalPlayer (upval)
		local AudioWaveform = Instance.new("Folder")
		AudioWaveform.Name = "AudioWaveform"
		local AudioPlayer = Instance.new("AudioPlayer")
		AudioPlayer.Asset = UseMemoResult1
		AudioPlayer.Parent = AudioWaveform
		UseRefResult.current = AudioPlayer
		AudioWaveform.Parent = LocalPlayer:WaitForChild("PlayerGui")
		
		return function() --[[ Line: 70 ]]
			-- upvalues: AudioWaveform (copy)
			AudioWaveform:Destroy()
		end
	end, { p1, p2 })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 78 ]]
		-- upvalues: UseRefResult (copy), UseMemoResult (copy), UseStateResult2 (copy), normalizeWaveform (upval)
		local Current = UseRefResult.current
		
		if Current and Current.IsReady then
			task.spawn(function() --[[ Line: 82 ]]
				-- upvalues: Current (copy), UseMemoResult (upval), UseStateResult2 (upval), normalizeWaveform (upval)
				UseStateResult2((normalizeWaveform((Current:GetWaveformAsync(NumberRange.new(0, Current.TimeLength), UseMemoResult * Current.TimeLength)))))
			end)
		end
	end, {})
	UseEffectFunction(function() --[[ Line: 92 ]]
		-- upvalues: UseRefResult (copy), UseResult (copy)
		local Current = UseRefResult.current
		local List = {}
		
		if Current then
			table.insert(List, Current:GetPropertyChangedSignal("IsReady"):Connect(UseResult))
		end
		return function() --[[ Line: 99 ]]
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult
end