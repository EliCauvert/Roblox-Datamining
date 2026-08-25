local coreGuiService = game:GetService("CoreGui")
local packages = script:FindFirstAncestor("Packages")
local rhodiumModule = require(packages.Dev.Rhodium)
local roactModule = require(packages.Roact)
local element = rhodiumModule.Element
local xPath = rhodiumModule.XPath
local mockStyleModule = require(script.Parent.Parent.UnitTestHelpers.mockStyle)

return function(p0)
	-- upvalues: roactModule (ref), mockStyleModule (ref), coreGuiService (ref), xPath (ref), element (ref)
	local var5 = false
	local testRoot = roactModule.mount(mockStyleModule(roactModule.createElement("ScreenGui", {}, {
		buttonElement = roactModule.createElement(p0, {
			onActivated = function()
				-- upvalues: var5 (write)
				var5 = true
			end
		})
	})), coreGuiService, "TestRoot")
	local var7 = element.new(xPath.new("game.CoreGui.Children.buttonElement"))
	assert(var7:getRbxInstance() ~= nil, "button was nil")
	var7:click()
	wait(0)
	assert(var5 == true, "button was not activated")
	roactModule.unmount(testRoot)
end