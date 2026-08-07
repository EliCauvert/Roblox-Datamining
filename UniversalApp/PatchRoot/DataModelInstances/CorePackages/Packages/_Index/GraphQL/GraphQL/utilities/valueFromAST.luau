local parent = script.Parent.Parent
local _ = require(parent.jsutils.ObjMap)
local keyMap = require(parent.jsutils.keyMap).keyMap
local inspect = require(parent.jsutils.inspect).inspect
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.language.ast)
local kind = require(parent.language.kinds).Kind
local definitionModule = require(parent.type.definition)
local isLeafType = definitionModule.isLeafType
local isInputObjectType = definitionModule.isInputObjectType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local nullModule = require(parent.luaUtils.null)
local isMissingVariable = nil

local function valueFromAST(p0, p1, p2) --[[ line: 37 ]]
	-- upvalues: kind (ref), nullModule (ref), isNonNullType (ref), valueFromAST (ref), isListType (ref), isMissingVariable (write), isInputObjectType (ref), keyMap (ref), isLeafType (ref), invariant (ref), inspect (ref)
	local ofType, var6
	if not p0 then return end
	if p0.kind == kind.VARIABLE then
		local value = p0.name.value
		
		if p2 == nil or p2[value] == nil then return end
		local var4 = p2[value]
		
		if var4 == nullModule and isNonNullType(p1) then
			return
		end
		return var4
	elseif isNonNullType(p1) then
		if p0.kind == kind.NULL then
			return
		end
		return valueFromAST(p0, p1.ofType, p2)
	elseif p0.kind == kind.NULL then
		return nullModule
	elseif isListType(p1) then
		ofType = p1.ofType
		
		if p0.kind == kind.LIST then
			local t = {}
			
			for i, v in ipairs(p0.values) do
				if isMissingVariable(v, p2) then
					if not isNonNullType(ofType) then
						table.insert(t, nullModule)
						continue
					end
					return
				else
					var6 = valueFromAST(v, ofType, p2)
					
					if var6 ~= nil then
						table.insert(t, var6)
						continue
					end
					return
				end
			end
			return t
		else
			local var7 = valueFromAST(p0, ofType, p2)
			
			if var7 == nil then
				return
			end
			return { var7 }
		end
	elseif isInputObjectType(p1) then
		if p0.kind ~= kind.OBJECT then return end
		ofType = {}
		local var8 = keyMap(p0.fields, function(p3) --[[ line: 118 ]]
			return p3.name.value
		end)
		
		for i, v in ipairs(p1:getFields():values()) do
			var6 = var8[v.name]
			
			if var6 and not isMissingVariable(var6.value, p2) then
				local var9 = valueFromAST(var6.value, v.type, p2)
				
				if var9 ~= nil then
					ofType[v.name] = var9
					continue
				end
				return
			elseif v.defaultValue == nil then
				if isNonNullType(v.type) then return end
			else
				ofType[v.name] = v.defaultValue
			end
		end
		return ofType
	elseif not isLeafType(p1) then
		invariant(false, "Unexpected input type: " .. inspect(p1))
		
		return
	end
	ofType = nil
	
	if not pcall(function() --[[ line: 148 ]]
		-- upvalues: ofType (write), p1 (ref), p0 (ref), p2 (ref)
		ofType = p1:parseLiteral(p0, p2)
	end) then return end
	if ofType == nil then
		return
	end
	return ofType
end

isMissingVariable = function(p4, p5) --[[ line: 170 | named "isMissingVariable" ]]
	-- upvalues: kind (ref)
	return p4.kind == kind.VARIABLE and (if p5 ~= nil then p5[p4.name.value] == nil else true)
end

return { valueFromAST = valueFromAST }