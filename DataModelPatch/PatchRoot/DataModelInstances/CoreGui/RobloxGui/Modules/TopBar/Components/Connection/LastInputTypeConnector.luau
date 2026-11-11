local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent.Parent
local EventConnectionModule = require(Parent.Parent.Common.EventConnection)
local SetInputTypeModule = require(Parent.Actions.SetInputType)
local InputType = require(Parent.Constants).InputType
local LastInputTypeConnector = RoactModule.PureComponent:extend("LastInputTypeConnector")
local config = {
	[Enum.UserInputType.MouseButton2] = InputType.MouseAndKeyBoard,
	[Enum.UserInputType.MouseButton3] = InputType.MouseAndKeyBoard,
	[Enum.UserInputType.MouseWheel] = InputType.MouseAndKeyBoard,
	[Enum.UserInputType.MouseMovement] = InputType.MouseAndKeyBoard,
	[Enum.UserInputType.Keyboard] = InputType.MouseAndKeyBoard,
	[Enum.UserInputType.Gamepad1] = InputType.Gamepad,
	[Enum.UserInputType.Gamepad2] = InputType.Gamepad,
	[Enum.UserInputType.Gamepad3] = InputType.Gamepad,
	[Enum.UserInputType.Gamepad4] = InputType.Gamepad,
	[Enum.UserInputType.Gamepad5] = InputType.Gamepad,
	[Enum.UserInputType.Gamepad6] = InputType.Gamepad,
	[Enum.UserInputType.Gamepad7] = InputType.Gamepad,
	[Enum.UserInputType.Gamepad8] = InputType.Gamepad,
	[Enum.UserInputType.Touch] = InputType.Touch
}

function LastInputTypeConnector.didMount(p1)
	-- upvalues: config (copy), UserInputService (copy)
	local Entry = config[UserInputService:GetLastInputType()]
	
	if Entry then
		p1.props.setInputType(Entry)
	end
end

function LastInputTypeConnector.render(p1)
	-- upvalues: RoactModule (copy), EventConnectionModule (copy), UserInputService (copy), config (copy)
	return RoactModule.createElement(EventConnectionModule, {
		event = UserInputService.LastInputTypeChanged,
		callback = function(p2)
			-- upvalues: config (upval), p1 (copy)
			local Entry = config[p2]
			
			if Entry then
				p1.props.setInputType(Entry)
			end
		end
	})
end

return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetInputTypeModule (copy)
	return {
		setInputType = function(p1)
			-- upvalues: Callback (copy), SetInputTypeModule (upval)
			return Callback(SetInputTypeModule(p1))
		end
	}
end)(LastInputTypeConnector)