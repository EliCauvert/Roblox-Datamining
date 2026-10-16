local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SetInspectMenuEnabledModule = require(script.Parent.Parent.Parent.Actions.SetInspectMenuEnabled)
local EventConnectionModule = require(script.Parent.EventConnection)
local GuiServiceConnector = RoactModule.PureComponent:extend("GuiServiceConnector")

function GuiServiceConnector.render(p1) --[[ Line: 16 ]]
	-- upvalues: RoactModule (copy), EventConnectionModule (copy), GuiService (copy)
	return RoactModule.createFragment({
		InspectMenuEnabledConnection = RoactModule.createElement(EventConnectionModule, {
			event = GuiService.InspectMenuEnabledChangedSignal,
			callback = function(p2) --[[ Line: 20 ]]
				-- upvalues: p1 (copy)
				p1.props.setInspectMenuEnabled(p2)
			end
		})
	})
end

return RoactRoduxModule.connect(nil, function(Callback) --[[ Line: 27 | Named "mapDispatchToProps" ]]
	-- upvalues: SetInspectMenuEnabledModule (copy)
	return {
		setInspectMenuEnabled = function(p1) --[[ Line: 29 ]]
			-- upvalues: Callback (copy), SetInspectMenuEnabledModule (upval)
			return Callback(SetInspectMenuEnabledModule(p1))
		end
	}
end)(GuiServiceConnector)