local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useAudioWaveformModule = require(momentsCreation.Hooks.useAudioWaveform)
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(momentsCreation.Constants)
local waveformWidth = constantsModule.AudioWaveform.WaveformWidth
local waveformPadding = constantsModule.AudioWaveform.WaveformPadding
local waveformMinHeight = constantsModule.AudioWaveform.WaveformMinHeight

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), useAudioWaveformModule (ref), reactModule (ref), view (ref), waveformPadding (ref), dashModule (ref), waveformWidth (ref), waveformMinHeight (ref)
	local var1 = useTokens()
	local var2 = useAudioWaveformModule(p1.audioAssetId, p1.videoDuration)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		if var2 and #var2 > 0 then
			p1.onWaveformReady()
		end
	end, { p1.audioAssetId, p1.onWaveformReady, var2 })
	
	return reactModule.createElement(view, {
		tag = "align-x-left align-y-center anchor-center-left auto-x size-0-full row",
		Position = p1.position,
		ZIndex = p1.zIndex,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, waveformPadding)
		},
		ref = p2
	}, dashModule.map(var2, function(p3, p4)
		-- upvalues: reactModule (copy), view (copy), waveformWidth (copy), waveformMinHeight (copy), var1 (ref)
		return reactModule.createElement(view, {
			tag = "radius-circle",
			key = p4,
			LayoutOrder = p4,
			Size = UDim2.new(0, waveformWidth, p3, waveformMinHeight),
			backgroundStyle = var1.Color.Content.Muted
		})
	end))
end)