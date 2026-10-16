local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function _(List, Value): boolean --[[ Line: 6 | Named "checkName" ]]
	return if type(List) == "table" then table.find(List, Value) ~= nil else List == Value
end

local _ = function(List) --[[ Line: 13 | Named "getReadableName" ]]
	return if type(List) == "table" then table.concat(List, " or ") elseif type(List) == "string" then List else "*"
end

local function validateInstancesFromSchema(Object, p1, p2, p3, MissingErrorKey, SkipInstanceContext) --[[ Line: 22 ]]
	-- upvalues: validateInstancesFromSchema (copy), ErrorSourceStringsModule (copy)
	p2[Object] = true
	
	if p1._ignoreDescendants then
		assert(not p1._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway")
		
		for _, descendant in Object:GetDescendants() do
			p2[descendant] = true
		end
		return
	else
		local Children = p1._children or {}
		local Flag = nil
		for _, child in Children do
			Flag = false
			
			for _, child1 in Object:GetChildren() do
				if p2[child1] == nil and child1.ClassName == child.ClassName then
					local NoName = child.Name == nil
					
					if not NoName then
						local Name = child.Name
						local Name1 = child1.Name
						NoName = if type(Name) == "table" then table.find(Name, Name1) ~= nil else Name == Name1
					end
					if NoName then
						validateInstancesFromSchema(child1, child, p2, p3, MissingErrorKey, SkipInstanceContext)
						Flag = true
						break
					end
				end
			end
			if not Flag and not child._optional then
				local Object1 = if SkipInstanceContext then nil else Object
				local MissingErrorKey1 = MissingErrorKey or ErrorSourceStringsModule.Keys.AssetSchemaMissingItem
				local Name = child.Name
				local config = {
					ParentPath = Object:GetFullName(),
					ExpectedClass = child.ClassName,
					ExpectedName = if type(Name) == "table" then table.concat(Name, " or ") elseif type(Name) == "string" then Name else "*"
				}
				local RequiredName: string = `missing required {child.ClassName}`
				local Named = nil
				
				if child.Name then
					local Name2 = child.Name
					Named = ` named '{if type(Name2) == "table" then table.concat(Name2, " or ") elseif type(Name2) == "string" then Name2 else "*"}'`
				else
					Named = ""
				end
				config.detail = RequiredName .. Named .. ` inside '{Object.Name}'`
				p3:fail(MissingErrorKey1, config, Object1)
			end
		end
	end
end

local function validateNoInstancesOutsideSchema(Object, p4, p5, UnauthorizedErrorKey, SkipInstanceContext) --[[ Line: 79 ]]
	-- upvalues: ErrorSourceStringsModule (copy)
	local List = {}
	
	for _, descendant in Object:GetDescendants() do
		if p4[descendant] == nil then
			table.insert(List, descendant:GetFullName())
		end
	end
	if #List > 0 then
		p5:fail(UnauthorizedErrorKey or ErrorSourceStringsModule.Keys.AssetSchemaUnexpectedItems, {
			UnexpectedDescendantPaths = table.concat(List, ", "),
			detail = `unauthorized instances found: {table.concat(List, ", ")}`
		}, if SkipInstanceContext then nil else Object)
	end
end

return function(p6, p7, p8, p9) --[[ Line: 103 | Named "validateInstanceTreeAgainstSchema" ]]
	-- upvalues: ErrorSourceStringsModule (copy), validateInstancesFromSchema (copy), validateNoInstancesOutsideSchema (copy)
	local MissingErrorKey = if p9 then p9.missingErrorKey else nil
	local UnauthorizedErrorKey = if p9 then p9.unauthorizedErrorKey else nil
	local SkipInstanceContext = if p9 then p9.skipInstanceContext else nil
	local t = {}
	
	if not (if p9 then p9.skipRootClassCheck else nil) then
		if p7.ClassName ~= p6.ClassName then
			p8:fail(ErrorSourceStringsModule.Keys.AssetSchemaWrongRootClass, { RootClass = p6.ClassName, ExpectedClass = p7.ClassName })
			
			return
		end
		if p7.Name ~= nil then
			local Name = p7.Name
			local Name1 = p6.Name
			
			if not (if type(Name) == "table" then table.find(Name, Name1) ~= nil else Name == Name1) then
				p8:fail(ErrorSourceStringsModule.Keys.AssetSchemaWrongRootName, { RootName = p6.Name, ExpectedName = p7.Name })
				
				return
			end
		end
	end
	validateInstancesFromSchema(p6, p7, t, p8, MissingErrorKey, SkipInstanceContext)
	validateNoInstancesOutsideSchema(p6, t, p8, UnauthorizedErrorKey, SkipInstanceContext)
end