local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local userInputService = game:GetService("UserInputService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local parent = script.Parent.Parent.Parent
local setInputTypeModule = require(parent.Actions.SetInputType)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local inputTypeMap = require(parent.Resources.Constants).InputTypeMap
local lastInputTypeConnector = roact.PureComponent:extend("LastInputTypeConnector")

function lastInputTypeConnector.updateInputType(p1, p2)
	-- upvalues: VRService (ref), inputTypeMap (ref)
	if VRService.VREnabled then
		p2 = inputTypeMap[Enum.UserInputType.MouseMovement]
	end
	if p2 then
		p1.props.setInputType(p2)
	end
end

function lastInputTypeConnector.init(p1)
	-- upvalues: inputTypeMap (ref), userInputService (ref)
	p1:updateInputType(inputTypeMap[userInputService:GetLastInputType()])
end

function lastInputTypeConnector.render(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), userInputService (ref), inputTypeMap (ref)
	return roact.createElement(externalEventConnectionModule, {
		event = userInputService.LastInputTypeChanged,
		callback = function(p2)
			-- upvalues: inputTypeMap (copy), p1 (ref)
			p1:updateInputType(inputTypeMap[p2])
		end
	})
end

return roactRodux.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setInputTypeModule (ref)
	return {
		setInputType = function(value)
			-- upvalues: p1 (ref), setInputTypeModule (copy)
			return p1(setInputTypeModule(value))
		end
	}
end)(lastInputTypeConnector)