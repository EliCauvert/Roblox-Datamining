return function(Parent, TargetInstance, p1)
	local P2 = p1 or 0.2
	local MasterFader = Instance.new("AudioFader")
	MasterFader.Name = "MasterFader"
	MasterFader.Volume = P2
	MasterFader.Parent = Parent
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = MasterFader
	Wire.TargetInstance = TargetInstance
	Wire.Parent = MasterFader
	local Tbl = {}
	local MasterMuted = false
	local Flag = false
	
	local function _(p2)
		p2.fader.Volume = if p2.muted then 0 else p2.targetVolume
	end
	
	local _ = function(Key)
		-- upvalues: Tbl (copy)
		local Entry = Tbl[Key]
		
		if Entry then
			Tbl[Key] = nil
			Entry.fader:Destroy()
			
			return
		end
	end
	
	return {
		addStem = function(Key, SourceInstance, p2)
			-- upvalues: Flag (ref), Tbl (copy), Parent (copy), MasterFader (copy)
			assert(not Flag, "createAudioGraph: addStem after dispose")
			assert(not Tbl[Key], `createAudioGraph: stem "{Key}" already added`)
			local P7 = p2 or 1
			local AudioFader = Instance.new("AudioFader")
			AudioFader.Name = `Stem_{Key}`
			AudioFader.Volume = P7
			AudioFader.Parent = Parent
			local Wire = Instance.new("Wire")
			Wire.SourceInstance = SourceInstance
			Wire.TargetInstance = AudioFader
			Wire.Parent = AudioFader
			local Wire1 = Instance.new("Wire")
			Wire1.SourceInstance = AudioFader
			Wire1.TargetInstance = MasterFader
			Wire1.Parent = AudioFader
			Tbl[Key] = { muted = false, fader = AudioFader, targetVolume = P7 }
			
			return function()
				-- upvalues: Key (copy), Tbl (upval)
				local Entry = Tbl[Key]
				
				if Entry then
					Tbl[Key] = nil
					Entry.fader:Destroy()
					
					return
				end
			end
		end,
		setVolume = function(p2, TargetVolume)
			-- upvalues: Flag (ref), Tbl (copy)
			assert(not Flag, "createAudioGraph: setVolume after dispose")
			local Entry = Tbl[p2]
			assert(Entry, `createAudioGraph: no stem "{p8}"`)
			Entry.targetVolume = TargetVolume
			Entry.fader.Volume = if Entry.muted then 0 else Entry.targetVolume
		end,
		setMuted = function(p2, Muted)
			-- upvalues: Flag (ref), Tbl (copy)
			assert(not Flag, "createAudioGraph: setMuted after dispose")
			local Entry = Tbl[p2]
			assert(Entry, `createAudioGraph: no stem "{p10}"`)
			Entry.muted = Muted
			Entry.fader.Volume = if Entry.muted then 0 else Entry.targetVolume
		end,
		setMasterMuted = function(Value)
			-- upvalues: Flag (ref), MasterMuted (ref), MasterFader (copy), P2 (copy)
			assert(not Flag, "createAudioGraph: setMasterMuted after dispose")
			MasterMuted = Value
			MasterFader.Volume = if Value then 0 else P2
		end,
		getMasterMuted = function()
			-- upvalues: MasterMuted (ref)
			return MasterMuted
		end,
		getOutput = function()
			-- upvalues: TargetInstance (copy)
			return TargetInstance
		end,
		dispose = function()
			-- upvalues: Flag (ref), Tbl (copy), MasterFader (copy)
			if Flag then return end
			Flag = true
			
			for _, value in Tbl do
				value.fader:Destroy()
			end
			table.clear(Tbl)
			MasterFader:Destroy()
		end
	}
end