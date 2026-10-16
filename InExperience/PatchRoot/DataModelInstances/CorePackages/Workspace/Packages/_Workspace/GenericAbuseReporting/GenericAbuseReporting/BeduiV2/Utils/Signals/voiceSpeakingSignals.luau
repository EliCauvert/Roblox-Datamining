local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local Context = ReactModule.createContext(nil)

local function createVoiceSpeakingStore() --[[ Line: 17 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local t = {}
	local ClockTimes = {}
	
	local function _() --[[ Line: 22 | Named "pruneCache" ]]
		-- upvalues: ClockTimes (copy), t (copy)
		local ClockTime = os.clock()
		
		for i, clockTime in ClockTimes do
			if ClockTime - clockTime > 300 then
				t[i] = nil
				ClockTimes[i] = nil
			end
		end
	end
	
	return {
		getIsSpeaking = function(Key) --[[ Line: 32 ]]
			-- upvalues: ClockTimes (copy), t (copy), SignalsModule (upval), Signal (copy)
			ClockTimes[Key] = os.clock()
			
			if not t[Key] then
				t[Key] = SignalsModule.createComputed(function(p1): boolean --[[ Line: 35 ]]
					-- upvalues: Signal (upval), Key (copy)
					return Signal(p1)[Key] == true
				end)
			end
			return t[Key]
		end,
		setParticipants = function(p1) --[[ Line: 43 ]]
			-- upvalues: ClockTimes (copy), t (copy), Signal2 (copy)
			local ClockTime = os.clock()
			
			for i, clockTime in ClockTimes do
				if ClockTime - clockTime > 300 then
					t[i] = nil
					ClockTimes[i] = nil
				end
			end
			Signal2(p1)
		end
	}
end

local function buildParticipantsMap(Participants) --[[ Line: 54 ]]
	local t = {}
	
	for i, participant in pairs(Participants) do
		t[tostring(i)] = participant.isSignalActive == true
	end
	return t
end

return {
	useVoiceSpeakingStore = function() --[[ Line: 62 ]]
		-- upvalues: ReactModule (copy), Context (copy), createVoiceSpeakingStore (copy), buildParticipantsMap (copy)
		local UseContextResult = ReactModule.useContext(Context)
		local UseRefResult = ReactModule.useRef(nil)
		
		if not UseRefResult.current then
			UseRefResult.current = createVoiceSpeakingStore()
		end
		local Current = UseRefResult.current
		ReactModule.useEffect(function() --[[ Line: 71 ]]
			-- upvalues: UseContextResult (copy), Current (copy), buildParticipantsMap (upval)
			if not UseContextResult then return end
			if UseContextResult.participants then
				Current.setParticipants((buildParticipantsMap(UseContextResult.participants)))
			end
			local EventConnection = UseContextResult.participantsUpdate.Event:Connect(function(p1) --[[ Line: 80 ]]
				-- upvalues: Current (upval), buildParticipantsMap (upval)
				Current.setParticipants((buildParticipantsMap(p1)))
			end)
			
			return function() --[[ Line: 84 ]]
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		end, { UseContextResult, Current.setParticipants })
		
		return Current
	end,
	createVoiceSpeakingStore = createVoiceSpeakingStore,
	VoiceChatServiceManagerContext = Context
}