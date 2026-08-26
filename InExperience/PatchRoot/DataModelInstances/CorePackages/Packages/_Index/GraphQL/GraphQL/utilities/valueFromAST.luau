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

local function valueFromAST(p1, p2, p3)
	-- upvalues: kind (ref), nullModule (ref), isNonNullType (ref), valueFromAST (ref), isListType (ref), isMissingVariable (write), isInputObjectType (ref), keyMap (ref), isLeafType (ref), invariant (ref), inspect (ref)
	local ofType, var1
	if not p1 then return end
	if p1.kind == kind.VARIABLE then
		local value = p1.name.value
		
		if p3 == nil or p3[value] == nil then return end
		local var2 = p3[value]
		
		if var2 == nullModule and isNonNullType(p2) then
			return
		end
		return var2
	elseif isNonNullType(p2) then
		if p1.kind == kind.NULL then
			return
		end
		return valueFromAST(p1, p2.ofType, p3)
	elseif p1.kind == kind.NULL then
		return nullModule
	elseif isListType(p2) then
		ofType = p2.ofType
		
		if p1.kind == kind.LIST then
			local t = {}
			
			for i, v in ipairs(p1.values) do
				if isMissingVariable(v, p3) then
					if not isNonNullType(ofType) then
						table.insert(t, nullModule)
						continue
					end
					return
				else
					var1 = valueFromAST(v, ofType, p3)
					
					if var1 ~= nil then
						table.insert(t, var1)
						continue
					end
					return
				end
			end
			return t
		else
			local var3 = valueFromAST(p1, ofType, p3)
			
			if var3 == nil then
				return
			end
			return { var3 }
		end
	elseif isInputObjectType(p2) then
		if p1.kind ~= kind.OBJECT then return end
		ofType = {}
		local var4 = keyMap(p1.fields, function(p4)
			return p4.name.value
		end)
		
		for i, v in ipairs(p2:getFields():values()) do
			var1 = var4[v.name]
			
			if var1 and not isMissingVariable(var1.value, p3) then
				local var5 = valueFromAST(var1.value, v.type, p3)
				
				if var5 ~= nil then
					ofType[v.name] = var5
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
	elseif not isLeafType(p2) then
		invariant(false, "Unexpected input type: " .. inspect(p2))
		
		return
	end
	ofType = nil
	
	if not pcall(function()
		-- upvalues: ofType (write), p2 (ref), p1 (ref), p3 (ref)
		ofType = p2:parseLiteral(p1, p3)
	end) then return end
	if ofType == nil then
		return
	end
	return ofType
end

isMissingVariable = function(p4, p5)
	-- upvalues: kind (ref)
	return p4.kind == kind.VARIABLE and (if p5 ~= nil then p5[p4.name.value] == nil else true)
end

return { valueFromAST = valueFromAST }