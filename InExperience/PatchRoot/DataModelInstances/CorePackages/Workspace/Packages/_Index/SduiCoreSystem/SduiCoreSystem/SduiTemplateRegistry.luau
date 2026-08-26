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

local function _(p1, p2)
	-- upvalues: tutilsModule (ref)
	p2 = p2 or {}
	
	for i, v in tutilsModule.deepCopy(p1) do
		table.insert(p2, v)
	end
	return p2
end

local function deepJoin(p3, p4)
	-- upvalues: t (ref), tutilsModule (ref), deepJoin (ref)
	if not p3 then
		return p4
	end
	local var1 = tutilsModule.deepCopy(p3)
	
	for i, v in p4 or t do
		if typeof(v) == "table" then
			var1[i] = deepJoin(var1[i], v)
		else
			var1[i] = v
		end
	end
	return var1
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p5)
	-- upvalues: t_1 (ref)
	local t = { _registeredTemplates = p5 or {} }
	setmetatable(t, t_1)
	
	return t
end

function t_1:getTemplate(p5)
	return self._registeredTemplates[p5]
end

function t_1.shouldResolveTemplate(_, p5)
	return p5.templateKey ~= nil and p5.templateKey ~= "NONE"
end

function t_1:resolveTemplateForConfig(p5, p6, p7)
	-- upvalues: sduiErrorsModule (ref), validateInterfaceModule (ref), sduiTemplateInterface (ref), t_1 (ref), cryoModule (ref), t (ref), deepJoin (ref), tutilsModule (ref)
	local templateKey = p5.templateKey
	
	if not templateKey or templateKey == "NONE" then
		return true
	end
	assert(templateKey, "templateKey must exist")
	p7 = p7 or {}
	assert(p7, "seen exists")
	
	if p7[p5] then
		p6.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.DetectedCycleInTemplates, {
			componentType = p5.componentType,
			value = templateKey,
			message = `Found cycle in template with key {templateKey}`
		}, p6.appPage)
		p5.templateKey = "NONE"
		
		return false
	end
	p7[p5] = true
	local var2 = self._registeredTemplates[templateKey]
	
	if var2 == nil then
		p6.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.FailedToFindTemplate, {
			componentType = p5.componentType,
			value = templateKey,
			message = `Failed to find template for key {templateKey}`
		}, p6.appPage)
		p5.templateKey = "NONE"
		
		return false
	end
	assert(var2, "template exists")
	local var3, var4 = validateInterfaceModule(var2, sduiTemplateInterface, false)
	
	if not var3 then
		p6.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidComponentConfig, {
			message = `Invalid Template for templateKey {templateKey}. err: {var4}`,
			componentType = p5.componentType or var2.componentType,
			name = templateKey
		}, p6.appPage)
	end
	t_1.resolveTemplateForConfig(self, var2, p6, p7)
	p5.templateKey = "NONE"
	
	if p5.componentType then
		if p5.componentType and var2.componentType and p5.componentType ~= var2.componentType then
			p6.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.ComponentTypeMismatchWithTemplate, {
				componentType = p5.componentType,
				value = templateKey,
				message = `Mismatch in componentType for template {templateKey}. Component {p5.componentType} and template {var2.componentType}`
			}, p6.appPage)
			
			return false
		elseif var2.analyticsData then
			p5.analyticsData = cryoModule.Dictionary.join(var2.analyticsData, p5.analyticsData or t)
		end
		if var2.props then
			local ok, status = pcall(function()
				-- upvalues: deepJoin (copy), var2 (ref), p5 (ref)
				return deepJoin(var2.props, p5.props)
			end)
			
			if ok then
				p5.props = status
			else
				p6.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.FailedToJoinTemplateProps, {
					componentType = p5.componentType,
					value = templateKey,
					message = status
				}, p6.appPage)
			end
		end
		if var2.children then
			local children = p5.children or {}
			
			for i, v in tutilsModule.deepCopy(var2.children) do
				table.insert(children, v)
			end
			p5.children = children
		end
		if var2.conditionalProps then
			local conditionalProps = p5.conditionalProps or {}
			
			for i, v in tutilsModule.deepCopy(var2.conditionalProps) do
				table.insert(conditionalProps, v)
			end
			p5.conditionalProps = conditionalProps
		end
		return true
	else
		p5.componentType = var2.componentType
	end
end

return t_1