local CoreGui = game:GetService("CoreGui")
local Packages = script:FindFirstAncestor("Packages")
local RhodiumModule = require(Packages.Dev.Rhodium)
local RoactModule = require(Packages.Roact)
local Element = RhodiumModule.Element
local XPath = RhodiumModule.XPath
local MockStyleModule = require(script.Parent.Parent.UnitTestHelpers.mockStyle)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: RoactModule (copy), MockStyleModule (copy), CoreGui (copy), XPath (copy), Element (copy)
	local Enabled = false
	local TestRoot = RoactModule.mount(MockStyleModule((RoactModule.createElement("ScreenGui", {}, {
		buttonElement = RoactModule.createElement(p1, {
			onActivated = function() --[[ Line: 16 ]]
				-- upvalues: Enabled (ref)
				Enabled = true
			end
		})
	}))), CoreGui, "TestRoot")
	local NewElement = Element.new((XPath.new("game.CoreGui.Children.buttonElement")))
	assert(NewElement:getRbxInstance() ~= nil, "button was nil")
	NewElement:click()
	wait(0)
	assert(Enabled == true, "button was not activated")
	RoactModule.unmount(TestRoot)
end