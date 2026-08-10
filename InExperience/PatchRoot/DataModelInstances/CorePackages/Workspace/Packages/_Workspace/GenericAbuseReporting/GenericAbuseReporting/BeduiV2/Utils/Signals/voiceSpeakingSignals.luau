local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local var2 = reactModule.createContext(nil)

local function createVoiceSpeakingStore() --[[ line: 17 ]]
	-- upvalues: signalsModule (ref)
	local var5, var6 = signalsModule.createSignal({})
	local t = {}
	local t_1 = {}
	
	local function _() --[[ line: 22 | named "pruneCache" ]]
		-- upvalues: t_1 (ref), t (ref)
		local processTime = os.clock()
		
		for i, v in t_1 do
			if processTime - v > 300 then
				t[i] = nil
				t_1[i] = nil
			end
		end
	end
	
	return {
		getIsSpeaking = function(p0) --[[ line: 32 ]]
			-- upvalues: t_1 (ref), t (ref), signalsModule (copy), var5 (ref)
			t_1[p0] = os.clock()
			
			if not t[p0] then
				t[p0] = signalsModule.createComputed(function(p1) --[[ line: 35 ]]
					-- upvalues: var5 (copy), p0 (ref)
					return var5(p1)[p0] == true
				end)
			end
			return t[p0]
		end,
		setParticipants = function(value) --[[ line: 43 ]]
			-- upvalues: t_1 (ref), t (ref), var6 (ref)
			local processTime = os.clock()
			
			for i, v in t_1 do
				if processTime - v > 300 then
					t[i] = nil
					t_1[i] = nil
				end
			end
			var6(value)
		end
	}
end

local function buildParticipantsMap(p2) --[[ line: 54 ]]
	local t = {}
	
	for i, v in pairs(p2) do
		t[tostring(i)] = v.isSignalActive == true
	end
	return t
end

return {
	useVoiceSpeakingStore = function() --[[ line: 62 ]]
		-- upvalues: reactModule (ref), var2 (ref), createVoiceSpeakingStore (ref), buildParticipantsMap (ref)
		local var12 = reactModule.useContext(var2)
		local var13 = reactModule.useRef(nil)
		
		if not var13.current then
			var13.current = createVoiceSpeakingStore()
		end
		local current = var13.current
		reactModule.useEffect(function() --[[ line: 71 ]]
			-- upvalues: var12 (ref), current (ref), buildParticipantsMap (copy)
			if not var12 then return end
			if var12.participants then
				current.setParticipants(buildParticipantsMap(var12.participants))
			end
			local eventConnection = var12.participantsUpdate.Event:Connect(function(p3) --[[ line: 80 ]]
				-- upvalues: current (copy), buildParticipantsMap (copy)
				current.setParticipants(buildParticipantsMap(p3))
			end)
			
			return function() --[[ line: 84 ]]
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end, { var12, current.setParticipants })
		
		return current
	end,
	createVoiceSpeakingStore = createVoiceSpeakingStore,
	VoiceChatServiceManagerContext = var2
}