local audioDuckingFastIntsModule = require(script:FindFirstAncestor("MomentsCommon").Media.audioDuckingFastInts)

return function(p1, p2, p3)
	-- upvalues: audioDuckingFastIntsModule (ref)
	p3 = p3 or {}
	local var1 = if p3.masterVolume ~= nil then 0.2 else p3.masterVolume
	local var2 = p3.enableDucking == true
	local masterFader = Instance.new("AudioFader")
	masterFader.Name = "MasterFader"
	masterFader.Volume = var1
	masterFader.Parent = p1
	local wire = Instance.new("Wire")
	wire.SourceInstance = masterFader
	wire.TargetInstance = p2
	wire.Parent = masterFader
	local var3 = nil
	
	if var2 then
		local compressorParams = audioDuckingFastIntsModule.getCompressorParams()
		local duckCompressor = Instance.new("AudioCompressor")
		duckCompressor.Name = "DuckCompressor"
		duckCompressor.Threshold = compressorParams.threshold
		duckCompressor.Ratio = compressorParams.ratio
		duckCompressor.Attack = compressorParams.attack
		duckCompressor.Release = compressorParams.release
		duckCompressor.MakeupGain = compressorParams.makeupGain
		duckCompressor.Parent = p1
		var3 = duckCompressor
		local wire_1 = Instance.new("Wire")
		wire_1.SourceInstance = duckCompressor
		wire_1.TargetInstance = masterFader
		wire_1.Parent = duckCompressor
	end
	local t = {}
	local var4 = false
	local var5 = false
	
	local function _(p4)
		p4.fader.Volume = if p4.muted then 0 else p4.targetVolume
	end
	
	local _ = function(p4)
		-- upvalues: t (ref)
		local var6 = t[p4]
		
		if var6 then
			t[p4] = nil
			var6.fader:Destroy()
			
			return
		end
	end
	
	return {
		addStem = function(p4, p5, p6, p7)
			-- upvalues: var5 (write), t (ref), p1 (ref), var2 (ref), masterFader (ref), var3 (write)
			assert(not var5, "createAudioGraph: addStem after dispose")
			assert(not t[p4], `createAudioGraph: stem "{p5}" already added`)
			p7 = p7 or "input"
			p6 = p6 or 1
			local audioFader = Instance.new("AudioFader")
			audioFader.Name = `Stem_{p4}`
			audioFader.Volume = p6
			audioFader.Parent = p1
			local wire = Instance.new("Wire")
			wire.SourceInstance = p5
			wire.TargetInstance = audioFader
			wire.Parent = audioFader
			
			if var2 and p7 == "sidechain" then
				local wire_1 = Instance.new("Wire")
				wire_1.SourceInstance = audioFader
				wire_1.TargetInstance = masterFader
				wire_1.Parent = audioFader
				local wire_2 = Instance.new("Wire")
				wire_2.SourceInstance = p5
				wire_2.TargetInstance = var3
				wire_2.TargetName = "Sidechain"
				wire_2.Parent = audioFader
			elseif var2 then
				local wire_1 = Instance.new("Wire")
				wire_1.SourceInstance = audioFader
				wire_1.TargetInstance = var3
				wire_1.Parent = audioFader
			else
				local wire_1 = Instance.new("Wire")
				wire_1.SourceInstance = audioFader
				wire_1.TargetInstance = masterFader
				wire_1.Parent = audioFader
			end
			t[p4] = { muted = false, fader = audioFader, targetVolume = p6 }
			
			return function()
				-- upvalues: p4 (ref), t (copy)
				local var6 = t[p4]
				
				if var6 then
					t[p4] = nil
					var6.fader:Destroy()
					
					return
				end
			end
		end,
		setVolume = function(value, p4)
			-- upvalues: var5 (write), t (ref)
			assert(not var5, "createAudioGraph: setVolume after dispose")
			local var6 = t[value]
			assert(var6, `createAudioGraph: no stem "{value}"`)
			var6.targetVolume = p4
			var6.fader.Volume = if var6.muted then 0 else var6.targetVolume
		end,
		setMuted = function(value, p4)
			-- upvalues: var5 (write), t (ref)
			assert(not var5, "createAudioGraph: setMuted after dispose")
			local var6 = t[value]
			assert(var6, `createAudioGraph: no stem "{value}"`)
			var6.muted = p4
			var6.fader.Volume = if var6.muted then 0 else var6.targetVolume
		end,
		setMasterMuted = function(value)
			-- upvalues: var5 (write), var4 (write), masterFader (ref), var1 (ref)
			assert(not var5, "createAudioGraph: setMasterMuted after dispose")
			var4 = value
			masterFader.Volume = if value then 0 else var1
		end,
		getMasterMuted = function()
			-- upvalues: var4 (write)
			return var4
		end,
		getOutput = function()
			-- upvalues: p2 (ref)
			return p2
		end,
		dispose = function()
			-- upvalues: var5 (write), t (ref), var3 (write), masterFader (ref)
			if var5 then return end
			var5 = true
			
			for i, v in t do
				v.fader:Destroy()
			end
			table.clear(t)
			
			if var3 ~= nil then
				var3:Destroy()
			end
			masterFader:Destroy()
		end
	}
end