local AudioDuckingFastIntsModule = require(script:FindFirstAncestor("MomentsCommon").Media.audioDuckingFastInts)

return function(Parent, TargetInstance, p1) --[[ Line: 54 | Named "createAudioGraph" ]]
	-- upvalues: AudioDuckingFastIntsModule (copy)
	local P2 = p1 or {}
	local MasterVolume = if P2.masterVolume == nil then 0.2 else P2.masterVolume
	local IsEnableDucking = P2.enableDucking == true
	local MasterFader = Instance.new("AudioFader")
	MasterFader.Name = "MasterFader"
	MasterFader.Volume = MasterVolume
	MasterFader.Parent = Parent
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = MasterFader
	Wire.TargetInstance = TargetInstance
	Wire.Parent = MasterFader
	local AudioCompressor = nil
	
	if IsEnableDucking then
		local CompressorParams = AudioDuckingFastIntsModule.getCompressorParams()
		local DuckCompressor = Instance.new("AudioCompressor")
		DuckCompressor.Name = "DuckCompressor"
		DuckCompressor.Threshold = CompressorParams.threshold
		DuckCompressor.Ratio = CompressorParams.ratio
		DuckCompressor.Attack = CompressorParams.attack
		DuckCompressor.Release = CompressorParams.release
		DuckCompressor.MakeupGain = CompressorParams.makeupGain
		DuckCompressor.Parent = Parent
		AudioCompressor = DuckCompressor
		local Wire1 = Instance.new("Wire")
		Wire1.SourceInstance = DuckCompressor
		Wire1.TargetInstance = MasterFader
		Wire1.Parent = DuckCompressor
	end
	local Tbl = {}
	local MasterMuted = false
	local Flag = false
	
	local function _(p2) --[[ Line: 99 | Named "applyStem" ]]
		p2.fader.Volume = if p2.muted then 0 else p2.targetVolume
	end
	
	local _ = function(Key) --[[ Line: 103 | Named "removeStem" ]]
		-- upvalues: Tbl (copy)
		local Entry = Tbl[Key]
		
		if Entry then
			Tbl[Key] = nil
			Entry.fader:Destroy()
			
			return
		end
	end
	
	return {
		addStem = function(Key, SourceInstance, p2, p3) --[[ Line: 114 ]]
			-- upvalues: Flag (ref), Tbl (copy), Parent (copy), IsEnableDucking (copy), MasterFader (copy), AudioCompressor (ref)
			assert(not Flag, "createAudioGraph: addStem after dispose")
			assert(not Tbl[Key], `createAudioGraph: stem "{Key}" already added`)
			local P8 = p3 or "input"
			local P7 = p2 or 1
			local AudioFader = Instance.new("AudioFader")
			AudioFader.Name = `Stem_{Key}`
			AudioFader.Volume = P7
			AudioFader.Parent = Parent
			local Wire = Instance.new("Wire")
			Wire.SourceInstance = SourceInstance
			Wire.TargetInstance = AudioFader
			Wire.Parent = AudioFader
			
			if IsEnableDucking and P8 == "sidechain" then
				local Wire1 = Instance.new("Wire")
				Wire1.SourceInstance = AudioFader
				Wire1.TargetInstance = MasterFader
				Wire1.Parent = AudioFader
				local Wire2 = Instance.new("Wire")
				Wire2.SourceInstance = SourceInstance
				Wire2.TargetInstance = AudioCompressor
				Wire2.TargetName = "Sidechain"
				Wire2.Parent = AudioFader
			elseif IsEnableDucking then
				local Wire3 = Instance.new("Wire")
				Wire3.SourceInstance = AudioFader
				Wire3.TargetInstance = AudioCompressor
				Wire3.Parent = AudioFader
			else
				local Wire4 = Instance.new("Wire")
				Wire4.SourceInstance = AudioFader
				Wire4.TargetInstance = MasterFader
				Wire4.Parent = AudioFader
			end
			Tbl[Key] = { muted = false, fader = AudioFader, targetVolume = P7 }
			
			return function() --[[ Line: 167 ]]
				-- upvalues: Key (copy), Tbl (upval)
				local Entry = Tbl[Key]
				
				if Entry then
					Tbl[Key] = nil
					Entry.fader:Destroy()
					
					return
				end
			end
		end,
		setVolume = function(p2, TargetVolume) --[[ Line: 172 ]]
			-- upvalues: Flag (ref), Tbl (copy)
			assert(not Flag, "createAudioGraph: setVolume after dispose")
			local Entry = Tbl[p2]
			assert(Entry, `createAudioGraph: no stem "{p9}"`)
			Entry.targetVolume = TargetVolume
			Entry.fader.Volume = if Entry.muted then 0 else Entry.targetVolume
		end,
		setMuted = function(p2, Muted) --[[ Line: 180 ]]
			-- upvalues: Flag (ref), Tbl (copy)
			assert(not Flag, "createAudioGraph: setMuted after dispose")
			local Entry = Tbl[p2]
			assert(Entry, `createAudioGraph: no stem "{p11}"`)
			Entry.muted = Muted
			Entry.fader.Volume = if Entry.muted then 0 else Entry.targetVolume
		end,
		setMasterMuted = function(Value) --[[ Line: 188 ]]
			-- upvalues: Flag (ref), MasterMuted (ref), MasterFader (copy), MasterVolume (copy)
			assert(not Flag, "createAudioGraph: setMasterMuted after dispose")
			MasterMuted = Value
			MasterFader.Volume = if Value then 0 else MasterVolume
		end,
		getMasterMuted = function() --[[ Line: 194 ]]
			-- upvalues: MasterMuted (ref)
			return MasterMuted
		end,
		getOutput = function() --[[ Line: 198 ]]
			-- upvalues: TargetInstance (copy)
			return TargetInstance
		end,
		dispose = function() --[[ Line: 202 ]]
			-- upvalues: Flag (ref), Tbl (copy), AudioCompressor (ref), MasterFader (copy)
			if Flag then return end
			Flag = true
			
			for _, value in Tbl do
				value.fader:Destroy()
			end
			table.clear(Tbl)
			
			if AudioCompressor ~= nil then
				AudioCompressor:Destroy()
			end
			MasterFader:Destroy()
		end
	}
end