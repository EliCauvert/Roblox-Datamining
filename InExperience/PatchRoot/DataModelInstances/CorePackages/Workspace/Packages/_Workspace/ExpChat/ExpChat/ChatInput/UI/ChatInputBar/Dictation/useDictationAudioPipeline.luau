local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ReactModule = require(ExpChat.Parent.React)
local FinishDictationInputModule = require(script.Parent.finishDictationInput)
local SetDictationUsageTypeModule = require(script.Parent.setDictationUsageType)
local EngineAudioSTTIsDictationEnabled = game:DefineFastFlag("EngineAudioSTTIsDictationEnabled", false)
local ExpChatDictationSendUsageType = game:DefineFastFlag("ExpChatDictationSendUsageType", false)
local FFlagExpChatDictationStreamingAudioModule = require(ExpChat.Flags.FFlagExpChatDictationStreamingAudio)

local function _(p1)
	if p1.current then
		p1.current:Destroy()
		p1.current = nil
	end
end

local _ = function(p1)
	if p1.current then
		p1.current:Disconnect()
		p1.current = nil
	end
end

local _ = function(p1)
	local TextConnection = p1.textConnection
	
	if TextConnection.current then
		TextConnection.current:Disconnect()
		TextConnection.current = nil
	end
	local VadConnection = p1.vadConnection
	
	if VadConnection.current then
		VadConnection.current:Disconnect()
		VadConnection.current = nil
	end
	local Wire = p1.wire
	
	if Wire.current then
		Wire.current:Destroy()
		Wire.current = nil
	end
	local AudioSTT = p1.audioSTT
	
	if AudioSTT.current then
		AudioSTT.current:Destroy()
		AudioSTT.current = nil
	end
	local AudioDeviceInput = p1.audioDeviceInput
	
	if AudioDeviceInput.current then
		AudioDeviceInput.current:Destroy()
		AudioDeviceInput.current = nil
	end
	local Container = p1.container
	
	if Container.current then
		Container.current:Destroy()
		Container.current = nil
	end
end

return function()
	-- upvalues: ReactModule (copy), Players (copy), CoreGui (copy), FFlagExpChatDictationStreamingAudioModule (copy), EngineAudioSTTIsDictationEnabled (copy), ExpChatDictationSendUsageType (copy), SetDictationUsageTypeModule (copy), FinishDictationInputModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult5 (copy)
		return {
			audioDeviceInput = UseRefResult,
			audioSTT = UseRefResult1,
			wire = UseRefResult2,
			container = UseRefResult3,
			textConnection = UseRefResult4,
			vadConnection = UseRefResult5
		}
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), UseStateResult2 (copy)
		local TextConnection = UseMemoResult.textConnection
		
		if TextConnection.current then
			TextConnection.current:Disconnect()
			TextConnection.current = nil
		end
		local VadConnection = UseMemoResult.vadConnection
		
		if VadConnection.current then
			VadConnection.current:Disconnect()
			VadConnection.current = nil
		end
		local Wire = UseMemoResult.wire
		
		if Wire.current then
			Wire.current:Destroy()
			Wire.current = nil
		end
		local AudioSTT = UseMemoResult.audioSTT
		
		if AudioSTT.current then
			AudioSTT.current:Destroy()
			AudioSTT.current = nil
		end
		local AudioDeviceInput = UseMemoResult.audioDeviceInput
		
		if AudioDeviceInput.current then
			AudioDeviceInput.current:Destroy()
			AudioDeviceInput.current = nil
		end
		local Container = UseMemoResult.container
		
		if Container.current then
			Container.current:Destroy()
			Container.current = nil
		end
		UseStateResult2(nil)
	end, { UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(p1, p2)
		-- upvalues: Players (upval), UseMemoResult (copy), CoreGui (upval), FFlagExpChatDictationStreamingAudioModule (upval), EngineAudioSTTIsDictationEnabled (upval), ExpChatDictationSendUsageType (upval), SetDictationUsageTypeModule (upval), UseStateResult2 (copy)
		local LocalPlayer = Players.LocalPlayer
		
		if not LocalPlayer then
			error("No local player")
		end
		local TextConnection = UseMemoResult.textConnection
		
		if TextConnection.current then
			TextConnection.current:Disconnect()
			TextConnection.current = nil
		end
		local VadConnection = UseMemoResult.vadConnection
		
		if VadConnection.current then
			VadConnection.current:Disconnect()
			VadConnection.current = nil
		end
		local Wire = UseMemoResult.wire
		
		if Wire.current then
			Wire.current:Destroy()
			Wire.current = nil
		end
		local AudioSTT = UseMemoResult.audioSTT
		
		if AudioSTT.current then
			AudioSTT.current:Destroy()
			AudioSTT.current = nil
		end
		local AudioDeviceInput = UseMemoResult.audioDeviceInput
		
		if AudioDeviceInput.current then
			AudioDeviceInput.current:Destroy()
			AudioDeviceInput.current = nil
		end
		local Container = UseMemoResult.container
		
		if Container.current then
			Container.current:Destroy()
			Container.current = nil
		end
		local IsContinuous: boolean = p2 ~= nil and p2.continuous == true
		local ExpChatDictation = Instance.new("Folder")
		ExpChatDictation.Name = "ExpChatDictation"
		ExpChatDictation.Parent = CoreGui
		UseMemoResult.container.current = ExpChatDictation
		local AudioDeviceInput1 = Instance.new("AudioDeviceInput")
		AudioDeviceInput1.Player = LocalPlayer
		AudioDeviceInput1.Muted = false
		
		if FFlagExpChatDictationStreamingAudioModule and IsContinuous then
			AudioDeviceInput1.Streaming = true
		end
		AudioDeviceInput1.Parent = ExpChatDictation
		AudioDeviceInput1.Active = true
		UseMemoResult.audioDeviceInput.current = AudioDeviceInput1
		local AudioSpeechToText = Instance.new("AudioSpeechToText")
		
		if FFlagExpChatDictationStreamingAudioModule and IsContinuous then
			AudioSpeechToText.Streaming = true
		end
		if EngineAudioSTTIsDictationEnabled then
			AudioSpeechToText.DictationEnabled = true
		end
		if ExpChatDictationSendUsageType then
			SetDictationUsageTypeModule(AudioSpeechToText, IsContinuous)
		end
		AudioSpeechToText.Enabled = true
		AudioSpeechToText.Parent = ExpChatDictation
		UseMemoResult.audioSTT.current = AudioSpeechToText
		local Wire1 = Instance.new("Wire")
		Wire1.SourceInstance = AudioDeviceInput1
		Wire1.TargetInstance = AudioSpeechToText
		Wire1.Parent = ExpChatDictation
		UseMemoResult.wire.current = Wire1
		UseMemoResult.textConnection.current = AudioSpeechToText:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: AudioSpeechToText (copy), IsContinuous (copy), p1 (copy)
			local Text = AudioSpeechToText.Text
			
			if Text and Text ~= "" then
				if IsContinuous then
					AudioSpeechToText.Text = ""
				end
				p1.onTranscription(Text)
			end
		end)
		
		if p1.onSpeechStarted then
			local OnSpeechStartedFunction = p1.onSpeechStarted
			UseMemoResult.vadConnection.current = AudioSpeechToText:GetPropertyChangedSignal("VoiceDetected"):Connect(function()
				-- upvalues: AudioSpeechToText (copy), OnSpeechStartedFunction (copy)
				if AudioSpeechToText.VoiceDetected then
					OnSpeechStartedFunction()
				end
			end)
		end
		UseStateResult2(AudioDeviceInput1)
		
		return AudioDeviceInput1
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			local TextConnection = UseMemoResult.textConnection
			
			if TextConnection.current then
				TextConnection.current:Disconnect()
				TextConnection.current = nil
			end
			local VadConnection = UseMemoResult.vadConnection
			
			if VadConnection.current then
				VadConnection.current:Disconnect()
				VadConnection.current = nil
			end
			local Wire = UseMemoResult.wire
			
			if Wire.current then
				Wire.current:Destroy()
				Wire.current = nil
			end
			local AudioSTT = UseMemoResult.audioSTT
			
			if AudioSTT.current then
				AudioSTT.current:Destroy()
				AudioSTT.current = nil
			end
			local AudioDeviceInput = UseMemoResult.audioDeviceInput
			
			if AudioDeviceInput.current then
				AudioDeviceInput.current:Destroy()
				AudioDeviceInput.current = nil
			end
			local Container = UseMemoResult.container
			
			if Container.current then
				Container.current:Destroy()
				Container.current = nil
			end
		end
	end, { UseMemoResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult1 (copy), FinishDictationInputModule (upval), UseMemoResult (copy), UseResult (copy), UseStateResult (copy), UseRefResult (copy)
		return {
			start = UseResult1,
			finishInput = function()
				-- upvalues: FinishDictationInputModule (upval), UseMemoResult (upval)
				return FinishDictationInputModule(UseMemoResult.audioSTT.current)
			end,
			stop = UseResult,
			audioDeviceInput = UseStateResult,
			audioDeviceInputRef = UseRefResult
		}
	end, { UseResult1, UseResult, UseStateResult, UseMemoResult })
end