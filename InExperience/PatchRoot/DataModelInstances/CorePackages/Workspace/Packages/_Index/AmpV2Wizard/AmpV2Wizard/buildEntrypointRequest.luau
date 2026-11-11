local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local _ = require(AmpV2Wizard.Types)
local ComponentRegistryModule = require(AmpV2Wizard.ComponentRegistry)

return function(Target, Flow, Surface, p1, ExtraProps)
	-- upvalues: ComponentRegistryModule (copy)
	return {
		target = Target,
		flow = Flow,
		surface = Surface,
		client = {
			clientCapabilities = ComponentRegistryModule.capabilities(p1)
		},
		extraProps = ExtraProps
	}
end