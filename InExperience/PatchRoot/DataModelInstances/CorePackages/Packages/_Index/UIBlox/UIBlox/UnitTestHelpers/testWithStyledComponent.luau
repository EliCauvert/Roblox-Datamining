local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Parent.Roact)
local DumpInstanceTreeModule = require(Parent.dumpInstanceTree)
local MockStyleComponentModule = require(Parent1.Utility.mockStyleComponent)

return function(p1, p2, Callback) --[[ Line: 33 | Named "testWithStyledComponent" ]]
	-- upvalues: RoactModule (copy), MockStyleComponentModule (copy), HttpService (copy), CoreGui (copy), DumpInstanceTreeModule (copy)
	local TestAppName: string = ("TestApp-%s"):format(HttpService:GenerateGUID())
	local MountResult = RoactModule.mount(RoactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, {
		StyleProvider = MockStyleComponentModule({ TestComponent = RoactModule.createElement(p1, p2) })
	}), CoreGui, TestAppName)
	local TestComponentName: string = ("game.CoreGui.%s.Children.TestComponent"):format(TestAppName)
	local Success, Result = pcall(function() --[[ Line: 46 ]]
		-- upvalues: Callback (copy), TestComponentName (copy)
		Callback(TestComponentName)
	end)
	
	if not Success then
		print("Test instance tree:")
		DumpInstanceTreeModule(CoreGui:FindFirstChild(TestAppName))
		print("Test instance tree end\n")
	end
	RoactModule.unmount(MountResult)
	
	if not Success then
		error(Result)
	end
end