-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local playersService = game:GetService("Players")
local reactModule = require(momentsCreationFlow.Parent.React)
local useEffect = reactModule.useEffect
local constantsModule = require(momentsCreationFlow.Constants)
local localPlayer = playersService.LocalPlayer
local segmentSelectorWidth = constantsModule.AudioWaveform.SegmentSelectorWidth
local waveformWidth = constantsModule.AudioWaveform.WaveformWidth
local waveformPadding = constantsModule.AudioWaveform.WaveformPadding

local function _(value) --[[ line: 18 | named "assetIdAsContent" ]]
	return `rbxassetid://{value}`
end

local function normalizeWaveform(p0) --[[ line: 22 ]]
	local var5 = 0
	local t = {}
	
	for i, v in p0 do
		local maxValue = math.max(0, v)
		table.insert(t, maxValue)
		var5 = math.max(var5, maxValue)
	end
	if var5 == 0 then
		return t
	end
	local t_1 = {}
	
	for i_1, v_1 in t do
		table.insert(t_1, v_1 / var5)
	end
	return t_1
end

return function(p1, p2) --[[ line: 47 | named "useAudioWaveform" ]]
	-- upvalues: reactModule (ref), segmentSelectorWidth (ref), waveformWidth (ref), waveformPadding (ref), useEffect (ref), localPlayer (ref), normalizeWaveform (ref)
	local var9, var10 = reactModule.useState({})
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useMemo(function() --[[ line: 51 ]]
		-- upvalues: segmentSelectorWidth (copy), waveformWidth (copy), waveformPadding (copy), p2 (ref)
		return segmentSelectorWidth / (waveformWidth + waveformPadding) / p2
	end, { p2 })
	local var13 = reactModule.useMemo(function() --[[ line: 55 ]]
		-- upvalues: p1 (ref)
		return `rbxassetid://{p1}`
	end, { p1 })
	useEffect(function() --[[ line: 59 ]]
		-- upvalues: var13 (ref), var11 (ref), localPlayer (copy)
		local audioWaveform = Instance.new("Folder")
		audioWaveform.Name = "AudioWaveform"
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = var13
		audioPlayer.Parent = audioWaveform
		var11.current = audioPlayer
		audioWaveform.Parent = localPlayer:WaitForChild("PlayerGui")
		
		return function() --[[ line: 70 ]]
			-- upvalues: audioWaveform (ref)
			audioWaveform:Destroy()
		end
	end, { p1, p2 })
	local var14 = reactModule.useCallback(function() --[[ line: 78 ]]
		-- upvalues: var11 (ref), var12 (ref), var10 (ref), normalizeWaveform (copy)
		local current = var11.current
		
		if current and current.IsReady then
			task.spawn(function() --[[ line: 82 ]]
				-- upvalues: current (ref), var12 (copy), var10 (copy), normalizeWaveform (copy)
				var10(normalizeWaveform(current:GetWaveformAsync(NumberRange.new(0, current.TimeLength), var12 * current.TimeLength)))
			end)
		end
	end, {})
	useEffect(function() --[[ line: 92 ]]
		-- upvalues: var11 (ref), var14 (ref)
		local current = var11.current
		local t = {}
		
		if current then
			table.insert(t, current:GetPropertyChangedSignal("IsReady"):Connect(var14))
		end
		return function() --[[ line: 99 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	
	return var9
end