-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local foundationProvider = require(parent_1.Foundation).FoundationProvider
local roactModule = require(parent_1.Roact)
local dumpInstanceTreeModule = require(parent.dumpInstanceTree)

local function TestApp(p0) --[[ line: 34 ]]
	-- upvalues: roactModule (ref)
	return roactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, p0[roactModule.Children])
end

return function(p1, p2) --[[ line: 40 | named "testWithComponent" ]]
	-- upvalues: roactModule (ref), TestApp (ref), foundationProvider (ref), httpService (ref), coreGuiService (ref), dumpInstanceTreeModule (ref)
	local var5 = ("TestApp-%s"):format(httpService:GenerateGUID(false))
	local var6 = roactModule.mount(roactModule.createElement(TestApp, nil, {
		FoundationProvider = roactModule.createElement(foundationProvider, { theme = "Dark" }, { TestComponent = p1 })
	}), coreGuiService, var5)
	local var7 = ("game.CoreGui.%s.TestComponent"):format(var5)
	local ok, status = pcall(function() --[[ line: 51 ]]
		-- upvalues: p2 (ref), var7 (ref)
		p2(var7)
	end)
	
	if not ok then
		print("Test instance tree:")
		dumpInstanceTreeModule(coreGuiService:FindFirstChild(var5))
		print("Test instance tree end\n")
	end
	roactModule.unmount(var6)
	
	if not ok then
		error(status)
	end
end