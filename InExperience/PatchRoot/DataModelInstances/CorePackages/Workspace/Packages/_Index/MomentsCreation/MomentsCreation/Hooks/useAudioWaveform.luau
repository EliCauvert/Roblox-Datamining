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
	-- upvalues: reactModule (ref), useEffect (ref), segmentSelectorWidth (ref), waveformWidth (ref), waveformPadding (ref), localPlayer (ref), normalizeWaveform (ref)
	local var2, var3 = reactModule.useState({})
	useEffect(function()
		-- upvalues: var3 (ref), p3 (ref), segmentSelectorWidth (copy), waveformWidth (copy), waveformPadding (copy), p2 (ref), localPlayer (copy), normalizeWaveform (copy)
		var3({})
		
		if p3 <= 0 then
			return nil
		end
		local var4 = segmentSelectorWidth / (waveformWidth + waveformPadding) / p3
		local audioWaveform = Instance.new("Folder")
		audioWaveform.Name = "AudioWaveform"
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = `rbxassetid://{p2}`
		audioPlayer.Parent = audioWaveform
		audioWaveform.Parent = localPlayer:WaitForChild("PlayerGui")
		local var5 = false
		local var6 = audioPlayer:GetPropertyChangedSignal("IsReady"):Connect(function()
			-- upvalues: var5 (write), audioPlayer (ref), var4 (ref), var3 (copy), normalizeWaveform (copy)
			if var5 or not audioPlayer.IsReady then
				return
			end
			task.spawn(function()
				-- upvalues: audioPlayer (copy), var4 (copy), var5 (copy), var3 (copy), normalizeWaveform (copy)
				local ok, status = pcall(function()
					-- upvalues: audioPlayer (copy), var4 (copy)
					return audioPlayer:GetWaveformAsync(NumberRange.new(0, audioPlayer.TimeLength), var4 * audioPlayer.TimeLength)
				end)
				
				if not var5 and ok then
					var3(normalizeWaveform(status))
				end
			end)
		end)
		
		if audioPlayer.IsReady and audioPlayer.IsReady then
			task.spawn(function()
				-- upvalues: audioPlayer (ref), var4 (ref), var5 (write), var3 (copy), normalizeWaveform (copy)
				local ok, status = pcall(function()
					-- upvalues: audioPlayer (copy), var4 (copy)
					return audioPlayer:GetWaveformAsync(NumberRange.new(0, audioPlayer.TimeLength), var4 * audioPlayer.TimeLength)
				end)
				
				if not var5 and ok then
					var3(normalizeWaveform(status))
				end
			end)
		end
		return function()
			-- upvalues: var5 (write), var6 (ref), audioWaveform (ref)
			var5 = true
			var6:Disconnect()
			audioWaveform:Destroy()
		end
	end, { p2, p3 })
	
	return var2
end