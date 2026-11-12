local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ReactModule = require(ExpChat.Parent.React)
local FinishDictationInputModule = require(script.Parent.finishDictationInput)
local PrepareDictationInputModule = require(script.Parent.prepareDictationInput)
local SetDictationUsageTypeModule = require(script.Parent.setDictationUsageType)
local FFlagExpChatDictationExplicitFinishModule = require(ExpChat.Flags.FFlagExpChatDictationExplicitFinish)
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

local function teardownPending(Current)
	for i, value in Current do
		pcall(task.cancel, value)
		local TextConnection = i.textConnection
		
		if TextConnection.current then
			TextConnection.current:Disconnect()
			TextConnection.current = nil
		end
		local VadConnection = i.vadConnection
		
		if VadConnection.current then
			VadConnection.current:Disconnect()
			VadConnection.current = nil
		end
		local Wire = i.wire
		
		if Wire.current then
			Wire.current:Destroy()
			Wire.current = nil
		end
		local AudioSTT = i.audioSTT
		
		if AudioSTT.current then
			AudioSTT.current:Destroy()
			AudioSTT.current = nil
		end
		local AudioDeviceInput = i.audioDeviceInput
		
		if AudioDeviceInput.current then
			AudioDeviceInput.current:Destroy()
			AudioDeviceInput.current = nil
		end
		local Container = i.container
		
		if Container.current then
			Container.current:Destroy()
			Container.current = nil
		end
		Current[i] = nil
	end
end

return function()
	-- upvalues: ReactModule (copy), teardownPending (copy), Players (copy), CoreGui (copy), FFlagExpChatDictationStreamingAudioModule (copy), EngineAudioSTTIsDictationEnabled (copy), ExpChatDictationSendUsageType (copy), SetDictationUsageTypeModule (copy), FFlagExpChatDictationExplicitFinishModule (copy), PrepareDictationInputModule (copy), FinishDictationInputModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult5 (copy), UseRefResult6 (copy)
		return {
			audioDeviceInput = UseRefResult1,
			audioSTT = UseRefResult2,
			wire = UseRefResult3,
			container = UseRefResult4,
			textConnection = UseRefResult5,
			vadConnection = UseRefResult6
		}
	end, {})
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseMemoResult (copy), teardownPending (upval), UseRefResult (copy), UseStateResult2 (copy)
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
		if p1 then
			teardownPending(UseRefResult.current)
		end
		UseStateResult2(nil)
	end, { UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(Delay)
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		local config = {
			audioDeviceInput = { current = UseMemoResult.audioDeviceInput.current },
			audioSTT = { current = UseMemoResult.audioSTT.current },
			wire = { current = UseMemoResult.wire.current },
			container = { current = UseMemoResult.container.current },
			textConnection = { current = UseMemoResult.textConnection.current },
			vadConnection = { current = UseMemoResult.vadConnection.current }
		}
		UseMemoResult.audioDeviceInput.current = nil
		UseMemoResult.audioSTT.current = nil
		UseMemoResult.wire.current = nil
		UseMemoResult.container.current = nil
		UseMemoResult.textConnection.current = nil
		UseMemoResult.vadConnection.current = nil
		local VadConnection = config.vadConnection
		
		if VadConnection.current then
			VadConnection.current:Disconnect()
			VadConnection.current = nil
		end
		UseRefResult.current[config] = task.delay(Delay, function()
			-- upvalues: UseRefResult (upval), config (copy)
			UseRefResult.current[config] = nil
			local TextConnection = config.textConnection
			
			if TextConnection.current then
				TextConnection.current:Disconnect()
				TextConnection.current = nil
			end
			local VadConnection = config.vadConnection
			
			if VadConnection.current then
				VadConnection.current:Disconnect()
				VadConnection.current = nil
			end
			local Wire = config.wire
			
			if Wire.current then
				Wire.current:Destroy()
				Wire.current = nil
			end
			local AudioSTT = config.audioSTT
			
			if AudioSTT.current then
				AudioSTT.current:Destroy()
				AudioSTT.current = nil
			end
			local AudioDeviceInput = config.audioDeviceInput
			
			if AudioDeviceInput.current then
				AudioDeviceInput.current:Destroy()
				AudioDeviceInput.current = nil
			end
			local Container = config.container
			
			if Container.current then
				Container.current:Destroy()
				Container.current = nil
			end
		end)
		UseStateResult2(nil)
	end, { UseMemoResult })
	local UseResult2 = ReactModule.useCallback(function(p1, p2)
		-- upvalues: Players (upval), UseMemoResult (copy), CoreGui (upval), FFlagExpChatDictationStreamingAudioModule (upval), EngineAudioSTTIsDictationEnabled (upval), ExpChatDictationSendUsageType (upval), SetDictationUsageTypeModule (upval), FFlagExpChatDictationExplicitFinishModule (upval), PrepareDictationInputModule (upval), UseStateResult2 (copy)
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
		if FFlagExpChatDictationExplicitFinishModule then
			PrepareDictationInputModule(AudioSpeechToText)
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
		-- upvalues: UseMemoResult (copy), teardownPending (upval), UseRefResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval), teardownPending (upval), UseRefResult (upval)
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
			teardownPending(UseRefResult.current)
		end
	end, { UseMemoResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult2 (copy), FinishDictationInputModule (upval), UseMemoResult (copy), UseResult (copy), UseResult1 (copy), teardownPending (upval), UseRefResult (copy), UseStateResult (copy), UseRefResult1 (copy)
		return {
			start = UseResult2,
			finishInput = function()
				-- upvalues: FinishDictationInputModule (upval), UseMemoResult (upval)
				return FinishDictationInputModule(UseMemoResult.audioSTT.current)
			end,
			stop = UseResult,
			drain = UseResult1,
			discardPending = function()
				-- upvalues: teardownPending (upval), UseRefResult (upval)
				teardownPending(UseRefResult.current)
			end,
			audioDeviceInput = UseStateResult,
			audioDeviceInputRef = UseRefResult1
		}
	end, {
		UseResult2,
		UseResult,
		UseResult1,
		UseStateResult,
		UseMemoResult
	})
end