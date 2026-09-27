local debugMyStatsExperienceAgentSpec = game:DefineFastFlag("DebugMyStatsExperienceAgentSpec", false)
local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local _ = require(script.Parent.Types.acpSession)
local var1, var2 = signalsModule.createSignal({})
local var3, var4 = signalsModule.createSignal({})

local function _(p1)
	return if p1 == nil or p1 == "" or p1 == "latest" then "" else p1
end

local function getState(p1, p2)
	-- upvalues: var1 (ref)
	local var5 = if p1 ~= nil then nil else var1(p2 or false)[p1]
	
	return {
		isSet = var5 ~= nil,
		specVersion = if var5 == "" then nil else var5
	}
end

local function isPending(p1)
	-- upvalues: var3 (ref)
	return p1 ~= nil and var3(false)[p1] == true
end

local _ = function(p1, p2)
	-- upvalues: var1 (ref), var2 (ref)
	local cloned = table.clone(var1(false))
	cloned[p1] = if p2 == nil or p2 == "" or p2 == "latest" then "" else p2
	var2(cloned)
end

local _ = function(value, p1)
	-- upvalues: var3 (ref), var4 (ref)
	if (value ~= nil and var3(false)[value] == true) == p1 then return end
	local cloned = table.clone(var3(false))
	
	if p1 then
		cloned[value] = true
	else
		cloned[value] = nil
	end
	var4(cloned)
end

local function getKey(p1)
	return if p1 == nil or p1 == "" then nil else `session:{p1}`
end

local var5 = 0

local function buildPromptPayload(p1)
	return {
		specVersion = p1.specVersion or "",
		clientToolConfig = { mode = "exclude", tools = {} }
	}
end

return {
	isEnabled = function()
		-- upvalues: debugMyStatsExperienceAgentSpec (ref)
		return debugMyStatsExperienceAgentSpec
	end,
	getKey = getKey,
	createPendingKey = function()
		-- upvalues: var5 (write)
		var5 += 1
		
		return `pending:{var5}`
	end,
	getState = getState,
	getStateSignal = function(value)
		-- upvalues: signalsModule (ref), var1 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: value (ref), var1 (copy)
			local var6 = if value ~= nil then nil else var1(p1 or false)[value]
			
			return {
				isSet = var6 ~= nil,
				specVersion = if var6 == "" then nil else var6
			}
		end)
	end,
	get = function(p1)
		-- upvalues: var1 (ref)
		local var6 = if p1 ~= nil then nil else var1(false)[p1]
		
		return ({
			isSet = var6 ~= nil,
			specVersion = if var6 == "" then nil else var6
		}).specVersion
	end,
	has = function(p1)
		-- upvalues: var1 (ref)
		local var6 = if p1 ~= nil then nil else var1(false)[p1]
		
		return ({
			isSet = var6 ~= nil,
			specVersion = if var6 == "" then nil else var6
		}).isSet
	end,
	isPending = isPending,
	set = function(value, p1)
		-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref)
		if value == nil then return end
		local cloned = table.clone(var1(false))
		cloned[value] = if p1 == nil or p1 == "" or p1 == "latest" then "" else p1
		var2(cloned)
		
		if (value ~= nil and var3(false)[value] == true) == true then
			return
		end
		local cloned_1 = table.clone(var3(false))
		cloned_1[value] = true
		var4(cloned_1)
	end,
	hydrate = function(p1, p2)
		-- upvalues: var3 (ref), var1 (ref), var2 (ref)
		if p1 ~= nil then
			if p1 ~= nil and var3(false)[p1] == true then return end
			local cloned = table.clone(var1(false))
			cloned[p1] = if p2 == nil or p2 == "" or p2 == "latest" then "" else p2
			var2(cloned)
			
			return
		end
	end,
	clear = function(p1)
		-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref)
		if p1 == nil then return end
		local cloned = table.clone(var1(false))
		cloned[p1] = nil
		var2(cloned)
		
		if (p1 ~= nil and var3(false)[p1] == true) == false then
			return
		end
		local cloned_1 = table.clone(var3(false))
		cloned_1[p1] = nil
		var4(cloned_1)
	end,
	consumePending = function(p1)
		-- upvalues: var3 (ref), var4 (ref)
		if p1 ~= nil then
			if not (p1 ~= nil and var3(false)[p1] == true) then return end
			if (p1 ~= nil and var3(false)[p1] == true) == false then
				return
			end
			local cloned = table.clone(var3(false))
			cloned[p1] = nil
			var4(cloned)
			
			return
		end
	end,
	move = function(p1, p2)
		-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref)
		local var6 = var1(false)
		
		if p1 == nil or p2 == nil or (var6[p1] == nil or p1 == p2) then return end
		local cloned = table.clone(var6)
		cloned[p2] = cloned[p1]
		cloned[p1] = nil
		var2(cloned)
		local var7 = p1 ~= nil and var3(false)[p1] == true
		local var8 = p1 ~= nil and var3(false)[p1] == true
		
		if var8 ~= false then
			var8 = table.clone(var3(false))
			var8[p1] = nil
			var4(var8)
		end
		if (p2 ~= nil and var3(false)[p2] == true) == var7 then return end
		local cloned_1 = table.clone(var3(false))
		
		if var7 then
			cloned_1[p2] = true
		else
			cloned_1[p2] = nil
		end
		var4(cloned_1)
	end,
	getExperiment = function(p1)
		-- upvalues: var1 (ref), debugMyStatsExperienceAgentSpec (ref)
		local var6 = if p1 ~= nil then nil else var1(false)[p1]
		local t = {
			isSet = var6 ~= nil,
			specVersion = if var6 == "" then nil else var6
		}
		
		return if debugMyStatsExperienceAgentSpec and t.specVersion ~= nil then {
			specVersion = t.specVersion,
			clientToolConfig = { mode = "exclude", tools = {} }
		} else nil
	end,
	getPromptExperiment = function(p1)
		-- upvalues: var1 (ref), debugMyStatsExperienceAgentSpec (ref), var3 (ref), buildPromptPayload (ref)
		local var6 = if p1 ~= nil then nil else var1(false)[p1]
		local t = {
			isSet = var6 ~= nil,
			specVersion = if var6 == "" then nil else var6
		}
		
		if debugMyStatsExperienceAgentSpec then
			return if (p1 ~= nil and var3(false)[p1] == true) and t.isSet then buildPromptPayload(t) else nil
		end
	end
}