local coreGuiService = game:GetService("CoreGui")
local packages = script:FindFirstAncestor("Packages")
local rhodiumModule = require(packages.Dev.Rhodium)
local roactModule = require(packages.Roact)
local element = rhodiumModule.Element
local xPath = rhodiumModule.XPath
local mockStyleModule = require(script.Parent.Parent.UnitTestHelpers.mockStyle)

return function(p1)
	-- upvalues: roactModule (ref), mockStyleModule (ref), coreGuiService (ref), xPath (ref), element (ref)
	local var1 = false
	local testRoot = roactModule.mount(mockStyleModule(roactModule.createElement("ScreenGui", {}, {
		buttonElement = roactModule.createElement(p1, {
			onActivated = function()
				-- upvalues: var1 (write)
				var1 = true
			end
		})
	})), coreGuiService, "TestRoot")
	local var2 = element.new(xPath.new("game.CoreGui.Children.buttonElement"))
	assert(var2:getRbxInstance() ~= nil, "button was nil")
	var2:click()
	wait(0)
	assert(var1 == true, "button was not activated")
	roactModule.unmount(testRoot)
end