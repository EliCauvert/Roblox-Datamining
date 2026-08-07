local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local contextProvidersModule = require(avatarSwitcher.Internal.ContextProviders)

return function(p0, p1) --[[ line: 9 | named "renderWithProviders" ]]
	-- upvalues: reactRobloxModule (ref), reactModule (ref), contextProvidersModule (ref)
	local frame = Instance.new("Frame")
	local var5 = reactRobloxModule.createRoot(frame)
	reactRobloxModule.act(function() --[[ line: 12 ]]
		-- upvalues: var5 (ref), reactModule (copy), contextProvidersModule (copy), p0 (ref), p1 (ref)
		var5:render(reactModule.createElement(contextProvidersModule, { theme = "Dark" }, { Child = reactModule.createElement(p0, p1) }))
	end)
	
	return frame, var5
end