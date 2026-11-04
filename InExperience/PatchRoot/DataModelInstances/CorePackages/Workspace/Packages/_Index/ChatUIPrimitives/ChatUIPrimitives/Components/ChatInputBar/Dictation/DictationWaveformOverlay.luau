local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local FoundationModule = require(Parent.Foundation)
local ComponentsModule = require(Parent.DictationCore.Components)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), ComponentsModule (copy), ReactIsModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "position-center-left anchor-center-left",
		ZIndex = 3,
		Size = UDim2.new(1, 0, 0, p1.lineHeight),
		Visible = p1.isAudioActiveBinding
	}, {
		Waveform = ReactModule.createElement(ComponentsModule.Waveform, {
			isActive = p1.isAudioActive,
			audioDeviceInput = p1.audioDeviceInput,
			onSample = p1.onWaveformSample,
			transcribedSamplesBinding = p1.transcribedSamplesBinding,
			transparencyValue = if ReactIsModule.isBinding(p1.transparencyValue) then p1.transparencyValue else nil
		})
	})
end)