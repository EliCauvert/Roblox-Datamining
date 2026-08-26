local userInputService = game:GetService("UserInputService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local parent = script.Parent.Parent.Parent
local controlsModule = require(parent.Resources.Controls)
local setControlLayoutModule = require(parent.Actions.SetControlLayout)
local controlLayoutSetter = roact.PureComponent:extend("ControlLayoutSetter")

function controlLayoutSetter.init(p1)
	-- upvalues: controlsModule (ref), userInputService (ref)
	local var1 = controlsModule.inputToControlTypeMap[userInputService:GetLastInputType()]
	
	if var1 then
		p1.props.dispatchSetControlLayout(var1)
	end
end

function controlLayoutSetter.render(_)
	return nil
end

function controlLayoutSetter.didMount(p1)
	-- upvalues: userInputService (ref), controlsModule (ref)
	p1.inputChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p2)
		-- upvalues: controlsModule (copy), p1 (ref)
		local var1 = controlsModule.inputToControlTypeMap[p2]
		
		if var1 then
			p1.props.dispatchSetControlLayout(var1)
		end
	end)
end

function controlLayoutSetter.willUnmount(p1)
	if p1.inputChangedConnection then
		p1.inputChangedConnection:Disconnect()
	end
end

return roactRodux.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setControlLayoutModule (ref)
	return {
		dispatchSetControlLayout = function(value)
			-- upvalues: p1 (ref), setControlLayoutModule (copy)
			p1(setControlLayoutModule(value))
		end
	}
end)(controlLayoutSetter)