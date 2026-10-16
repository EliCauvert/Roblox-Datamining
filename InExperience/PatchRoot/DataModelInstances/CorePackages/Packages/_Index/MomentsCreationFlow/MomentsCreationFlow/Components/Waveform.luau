local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UseAudioWaveformModule = require(MomentsCreationFlow.Hooks.useAudioWaveform)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(MomentsCreationFlow.Constants)
local WaveformWidth = ConstantsModule.AudioWaveform.WaveformWidth
local WaveformPadding = ConstantsModule.AudioWaveform.WaveformPadding
local WaveformMinHeight = ConstantsModule.AudioWaveform.WaveformMinHeight

return ReactModule.forwardRef(function(p1, Ref) --[[ Line: 29 | Named "Waveform" ]]
	-- upvalues: UseTokensFunction (copy), UseAudioWaveformModule (copy), ReactModule (copy), View (copy), WaveformPadding (copy), DashModule (copy), WaveformWidth (copy), WaveformMinHeight (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAudioWaveformModuleResult = UseAudioWaveformModule(p1.audioAssetId, p1.videoDuration)
	ReactModule.useEffect(function() --[[ Line: 33 ]]
		-- upvalues: UseAudioWaveformModuleResult (copy), p1 (copy)
		if UseAudioWaveformModuleResult and #UseAudioWaveformModuleResult > 0 then
			p1.onWaveformReady()
		end
	end, {
		p1.audioAssetId,
		p1.onWaveformReady,
		UseAudioWaveformModuleResult
	})
	
	return ReactModule.createElement(View, {
		tag = "align-x-left align-y-center anchor-center-left auto-x size-0-full row",
		Position = p1.position,
		ZIndex = p1.zIndex,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, WaveformPadding)
		},
		ref = Ref
	}, DashModule.map(UseAudioWaveformModuleResult, function(YScale, Key) --[[ Line: 51 ]]
		-- upvalues: ReactModule (upval), View (upval), WaveformWidth (upval), WaveformMinHeight (upval), UseTokensResult (copy)
		return ReactModule.createElement(View, {
			tag = "radius-circle",
			key = Key,
			LayoutOrder = Key,
			Size = UDim2.new(0, WaveformWidth, YScale, WaveformMinHeight),
			backgroundStyle = UseTokensResult.Color.Content.Muted
		})
	end))
end)