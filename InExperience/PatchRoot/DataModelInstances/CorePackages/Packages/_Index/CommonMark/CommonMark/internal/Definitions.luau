local _ = require(script:FindFirstAncestor("CommonMark").node.DefinitionMap)
local DefinitionsModule = {}
DefinitionsModule.__index = DefinitionsModule

function DefinitionsModule.new()
	-- upvalues: DefinitionsModule (copy)
	return (setmetatable({ _definitionsByType = {} }, DefinitionsModule))
end

function DefinitionsModule:addDefinitions(p1)
	local Map = self:getMap(p1:getType())
	
	if Map == nil then
		self._definitionsByType[p1:getType()] = p1
		
		return
	else
		Map:addAll(p1)
	end
end

function DefinitionsModule:getDefinition(p1, p2)
	local Map = self:getMap(p1)
	
	return if Map == nil then nil else Map:get(p2)
end

function DefinitionsModule:getMap(Type)
	return self._definitionsByType[Type]
end

return DefinitionsModule