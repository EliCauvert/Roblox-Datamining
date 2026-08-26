local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Parent.Roact)
local dumpInstanceTreeModule = require(parent.dumpInstanceTree)
local mockStyleComponentModule = require(parent_1.Utility.mockStyleComponent)

return function(p1, p2, p3)
	-- upvalues: roactModule (ref), mockStyleComponentModule (ref), httpService (ref), coreGuiService (ref), dumpInstanceTreeModule (ref)
	local var1 = ("TestApp-%s"):format(httpService:GenerateGUID())
	local var2 = roactModule.mount(roactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, {
		StyleProvider = mockStyleComponentModule({ TestComponent = roactModule.createElement(p1, p2) })
	}), coreGuiService, var1)
	local var3 = ("game.CoreGui.%s.Children.TestComponent"):format(var1)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), var3 (ref)
		p3(var3)
	end)
	
	if not ok then
		print("Test instance tree:")
		dumpInstanceTreeModule(coreGuiService:FindFirstChild(var1))
		print("Test instance tree end\n")
	end
	roactModule.unmount(var2)
	
	if not ok then
		error(status)
	end
end