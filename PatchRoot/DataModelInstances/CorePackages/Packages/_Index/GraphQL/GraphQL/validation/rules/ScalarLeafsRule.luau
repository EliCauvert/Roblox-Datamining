-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local definitionModule = require(parent.type.definition)
local getNamedType = definitionModule.getNamedType
local isLeafType = definitionModule.isLeafType

return {
	ScalarLeafsRule = function(p0) --[[ line: 25 ]]
		-- upvalues: isLeafType (ref), getNamedType (ref), inspect (ref), graphQLError (ref)
		return {
			Field = function(_, p1) --[[ line: 27 ]]
				-- upvalues: p0 (ref), isLeafType (copy), getNamedType (copy), inspect (copy), graphQLError (copy)
				local type = p0:getType()
				local selectionSet = p1.selectionSet
				
				if type then
					if isLeafType(getNamedType(type)) then
						if selectionSet then
							p0:reportError(graphQLError.new(("Field \"%s\" must not have a selection since type \"%s\" has no subfields."):format(p1.name.value, inspect(type)), selectionSet))
							
							return
						end
					elseif not selectionSet then
						local value = p1.name.value
						p0:reportError(graphQLError.new(("Field \"%s\" of type \"%s\" must have a selection of subfields. Did you mean \"%s { ... }\"?"):format(value, inspect(type), value), p1))
					end
				end
			end
		}
	end
}