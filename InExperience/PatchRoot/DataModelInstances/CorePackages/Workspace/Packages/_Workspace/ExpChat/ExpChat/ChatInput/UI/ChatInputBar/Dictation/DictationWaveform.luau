local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local waveformModule = require(script.Parent.Parent.Waveform)
local _ = require(script.Parent.useTranscribedSamples)
local var2 = reactModule.createBinding({})

local function _(p0, p1) --[[ line: 34 | named "isItemTranscribed" ]]
	for i, v in p0 do
		if v.startIdx <= p1 and p1 <= v.endIdx then
			return true
		end
	end
	return false
end

local _ = function(p2, p3) --[[ line: 43 | named "fadeInTransparency" ]]
	return if p3 <= p2 then 0 else 1 - p2 / p3
end

local _ = function(p4, p5) --[[ line: 50 | named "compositeWithFade" ]]
	return p4 + p5 * (1 - p4)
end

return reactModule.memo(function(p6) --[[ line: 63 | named "DictationWaveform" ]]
	-- upvalues: useTokens (ref), var2 (ref), reactModule (ref), waveformModule (ref)
	local var3 = useTokens()
	local color3 = var3.Color.Content.Emphasis.Color3
	local color3_1 = var3.Color.Content.Muted.Color3
	local color3_2 = var3.Color.System.Success.Color3
	local transcribedSamplesBinding = p6.transcribedSamplesBinding or var2
	local transparencyValue = p6.transparencyValue
	local fadeInTicks = p6.fadeInTicks or 10
	
	return reactModule.createElement(waveformModule, {
		isActive = p6.isActive,
		audioDeviceInput = p6.audioDeviceInput,
		onSample = p6.onSample,
		bindBarStyle = reactModule.useCallback(function(p7) --[[ line: 74 ]]
			-- upvalues: transcribedSamplesBinding (ref), transparencyValue (ref), reactModule (copy), color3_1 (ref), color3_2 (ref), fadeInTicks (ref), color3 (ref)
			local t = { sample = p7, transcribed = transcribedSamplesBinding }
			
			if transparencyValue ~= nil then
				t.fade = transparencyValue
			end
			return reactModule.joinBindings(t):map(function(p8) --[[ line: 82 ]]
				-- upvalues: color3_1 (copy), color3_2 (copy), fadeInTicks (copy), color3 (copy)
				local var7, var8
				local sample = p8.sample
				local transcribed = p8.transcribed
				local _ = nil
				local _ = nil
				
				if sample.age == nil then
					var7 = color3_1
					var8 = 0.85
				else
					local age
					local itemIdx = sample.itemIdx
					
					for i, v in transcribed do
						if v.startIdx <= itemIdx and itemIdx <= v.endIdx then
							age = true
							if age then
								var7 = color3_2
								age = sample.age
								itemIdx = fadeInTicks
								var8 = if itemIdx <= age then 0 else 1 - age / itemIdx
							else
								var7 = color3
								age = sample.age
								itemIdx = fadeInTicks
								var8 = if itemIdx <= age then 0 else 1 - age / itemIdx
							end
						end
					end
					age = false
				end
				if p8.fade ~= nil then
					local var9 = var8
					var8 = var9 + p8.fade * (1 - var9)
				end
				return { color = var7, transparency = var8 }
			end)
		end, {
			color3, color3_1, color3_2, transcribedSamplesBinding, transparencyValue,
			fadeInTicks
		})
	})
end)