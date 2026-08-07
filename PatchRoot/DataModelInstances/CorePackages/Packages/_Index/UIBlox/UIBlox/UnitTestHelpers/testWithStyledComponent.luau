-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Parent.Roact)
local dumpInstanceTreeModule = require(parent.dumpInstanceTree)
local mockStyleComponentModule = require(parent_1.Utility.mockStyleComponent)

return function(p0, p1, p2) --[[ line: 33 | named "testWithStyledComponent" ]]
	-- upvalues: roactModule (ref), mockStyleComponentModule (ref), httpService (ref), coreGuiService (ref), dumpInstanceTreeModule (ref)
	local var5 = ("TestApp-%s"):format(httpService:GenerateGUID())
	local var6 = roactModule.mount(roactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, {
		StyleProvider = mockStyleComponentModule({ TestComponent = roactModule.createElement(p0, p1) })
	}), coreGuiService, var5)
	local var7 = ("game.CoreGui.%s.Children.TestComponent"):format(var5)
	local ok, status = pcall(function() --[[ line: 46 ]]
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