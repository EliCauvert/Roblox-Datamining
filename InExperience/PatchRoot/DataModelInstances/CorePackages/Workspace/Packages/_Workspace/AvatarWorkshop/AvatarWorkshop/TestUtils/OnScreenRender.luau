local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local _ = require(Parent.React)
local ReactTestingLibraryModule = require(Parent.Dev.ReactTestingLibrary)
local RenderFunction = ReactTestingLibraryModule.render
local ActFunction = ReactTestingLibraryModule.act
local CoreGui = game:GetService("CoreGui")
local List = {}

return {
	render = function(p1, p2, p3)
		-- upvalues: CoreGui (copy), List (copy), RenderFunction (copy), ActFunction (copy)
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = CoreGui
		table.insert(List, ScreenGui)
		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.fromOffset(p2 or 1000, p3 or 600)
		Frame.Parent = ScreenGui
		local RenderResult = RenderFunction(p1, { container = Frame })
		ActFunction(function()
			task.wait()
		end)
		ActFunction(function()
			task.wait()
		end)
		
		return RenderResult
	end,
	cleanup = function()
		-- upvalues: List (copy)
		for _, value in List do
			value:Destroy()
		end
		table.clear(List)
	end
}