local coreGuiService = game:GetService("CoreGui")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local controllerBar = inGameMenuDependenciesModule.UIBlox.App.Bar.ControllerBar
local parent = script.Parent.Parent
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local constantsModule = require(parent.Resources.Constants)
local incrementControllerBarModule = require(parent.Actions.IncrementControllerBar)
local decrementControllerBarModule = require(parent.Actions.DecrementControllerBar)
local IGMControllerBar2 = roact.PureComponent:extend("IGMControllerBar2")
IGMControllerBar2.validateProps = t.strictInterface({
	rightHints = t.table,
	leftHint = t.table,
	incrementControllerBar = t.callback,
	decrementControllerBar = t.callback
})

function IGMControllerBar2.init(p0)
	p0.props.incrementControllerBar()
end

function IGMControllerBar2.willUnmount(p1)
	p1.props.decrementControllerBar()
end

function IGMControllerBar2.render(p2)
	-- upvalues: roact (ref), coreGuiService (ref), constantsModule (ref), controllerBar (ref)
	return roact.createElement(roact.Portal, { target = coreGuiService }, {
		IGMControllerBar = roact.createElement("ScreenGui", {
			DisplayOrder = constantsModule.DisplayOrder.ControllerBar
		}, {
			ControllerBar = roact.createElement(controllerBar, {
				rightHints = p2.props.rightHints,
				leftHint = p2.props.leftHint
			})
		})
	})
end

return roactRodux.UNSTABLE_connect2(nil, function(p3)
	-- upvalues: incrementControllerBarModule (ref), decrementControllerBarModule (ref)
	return {
		incrementControllerBar = function()
			-- upvalues: p3 (ref), incrementControllerBarModule (copy)
			p3(incrementControllerBarModule())
		end,
		decrementControllerBar = function()
			-- upvalues: p3 (ref), decrementControllerBarModule (copy)
			p3(decrementControllerBarModule())
		end
	}
end)(IGMControllerBar2)