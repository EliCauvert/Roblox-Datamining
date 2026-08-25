local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local playersService = game:GetService("Players")
local reactModule = require(momentsCreation.Parent.React)
local useEffect = reactModule.useEffect
local constantsModule = require(momentsCreation.Constants)
local localPlayer = playersService.LocalPlayer
local segmentSelectorWidth = constantsModule.AudioWaveform.SegmentSelectorWidth
local waveformWidth = constantsModule.AudioWaveform.WaveformWidth
local waveformPadding = constantsModule.AudioWaveform.WaveformPadding

local function _(value)
	return `rbxassetid://{value}`
end

local function normalizeWaveform(p0)
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

return function(p1, p2)
	-- upvalues: reactModule (ref), useEffect (ref), segmentSelectorWidth (ref), waveformWidth (ref), waveformPadding (ref), localPlayer (ref), normalizeWaveform (ref)
	local var9, var10 = reactModule.useState({})
	useEffect(function()
		-- upvalues: var10 (ref), p2 (ref), segmentSelectorWidth (copy), waveformWidth (copy), waveformPadding (copy), p1 (ref), localPlayer (copy), normalizeWaveform (copy)
		var10({})
		
		if p2 <= 0 then
			return nil
		end
		local var11 = segmentSelectorWidth / (waveformWidth + waveformPadding) / p2
		local audioWaveform = Instance.new("Folder")
		audioWaveform.Name = "AudioWaveform"
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = `rbxassetid://{p1}`
		audioPlayer.Parent = audioWaveform
		audioWaveform.Parent = localPlayer:WaitForChild("PlayerGui")
		local var14 = false
		local var15 = audioPlayer:GetPropertyChangedSignal("IsReady"):Connect(function()
			-- upvalues: var14 (write), audioPlayer (ref), var11 (ref), var10 (copy), normalizeWaveform (copy)
			if var14 or not audioPlayer.IsReady then
				return
			end
			task.spawn(function()
				-- upvalues: audioPlayer (copy), var11 (copy), var14 (copy), var10 (copy), normalizeWaveform (copy)
				local ok, status = pcall(function()
					-- upvalues: audioPlayer (copy), var11 (copy)
					return audioPlayer:GetWaveformAsync(NumberRange.new(0, audioPlayer.TimeLength), var11 * audioPlayer.TimeLength)
				end)
				
				if not var14 and ok then
					var10(normalizeWaveform(status))
				end
			end)
		end)
		
		if audioPlayer.IsReady and audioPlayer.IsReady then
			task.spawn(function()
				-- upvalues: audioPlayer (ref), var11 (ref), var14 (write), var10 (copy), normalizeWaveform (copy)
				local ok, status = pcall(function()
					-- upvalues: audioPlayer (copy), var11 (copy)
					return audioPlayer:GetWaveformAsync(NumberRange.new(0, audioPlayer.TimeLength), var11 * audioPlayer.TimeLength)
				end)
				
				if not var14 and ok then
					var10(normalizeWaveform(status))
				end
			end)
		end
		return function()
			-- upvalues: var14 (write), var15 (ref), audioWaveform (ref)
			var14 = true
			var15:Disconnect()
			audioWaveform:Destroy()
		end
	end, { p1, p2 })
	
	return var9
end