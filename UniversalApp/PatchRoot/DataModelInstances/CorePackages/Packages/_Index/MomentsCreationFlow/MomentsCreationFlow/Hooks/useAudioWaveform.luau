local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local playersService = game:GetService("Players")
local reactModule = require(momentsCreationFlow.Parent.React)
local useEffect = reactModule.useEffect
local constantsModule = require(momentsCreationFlow.Constants)
local localPlayer = playersService.LocalPlayer
local segmentSelectorWidth = constantsModule.AudioWaveform.SegmentSelectorWidth
local waveformWidth = constantsModule.AudioWaveform.WaveformWidth
local waveformPadding = constantsModule.AudioWaveform.WaveformPadding

local function _(value)
	return `rbxassetid://{value}`
end

local function normalizeWaveform(p1)
	local var1 = 0
	local t = {}
	
	for i, v in p1 do
		local maxValue = math.max(0, v)
		table.insert(t, maxValue)
		var1 = math.max(var1, maxValue)
	end
	if var1 == 0 then
		return t
	end
	local t_1 = {}
	
	for i_1, v_1 in t do
		table.insert(t_1, v_1 / var1)
	end
	return t_1
end

return function(p2, p3)
	-- upvalues: reactModule (ref), segmentSelectorWidth (ref), waveformWidth (ref), waveformPadding (ref), useEffect (ref), localPlayer (ref), normalizeWaveform (ref)
	local var2, var3 = reactModule.useState({})
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useMemo(function()
		-- upvalues: segmentSelectorWidth (copy), waveformWidth (copy), waveformPadding (copy), p3 (ref)
		return segmentSelectorWidth / (waveformWidth + waveformPadding) / p3
	end, { p3 })
	local var6 = reactModule.useMemo(function()
		-- upvalues: p2 (ref)
		return `rbxassetid://{p2}`
	end, { p2 })
	useEffect(function()
		-- upvalues: var6 (ref), var4 (ref), localPlayer (copy)
		local audioWaveform = Instance.new("Folder")
		audioWaveform.Name = "AudioWaveform"
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = var6
		audioPlayer.Parent = audioWaveform
		var4.current = audioPlayer
		audioWaveform.Parent = localPlayer:WaitForChild("PlayerGui")
		
		return function()
			-- upvalues: audioWaveform (ref)
			audioWaveform:Destroy()
		end
	end, { p2, p3 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var5 (ref), var3 (ref), normalizeWaveform (copy)
		local current = var4.current
		
		if current and current.IsReady then
			task.spawn(function()
				-- upvalues: current (ref), var5 (copy), var3 (copy), normalizeWaveform (copy)
				var3(normalizeWaveform(current:GetWaveformAsync(NumberRange.new(0, current.TimeLength), var5 * current.TimeLength)))
			end)
		end
	end, {})
	useEffect(function()
		-- upvalues: var4 (ref), var7 (ref)
		local current = var4.current
		local t = {}
		
		if current then
			table.insert(t, current:GetPropertyChangedSignal("IsReady"):Connect(var7))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	
	return var2
end