local CoreGui = game:GetService("CoreGui")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local ControllerBar = InGameMenuDependenciesModule.UIBlox.App.Bar.ControllerBar
local Parent = script.Parent.Parent
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local ConstantsModule = require(Parent.Resources.Constants)
local IncrementControllerBarModule = require(Parent.Actions.IncrementControllerBar)
local DecrementControllerBarModule = require(Parent.Actions.DecrementControllerBar)
local IGMControllerBar2 = Roact.PureComponent:extend("IGMControllerBar2")
IGMControllerBar2.validateProps = T.strictInterface({
	rightHints = T.table,
	leftHint = T.table,
	incrementControllerBar = T.callback,
	decrementControllerBar = T.callback
})

function IGMControllerBar2.init(p1)
	p1.props.incrementControllerBar()
end

function IGMControllerBar2.willUnmount(p1)
	p1.props.decrementControllerBar()
end

function IGMControllerBar2.render(p1)
	-- upvalues: Roact (copy), CoreGui (copy), ConstantsModule (copy), ControllerBar (copy)
	return Roact.createElement(Roact.Portal, { target = CoreGui }, {
		IGMControllerBar = Roact.createElement("ScreenGui", {
			DisplayOrder = ConstantsModule.DisplayOrder.ControllerBar
		}, {
			ControllerBar = Roact.createElement(ControllerBar, {
				rightHints = p1.props.rightHints,
				leftHint = p1.props.leftHint
			})
		})
	})
end

return RoactRodux.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: IncrementControllerBarModule (copy), DecrementControllerBarModule (copy)
	return {
		incrementControllerBar = function()
			-- upvalues: Callback (copy), IncrementControllerBarModule (upval)
			Callback(IncrementControllerBarModule())
		end,
		decrementControllerBar = function()
			-- upvalues: Callback (copy), DecrementControllerBarModule (upval)
			Callback(DecrementControllerBarModule())
		end
	}
end)(IGMControllerBar2)