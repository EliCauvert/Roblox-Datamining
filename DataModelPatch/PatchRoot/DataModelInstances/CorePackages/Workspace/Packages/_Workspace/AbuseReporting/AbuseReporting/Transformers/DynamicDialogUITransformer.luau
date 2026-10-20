local Parent = script:FindFirstAncestor("AbuseReporting").Parent
local CryoModule = require(Parent.Cryo)
local Constants = require(Parent.ServerUI).Constants
local DynamicDialogUITransformerModule = {}
DynamicDialogUITransformerModule.__index = DynamicDialogUITransformerModule

function DynamicDialogUITransformerModule.new(p1)
	-- upvalues: Constants (copy), DynamicDialogUITransformerModule (copy)
	local config = {
		templateMap = p1.templateMap,
		componentMap = p1.componentMap,
		defaultTemplateName = p1.defaultTemplateName or Constants.DEFAULT_TEMPLATE_NAME
	}
	setmetatable(config, DynamicDialogUITransformerModule)
	
	return config
end

function DynamicDialogUITransformerModule:transform(p1)
	-- upvalues: CryoModule (copy)
	local config = {
		name = self.templateMap[self.defaultTemplateName] and self.templateMap[self.defaultTemplateName].name or self.defaultTemplateName,
		component = self.templateMap[self.defaultTemplateName].component,
		props = {},
		children = {}
	}
	local config1 = { templates = { [config.name] = config }, components = {} }
	
	if p1.dialog and p1.dialog.componentRefs then
		for _, componentRef in ipairs(p1.dialog.componentRefs) do
			if self.componentMap[componentRef] then
				table.insert(config.children, componentRef)
			end
		end
	end
	if p1.components then
		if p1.components.title then
			config.props.title = p1.components.title.text
		end
		if p1.components.subtitle then
			config.props.subtitle = p1.components.subtitle.text
		end
		if p1.components.artifacts then
			config.props.artifacts = p1.components.artifacts
		end
		for i, value in self.componentMap do
			local Component = p1.components[i]
			
			if Component then
				local Name = value.name or i
				config1.components[Name] = {
					name = Name,
					component = value.component,
					props = CryoModule.Dictionary.join({ params = Component }, value.props or {})
				}
			end
		end
	end
	return config1
end

return DynamicDialogUITransformerModule