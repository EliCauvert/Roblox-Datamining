local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local sduiCapabilityFlagsModule = require(sduiCoreSystem.ClientBinding.SduiCapabilityFlags)
local t = {
	isEnabled = function(p1)
		-- upvalues: sduiCapabilityFlagsModule (ref)
		return sduiCapabilityFlagsModule[p1] == true
	end,
	getEnabledCapabilities = function()
		-- upvalues: sduiCapabilityFlagsModule (ref)
		local t = {}
		
		for i, v in sduiCapabilityFlagsModule do
			if v then
				table.insert(t, i)
			end
		end
		return t
	end
}

local function resolveNamesToNumbers(p1)
	-- upvalues: parent (ref)
	if #p1 == 0 then
		return {}
	end
	local capability = require(parent.ServiceContractsProto).apppageplatform.shared.capability.Capability
	local t = {}
	
	for i, v in p1 do
		local var1 = capability.fromName(v)
		
		if var1 == nil then
			warn(`SduiCapabilities: unknown capability name {v}`)
		else
			table.insert(t, capability.toNumber(var1))
		end
	end
	return t
end

function t.createQueryValue(p2)
	-- upvalues: resolveNamesToNumbers (ref)
	local var2 = resolveNamesToNumbers(p2)
	
	if #var2 == 0 then
		return nil
	end
	table.sort(var2)
	local list = table.create(#var2)
	
	for i, v in var2 do
		table.insert(list, tostring(v))
	end
	return table.concat(list, ",")
end

function t.addToQueryParams(p3, p4)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p4 do
		if t.isEnabled(v) then
			table.insert(t_1, v)
		end
	end
	local var3 = t.createQueryValue(t_1)
	
	if var3 ~= nil then
		p3.enabledCapabilities = var3
	end
end

function t.getEnabledCapabilityNumbers(p5)
	-- upvalues: t (ref), resolveNamesToNumbers (ref)
	local t_1 = {}
	
	for i, v in p5 do
		if t.isEnabled(v) then
			table.insert(t_1, v)
		end
	end
	local var4 = resolveNamesToNumbers(t_1)
	table.sort(var4)
	
	return var4
end

function t.addAllToQueryParams(p6)
	-- upvalues: t (ref)
	local var5 = t.createQueryValue(t.getEnabledCapabilities())
	
	if var5 ~= nil then
		p6.enabledCapabilities = var5
	end
end

return t