local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local TutilsModule = require(Parent.tutils)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local ValidateInterfaceModule = require(SduiCoreSystem.validateInterface)
local SduiTemplateInterface = require(SduiCoreSystem.SduiConfigTypes).SduiTemplateInterface
local t = {}

local function _(p1, p2)
	-- upvalues: TutilsModule (copy)
	local List = p2 or {}
	
	for _, value in TutilsModule.deepCopy(p1) do
		table.insert(List, value)
	end
	return List
end

local function deepJoin(Props, Props1)
	-- upvalues: t (copy), TutilsModule (copy), deepJoin (copy)
	if not Props then
		return Props1
	end
	local DeepCopyResult = TutilsModule.deepCopy(Props)
	
	for i, value in Props1 or t do
		if typeof(value) == "table" then
			DeepCopyResult[i] = deepJoin(DeepCopyResult[i], value)
		else
			DeepCopyResult[i] = value
		end
	end
	return DeepCopyResult
end

local SduiTemplateRegistry = {}
SduiTemplateRegistry.__index = SduiTemplateRegistry

function SduiTemplateRegistry.new(p3)
	-- upvalues: SduiTemplateRegistry (copy)
	local config = { _registeredTemplates = p3 or {} }
	setmetatable(config, SduiTemplateRegistry)
	
	return config
end

function SduiTemplateRegistry:getTemplate(p3)
	return self._registeredTemplates[p3]
end

function SduiTemplateRegistry:shouldResolveTemplate(p3): boolean
	return p3.templateKey ~= nil and p3.templateKey ~= "NONE"
end

function SduiTemplateRegistry:resolveTemplateForConfig(RegisteredTemplate, p3, p4): boolean
	-- upvalues: SduiErrorsModule (copy), ValidateInterfaceModule (copy), SduiTemplateInterface (copy), SduiTemplateRegistry (copy), CryoModule (copy), t (copy), deepJoin (copy), TutilsModule (copy)
	local TemplateKey = RegisteredTemplate.templateKey
	
	if not TemplateKey or TemplateKey == "NONE" then
		return true
	end
	assert(TemplateKey, "templateKey must exist")
	local P12 = p4 or {}
	assert(P12, "seen exists")
	
	if P12[RegisteredTemplate] then
		p3.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.DetectedCycleInTemplates, {
			componentType = RegisteredTemplate.componentType,
			value = TemplateKey,
			message = `Found cycle in template with key {TemplateKey}`
		}, p3.appPage)
		RegisteredTemplate.templateKey = "NONE"
		
		return false
	end
	P12[RegisteredTemplate] = true
	local RegisteredTemplate1 = self._registeredTemplates[TemplateKey]
	
	if RegisteredTemplate1 == nil then
		p3.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.FailedToFindTemplate, {
			componentType = RegisteredTemplate.componentType,
			value = TemplateKey,
			message = `Failed to find template for key {TemplateKey}`
		}, p3.appPage)
		RegisteredTemplate.templateKey = "NONE"
		
		return false
	end
	assert(RegisteredTemplate1, "template exists")
	local ValidateInterfaceModuleResult, ValidateInterfaceModuleResult2 = ValidateInterfaceModule(RegisteredTemplate1, SduiTemplateInterface, false)
	
	if not ValidateInterfaceModuleResult then
		p3.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.InvalidComponentConfig, {
			message = `Invalid Template for templateKey {TemplateKey}. err: {ValidateInterfaceModuleResult2}`,
			componentType = RegisteredTemplate.componentType or RegisteredTemplate1.componentType,
			name = TemplateKey
		}, p3.appPage)
	end
	SduiTemplateRegistry.resolveTemplateForConfig(self, RegisteredTemplate1, p3, P12)
	RegisteredTemplate.templateKey = "NONE"
	
	if not RegisteredTemplate.componentType then
		RegisteredTemplate.componentType = RegisteredTemplate1.componentType
	elseif RegisteredTemplate.componentType and RegisteredTemplate1.componentType and RegisteredTemplate.componentType ~= RegisteredTemplate1.componentType then
		p3.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.ComponentTypeMismatchWithTemplate, {
			componentType = RegisteredTemplate.componentType,
			value = TemplateKey,
			message = `Mismatch in componentType for template {TemplateKey}. Component {RegisteredTemplate.componentType} and template {RegisteredTemplate1.componentType}`
		}, p3.appPage)
		
		return false
	end
	if RegisteredTemplate1.analyticsData then
		RegisteredTemplate.analyticsData = CryoModule.Dictionary.join(RegisteredTemplate1.analyticsData, RegisteredTemplate.analyticsData or t)
	end
	if RegisteredTemplate1.props then
		local Success, Result = pcall(function()
			-- upvalues: deepJoin (upval), RegisteredTemplate1 (copy), RegisteredTemplate (copy)
			return (deepJoin(RegisteredTemplate1.props, RegisteredTemplate.props))
		end)
		
		if Success then
			RegisteredTemplate.props = Result
		else
			p3.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.FailedToJoinTemplateProps, {
				componentType = RegisteredTemplate.componentType,
				value = TemplateKey,
				message = Result
			}, p3.appPage)
		end
	end
	if RegisteredTemplate1.children then
		local Children = RegisteredTemplate.children or {}
		
		for _, value in TutilsModule.deepCopy(RegisteredTemplate1.children) do
			table.insert(Children, value)
		end
		RegisteredTemplate.children = Children
	end
	if RegisteredTemplate1.conditionalProps then
		local ConditionalProps = RegisteredTemplate.conditionalProps or {}
		
		for _, value1 in TutilsModule.deepCopy(RegisteredTemplate1.conditionalProps) do
			table.insert(ConditionalProps, value1)
		end
		RegisteredTemplate.conditionalProps = ConditionalProps
	end
	return true
end

return SduiTemplateRegistry