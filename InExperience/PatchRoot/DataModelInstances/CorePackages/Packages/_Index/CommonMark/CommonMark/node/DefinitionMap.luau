local EscapingModule = require(script:FindFirstAncestor("CommonMark").internal.util.Escaping)
local DefinitionMapModule = {}
DefinitionMapModule.__index = DefinitionMapModule

function DefinitionMapModule.new(_type)
	-- upvalues: DefinitionMapModule (copy)
	return (setmetatable({ _type = _type, _keys = {}, _definitions = {} }, DefinitionMapModule))
end

local function _(p1, p2, p3)
	local Definition = p1._definitions[p2]
	
	if Definition == nil then
		table.insert(p1._keys, p2)
		p1._definitions[p2] = p3
		
		return nil
	else
		return Definition
	end
end

function DefinitionMapModule:getType()
	return self._type
end

function DefinitionMapModule:addAll(p1)
	for _, key in ipairs(p1._keys) do
		local Definition = p1._definitions[key]
		
		if self._definitions[key] == nil then
			table.insert(self._keys, key)
			self._definitions[key] = Definition
		end
	end
end

function DefinitionMapModule:putIfAbsent(p2, p3)
	-- upvalues: EscapingModule (copy)
	local NormalizeLabelContentResult = EscapingModule.normalizeLabelContent(p2)
	local Definition = self._definitions[NormalizeLabelContentResult]
	
	if Definition == nil then
		table.insert(self._keys, NormalizeLabelContentResult)
		self._definitions[NormalizeLabelContentResult] = p3
		
		return nil
	else
		return Definition
	end
end

function DefinitionMapModule:get(p2)
	-- upvalues: EscapingModule (copy)
	return self._definitions[EscapingModule.normalizeLabelContent(p2)]
end

function DefinitionMapModule:keySet()
	return table.clone(self._keys)
end

function DefinitionMapModule:values()
	local Buffer = table.create(#self._keys)
	
	for i, key in ipairs(self._keys) do
		Buffer[i] = self._definitions[key]
	end
	return Buffer
end

return DefinitionMapModule