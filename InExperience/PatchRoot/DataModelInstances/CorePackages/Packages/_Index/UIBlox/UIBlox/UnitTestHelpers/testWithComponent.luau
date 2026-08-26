local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local foundationProvider = require(parent_1.Foundation).FoundationProvider
local roactModule = require(parent_1.Roact)
local dumpInstanceTreeModule = require(parent.dumpInstanceTree)

local function TestApp(p1)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, p1[roactModule.Children])
end

return function(p1, p2)
	-- upvalues: roactModule (ref), TestApp (ref), foundationProvider (ref), httpService (ref), coreGuiService (ref), dumpInstanceTreeModule (ref)
	local var1 = ("TestApp-%s"):format(httpService:GenerateGUID(false))
	local var2 = roactModule.mount(roactModule.createElement(TestApp, nil, {
		FoundationProvider = roactModule.createElement(foundationProvider, { theme = "Dark" }, { TestComponent = p1 })
	}), coreGuiService, var1)
	local var3 = ("game.CoreGui.%s.TestComponent"):format(var1)
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), var3 (ref)
		p2(var3)
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