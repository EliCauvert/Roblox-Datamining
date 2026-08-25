local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local signalsModule = require(momentsCreation.Parent.Signals)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local classifyTTSErrorModule = require(momentsCreation.Audio.classifyTTSError)
local normalizeWaveformModule = require(momentsCreation.Audio.normalizeWaveform)
local getFIntMomentsTTSWaveformSamplesPerSecondModule = require(momentsCreation.Flags.GetFIntMomentsTTSWaveformSamplesPerSecond)
local getFIntMomentsTTSWaveformMinSamplesModule = require(momentsCreation.Flags.GetFIntMomentsTTSWaveformMinSamples)
local getFIntMomentsTTSWaveformMaxSamplesModule = require(momentsCreation.Flags.GetFIntMomentsTTSWaveformMaxSamples)
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local createSignal = signalsModule.createSignal

local function defaultCreateTtsInstance()
	-- upvalues: playersService (ref)
	if not game:GetEngineFeature("TextToSpeechPlatformPreview") then
		return nil
	end
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		return nil
	end
	local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
	
	if playerGui == nil then
		return nil
	end
	local TTSSharedGraph = Instance.new("Folder")
	TTSSharedGraph.Name = "TTSSharedGraph"
	local audioTextToSpeech = Instance.new("AudioTextToSpeech")
	audioTextToSpeech.Volume = 1
	audioTextToSpeech.Parent = TTSSharedGraph
	local audioDeviceOutput = Instance.new("AudioDeviceOutput")
	audioDeviceOutput.Parent = TTSSharedGraph
	local wire = Instance.new("Wire")
	wire.SourceInstance = audioTextToSpeech
	wire.TargetInstance = audioDeviceOutput
	wire.Parent = TTSSharedGraph
	TTSSharedGraph.Parent = playerGui
	
	return audioTextToSpeech
end

return function(p0)
	-- upvalues: defaultCreateTtsInstance (ref), createSignal (ref), runService (ref), classifyTTSErrorModule (ref), getFIntMomentsTTSWaveformSamplesPerSecondModule (ref), getFIntMomentsTTSWaveformMinSamplesModule (ref), getFIntMomentsTTSWaveformMaxSamplesModule (ref), normalizeWaveformModule (ref)
	p0 = p0 or defaultCreateTtsInstance
	local var16, var17 = createSignal("idle")
	local var18, var19 = createSignal(nil)
	local var20, var21 = createSignal(0)
	local var22, var23 = createSignal(0)
	local var24, var25 = createSignal(false)
	local var26, var27 = createSignal("")
	local var28, var29 = createSignal(0)
	local var30, var31 = createSignal({})
	local var32 = nil
	local var33 = nil
	local var34 = 0
	local var35 = nil
	local var36 = nil
	local var37 = false
	
	local function _()
		-- upvalues: var35 (write)
		if var35 then
			var35:Disconnect()
			var35 = nil
		end
	end
	
	local _ = function()
		-- upvalues: var35 (write), runService (copy), var32 (write), var23 (ref)
		if var35 then
			var35:Disconnect()
			var35 = nil
		end
		var35 = runService.RenderStepped:Connect(function()
			-- upvalues: var32 (copy), var23 (copy)
			if var32 then
				var23(var32.TimePosition)
			end
		end)
	end
	
	local _ = function()
		-- upvalues: var32 (write), p0 (ref), var33 (write), var36 (write), var37 (write), var17 (ref), var23 (ref), var35 (write)
		if var32 ~= nil then
			return var32
		end
		local var39 = p0()
		
		if var39 == nil then
			return nil
		end
		var32 = var39
		var33 = var39.Parent
		var36 = var39.Ended:Connect(function()
			-- upvalues: var37 (copy), var17 (copy), var23 (copy), var35 (copy)
			if var37 then return end
			var17("ready")
			var23(0)
			
			if var35 then
				var35:Disconnect()
				var35 = nil
			end
		end)
		
		return var39
	end
	
	local function failGeneration(p1)
		-- upvalues: var27 (ref), var29 (ref), var25 (ref), var21 (ref), var31 (ref), var19 (ref), var17 (ref)
		var27("")
		var29(0)
		var25(false)
		var21(0)
		var31({})
		var19(p1)
		var17("error")
	end
	
	return {
		getState = var16,
		getErrorReason = var18,
		getTimeLength = var20,
		getTimePosition = var22,
		getIsLoaded = var24,
		getLoadedText = var26,
		getLoadedVoiceId = var28,
		getWaveform = var30,
		generate = function(p2, p3)
			-- upvalues: var37 (write), var26 (ref), var28 (ref), var16 (ref), var32 (write), p0 (ref), var33 (write), var36 (write), var17 (ref), var23 (ref), var35 (write), var19 (ref), var34 (write), var31 (ref), var27 (ref), var29 (ref), failGeneration (ref), classifyTTSErrorModule (copy), getFIntMomentsTTSWaveformSamplesPerSecondModule (copy), getFIntMomentsTTSWaveformMinSamplesModule (copy), getFIntMomentsTTSWaveformMaxSamplesModule (copy), var21 (ref), var25 (ref), normalizeWaveformModule (copy)
			local var40
			if var37 then return end
			if p2 == var26(false) and p3 == var28(false) and var16(false) ~= "error" then return end
			if var32 == nil then
				local var41 = p0()
				
				if var41 == nil then
					var40 = nil
				else
					var32 = var41
					var33 = var41.Parent
					var36 = var41.Ended:Connect(function()
						-- upvalues: var37 (copy), var17 (copy), var23 (copy), var35 (copy)
						if var37 then return end
						var17("ready")
						var23(0)
						
						if var35 then
							var35:Disconnect()
							var35 = nil
						end
					end)
					var40 = var41
				end
			else
				var40 = var32
			end
			if not var40 then
				var19("failure")
				var17("error")
				
				return
			end
			var34 += 1
			local var42 = var34
			var40:Pause()
			
			if var35 then
				var35:Disconnect()
				var35 = nil
			end
			var19(nil)
			var17("loading")
			var23(0)
			var31({})
			var27("")
			var29(0)
			task.spawn(function()
				-- upvalues: var37 (copy), var40 (ref), p2 (ref), p3 (ref), var34 (copy), var42 (ref), failGeneration (copy), classifyTTSErrorModule (copy), getFIntMomentsTTSWaveformSamplesPerSecondModule (copy), getFIntMomentsTTSWaveformMinSamplesModule (copy), getFIntMomentsTTSWaveformMaxSamplesModule (copy), var27 (copy), var29 (copy), var21 (copy), var25 (copy), var23 (copy), var31 (copy), normalizeWaveformModule (copy), var17 (copy)
				if var37 then return end
				var40.Text = p2
				var40.VoiceId = tostring(p3)
				local ok, status = pcall(function()
					-- upvalues: var40 (copy)
					return var40:LoadPlatformAsync()
				end)
				
				if var37 or var34 ~= var42 then return end
				if not ok then
					failGeneration(classifyTTSErrorModule(status))
					
					return
				elseif status ~= Enum.AssetFetchStatus.Success then
					failGeneration("failure")
					
					return
				end
				local clampedValue = math.clamp(math.round(var40.TimeLength * getFIntMomentsTTSWaveformSamplesPerSecondModule()), getFIntMomentsTTSWaveformMinSamplesModule(), getFIntMomentsTTSWaveformMaxSamplesModule())
				local ok_1, status_1 = pcall(function()
					-- upvalues: var40 (copy), clampedValue (ref)
					return var40:GetWaveformAsync(NumberRange.new(0, var40.TimeLength), clampedValue)
				end)
				
				if var37 or var34 ~= var42 then return end
				var27(p2)
				var29(p3)
				var21(var40.TimeLength)
				var25(true)
				var23(0)
				
				if ok_1 and type(status_1) == "table" then
					var31(normalizeWaveformModule(status_1))
				end
				var17("ready")
			end)
		end,
		play = function()
			-- upvalues: var37 (write), var32 (write), var17 (ref), var35 (write), runService (copy), var23 (ref)
			if var37 then return end
			if var32 and var32.IsLoaded then
				var32:Play()
				var17("playing")
				
				if var35 then
					var35:Disconnect()
					var35 = nil
				end
				var35 = runService.RenderStepped:Connect(function()
					-- upvalues: var32 (copy), var23 (copy)
					if var32 then
						var23(var32.TimePosition)
					end
				end)
			end
		end,
		pause = function()
			-- upvalues: var37 (write), var32 (write), var35 (write), var16 (ref), var17 (ref)
			if var37 then return end
			if var32 then
				var32:Pause()
				
				if var35 then
					var35:Disconnect()
					var35 = nil
				end
				if var16(false) == "playing" then
					var17("ready")
				end
			end
		end,
		seek = function(p4)
			-- upvalues: var37 (write), var32 (write), var20 (ref), var23 (ref)
			if var37 then return end
			if var32 then
				local clampedValue = math.clamp(p4, 0, var20(false))
				var32.TimePosition = clampedValue
				var23(clampedValue)
			end
		end,
		setVolume = function(value)
			-- upvalues: var37 (write), var32 (write)
			if var37 then return end
			if var32 then
				var32.Volume = value
			end
		end,
		reset = function()
			-- upvalues: var37 (write), var34 (write), var32 (write), var35 (write), var19 (ref), var17 (ref), var23 (ref), var21 (ref), var25 (ref), var27 (ref), var29 (ref), var31 (ref)
			if var37 then return end
			var34 += 1
			
			if var32 then
				var32:Pause()
			end
			if var35 then
				var35:Disconnect()
				var35 = nil
			end
			var19(nil)
			var17("idle")
			var23(0)
			var21(0)
			var25(false)
			var27("")
			var29(0)
			var31({})
		end,
		destroy = function()
			-- upvalues: var37 (write), var35 (write), var36 (write), var33 (write), var32 (write)
			if var37 then return end
			var37 = true
			
			if var35 then
				var35:Disconnect()
				var35 = nil
			end
			if var36 then
				var36:Disconnect()
				var36 = nil
			end
			if var33 then
				var33:Destroy()
				var33 = nil
			end
			var32 = nil
		end
	}
end