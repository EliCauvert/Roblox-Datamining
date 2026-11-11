local Parent = script.Parent.Parent
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local DumpInstanceTreeFunction = require(Parent.AppDebug).dumpInstanceTree

return function(p1, Callback)
	-- upvalues: ReactRobloxModule (copy), DumpInstanceTreeFunction (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	local Root = ReactRobloxModule.createRoot(ScreenGui)
	ReactRobloxModule.act(function()
		-- upvalues: Root (copy), p1 (copy)
		Root:render(p1)
	end)
	local Success, Result = pcall(function(): string
		-- upvalues: Callback (copy), ScreenGui (copy), Root (copy)
		Callback(ScreenGui, Root)
		
		return "Success"
	end)
	local Formatted = if Success then nil else string.format("%s\n\nInstance Tree:\n\n%s", tostring(Result), DumpInstanceTreeFunction(ScreenGui))
	Root:unmount()
	
	if not Success then
		error(Formatted)
	end
end