local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local ClassifyTTSErrorModule = require(MomentsCreation.Audio.classifyTTSError)
local NormalizeWaveformModule = require(MomentsCreation.Audio.normalizeWaveform)
local GetFIntMomentsTTSWaveformSamplesPerSecondModule = require(MomentsCreation.Flags.GetFIntMomentsTTSWaveformSamplesPerSecond)
local GetFIntMomentsTTSWaveformMinSamplesModule = require(MomentsCreation.Flags.GetFIntMomentsTTSWaveformMinSamples)
local GetFIntMomentsTTSWaveformMaxSamplesModule = require(MomentsCreation.Flags.GetFIntMomentsTTSWaveformMaxSamples)
local AudioDuckingFastInts = require(Parent.MomentsCommon).Media.audioDuckingFastInts
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CreateSignalFunction = require(Parent.Signals).createSignal

local function defaultCreateTtsInstance(PlayerGui)
	-- upvalues: Players (copy), AudioDuckingFastInts (copy)
	if not game:GetEngineFeature("TextToSpeechPlatformPreview") then
		return nil
	end
	if PlayerGui == nil then
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer == nil then
			return nil
		end
		PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		
		if PlayerGui == nil then
			return nil
		end
	end
	local TTSSharedGraph = Instance.new("Folder")
	TTSSharedGraph.Name = "TTSSharedGraph"
	local AudioTextToSpeech = Instance.new("AudioTextToSpeech")
	AudioTextToSpeech.Volume = AudioDuckingFastInts.getTtsVolume()
	AudioTextToSpeech.Parent = TTSSharedGraph
	local AudioDeviceOutput = Instance.new("AudioDeviceOutput")
	AudioDeviceOutput.Parent = TTSSharedGraph
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = AudioTextToSpeech
	Wire.TargetInstance = AudioDeviceOutput
	Wire.Parent = TTSSharedGraph
	TTSSharedGraph.Parent = PlayerGui
	
	return AudioTextToSpeech
end

return function(p1, PlayerGui)
	-- upvalues: defaultCreateTtsInstance (copy), CreateSignalFunction (copy), RunService (copy), ClassifyTTSErrorModule (copy), GetFIntMomentsTTSWaveformSamplesPerSecondModule (copy), GetFIntMomentsTTSWaveformMinSamplesModule (copy), GetFIntMomentsTTSWaveformMaxSamplesModule (copy), NormalizeWaveformModule (copy)
	local Callback = p1 or function()
		-- upvalues: defaultCreateTtsInstance (upval), PlayerGui (copy)
		return (defaultCreateTtsInstance(PlayerGui))
	end
	local Idle, Idle2 = CreateSignalFunction("idle")
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(0)
	local Signal3, Signal2_2 = CreateSignalFunction(0)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local Signal5, Signal2_4 = CreateSignalFunction("")
	local Signal6, Signal2_5 = CreateSignalFunction(0)
	local Signal7, Signal2_6 = CreateSignalFunction({})
	local v1 = nil
	local Parent = nil
	local Count = 0
	local RenderSteppedConnection = nil
	local EndedConnection = nil
	local Flag = false
	
	local function _()
		-- upvalues: RenderSteppedConnection (ref)
		if RenderSteppedConnection then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
	end
	
	local _ = function()
		-- upvalues: RenderSteppedConnection (ref), RunService (upval), v1 (ref), Signal2_2 (copy)
		if RenderSteppedConnection then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
		RenderSteppedConnection = RunService.RenderStepped:Connect(function()
			-- upvalues: v1 (upval), Signal2_2 (upval)
			if v1 then
				Signal2_2(v1.TimePosition)
			end
		end)
	end
	
	local _ = function()
		-- upvalues: v1 (ref), Callback (copy), Parent (ref), EndedConnection (ref), Flag (ref), Idle2 (copy), Signal2_2 (copy), RenderSteppedConnection (ref)
		if v1 ~= nil then
			return v1
		end
		local CallbackResult = Callback()
		
		if CallbackResult == nil then
			return nil
		else
			v1 = CallbackResult
			Parent = CallbackResult.Parent
			EndedConnection = CallbackResult.Ended:Connect(function()
				-- upvalues: Flag (upval), Idle2 (upval), Signal2_2 (upval), RenderSteppedConnection (upval)
				if Flag then return end
				Idle2("ready")
				Signal2_2(0)
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
			end)
			
			return CallbackResult
		end
	end
	
	local function failGeneration(p2)
		-- upvalues: Signal2_4 (copy), Signal2_5 (copy), Signal2_3 (copy), Signal2_1 (copy), Signal2_6 (copy), Signal2 (copy), Idle2 (copy)
		Signal2_4("")
		Signal2_5(0)
		Signal2_3(false)
		Signal2_1(0)
		Signal2_6({})
		Signal2(p2)
		Idle2("error")
	end
	
	return {
		getState = Idle,
		getErrorReason = Signal,
		getTimeLength = Signal1,
		getTimePosition = Signal3,
		getIsLoaded = Signal4,
		getLoadedText = Signal5,
		getLoadedVoiceId = Signal6,
		getWaveform = Signal7,
		generate = function(Text, p2)
			-- upvalues: Flag (ref), Signal5 (copy), Signal6 (copy), Idle (copy), v1 (ref), Callback (copy), Parent (ref), EndedConnection (ref), Idle2 (copy), Signal2_2 (copy), RenderSteppedConnection (ref), Signal2 (copy), Count (ref), Signal2_6 (copy), Signal2_4 (copy), Signal2_5 (copy), failGeneration (copy), ClassifyTTSErrorModule (upval), GetFIntMomentsTTSWaveformSamplesPerSecondModule (upval), GetFIntMomentsTTSWaveformMinSamplesModule (upval), GetFIntMomentsTTSWaveformMaxSamplesModule (upval), Signal2_1 (copy), Signal2_3 (copy), NormalizeWaveformModule (upval)
			if Flag then return end
			if Text == Signal5(false) and p2 == Signal6(false) and Idle(false) ~= "error" then return end
			local Sound = nil
			if v1 == nil then
				local CallbackResult = Callback()
				
				if CallbackResult == nil then
					Sound = nil
				else
					v1 = CallbackResult
					Parent = CallbackResult.Parent
					EndedConnection = CallbackResult.Ended:Connect(function()
						-- upvalues: Flag (upval), Idle2 (upval), Signal2_2 (upval), RenderSteppedConnection (upval)
						if Flag then return end
						Idle2("ready")
						Signal2_2(0)
						
						if RenderSteppedConnection then
							RenderSteppedConnection:Disconnect()
							RenderSteppedConnection = nil
						end
					end)
					Sound = CallbackResult
				end
			else
				Sound = v1
			end
			if not Sound then
				Signal2("failure")
				Idle2("error")
				
				return
			end
			Count += 1
			local Count1: number = Count
			Sound:Pause()
			
			if RenderSteppedConnection then
				RenderSteppedConnection:Disconnect()
				RenderSteppedConnection = nil
			end
			Signal2(nil)
			Idle2("loading")
			Signal2_2(0)
			Signal2_6({})
			Signal2_4("")
			Signal2_5(0)
			task.spawn(function()
				-- upvalues: Flag (upval), Sound (copy), Text (copy), p2 (copy), Count (upval), Count1 (copy), failGeneration (upval), ClassifyTTSErrorModule (upval), GetFIntMomentsTTSWaveformSamplesPerSecondModule (upval), GetFIntMomentsTTSWaveformMinSamplesModule (upval), GetFIntMomentsTTSWaveformMaxSamplesModule (upval), Signal2_4 (upval), Signal2_5 (upval), Signal2_1 (upval), Signal2_3 (upval), Signal2_2 (upval), Signal2_6 (upval), NormalizeWaveformModule (upval), Idle2 (upval)
				if Flag then return end
				Sound.Text = Text
				Sound.VoiceId = tostring(p2)
				local Success, Result = pcall(function()
					-- upvalues: Sound (upval)
					return Sound:LoadPlatformAsync()
				end)
				
				if Flag or Count ~= Count1 then return end
				if not Success then
					failGeneration(ClassifyTTSErrorModule(Result))
					
					return
				end
				if Result ~= Enum.AssetFetchStatus.Success then
					failGeneration("failure")
					
					return
				end
				local ClampedValue = math.clamp(math.round(Sound.TimeLength * GetFIntMomentsTTSWaveformSamplesPerSecondModule()), GetFIntMomentsTTSWaveformMinSamplesModule(), GetFIntMomentsTTSWaveformMaxSamplesModule())
				local Success1, Result1 = pcall(function()
					-- upvalues: Sound (upval), ClampedValue (copy)
					return Sound:GetWaveformAsync(NumberRange.new(0, Sound.TimeLength), ClampedValue)
				end)
				
				if Flag or Count ~= Count1 then return end
				Signal2_4(Text)
				Signal2_5(p2)
				Signal2_1(Sound.TimeLength)
				Signal2_3(true)
				Signal2_2(0)
				
				if Success1 and type(Result1) == "table" then
					Signal2_6(NormalizeWaveformModule(Result1))
				end
				Idle2("ready")
			end)
		end,
		play = function()
			-- upvalues: Flag (ref), v1 (ref), Idle2 (copy), RenderSteppedConnection (ref), RunService (upval), Signal2_2 (copy)
			if Flag then return end
			local v2 = v1
			
			if v2 and v2.IsLoaded then
				v2:Play()
				Idle2("playing")
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
				RenderSteppedConnection = RunService.RenderStepped:Connect(function()
					-- upvalues: v1 (upval), Signal2_2 (upval)
					if v1 then
						Signal2_2(v1.TimePosition)
					end
				end)
			end
		end,
		pause = function()
			-- upvalues: Flag (ref), v1 (ref), RenderSteppedConnection (ref), Idle (copy), Idle2 (copy)
			if Flag then return end
			local v2 = v1
			
			if v2 then
				v2:Pause()
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
				if Idle(false) == "playing" then
					Idle2("ready")
				end
			end
		end,
		seek = function(Value: number)
			-- upvalues: Flag (ref), v1 (ref), Signal1 (copy), Signal2_2 (copy)
			if Flag then return end
			local v2 = v1
			
			if v2 then
				local ClampedValue = math.clamp(Value, 0, (Signal1(false)))
				v2.TimePosition = ClampedValue
				Signal2_2(ClampedValue)
			end
		end,
		setVolume = function(Volume)
			-- upvalues: Flag (ref), v1 (ref)
			if Flag then return end
			local v2 = v1
			
			if v2 then
				v2.Volume = Volume
			end
		end,
		reset = function()
			-- upvalues: Flag (ref), Count (ref), v1 (ref), RenderSteppedConnection (ref), Signal2 (copy), Idle2 (copy), Signal2_2 (copy), Signal2_1 (copy), Signal2_3 (copy), Signal2_4 (copy), Signal2_5 (copy), Signal2_6 (copy)
			if Flag then return end
			Count += 1
			
			if v1 then
				v1:Pause()
			end
			if RenderSteppedConnection then
				RenderSteppedConnection:Disconnect()
				RenderSteppedConnection = nil
			end
			Signal2(nil)
			Idle2("idle")
			Signal2_2(0)
			Signal2_1(0)
			Signal2_3(false)
			Signal2_4("")
			Signal2_5(0)
			Signal2_6({})
		end,
		destroy = function()
			-- upvalues: Flag (ref), RenderSteppedConnection (ref), EndedConnection (ref), Parent (ref), v1 (ref)
			if Flag then return end
			Flag = true
			
			if RenderSteppedConnection then
				RenderSteppedConnection:Disconnect()
				RenderSteppedConnection = nil
			end
			if EndedConnection then
				EndedConnection:Disconnect()
				EndedConnection = nil
			end
			if Parent then
				Parent:Destroy()
				Parent = nil
			end
			v1 = nil
		end
	}
end