local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ContextProvidersModule = require(AvatarSwitcher.Internal.ContextProviders)

return function(p1, p2) --[[ Line: 9 | Named "renderWithProviders" ]]
	-- upvalues: ReactRobloxModule (copy), ReactModule (copy), ContextProvidersModule (copy)
	local Frame = Instance.new("Frame")
	local Root = ReactRobloxModule.createRoot(Frame)
	ReactRobloxModule.act(function() --[[ Line: 12 ]]
		-- upvalues: Root (copy), ReactModule (upval), ContextProvidersModule (upval), p1 (copy), p2 (copy)
		Root:render(ReactModule.createElement(ContextProvidersModule, { theme = "Dark" }, { Child = ReactModule.createElement(p1, p2) }))
	end)
	
	return Frame, Root
end