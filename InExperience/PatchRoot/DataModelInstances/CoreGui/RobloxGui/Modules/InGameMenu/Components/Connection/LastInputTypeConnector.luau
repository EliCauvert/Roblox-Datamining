local VRService = game:GetService("VRService")
local UserInputService = game:GetService("UserInputService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local Parent = script.Parent.Parent.Parent
local SetInputTypeModule = require(Parent.Actions.SetInputType)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local InputTypeMap = require(Parent.Resources.Constants).InputTypeMap
local LastInputTypeConnector = Roact.PureComponent:extend("LastInputTypeConnector")

function LastInputTypeConnector.updateInputType(p1, p2) --[[ Line: 19 ]]
	-- upvalues: VRService (copy), InputTypeMap (copy)
	if VRService.VREnabled then
		p2 = InputTypeMap[Enum.UserInputType.MouseMovement]
	end
	if p2 then
		p1.props.setInputType(p2)
	end
end

function LastInputTypeConnector.init(p1) --[[ Line: 32 ]]
	-- upvalues: InputTypeMap (copy), UserInputService (copy)
	p1:updateInputType(InputTypeMap[UserInputService:GetLastInputType()])
end

function LastInputTypeConnector.render(p1) --[[ Line: 37 ]]
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), UserInputService (copy), InputTypeMap (copy)
	return Roact.createElement(ExternalEventConnectionModule, {
		event = UserInputService.LastInputTypeChanged,
		callback = function(p2) --[[ Line: 40 ]]
			-- upvalues: InputTypeMap (upval), p1 (copy)
			p1:updateInputType(InputTypeMap[p2])
		end
	})
end

return RoactRodux.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 47 ]]
	-- upvalues: SetInputTypeModule (copy)
	return {
		setInputType = function(p1) --[[ Line: 49 ]]
			-- upvalues: Callback (copy), SetInputTypeModule (upval)
			return Callback(SetInputTypeModule(p1))
		end
	}
end)(LastInputTypeConnector)