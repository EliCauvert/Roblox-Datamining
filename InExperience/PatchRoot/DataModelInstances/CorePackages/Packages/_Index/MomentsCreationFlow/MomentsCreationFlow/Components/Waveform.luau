local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useAudioWaveformModule = require(momentsCreationFlow.Hooks.useAudioWaveform)
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(momentsCreationFlow.Constants)
local waveformWidth = constantsModule.AudioWaveform.WaveformWidth
local waveformPadding = constantsModule.AudioWaveform.WaveformPadding
local waveformMinHeight = constantsModule.AudioWaveform.WaveformMinHeight

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokens (ref), useAudioWaveformModule (ref), reactModule (ref), view (ref), waveformPadding (ref), dashModule (ref), waveformWidth (ref), waveformMinHeight (ref)
	local var6 = useTokens()
	local var7 = useAudioWaveformModule(p0.audioAssetId, p0.videoDuration)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), p0 (ref)
		if var7 and #var7 > 0 then
			p0.onWaveformReady()
		end
	end, { p0.audioAssetId, p0.onWaveformReady, var7 })
	
	return reactModule.createElement(view, {
		tag = "align-x-left align-y-center anchor-center-left auto-x size-0-full row",
		Position = p0.position,
		ZIndex = p0.zIndex,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, waveformPadding)
		},
		ref = p1
	}, dashModule.map(var7, function(p2, p3)
		-- upvalues: reactModule (copy), view (copy), waveformWidth (copy), waveformMinHeight (copy), var6 (ref)
		return reactModule.createElement(view, {
			tag = "radius-circle",
			key = p3,
			LayoutOrder = p3,
			Size = UDim2.new(0, waveformWidth, p2, waveformMinHeight),
			backgroundStyle = var6.Color.Content.Muted
		})
	end))
end)