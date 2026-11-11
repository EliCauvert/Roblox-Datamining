local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SduiCapabilityFlagsModule = require(SduiCoreSystem.ClientBinding.SduiCapabilityFlags)

local function resolveNamesToNumbers(List)
	-- upvalues: Parent (copy)
	if #List == 0 then
		return {}
	end
	local Capability = require(Parent.ServiceContractsProto).apppageplatform.shared.capability.Capability
	local List1 = {}
	
	for _, value in List do
		local FromNameResult = Capability.fromName(value)
		
		if FromNameResult == nil then
			warn(`SduiCapabilities: unknown capability name {value}`)
		else
			table.insert(List1, Capability.toNumber(FromNameResult))
		end
	end
	return List1
end

local SduiCapabilitiesModule = {
	isEnabled = function(p1): boolean
		-- upvalues: SduiCapabilityFlagsModule (copy)
		return SduiCapabilityFlagsModule[p1] == true
	end,
	getEnabledCapabilities = function()
		-- upvalues: SduiCapabilityFlagsModule (copy)
		local List = {}
		
		for i, value in SduiCapabilityFlagsModule do
			if value then
				table.insert(List, i)
			end
		end
		return List
	end,
	createQueryValue = function(EnabledCapabilities): string?
		-- upvalues: resolveNamesToNumbers (copy)
		local ResolveNamesToNumbersResult = resolveNamesToNumbers(EnabledCapabilities)
		
		if #ResolveNamesToNumbersResult == 0 then
			return nil
		end
		table.sort(ResolveNamesToNumbersResult)
		local Buffer = table.create(#ResolveNamesToNumbersResult)
		
		for _, value in ResolveNamesToNumbersResult do
			table.insert(Buffer, (tostring(value)))
		end
		return table.concat(Buffer, ",")
	end
}

function SduiCapabilitiesModule.addToQueryParams(p1, List)
	-- upvalues: SduiCapabilitiesModule (copy)
	local List1 = {}
	
	for _, value in List do
		if SduiCapabilitiesModule.isEnabled(value) then
			table.insert(List1, value)
		end
	end
	local QueryValue = SduiCapabilitiesModule.createQueryValue(List1)
	
	if QueryValue ~= nil then
		p1.enabledCapabilities = QueryValue
	end
end

function SduiCapabilitiesModule.getEnabledCapabilityNumbers(List)
	-- upvalues: SduiCapabilitiesModule (copy), resolveNamesToNumbers (copy)
	local List1 = {}
	
	for _, value in List do
		if SduiCapabilitiesModule.isEnabled(value) then
			table.insert(List1, value)
		end
	end
	local ResolveNamesToNumbersResult = resolveNamesToNumbers(List1)
	table.sort(ResolveNamesToNumbersResult)
	
	return ResolveNamesToNumbersResult
end

function SduiCapabilitiesModule.addAllToQueryParams(p2)
	-- upvalues: SduiCapabilitiesModule (copy)
	local QueryValue = SduiCapabilitiesModule.createQueryValue(SduiCapabilitiesModule.getEnabledCapabilities())
	
	if QueryValue ~= nil then
		p2.enabledCapabilities = QueryValue
	end
end

return SduiCapabilitiesModule