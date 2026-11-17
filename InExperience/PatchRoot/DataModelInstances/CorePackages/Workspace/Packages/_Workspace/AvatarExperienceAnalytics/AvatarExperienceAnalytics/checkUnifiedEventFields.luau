local UnifiedEventTypesModule = require(script.Parent.Generated.UnifiedEventTypes)

local function _(p1, p2): boolean
	local ToEnumFunction = p1.toEnum
	
	if ToEnumFunction == nil then
		local LuauType = p1.luauType
		
		return LuauType == nil or type(p2) == LuauType
	else
		return type(p2) == "number" and ToEnumFunction(p2) ~= nil
	end
end

local function hasValidValues(p1): boolean
	-- upvalues: UnifiedEventTypesModule (copy)
	for i, payloadKeyCheck in UnifiedEventTypesModule.PayloadKeyChecks do
		local v1 = p1[i]
		
		if v1 ~= nil then
			local ToEnumFunction = payloadKeyCheck.toEnum
			local HasToEnumResult = nil
			
			if ToEnumFunction == nil then
				local LuauType = payloadKeyCheck.luauType
				HasToEnumResult = LuauType == nil or type(v1) == LuauType
			else
				HasToEnumResult = type(v1) == "number" and ToEnumFunction(v1) ~= nil
			end
			if not HasToEnumResult then
				return false
			end
		end
	end
	return true
end

local _ = function(p2, List): boolean
	for _, value in List do
		if p2[value] == nil then
			return false
		end
	end
	return true
end

local _ = function(p3, List): boolean
	for _, value in List do
		if p3[value] ~= nil then
			return true
		end
	end
	return false
end

local _ = function(p4, p5): boolean
	for _, action in p4.actions do
		if action == p5 then
			return true
		end
	end
	return false
end

local function matchesShape(p6, Action, p7): boolean
	local Flag = false
	
	for _, action in p7.actions do
		if action == Action then
			Flag = true
			break
		end
	end
	if Flag then
		local Flag1 = true
		
		for _, value in p7.required do
			if p6[value] == nil then
				Flag1 = false
				break
			end
		end
		if Flag1 then
			local Flag2 = false
			
			for _, value1 in p7.forbidden do
				if p6[value1] ~= nil then
					Flag2 = true
					break
				end
			end
			if not Flag2 then
				local AnyOf = p7.anyOf
				local Flag3 = true
				
				if AnyOf ~= nil then
					for _, value2 in AnyOf do
						if p6[value2] ~= nil then
							return true
						end
					end
					Flag3 = false
				end
				return Flag3
			end
		end
	end
	return false
end

return function(p8): boolean
	-- upvalues: hasValidValues (copy), UnifiedEventTypesModule (copy), matchesShape (copy)
	if not hasValidValues(p8) then
		return false
	end
	for _, payloadShape in UnifiedEventTypesModule.PayloadShapes do
		if matchesShape(p8, p8.action, payloadShape) then
			return true
		end
	end
	return false
end