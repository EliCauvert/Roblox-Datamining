return function(p1, p2, p3)
	p3 = p3 or 0.2
	local masterFader = Instance.new("AudioFader")
	masterFader.Name = "MasterFader"
	masterFader.Volume = p3
	masterFader.Parent = p1
	local wire = Instance.new("Wire")
	wire.SourceInstance = masterFader
	wire.TargetInstance = p2
	wire.Parent = masterFader
	local t = {}
	local var1 = false
	local var2 = false
	
	local function _(p4)
		p4.fader.Volume = if p4.muted then 0 else p4.targetVolume
	end
	
	local _ = function(p4)
		-- upvalues: t (ref)
		local var3 = t[p4]
		
		if var3 then
			t[p4] = nil
			var3.fader:Destroy()
			
			return
		end
	end
	
	return {
		addStem = function(p4, p5, p6)
			-- upvalues: var2 (write), t (ref), p1 (ref), masterFader (ref)
			assert(not var2, "createAudioGraph: addStem after dispose")
			assert(not t[p4], `createAudioGraph: stem "{p5}" already added`)
			p6 = p6 or 1
			local audioFader = Instance.new("AudioFader")
			audioFader.Name = `Stem_{p4}`
			audioFader.Volume = p6
			audioFader.Parent = p1
			local wire = Instance.new("Wire")
			wire.SourceInstance = p5
			wire.TargetInstance = audioFader
			wire.Parent = audioFader
			local wire_1 = Instance.new("Wire")
			wire_1.SourceInstance = audioFader
			wire_1.TargetInstance = masterFader
			wire_1.Parent = audioFader
			t[p4] = { muted = false, fader = audioFader, targetVolume = p6 }
			
			return function()
				-- upvalues: p4 (ref), t (copy)
				local var3 = t[p4]
				
				if var3 then
					t[p4] = nil
					var3.fader:Destroy()
					
					return
				end
			end
		end,
		setVolume = function(value, p4)
			-- upvalues: var2 (write), t (ref)
			assert(not var2, "createAudioGraph: setVolume after dispose")
			local var3 = t[value]
			assert(var3, `createAudioGraph: no stem "{value}"`)
			var3.targetVolume = p4
			var3.fader.Volume = if var3.muted then 0 else var3.targetVolume
		end,
		setMuted = function(value, p4)
			-- upvalues: var2 (write), t (ref)
			assert(not var2, "createAudioGraph: setMuted after dispose")
			local var3 = t[value]
			assert(var3, `createAudioGraph: no stem "{value}"`)
			var3.muted = p4
			var3.fader.Volume = if var3.muted then 0 else var3.targetVolume
		end,
		setMasterMuted = function(value)
			-- upvalues: var2 (write), var1 (write), masterFader (ref), p3 (ref)
			assert(not var2, "createAudioGraph: setMasterMuted after dispose")
			var1 = value
			masterFader.Volume = if value then 0 else p3
		end,
		getMasterMuted = function()
			-- upvalues: var1 (write)
			return var1
		end,
		getOutput = function()
			-- upvalues: p2 (ref)
			return p2
		end,
		dispose = function()
			-- upvalues: var2 (write), t (ref), masterFader (ref)
			if var2 then return end
			var2 = true
			
			for i, v in t do
				v.fader:Destroy()
			end
			table.clear(t)
			masterFader:Destroy()
		end
	}
end