local Parent = script:FindFirstAncestor("ExpChat").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local WaveformModule = require(script.Parent.Parent.Waveform)
local _ = require(script.Parent.useTranscribedSamples)
local Binding = ReactModule.createBinding({})

local function _(List, p1): boolean --[[ Line: 34 | Named "isItemTranscribed" ]]
	for _, value in List do
		if value.startIdx <= p1 and p1 <= value.endIdx then
			return true
		end
	end
	return false
end

local _ = function(p2, p3): number --[[ Line: 43 | Named "fadeInTransparency" ]]
	return if p3 <= p2 then 0 else 1 - p2 / p3
end

local _ = function(p2: number, p3): number --[[ Line: 50 | Named "compositeWithFade" ]]
	return p2 + p3 * (1 - p2)
end

return ReactModule.memo(function(p2) --[[ Line: 63 | Named "DictationWaveform" ]]
	-- upvalues: UseTokensFunction (copy), Binding (copy), ReactModule (copy), WaveformModule (copy)
	local UseTokensResult = UseTokensFunction()
	local EmphasisColor3 = UseTokensResult.Color.Content.Emphasis.Color3
	local MutedColor3 = UseTokensResult.Color.Content.Muted.Color3
	local SuccessColor3 = UseTokensResult.Color.System.Success.Color3
	local TranscribedSamplesBinding = p2.transcribedSamplesBinding or Binding
	local TransparencyValue = p2.transparencyValue
	local FadeInTicks = p2.fadeInTicks or 10
	
	return ReactModule.createElement(WaveformModule, {
		isActive = p2.isActive,
		audioDeviceInput = p2.audioDeviceInput,
		onSample = p2.onSample,
		bindBarStyle = ReactModule.useCallback(function(Sample) --[[ Line: 74 ]]
			-- upvalues: TranscribedSamplesBinding (copy), TransparencyValue (copy), ReactModule (upval), MutedColor3 (copy), SuccessColor3 (copy), FadeInTicks (copy), EmphasisColor3 (copy)
			local config = { sample = Sample, transcribed = TranscribedSamplesBinding }
			
			if TransparencyValue ~= nil then
				config.fade = TransparencyValue
			end
			return ReactModule.joinBindings(config):map(function(p3) --[[ Line: 82 ]]
				-- upvalues: MutedColor3 (upval), SuccessColor3 (upval), FadeInTicks (upval), EmphasisColor3 (upval)
				local Sample = p3.sample
				local Transcribed = p3.transcribed
				local Color = nil
				local NewFade = nil
				
				if Sample.age == nil then
					Color = MutedColor3
					NewFade = 0.85
				else
					local ItemIdx = Sample.itemIdx
					local Flag = false
					
					for _, value in Transcribed do
						if value.startIdx <= ItemIdx and ItemIdx <= value.endIdx then
							Flag = true
							break
						end
					end
					if Flag then
						Color = SuccessColor3
						local Age = Sample.age
						NewFade = if Age >= FadeInTicks then 0 else 1 - Age / FadeInTicks
					else
						Color = EmphasisColor3
						local Age = Sample.age
						NewFade = if Age >= FadeInTicks then 0 else 1 - Age / FadeInTicks
					end
				end
				if p3.fade ~= nil then
					NewFade += p3.fade * (1 - NewFade)
				end
				return { color = Color, transparency = NewFade }
			end)
		end, {
			EmphasisColor3, MutedColor3, SuccessColor3, TranscribedSamplesBinding,
			TransparencyValue, FadeInTicks
		})
	})
end)