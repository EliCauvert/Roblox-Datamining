local DebugMyStatsExperienceAgentSpec = game:DefineFastFlag("DebugMyStatsExperienceAgentSpec", false)
local Parent = script:FindFirstAncestor("DataHydration").Parent
local SignalsModule = require(Parent.Signals)
local _ = require(script.Parent.Types.acpSession)
local FFlagBuildExperienceModelPickerData = require(Parent.SharedFlags).FFlagBuildExperienceModelPickerData
local CreateSessionScopedSignal = if FFlagBuildExperienceModelPickerData and DebugMyStatsExperienceAgentSpec then require(Parent.SignalsUtils).createSessionScopedSignal else SignalsModule.createSignal
local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignal({})
local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignal({})
local t = {}

local function v11(_)
	-- upvalues: t (copy)
	return t
end

local function v12(_) end

if FFlagBuildExperienceModelPickerData and DebugMyStatsExperienceAgentSpec then
	v11, v12 = CreateSessionScopedSignal({})
end
local function getState(Key, p1)
	-- upvalues: SessionScopedSignal (copy)
	local SessionScopedSignalResultEntry = if Key == nil then nil else SessionScopedSignal(p1 or false)[Key]
	
	return {
		isSet = SessionScopedSignalResultEntry ~= nil,
		specVersion = if SessionScopedSignalResultEntry == nil or SessionScopedSignalResultEntry.specVersion == "" then nil else SessionScopedSignalResultEntry.specVersion
	}
end

local function writeDisplay(Key, p1, p2)
	-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
	local Copy = table.clone(SessionScopedSignal(false))
	local Copy1 = table.clone(p2 or (Copy[Key] or { clientToolConfig = { mode = "exclude", tools = {} } }))
	Copy1.specVersion = if p1 == nil or p1 == "" or p1 == "latest" then "" else p1
	Copy[Key] = Copy1
	SessionScopedSignal2(Copy)
end

local function _(Key, p1)
	-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy)
	if (Key ~= nil and SessionScopedSignal1(false)[Key] == true) == p1 then return end
	local Copy = table.clone(SessionScopedSignal1(false))
	
	if p1 then
		Copy[Key] = true
	else
		Copy[Key] = nil
	end
	SessionScopedSignal2_1(Copy)
end

local Count = 0

local _ = function(p1)
	-- upvalues: SessionScopedSignal (copy), v11 (ref)
	local Copy = table.clone(SessionScopedSignal(false)[p1])
	
	if v11(false)[p1] == false then
		Copy.specVersion = ""
	end
	return Copy
end

return {
	isEnabled = function()
		-- upvalues: DebugMyStatsExperienceAgentSpec (copy)
		return DebugMyStatsExperienceAgentSpec
	end,
	getKey = function(p1)
		return if p1 == nil or p1 == "" then nil else `session:{p1}`
	end,
	selectInternal = function(Key, p1)
		-- upvalues: getState (copy), writeDisplay (copy), v11 (ref), v12 (ref), SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy)
		if not getState(Key).isSet then
			writeDisplay(Key, nil)
		end
		local Copy = table.clone(v11(false))
		Copy[Key] = p1
		v12(Copy)
		
		if Key == nil or SessionScopedSignal1(false)[Key] ~= true then
			local Copy1 = table.clone(SessionScopedSignal1(false))
			Copy1[Key] = true
			SessionScopedSignal2_1(Copy1)
			
			return
		end
	end,
	getInternalSelection = function(p1, p2)
		-- upvalues: v11 (ref), getState (copy)
		local v1 = v11(p2)[p1]
		local State = getState(p1, p2)
		
		return {
			isSelected = if v1 == nil then State.specVersion ~= nil else v1,
			previewHash = State.specVersion
		}
	end,
	hasInternalEdit = function(p1): boolean
		-- upvalues: v11 (ref)
		return p1 ~= nil and v11(false)[p1] ~= nil
	end,
	normalize = function(p1)
		return if p1 == nil or p1 == "" or p1 == "latest" then "" else p1
	end,
	createPendingKey = function(): string
		-- upvalues: Count (ref)
		Count += 1
		
		return `pending:{Count}`
	end,
	getState = getState,
	getStateSignal = function(p1)
		-- upvalues: SignalsModule (copy), getState (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: getState (upval), p1 (copy)
			return (getState(p1, p2))
		end)
	end,
	get = function(p1)
		-- upvalues: getState (copy)
		return getState(p1, nil).specVersion
	end,
	has = function(p1)
		-- upvalues: getState (copy)
		return getState(p1, nil).isSet
	end,
	isPending = function(p1): boolean
		-- upvalues: SessionScopedSignal1 (copy)
		return p1 ~= nil and SessionScopedSignal1(false)[p1] == true
	end,
	set = function(Key, p1)
		-- upvalues: writeDisplay (copy), SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy)
		if Key == nil then return end
		writeDisplay(Key, p1)
		
		if Key == nil or SessionScopedSignal1(false)[Key] ~= true then
			local Copy = table.clone(SessionScopedSignal1(false))
			Copy[Key] = true
			SessionScopedSignal2_1(Copy)
			
			return
		end
	end,
	hydrate = function(p1, p2, p3)
		-- upvalues: SessionScopedSignal1 (copy), v11 (ref), writeDisplay (copy)
		if p1 ~= nil and ((p1 == nil or SessionScopedSignal1(false)[p1] ~= true) and v11(false)[p1] == nil) then
			writeDisplay(p1, p2, p3)
			
			return
		end
	end,
	clear = function(Key)
		-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy), SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy), v11 (ref), v12 (ref)
		if Key == nil then return end
		local Copy = table.clone(SessionScopedSignal(false))
		Copy[Key] = nil
		SessionScopedSignal2(Copy)
		
		if Key ~= nil and SessionScopedSignal1(false)[Key] == true then
			local Copy1 = table.clone(SessionScopedSignal1(false))
			Copy1[Key] = nil
			SessionScopedSignal2_1(Copy1)
		end
		local Copy2 = table.clone(v11(false))
		Copy2[Key] = nil
		v12(Copy2)
	end,
	consumePending = function(Key)
		-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy)
		if Key == nil or (Key == nil or SessionScopedSignal1(false)[Key] ~= true) then return end
		if Key ~= nil and SessionScopedSignal1(false)[Key] == true then
			local Copy = table.clone(SessionScopedSignal1(false))
			Copy[Key] = nil
			SessionScopedSignal2_1(Copy)
			
			return
		end
	end,
	move = function(Key, Key1)
		-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy), v11 (ref), v12 (ref), SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy)
		local SessionScopedSignalResult = SessionScopedSignal(false)
		
		if Key == nil or Key1 == nil or SessionScopedSignalResult[Key] == nil or Key == Key1 then return end
		local Copy = table.clone(SessionScopedSignalResult)
		Copy[Key1] = Copy[Key]
		Copy[Key] = nil
		SessionScopedSignal2(Copy)
		local Copy1 = table.clone(v11(false))
		Copy1[Key1] = Copy1[Key]
		Copy1[Key] = nil
		v12(Copy1)
		local IsSessionScopedSignalResultEntry: boolean = Key ~= nil and SessionScopedSignal1(false)[Key] == true
		
		if Key ~= nil and SessionScopedSignal1(false)[Key] == true then
			local Copy2 = table.clone(SessionScopedSignal1(false))
			Copy2[Key] = nil
			SessionScopedSignal2_1(Copy2)
		end
		if (Key1 ~= nil and SessionScopedSignal1(false)[Key1] == true) == IsSessionScopedSignalResultEntry then return end
		local Copy3 = table.clone(SessionScopedSignal1(false))
		
		if IsSessionScopedSignalResultEntry then
			Copy3[Key1] = true
		else
			Copy3[Key1] = nil
		end
		SessionScopedSignal2_1(Copy3)
	end,
	getExperiment = function(p1)
		-- upvalues: getState (copy), DebugMyStatsExperienceAgentSpec (copy), SessionScopedSignal (copy), v11 (ref)
		local State = getState(p1, nil)
		
		if not DebugMyStatsExperienceAgentSpec or State.specVersion == nil then
			return nil
		end
		local Copy = table.clone(SessionScopedSignal(false)[p1])
		
		if v11(false)[p1] == false then
			Copy.specVersion = ""
		end
		return Copy
	end,
	getPromptExperiment = function(p1)
		-- upvalues: getState (copy), DebugMyStatsExperienceAgentSpec (copy), SessionScopedSignal1 (copy), SessionScopedSignal (copy), v11 (ref)
		local State = getState(p1, nil)
		
		if not DebugMyStatsExperienceAgentSpec or (p1 == nil or SessionScopedSignal1(false)[p1] ~= true or not State.isSet) then
			return nil
		end
		local Copy = table.clone(SessionScopedSignal(false)[p1])
		
		if v11(false)[p1] == false then
			Copy.specVersion = ""
		end
		return Copy
	end
}