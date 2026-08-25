local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var1 (ref)
		if p0 then
			local waveformAnalyzer = Instance.new("AudioAnalyzer")
			waveformAnalyzer.SpectrumEnabled = false
			waveformAnalyzer.Name = "WaveformAnalyzer"
			waveformAnalyzer.Parent = p0.Parent
			var1.current = waveformAnalyzer
			local wire = Instance.new("Wire")
			wire.SourceInstance = p0
			wire.TargetInstance = waveformAnalyzer
			wire.Parent = p0.Parent
			
			return function()
				-- upvalues: wire (ref), waveformAnalyzer (ref), var1 (copy)
				wire:Destroy()
				waveformAnalyzer:Destroy()
				var1.current = nil
			end
		end
	end, { p0 })
	
	return var1
end