local CoreGui = game:GetService("CoreGui")
local Parent = script.Parent.Parent
local RhodiumModule = require(Parent.Rhodium)
local RoactModule = require(Parent.Roact)
local Element = RhodiumModule.Element
local XPath = RhodiumModule.XPath
local MockStyleFunction = require(Parent.UnitTestHelpers).mockStyle

return function(p1)
	-- upvalues: RoactModule (copy), MockStyleFunction (copy), CoreGui (copy), XPath (copy), Element (copy)
	local Enabled = false
	local TestRoot = RoactModule.mount(MockStyleFunction((RoactModule.createElement("ScreenGui", {}, {
		buttonElement = RoactModule.createElement(p1, {
			onActivated = function()
				-- upvalues: Enabled (ref)
				Enabled = true
			end
		})
	}))), CoreGui, "TestRoot")
	local NewElement = Element.new((XPath.new("game.CoreGui.*.buttonElement")))
	assert(NewElement:getRbxInstance() ~= nil, "button was nil")
	NewElement:clickWithoutValidation()
	assert(Enabled == true, "button was not activated")
	RoactModule.unmount(TestRoot)
end