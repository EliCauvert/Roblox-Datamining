local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local var1 = reactModule.createContext(nil)

local function createVoiceSpeakingStore()
	-- upvalues: signalsModule (ref)
	local var2, var3 = signalsModule.createSignal({})
	local t = {}
	local t_1 = {}
	
	local function _()
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
		getIsSpeaking = function(p1)
			-- upvalues: t_1 (ref), t (ref), signalsModule (copy), var2 (ref)
			t_1[p1] = os.clock()
			
			if not t[p1] then
				t[p1] = signalsModule.createComputed(function(p2)
					-- upvalues: var2 (copy), p1 (ref)
					return var2(p2)[p1] == true
				end)
			end
			return t[p1]
		end,
		setParticipants = function(value)
			-- upvalues: t_1 (ref), t (ref), var3 (ref)
			local processTime = os.clock()
			
			for i, v in t_1 do
				if processTime - v > 300 then
					t[i] = nil
					t_1[i] = nil
				end
			end
			var3(value)
		end
	}
end

local function buildParticipantsMap(p1)
	local t = {}
	
	for i, v in pairs(p1) do
		t[tostring(i)] = v.isSignalActive == true
	end
	return t
end

return {
	useVoiceSpeakingStore = function()
		-- upvalues: reactModule (ref), var1 (ref), createVoiceSpeakingStore (ref), buildParticipantsMap (ref)
		local var4 = reactModule.useContext(var1)
		local var5 = reactModule.useRef(nil)
		
		if not var5.current then
			var5.current = createVoiceSpeakingStore()
		end
		local current = var5.current
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), current (ref), buildParticipantsMap (copy)
			if not var4 then return end
			if var4.participants then
				current.setParticipants(buildParticipantsMap(var4.participants))
			end
			local eventConnection = var4.participantsUpdate.Event:Connect(function(p2)
				-- upvalues: current (copy), buildParticipantsMap (copy)
				current.setParticipants(buildParticipantsMap(p2))
			end)
			
			return function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end, { var4, current.setParticipants })
		
		return current
	end,
	createVoiceSpeakingStore = createVoiceSpeakingStore,
	VoiceChatServiceManagerContext = var1
}