local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local tutilsModule = require(parent.tutils)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiConfigTypesModule = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local validateInterfaceModule = require(sduiCoreSystem.validateInterface)
local sduiTemplateInterface = sduiConfigTypesModule.SduiTemplateInterface
local t = {}

local function _(p0, p1) --[[ line: 26 | named "deepJoinArrays" ]]
	-- upvalues: tutilsModule (ref)
	p1 = p1 or {}
	
	for i, v in tutilsModule.deepCopy(p0) do
		table.insert(p1, v)
	end
	return p1
end

local function deepJoin(p2, p3) --[[ line: 36 ]]
	-- upvalues: t (ref), tutilsModule (ref), deepJoin (ref)
	if not p2 then
		return p3
	end
	local var10 = tutilsModule.deepCopy(p2)
	
	for i, v in p3 or t do
		if typeof(v) == "table" then
			var10[i] = deepJoin(var10[i], v)
		else
			var10[i] = v
		end
	end
	return var10
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p4) --[[ line: 60 ]]
	-- upvalues: t_1 (ref)
	local t = { _registeredTemplates = p4 or {} }
	setmetatable(t, t_1)
	
	return t
end

function t_1:getTemplate(p5) --[[ line: 69 ]]
	return self._registeredTemplates[p5]
end

function t_1.shouldResolveTemplate(_, p6) --[[ line: 73 ]]
	return p6.templateKey ~= nil and p6.templateKey ~= "NONE"
end

function t_1:resolveTemplateForConfig(p7, p8, p9) --[[ line: 80 ]]
	-- upvalues: sduiErrorsModule (ref), validateInterfaceModule (ref), sduiTemplateInterface (ref), t_1 (ref), cryoModule (ref), t (ref), deepJoin (ref), tutilsModule (ref)
	local templateKey = p7.templateKey
	
	if not templateKey or templateKey == "NONE" then
		return true
	end
	assert(templateKey, "templateKey must exist")
	p9 = p9 or {}
	assert(p9, "seen exists")
	
	if p9[p7] then
		p8.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.DetectedCycleInTemplates, {
			componentType = p7.componentType,
			value = templateKey,
			message = `Found cycle in template with key {templateKey}`
		}, p8.appPage)
		p7.templateKey = "NONE"
		
		return false
	end
	p9[p7] = true
	local var13 = self._registeredTemplates[templateKey]
	
	if var13 == nil then
		p8.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.FailedToFindTemplate, {
			componentType = p7.componentType,
			value = templateKey,
			message = `Failed to find template for key {templateKey}`
		}, p8.appPage)
		p7.templateKey = "NONE"
		
		return false
	end
	assert(var13, "template exists")
	local var14, var15 = validateInterfaceModule(var13, sduiTemplateInterface, false)
	
	if not var14 then
		p8.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidComponentConfig, {
			message = `Invalid Template for templateKey {templateKey}. err: {var15}`,
			componentType = p7.componentType or var13.componentType,
			name = templateKey
		}, p8.appPage)
	end
	t_1.resolveTemplateForConfig(self, var13, p8, p9)
	p7.templateKey = "NONE"
	
	if p7.componentType then
		if p7.componentType and var13.componentType and p7.componentType ~= var13.componentType then
			p8.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.ComponentTypeMismatchWithTemplate, {
				componentType = p7.componentType,
				value = templateKey,
				message = `Mismatch in componentType for template {templateKey}. Component {p7.componentType} and template {var13.componentType}`
			}, p8.appPage)
			
			return false
		elseif var13.analyticsData then
			p7.analyticsData = cryoModule.Dictionary.join(var13.analyticsData, p7.analyticsData or t)
		end
		if var13.props then
			local ok, status = pcall(function() --[[ line: 158 ]]
				-- upvalues: deepJoin (copy), var13 (ref), p7 (ref)
				return deepJoin(var13.props, p7.props)
			end)
			
			if ok then
				p7.props = status
			else
				p8.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.FailedToJoinTemplateProps, {
					componentType = p7.componentType,
					value = templateKey,
					message = status
				}, p8.appPage)
			end
		end
		if var13.children then
			local children = p7.children or {}
			
			for i, v in tutilsModule.deepCopy(var13.children) do
				table.insert(children, v)
			end
			p7.children = children
		end
		if var13.conditionalProps then
			local conditionalProps = p7.conditionalProps or {}
			
			for i, v in tutilsModule.deepCopy(var13.conditionalProps) do
				table.insert(conditionalProps, v)
			end
			p7.conditionalProps = conditionalProps
		end
		return true
	else
		p7.componentType = var13.componentType
	end
end

return t_1