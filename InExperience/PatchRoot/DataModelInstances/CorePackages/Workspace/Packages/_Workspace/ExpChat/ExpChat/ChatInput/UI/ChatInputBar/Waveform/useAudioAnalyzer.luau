local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function(SourceInstance) --[[ Line: 10 | Named "useAudioAnalyzer" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 13 ]]
		-- upvalues: SourceInstance (copy), UseRefResult (copy)
		if not SourceInstance then return end
		local WaveformAnalyzer = Instance.new("AudioAnalyzer")
		WaveformAnalyzer.SpectrumEnabled = false
		WaveformAnalyzer.Name = "WaveformAnalyzer"
		WaveformAnalyzer.Parent = SourceInstance.Parent
		UseRefResult.current = WaveformAnalyzer
		local Wire = Instance.new("Wire")
		Wire.SourceInstance = SourceInstance
		Wire.TargetInstance = WaveformAnalyzer
		Wire.Parent = SourceInstance.Parent
		
		return function() --[[ Line: 29 ]]
			-- upvalues: Wire (copy), WaveformAnalyzer (copy), UseRefResult (upval)
			Wire:Destroy()
			WaveformAnalyzer:Destroy()
			UseRefResult.current = nil
		end
	end, { SourceInstance })
	
	return UseRefResult
end