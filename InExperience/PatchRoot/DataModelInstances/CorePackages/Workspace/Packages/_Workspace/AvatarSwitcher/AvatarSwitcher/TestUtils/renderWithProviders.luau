local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local contextProvidersModule = require(avatarSwitcher.Internal.ContextProviders)

return function(p1, p2)
	-- upvalues: reactRobloxModule (ref), reactModule (ref), contextProvidersModule (ref)
	local frame = Instance.new("Frame")
	local var1 = reactRobloxModule.createRoot(frame)
	reactRobloxModule.act(function()
		-- upvalues: var1 (ref), reactModule (copy), contextProvidersModule (copy), p1 (ref), p2 (ref)
		var1:render(reactModule.createElement(contextProvidersModule, { theme = "Dark" }, { Child = reactModule.createElement(p1, p2) }))
	end)
	
	return frame, var1
end