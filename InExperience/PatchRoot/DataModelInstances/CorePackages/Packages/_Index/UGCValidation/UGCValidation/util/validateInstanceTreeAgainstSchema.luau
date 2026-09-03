local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule = require(parent.flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants)

local function _(p1, p2)
	return if type(p1) == "table" then table.find(p1, p2) ~= nil else p1 == p2
end

local _ = function(p1)
	return if type(p1) == "table" then table.concat(p1, " or ") elseif type(p1) == "string" then p1 else "*"
end

local function validateInstancesFromSchema(p1, p2, p3, p4, p5, p6)
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), validateInstancesFromSchema (ref), errorSourceStringsModule (ref)
	p3[p1] = true
	
	if getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() and p2._ignoreDescendants then
		assert(not p2._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway")
		
		for i, v in p1:GetDescendants() do
			p3[v] = true
		end
		return
	else
		local var1, v_1
		for i, v in p2._children or {} do
			var1 = false
			
			for i_1, v_1 in p1:GetChildren() do
				if p3[v_1] == nil and v_1.ClassName == v.ClassName then
					if v.Name ~= nil then
						local var2
						local name = v.Name
						local name_1 = v_1.Name
						
						if type(name) == "table" then
							var2 = table.find(name, name_1) ~= nil
							var2 = nil
						else
							var2 = name == name_1
						end
						if var2 then
							validateInstancesFromSchema(v_1, v, p3, p4, p5, p6)
							var1 = true
							break
						end
					end
				end
			end
			if not var1 and not v._optional then
				local var3
				local var4 = if p6 then nil else p1
				v_1 = p5 or errorSourceStringsModule.Keys.AssetSchemaMissingItem
				local t = {
					ParentPath = p1:GetFullName(),
					ExpectedClass = v.ClassName
				}
				local name = v.Name
				t.ExpectedName = if type(name) == "table" then table.concat(name, " or ") elseif type(name) == "string" then name else "*"
				local className = `missing required {v.ClassName}`
				
				if v.Name then
					local name_1 = v.Name
					var3 = ` named '{if type(name_1) == "table" then table.concat(name_1, " or ") elseif type(name_1) == "string" then name_1 else "*"}'`
				else
					var3 = ""
				end
				t.detail = className .. var8 .. ` inside '{p3.Name}'`
				p4:fail(v_1, t, var4)
			end
		end
	end
end

local function validateNoInstancesOutsideSchema(p7, p8, p9, p10, p11)
	-- upvalues: errorSourceStringsModule (ref)
	local t = {}
	
	for i, v in p7:GetDescendants() do
		if p8[v] == nil then
			table.insert(t, v:GetFullName())
		end
	end
	if #t > 0 then
		p9:fail(p10 or errorSourceStringsModule.Keys.AssetSchemaUnexpectedItems, {
			UnexpectedDescendantPaths = table.concat(t, ", "),
			detail = `unauthorized instances found: {table.concat(t, ", ")}`
		}, if p11 then nil else p7)
	end
end

return function(p12, p13, p14, p15)
	-- upvalues: errorSourceStringsModule (ref), validateInstancesFromSchema (ref), validateNoInstancesOutsideSchema (ref)
	local var5 = if p15 then p15.skipRootClassCheck else nil
	local var6 = if p15 then p15.missingErrorKey else nil
	local var7 = if p15 then p15.unauthorizedErrorKey else nil
	local var8 = if p15 then p15.skipInstanceContext else nil
	local t = {}
	
	if not var5 then
		if p13.ClassName ~= p12.ClassName then
			p14:fail(errorSourceStringsModule.Keys.AssetSchemaWrongRootClass, { RootClass = p12.ClassName, ExpectedClass = p13.ClassName })
			
			return
		elseif p13.Name ~= nil then
			local var9
			local name = p13.Name
			local name_1 = p12.Name
			
			if type(name) == "table" then
				var9 = table.find(name, name_1) ~= nil
				var9 = nil
			else
				var9 = name == name_1
			end
			if var9 then
				validateInstancesFromSchema(p12, p13, t, p14, var6, var8)
				validateNoInstancesOutsideSchema(p12, t, p14, var7, var8)
				
				return
			else
				p14:fail(errorSourceStringsModule.Keys.AssetSchemaWrongRootName, { RootName = p12.Name, ExpectedName = p13.Name })
			end
		end
	end
end