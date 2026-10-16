local DebugMyStatsExperienceAgentSpec = game:DefineFastFlag("DebugMyStatsExperienceAgentSpec", false)
local SignalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.Types.acpSession)
local Signal, Signal2 = SignalsModule.createSignal({})
local Signal1, Signal2_1 = SignalsModule.createSignal({})

local function _(Key, p1) --[[ Line: 36 | Named "writeDisplay" ]]
	-- upvalues: Signal (copy), Signal2 (copy)
	local Copy = table.clone(Signal(false))
	Copy[Key] = if p1 == nil or p1 == "" or p1 == "latest" then "" else p1
	Signal2(Copy)
end

local _ = function(Key, p1) --[[ Line: 42 | Named "setPendingFlag" ]]
	-- upvalues: Signal1 (copy), Signal2_1 (copy)
	if (Key ~= nil and Signal1(false)[Key] == true) == p1 then return end
	local Copy = table.clone(Signal1(false))
	
	if p1 then
		Copy[Key] = true
	else
		Copy[Key] = nil
	end
	Signal2_1(Copy)
end

local Count = 0

local function buildPromptPayload(p1) --[[ Line: 106 ]]
	return {
		specVersion = p1.specVersion or "",
		clientToolConfig = { mode = "exclude", tools = {} }
	}
end

return {
	isEnabled = function() --[[ Line: 117 ]]
		-- upvalues: DebugMyStatsExperienceAgentSpec (copy)
		return DebugMyStatsExperienceAgentSpec
	end,
	getKey = function(p1) --[[ Line: 58 ]]
		return if p1 == nil or p1 == "" then nil else `session:{p1}`
	end,
	normalize = function(p1) --[[ Line: 20 ]]
		return if p1 == nil or p1 == "" or p1 == "latest" then "" else p1
	end,
	createPendingKey = function(): string --[[ Line: 67 ]]
		-- upvalues: Count (ref)
		Count += 1
		
		return `pending:{Count}`
	end,
	getState = function(p1, p2) --[[ Line: 24 ]]
		-- upvalues: Signal (copy)
		local SignalResultEntry = if p1 == nil then nil else Signal(p2 or false)[p1]
		
		return {
			isSet = SignalResultEntry ~= nil,
			specVersion = if SignalResultEntry == "" then nil else SignalResultEntry
		}
	end,
	getStateSignal = function(p1) --[[ Line: 124 ]]
		-- upvalues: SignalsModule (copy), Signal (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 125 ]]
			-- upvalues: p1 (copy), Signal (upval)
			local SignalResultEntry = if p1 == nil then nil else Signal(p2 or false)[p1]
			
			return {
				isSet = SignalResultEntry ~= nil,
				specVersion = if SignalResultEntry == "" then nil else SignalResultEntry
			}
		end)
	end,
	get = function(p1) --[[ Line: 129 ]]
		-- upvalues: Signal (copy)
		local SignalResultEntry = if p1 == nil then nil else Signal(false)[p1]
		
		return ({
			isSet = SignalResultEntry ~= nil,
			specVersion = if SignalResultEntry == "" then nil else SignalResultEntry
		}).specVersion
	end,
	has = function(p1) --[[ Line: 132 ]]
		-- upvalues: Signal (copy)
		local SignalResultEntry = if p1 == nil then nil else Signal(false)[p1]
		
		return ({
			isSet = SignalResultEntry ~= nil,
			specVersion = if SignalResultEntry == "" then nil else SignalResultEntry
		}).isSet
	end,
	isPending = function(p1): boolean --[[ Line: 32 ]]
		-- upvalues: Signal1 (copy)
		return p1 ~= nil and Signal1(false)[p1] == true
	end,
	set = function(Key, p1) --[[ Line: 72 ]]
		-- upvalues: Signal (copy), Signal2 (copy), Signal1 (copy), Signal2_1 (copy)
		if Key == nil then return end
		local Copy = table.clone(Signal(false))
		Copy[Key] = if p1 == nil or p1 == "" or p1 == "latest" then "" else p1
		Signal2(Copy)
		
		if Key == nil or Signal1(false)[Key] ~= true then
			local Copy1 = table.clone(Signal1(false))
			Copy1[Key] = true
			Signal2_1(Copy1)
			
			return
		end
	end,
	hydrate = function(Key, p1) --[[ Line: 82 ]]
		-- upvalues: Signal1 (copy), Signal (copy), Signal2 (copy)
		if Key ~= nil and (Key == nil or Signal1(false)[Key] ~= true) then
			local Copy = table.clone(Signal(false))
			Copy[Key] = if p1 == nil or p1 == "" or p1 == "latest" then "" else p1
			Signal2(Copy)
			
			return
		end
	end,
	clear = function(Key) --[[ Line: 89 ]]
		-- upvalues: Signal (copy), Signal2 (copy), Signal1 (copy), Signal2_1 (copy)
		if Key == nil then return end
		local Copy = table.clone(Signal(false))
		Copy[Key] = nil
		Signal2(Copy)
		
		if Key ~= nil and Signal1(false)[Key] == true then
			local Copy1 = table.clone(Signal1(false))
			Copy1[Key] = nil
			Signal2_1(Copy1)
			
			return
		end
	end,
	consumePending = function(Key) --[[ Line: 99 ]]
		-- upvalues: Signal1 (copy), Signal2_1 (copy)
		if Key == nil or (Key == nil or Signal1(false)[Key] ~= true) then return end
		if Key ~= nil and Signal1(false)[Key] == true then
			local Copy = table.clone(Signal1(false))
			Copy[Key] = nil
			Signal2_1(Copy)
			
			return
		end
	end,
	move = function(Key, Key1) --[[ Line: 140 ]]
		-- upvalues: Signal (copy), Signal2 (copy), Signal1 (copy), Signal2_1 (copy)
		local SignalResult = Signal(false)
		
		if Key == nil or Key1 == nil or SignalResult[Key] == nil or Key == Key1 then return end
		local Copy = table.clone(SignalResult)
		Copy[Key1] = Copy[Key]
		Copy[Key] = nil
		Signal2(Copy)
		local IsSignalResultEntry: boolean = Key ~= nil and Signal1(false)[Key] == true
		
		if Key ~= nil and Signal1(false)[Key] == true then
			local Copy1 = table.clone(Signal1(false))
			Copy1[Key] = nil
			Signal2_1(Copy1)
		end
		if (Key1 ~= nil and Signal1(false)[Key1] == true) == IsSignalResultEntry then return end
		local Copy2 = table.clone(Signal1(false))
		
		if IsSignalResultEntry then
			Copy2[Key1] = true
		else
			Copy2[Key1] = nil
		end
		Signal2_1(Copy2)
	end,
	getExperiment = function(p1) --[[ Line: 155 ]]
		-- upvalues: Signal (copy), DebugMyStatsExperienceAgentSpec (copy)
		local SignalResultEntry = if p1 == nil then nil else Signal(false)[p1]
		local config = {
			isSet = SignalResultEntry ~= nil,
			specVersion = if SignalResultEntry == "" then nil else SignalResultEntry
		}
		
		return if DebugMyStatsExperienceAgentSpec and config.specVersion ~= nil then {
			specVersion = config.specVersion,
			clientToolConfig = { mode = "exclude", tools = {} }
		} else nil
	end,
	getPromptExperiment = function(p1) --[[ Line: 172 ]]
		-- upvalues: Signal (copy), DebugMyStatsExperienceAgentSpec (copy), Signal1 (copy), buildPromptPayload (copy)
		local SignalResultEntry = if p1 == nil then nil else Signal(false)[p1]
		local config = {
			isSet = SignalResultEntry ~= nil,
			specVersion = if SignalResultEntry == "" then nil else SignalResultEntry
		}
		
		if DebugMyStatsExperienceAgentSpec and (p1 ~= nil and Signal1(false)[p1] == true and config.isSet) then
			return (buildPromptPayload(config))
		else
			return nil
		end
	end
}