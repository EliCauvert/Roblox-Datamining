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

function lastInputTypeConnector.updateInputType(p0, p1) --[[ line: 19 ]]
	-- upvalues: VRService (ref), inputTypeMap (ref)
	if VRService.VREnabled then
		p1 = inputTypeMap[Enum.UserInputType.MouseMovement]
	end
	if p1 then
		p0.props.setInputType(p1)
	end
end

function lastInputTypeConnector.init(p2) --[[ line: 32 ]]
	-- upvalues: inputTypeMap (ref), userInputService (ref)
	p2:updateInputType(inputTypeMap[userInputService:GetLastInputType()])
end

function lastInputTypeConnector.render(p3) --[[ line: 37 ]]
	-- upvalues: roact (ref), externalEventConnectionModule (ref), userInputService (ref), inputTypeMap (ref)
	return roact.createElement(externalEventConnectionModule, {
		event = userInputService.LastInputTypeChanged,
		callback = function(p4) --[[ line: 40 ]]
			-- upvalues: inputTypeMap (copy), p3 (ref)
			p3:updateInputType(inputTypeMap[p4])
		end
	})
end

return roactRodux.UNSTABLE_connect2(nil, function(p5) --[[ line: 47 ]]
	-- upvalues: setInputTypeModule (ref)
	return {
		setInputType = function(value) --[[ line: 49 ]]
			-- upvalues: p5 (ref), setInputTypeModule (copy)
			return p5(setInputTypeModule(value))
		end
	}
end)(lastInputTypeConnector)