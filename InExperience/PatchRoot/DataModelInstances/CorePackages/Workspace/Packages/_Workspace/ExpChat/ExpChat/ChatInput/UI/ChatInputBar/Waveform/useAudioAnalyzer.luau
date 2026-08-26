local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1 then
			local waveformAnalyzer = Instance.new("AudioAnalyzer")
			waveformAnalyzer.SpectrumEnabled = false
			waveformAnalyzer.Name = "WaveformAnalyzer"
			waveformAnalyzer.Parent = p1.Parent
			var1.current = waveformAnalyzer
			local wire = Instance.new("Wire")
			wire.SourceInstance = p1
			wire.TargetInstance = waveformAnalyzer
			wire.Parent = p1.Parent
			
			return function()
				-- upvalues: wire (ref), waveformAnalyzer (ref), var1 (copy)
				wire:Destroy()
				waveformAnalyzer:Destroy()
				var1.current = nil
			end
		end
	end, { p1 })
	
	return var1
end