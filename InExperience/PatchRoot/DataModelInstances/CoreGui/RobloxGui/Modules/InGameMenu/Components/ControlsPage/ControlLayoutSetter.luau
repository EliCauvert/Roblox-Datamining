local UserInputService = game:GetService("UserInputService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local Parent = script.Parent.Parent.Parent
local ControlsModule = require(Parent.Resources.Controls)
local SetControlLayoutModule = require(Parent.Actions.SetControlLayout)
local ControlLayoutSetter = InGameMenuDependenciesModule.Roact.PureComponent:extend("ControlLayoutSetter")

function ControlLayoutSetter.init(p1) --[[ Line: 16 ]]
	-- upvalues: ControlsModule (copy), UserInputService (copy)
	local InputToControlType = ControlsModule.inputToControlTypeMap[UserInputService:GetLastInputType()]
	
	if InputToControlType then
		p1.props.dispatchSetControlLayout(InputToControlType)
	end
end

function ControlLayoutSetter:render() --[[ Line: 23 ]]
	return nil
end

function ControlLayoutSetter.didMount(p1) --[[ Line: 27 ]]
	-- upvalues: UserInputService (copy), ControlsModule (copy)
	p1.inputChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(LastInputType) --[[ Line: 28 ]]
		-- upvalues: ControlsModule (upval), p1 (copy)
		local InputToControlType = ControlsModule.inputToControlTypeMap[LastInputType]
		
		if InputToControlType then
			p1.props.dispatchSetControlLayout(InputToControlType)
		end
	end)
end

function ControlLayoutSetter.willUnmount(p1) --[[ Line: 39 ]]
	if p1.inputChangedConnection then
		p1.inputChangedConnection:Disconnect()
	end
end

return RoactRodux.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 45 ]]
	-- upvalues: SetControlLayoutModule (copy)
	return {
		dispatchSetControlLayout = function(p1) --[[ Line: 47 ]]
			-- upvalues: Callback (copy), SetControlLayoutModule (upval)
			Callback(SetControlLayoutModule(p1))
		end
	}
end)(ControlLayoutSetter)