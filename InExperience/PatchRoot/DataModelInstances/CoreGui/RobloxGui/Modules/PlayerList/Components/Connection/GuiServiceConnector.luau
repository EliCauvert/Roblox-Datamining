local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local setInspectMenuEnabledModule = require(script.Parent.Parent.Parent.Actions.SetInspectMenuEnabled)
local eventConnectionModule = require(script.Parent.EventConnection)
local guiServiceConnector = roactModule.PureComponent:extend("GuiServiceConnector")

function guiServiceConnector.render(p1)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), guiService (ref)
	return roactModule.createFragment({
		InspectMenuEnabledConnection = roactModule.createElement(eventConnectionModule, {
			event = guiService.InspectMenuEnabledChangedSignal,
			callback = function(p2)
				-- upvalues: p1 (ref)
				p1.props.setInspectMenuEnabled(p2)
			end
		})
	})
end

return roactRoduxModule.connect(nil, function(p1)
	-- upvalues: setInspectMenuEnabledModule (ref)
	return {
		setInspectMenuEnabled = function(value)
			-- upvalues: p1 (ref), setInspectMenuEnabledModule (copy)
			return p1(setInspectMenuEnabledModule(value))
		end
	}
end)(guiServiceConnector)