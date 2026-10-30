local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ContextProvidersModule = require(AvatarWorkshop.Internal.ContextProviders)

return function(p1, p2)
	-- upvalues: ReactRobloxModule (copy), ReactModule (copy), ContextProvidersModule (copy)
	local Frame = Instance.new("Frame")
	local Root = ReactRobloxModule.createRoot(Frame)
	ReactRobloxModule.act(function()
		-- upvalues: Root (copy), ReactModule (upval), ContextProvidersModule (upval), p1 (copy), p2 (copy)
		Root:render(ReactModule.createElement(ContextProvidersModule, { theme = "Dark" }, { Child = ReactModule.createElement(p1, p2) }))
	end)
	
	return Frame, Root
end