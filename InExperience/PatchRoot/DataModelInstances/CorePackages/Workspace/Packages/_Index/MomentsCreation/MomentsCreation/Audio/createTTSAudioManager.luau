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

return function(p1)
	-- upvalues: defaultCreateTtsInstance (ref), createSignal (ref), runService (ref), classifyTTSErrorModule (ref), getFIntMomentsTTSWaveformSamplesPerSecondModule (ref), getFIntMomentsTTSWaveformMinSamplesModule (ref), getFIntMomentsTTSWaveformMaxSamplesModule (ref), normalizeWaveformModule (ref)
	p1 = p1 or defaultCreateTtsInstance
	local var1, var2 = createSignal("idle")
	local var3, var4 = createSignal(nil)
	local var5, var6 = createSignal(0)
	local var7, var8 = createSignal(0)
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal("")
	local var13, var14 = createSignal(0)
	local var15, var16 = createSignal({})
	local var17 = nil
	local var18 = nil
	local var19 = 0
	local var20 = nil
	local var21 = nil
	local var22 = false
	
	local function _()
		-- upvalues: var20 (write)
		if var20 then
			var20:Disconnect()
			var20 = nil
		end
	end
	
	local _ = function()
		-- upvalues: var20 (write), runService (copy), var17 (write), var8 (ref)
		if var20 then
			var20:Disconnect()
			var20 = nil
		end
		var20 = runService.RenderStepped:Connect(function()
			-- upvalues: var17 (copy), var8 (copy)
			if var17 then
				var8(var17.TimePosition)
			end
		end)
	end
	
	local _ = function()
		-- upvalues: var17 (write), p1 (ref), var18 (write), var21 (write), var22 (write), var2 (ref), var8 (ref), var20 (write)
		if var17 ~= nil then
			return var17
		end
		local var23 = p1()
		
		if var23 == nil then
			return nil
		end
		var17 = var23
		var18 = var23.Parent
		var21 = var23.Ended:Connect(function()
			-- upvalues: var22 (copy), var2 (copy), var8 (copy), var20 (copy)
			if var22 then return end
			var2("ready")
			var8(0)
			
			if var20 then
				var20:Disconnect()
				var20 = nil
			end
		end)
		
		return var23
	end
	
	local function failGeneration(p2)
		-- upvalues: var12 (ref), var14 (ref), var10 (ref), var6 (ref), var16 (ref), var4 (ref), var2 (ref)
		var12("")
		var14(0)
		var10(false)
		var6(0)
		var16({})
		var4(p2)
		var2("error")
	end
	
	return {
		getState = var1,
		getErrorReason = var3,
		getTimeLength = var5,
		getTimePosition = var7,
		getIsLoaded = var9,
		getLoadedText = var11,
		getLoadedVoiceId = var13,
		getWaveform = var15,
		generate = function(p2, p3)
			-- upvalues: var22 (write), var11 (ref), var13 (ref), var1 (ref), var17 (write), p1 (ref), var18 (write), var21 (write), var2 (ref), var8 (ref), var20 (write), var4 (ref), var19 (write), var16 (ref), var12 (ref), var14 (ref), failGeneration (ref), classifyTTSErrorModule (copy), getFIntMomentsTTSWaveformSamplesPerSecondModule (copy), getFIntMomentsTTSWaveformMinSamplesModule (copy), getFIntMomentsTTSWaveformMaxSamplesModule (copy), var6 (ref), var10 (ref), normalizeWaveformModule (copy)
			local var23
			if var22 then return end
			if p2 == var11(false) and p3 == var13(false) and var1(false) ~= "error" then return end
			if var17 == nil then
				local var24 = p1()
				
				if var24 == nil then
					var23 = nil
				else
					var17 = var24
					var18 = var24.Parent
					var21 = var24.Ended:Connect(function()
						-- upvalues: var22 (copy), var2 (copy), var8 (copy), var20 (copy)
						if var22 then return end
						var2("ready")
						var8(0)
						
						if var20 then
							var20:Disconnect()
							var20 = nil
						end
					end)
					var23 = var24
				end
			else
				var23 = var17
			end
			if not var23 then
				var4("failure")
				var2("error")
				
				return
			end
			var19 += 1
			local var25 = var19
			var23:Pause()
			
			if var20 then
				var20:Disconnect()
				var20 = nil
			end
			var4(nil)
			var2("loading")
			var8(0)
			var16({})
			var12("")
			var14(0)
			task.spawn(function()
				-- upvalues: var22 (copy), var23 (ref), p2 (ref), p3 (ref), var19 (copy), var25 (ref), failGeneration (copy), classifyTTSErrorModule (copy), getFIntMomentsTTSWaveformSamplesPerSecondModule (copy), getFIntMomentsTTSWaveformMinSamplesModule (copy), getFIntMomentsTTSWaveformMaxSamplesModule (copy), var12 (copy), var14 (copy), var6 (copy), var10 (copy), var8 (copy), var16 (copy), normalizeWaveformModule (copy), var2 (copy)
				if var22 then return end
				var23.Text = p2
				var23.VoiceId = tostring(p3)
				local ok, status = pcall(function()
					-- upvalues: var23 (copy)
					return var23:LoadPlatformAsync()
				end)
				
				if var22 or var19 ~= var25 then return end
				if not ok then
					failGeneration(classifyTTSErrorModule(status))
					
					return
				elseif status ~= Enum.AssetFetchStatus.Success then
					failGeneration("failure")
					
					return
				end
				local clampedValue = math.clamp(math.round(var23.TimeLength * getFIntMomentsTTSWaveformSamplesPerSecondModule()), getFIntMomentsTTSWaveformMinSamplesModule(), getFIntMomentsTTSWaveformMaxSamplesModule())
				local ok_1, status_1 = pcall(function()
					-- upvalues: var23 (copy), clampedValue (ref)
					return var23:GetWaveformAsync(NumberRange.new(0, var23.TimeLength), clampedValue)
				end)
				
				if var22 or var19 ~= var25 then return end
				var12(p2)
				var14(p3)
				var6(var23.TimeLength)
				var10(true)
				var8(0)
				
				if ok_1 and type(status_1) == "table" then
					var16(normalizeWaveformModule(status_1))
				end
				var2("ready")
			end)
		end,
		play = function()
			-- upvalues: var22 (write), var17 (write), var2 (ref), var20 (write), runService (copy), var8 (ref)
			if var22 then return end
			if var17 and var17.IsLoaded then
				var17:Play()
				var2("playing")
				
				if var20 then
					var20:Disconnect()
					var20 = nil
				end
				var20 = runService.RenderStepped:Connect(function()
					-- upvalues: var17 (copy), var8 (copy)
					if var17 then
						var8(var17.TimePosition)
					end
				end)
			end
		end,
		pause = function()
			-- upvalues: var22 (write), var17 (write), var20 (write), var1 (ref), var2 (ref)
			if var22 then return end
			if var17 then
				var17:Pause()
				
				if var20 then
					var20:Disconnect()
					var20 = nil
				end
				if var1(false) == "playing" then
					var2("ready")
				end
			end
		end,
		seek = function(p2)
			-- upvalues: var22 (write), var17 (write), var5 (ref), var8 (ref)
			if var22 then return end
			if var17 then
				local clampedValue = math.clamp(p2, 0, var5(false))
				var17.TimePosition = clampedValue
				var8(clampedValue)
			end
		end,
		setVolume = function(value)
			-- upvalues: var22 (write), var17 (write)
			if var22 then return end
			if var17 then
				var17.Volume = value
			end
		end,
		reset = function()
			-- upvalues: var22 (write), var19 (write), var17 (write), var20 (write), var4 (ref), var2 (ref), var8 (ref), var6 (ref), var10 (ref), var12 (ref), var14 (ref), var16 (ref)
			if var22 then return end
			var19 += 1
			
			if var17 then
				var17:Pause()
			end
			if var20 then
				var20:Disconnect()
				var20 = nil
			end
			var4(nil)
			var2("idle")
			var8(0)
			var6(0)
			var10(false)
			var12("")
			var14(0)
			var16({})
		end,
		destroy = function()
			-- upvalues: var22 (write), var20 (write), var21 (write), var18 (write), var17 (write)
			if var22 then return end
			var22 = true
			
			if var20 then
				var20:Disconnect()
				var20 = nil
			end
			if var21 then
				var21:Disconnect()
				var21 = nil
			end
			if var18 then
				var18:Destroy()
				var18 = nil
			end
			var17 = nil
		end
	}
end