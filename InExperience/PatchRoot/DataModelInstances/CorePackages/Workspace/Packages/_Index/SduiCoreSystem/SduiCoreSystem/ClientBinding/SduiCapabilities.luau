local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local sduiCapabilityFlagsModule = require(sduiCoreSystem.ClientBinding.SduiCapabilityFlags)
local t = {
	isEnabled = function(p0)
		-- upvalues: sduiCapabilityFlagsModule (ref)
		return sduiCapabilityFlagsModule[p0] == true
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
		local var6 = capability.fromName(v)
		
		if var6 == nil then
			warn(`SduiCapabilities: unknown capability name {v}`)
		else
			table.insert(t, capability.toNumber(var6))
		end
	end
	return t
end

function t.createQueryValue(p2)
	-- upvalues: resolveNamesToNumbers (ref)
	local var7 = resolveNamesToNumbers(p2)
	
	if #var7 == 0 then
		return nil
	end
	table.sort(var7)
	local list = table.create(#var7)
	
	for i, v in var7 do
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
	local var10 = t.createQueryValue(t_1)
	
	if var10 ~= nil then
		p3.enabledCapabilities = var10
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
	local var12 = resolveNamesToNumbers(t_1)
	table.sort(var12)
	
	return var12
end

function t.addAllToQueryParams(p6)
	-- upvalues: t (ref)
	local var13 = t.createQueryValue(t.getEnabledCapabilities())
	
	if var13 ~= nil then
		p6.enabledCapabilities = var13
	end
end

return t