local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local setInspectMenuEnabledModule = require(script.Parent.Parent.Parent.Actions.SetInspectMenuEnabled)
local eventConnectionModule = require(script.Parent.EventConnection)
local guiServiceConnector = roactModule.PureComponent:extend("GuiServiceConnector")

function guiServiceConnector.render(p0) --[[ line: 16 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref), guiService (ref)
	return roactModule.createFragment({
		InspectMenuEnabledConnection = roactModule.createElement(eventConnectionModule, {
			event = guiService.InspectMenuEnabledChangedSignal,
			callback = function(p1) --[[ line: 20 ]]
				-- upvalues: p0 (ref)
				p0.props.setInspectMenuEnabled(p1)
			end
		})
	})
end

return roactRoduxModule.connect(nil, function(p2) --[[ line: 27 | named "mapDispatchToProps" ]]
	-- upvalues: setInspectMenuEnabledModule (ref)
	return {
		setInspectMenuEnabled = function(value) --[[ line: 29 ]]
			-- upvalues: p2 (ref), setInspectMenuEnabledModule (copy)
			return p2(setInspectMenuEnabledModule(value))
		end
	}
end)(guiServiceConnector)