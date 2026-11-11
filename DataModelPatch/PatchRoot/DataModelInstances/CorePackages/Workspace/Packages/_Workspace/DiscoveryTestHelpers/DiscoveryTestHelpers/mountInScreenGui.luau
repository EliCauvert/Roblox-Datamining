local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("DiscoveryTestHelpers").Parent
local _ = require(Parent.React)
local RhodiumModule = require(Parent.Rhodium)
local RoactModule = require(Parent.Roact)
local ReactRobloxModule = require(Parent.ReactRoblox)
local Element = RhodiumModule.Element
local XPath = RhodiumModule.XPath

return function(p1, p2, p3)
	-- upvalues: RoactModule (copy), ReactRobloxModule (copy), CoreGui (copy), XPath (copy), Element (copy)
	local ScreenGui = RoactModule.createElement("ScreenGui", p3 or {}, {
		Frame = RoactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p1)
	})
	local MountResult = nil
	ReactRobloxModule.act(function()
		-- upvalues: MountResult (ref), RoactModule (upval), ScreenGui (copy), CoreGui (upval), p2 (copy)
		MountResult = RoactModule.mount(ScreenGui, CoreGui, p2)
	end)
	Element.new((XPath.new(`game.CoreGui.{p2}`))):waitForRbxInstance(1)
	
	return MountResult
end