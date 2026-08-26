local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local waveformModule = require(script.Parent.Parent.Waveform)
local _ = require(script.Parent.useTranscribedSamples)
local var1 = reactModule.createBinding({})

local function _(p1, p2)
	for i, v in p1 do
		if v.startIdx <= p2 and p2 <= v.endIdx then
			return true
		end
	end
	return false
end

local _ = function(p3, p4)
	return if p4 <= p3 then 0 else 1 - p3 / p4
end

local _ = function(p3, p4)
	return p3 + p4 * (1 - p3)
end

return reactModule.memo(function(p3)
	-- upvalues: useTokens (ref), var1 (ref), reactModule (ref), waveformModule (ref)
	local var2 = useTokens()
	local color3 = var2.Color.Content.Emphasis.Color3
	local color3_1 = var2.Color.Content.Muted.Color3
	local color3_2 = var2.Color.System.Success.Color3
	local transcribedSamplesBinding = p3.transcribedSamplesBinding or var1
	local transparencyValue = p3.transparencyValue
	local fadeInTicks = p3.fadeInTicks or 10
	
	return reactModule.createElement(waveformModule, {
		isActive = p3.isActive,
		audioDeviceInput = p3.audioDeviceInput,
		onSample = p3.onSample,
		bindBarStyle = reactModule.useCallback(function(p4)
			-- upvalues: transcribedSamplesBinding (ref), transparencyValue (ref), reactModule (copy), color3_1 (ref), color3_2 (ref), fadeInTicks (ref), color3 (ref)
			local t = { sample = p4, transcribed = transcribedSamplesBinding }
			
			if transparencyValue ~= nil then
				t.fade = transparencyValue
			end
			return reactModule.joinBindings(t):map(function(p5)
				-- upvalues: color3_1 (copy), color3_2 (copy), fadeInTicks (copy), color3 (copy)
				local var3, var4
				local sample = p5.sample
				local transcribed = p5.transcribed
				local _ = nil
				local _ = nil
				
				if sample.age == nil then
					var3 = color3_1
					var4 = 0.85
				else
					local age
					local itemIdx = sample.itemIdx
					
					for i, v in transcribed do
						if v.startIdx <= itemIdx and itemIdx <= v.endIdx then
							age = true
							if age then
								var3 = color3_2
								age = sample.age
								itemIdx = fadeInTicks
								var4 = if itemIdx <= age then 0 else 1 - age / itemIdx
							else
								var3 = color3
								age = sample.age
								itemIdx = fadeInTicks
								var4 = if itemIdx <= age then 0 else 1 - age / itemIdx
							end
						end
					end
					age = false
				end
				if p5.fade ~= nil then
					local var5 = var4
					var4 = var5 + p5.fade * (1 - var5)
				end
				return { color = var3, transparency = var4 }
			end)
		end, {
			color3, color3_1, color3_2, transcribedSamplesBinding, transparencyValue,
			fadeInTicks
		})
	})
end)