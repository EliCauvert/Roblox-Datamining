local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local ReactModule = require(MomentsCreation.Parent.React)
local UseEffectFunction = ReactModule.useEffect
local ConstantsModule = require(MomentsCreation.Constants)
local LocalPlayer = game:GetService("Players").LocalPlayer
local SegmentSelectorWidth = ConstantsModule.AudioWaveform.SegmentSelectorWidth
local WaveformWidth = ConstantsModule.AudioWaveform.WaveformWidth
local WaveformPadding = ConstantsModule.AudioWaveform.WaveformPadding

local function _(p1): string
	return `rbxassetid://{p1}`
end

local function normalizeWaveform(List)
	local Largest = 0
	local List1 = {}
	
	for _, value in List do
		local Largest1 = math.max(0, value)
		table.insert(List1, Largest1)
		Largest = math.max(Largest, Largest1)
	end
	if Largest == 0 then
		return List1
	end
	local List2 = {}
	
	for _, value1 in List1 do
		table.insert(List2, value1 / Largest)
	end
	return List2
end

return function(p1, p2)
	-- upvalues: ReactModule (copy), UseEffectFunction (copy), SegmentSelectorWidth (copy), WaveformWidth (copy), WaveformPadding (copy), LocalPlayer (copy), normalizeWaveform (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	UseEffectFunction(function()
		-- upvalues: UseStateResult2 (copy), p2 (copy), SegmentSelectorWidth (upval), WaveformWidth (upval), WaveformPadding (upval), p1 (copy), LocalPlayer (upval), normalizeWaveform (upval)
		UseStateResult2({})
		
		if p2 <= 0 then
			return nil
		end
		local SegmentSelectorWidthRatio = SegmentSelectorWidth / (WaveformWidth + WaveformPadding) / p2
		local AudioWaveform = Instance.new("Folder")
		AudioWaveform.Name = "AudioWaveform"
		local AudioPlayer = Instance.new("AudioPlayer")
		AudioPlayer.Asset = `rbxassetid://{p1}`
		AudioPlayer.Parent = AudioWaveform
		AudioWaveform.Parent = LocalPlayer:WaitForChild("PlayerGui")
		local Flag = false
		local Connection = AudioPlayer:GetPropertyChangedSignal("IsReady"):Connect(function()
			-- upvalues: Flag (ref), AudioPlayer (copy), SegmentSelectorWidthRatio (copy), UseStateResult2 (upval), normalizeWaveform (upval)
			if not Flag and AudioPlayer.IsReady then
				task.spawn(function()
					-- upvalues: AudioPlayer (upval), SegmentSelectorWidthRatio (upval), Flag (upval), UseStateResult2 (upval), normalizeWaveform (upval)
					local Success, Result = pcall(function()
						-- upvalues: AudioPlayer (upval), SegmentSelectorWidthRatio (upval)
						return AudioPlayer:GetWaveformAsync(NumberRange.new(0, AudioPlayer.TimeLength), SegmentSelectorWidthRatio * AudioPlayer.TimeLength)
					end)
					
					if not Flag and Success then
						UseStateResult2((normalizeWaveform(Result)))
					end
				end)
				
				return
			end
		end)
		
		if AudioPlayer.IsReady and not Flag and AudioPlayer.IsReady then
			task.spawn(function()
				-- upvalues: AudioPlayer (copy), SegmentSelectorWidthRatio (copy), Flag (ref), UseStateResult2 (upval), normalizeWaveform (upval)
				local Success, Result = pcall(function()
					-- upvalues: AudioPlayer (upval), SegmentSelectorWidthRatio (upval)
					return AudioPlayer:GetWaveformAsync(NumberRange.new(0, AudioPlayer.TimeLength), SegmentSelectorWidthRatio * AudioPlayer.TimeLength)
				end)
				
				if not Flag and Success then
					UseStateResult2((normalizeWaveform(Result)))
				end
			end)
		end
		return function()
			-- upvalues: Flag (ref), Connection (copy), AudioWaveform (copy)
			Flag = true
			Connection:Disconnect()
			AudioWaveform:Destroy()
		end
	end, { p1, p2 })
	
	return UseStateResult
end