local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local FoundationProvider = require(Parent1.Foundation).FoundationProvider
local RoactModule = require(Parent1.Roact)
local DumpInstanceTreeModule = require(Parent.dumpInstanceTree)

local function TestApp(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, p1[RoactModule.Children])
end

return function(TestComponent, Callback)
	-- upvalues: RoactModule (copy), TestApp (copy), FoundationProvider (copy), HttpService (copy), CoreGui (copy), DumpInstanceTreeModule (copy)
	local TestAppName: string = ("TestApp-%s"):format(HttpService:GenerateGUID(false))
	local MountResult = RoactModule.mount(RoactModule.createElement(TestApp, nil, {
		FoundationProvider = RoactModule.createElement(FoundationProvider, { theme = "Dark" }, { TestComponent = TestComponent })
	}), CoreGui, TestAppName)
	local TestComponentName: string = ("game.CoreGui.%s.TestComponent"):format(TestAppName)
	local Success, Result = pcall(function()
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