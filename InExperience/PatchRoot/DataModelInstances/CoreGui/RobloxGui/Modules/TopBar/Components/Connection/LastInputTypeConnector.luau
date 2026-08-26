local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent.Parent
local eventConnectionModule = require(parent.Parent.Common.EventConnection)
local setInputTypeModule = require(parent.Actions.SetInputType)
local inputType = require(parent.Constants).InputType
local lastInputTypeConnector = roactModule.PureComponent:extend("LastInputTypeConnector")
local t = {
	[Enum.UserInputType.MouseButton2] = inputType.MouseAndKeyBoard,
	[Enum.UserInputType.MouseButton3] = inputType.MouseAndKeyBoard,
	[Enum.UserInputType.MouseWheel] = inputType.MouseAndKeyBoard,
	[Enum.UserInputType.MouseMovement] = inputType.MouseAndKeyBoard,
	[Enum.UserInputType.Keyboard] = inputType.MouseAndKeyBoard,
	[Enum.UserInputType.Gamepad1] = inputType.Gamepad,
	[Enum.UserInputType.Gamepad2] = inputType.Gamepad,
	[Enum.UserInputType.Gamepad3] = inputType.Gamepad,
	[Enum.UserInputType.Gamepad4] = inputType.Gamepad,
	[Enum.UserInputType.Gamepad5] = inputType.Gamepad,
	[Enum.UserInputType.Gamepad6] = inputType.Gamepad,
	[Enum.UserInputType.Gamepad7] = inputType.Gamepad,
	[Enum.UserInputType.Gamepad8] = inputType.Gamepad,
	[Enum.UserInputType.Touch] = inputType.Touch
}

function lastInputTypeConnector.didMount(p1)
	-- upvalues: t (ref), userInputService (ref)
	local var1 = t[userInputService:GetLastInputType()]
	
	if var1 then
		p1.props.setInputType(var1)
	end
end

function lastInputTypeConnector.render(p1)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), userInputService (ref), t (ref)
	return roactModule.createElement(eventConnectionModule, {
		event = userInputService.LastInputTypeChanged,
		callback = function(p2)
			-- upvalues: t (copy), p1 (ref)
			local var1 = t[p2]
			
			if var1 then
				p1.props.setInputType(var1)
			end
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setInputTypeModule (ref)
	return {
		setInputType = function(value)
			-- upvalues: p1 (ref), setInputTypeModule (copy)
			return p1(setInputTypeModule(value))
		end
	}
end)(lastInputTypeConnector)