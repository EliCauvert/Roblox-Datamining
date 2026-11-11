local SocialTestHelpers = script:FindFirstAncestor("SocialTestHelpers")
local DumpInstanceTreeModule = require(script.Parent.dumpInstanceTree)
local DashModule = require(SocialTestHelpers.Parent.Dash)
local Roact = require(SocialTestHelpers.dependencies).Roact

return function(p1, Callback: (any) -> (), p2)
	-- upvalues: Roact (copy), DashModule (copy), DumpInstanceTreeModule (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = game:GetService("CoreGui")
	local MountResult = Roact.mount(p1, ScreenGui)
	
	if p2 and p2.shouldPrintFailedTree then
		local Success, Result = pcall(function(): string
			-- upvalues: Callback (copy), ScreenGui (copy)
			Callback(ScreenGui)
			
			return "Success"
		end)
		
		if not Success then
			warn(`Test Failure\n -----CallStack----- \n {DashModule.pretty(Result)}, \n-----Instance Tree----- \n {DumpInstanceTreeModule(ScreenGui)}`)
		end
	else
		Callback(ScreenGui)
	end
	Roact.unmount(MountResult)
	ScreenGui:Destroy()
end