return function(p0, p1, p2) --[[ line: 43 | named "createAudioGraph" ]]
	p2 = p2 or 0.2
	local masterFader = Instance.new("AudioFader")
	masterFader.Name = "MasterFader"
	masterFader.Volume = p2
	masterFader.Parent = p0
	local wire = Instance.new("Wire")
	wire.SourceInstance = masterFader
	wire.TargetInstance = p1
	wire.Parent = masterFader
	local t = {}
	local var4 = false
	local var5 = false
	
	local function _(p3) --[[ line: 62 | named "applyStem" ]]
		p3.fader.Volume = if p3.muted then 0 else p3.targetVolume
	end
	
	local _ = function(p4) --[[ line: 66 | named "removeStem" ]]
		-- upvalues: t (ref)
		local var6 = t[p4]
		
		if var6 then
			t[p4] = nil
			var6.fader:Destroy()
			
			return
		end
	end
	
	return {
		addStem = function(p5, p6, p7) --[[ line: 77 ]]
			-- upvalues: var5 (write), t (ref), p0 (ref), masterFader (ref)
			assert(not var5, "createAudioGraph: addStem after dispose")
			assert(not t[p5], `createAudioGraph: stem "{p5}" already added`)
			p7 = p7 or 1
			local audioFader = Instance.new("AudioFader")
			audioFader.Name = `Stem_{p5}`
			audioFader.Volume = p7
			audioFader.Parent = p0
			local wire = Instance.new("Wire")
			wire.SourceInstance = p6
			wire.TargetInstance = audioFader
			wire.Parent = audioFader
			local wire_1 = Instance.new("Wire")
			wire_1.SourceInstance = audioFader
			wire_1.TargetInstance = masterFader
			wire_1.Parent = audioFader
			t[p5] = { muted = false, fader = audioFader, targetVolume = p7 }
			
			return function() --[[ line: 104 ]]
				-- upvalues: p5 (ref), t (copy)
				local var11 = t[p5]
				
				if var11 then
					t[p5] = nil
					var11.fader:Destroy()
					
					return
				end
			end
		end,
		setVolume = function(value, p8) --[[ line: 109 ]]
			-- upvalues: var5 (write), t (ref)
			assert(not var5, "createAudioGraph: setVolume after dispose")
			local var12 = t[value]
			assert(var12, `createAudioGraph: no stem "{value}"`)
			var12.targetVolume = p8
			var12.fader.Volume = if var12.muted then 0 else var12.targetVolume
		end,
		setMuted = function(value, p9) --[[ line: 117 ]]
			-- upvalues: var5 (write), t (ref)
			assert(not var5, "createAudioGraph: setMuted after dispose")
			local var13 = t[value]
			assert(var13, `createAudioGraph: no stem "{value}"`)
			var13.muted = p9
			var13.fader.Volume = if var13.muted then 0 else var13.targetVolume
		end,
		setMasterMuted = function(value) --[[ line: 125 ]]
			-- upvalues: var5 (write), var4 (write), masterFader (ref), p2 (ref)
			assert(not var5, "createAudioGraph: setMasterMuted after dispose")
			var4 = value
			masterFader.Volume = if value then 0 else p2
		end,
		getMasterMuted = function() --[[ line: 131 ]]
			-- upvalues: var4 (write)
			return var4
		end,
		getOutput = function() --[[ line: 135 ]]
			-- upvalues: p1 (ref)
			return p1
		end,
		dispose = function() --[[ line: 139 ]]
			-- upvalues: var5 (write), t (ref), masterFader (ref)
			if var5 then return end
			var5 = true
			
			for i, v in t do
				v.fader:Destroy()
			end
			table.clear(t)
			masterFader:Destroy()
		end
	}
end