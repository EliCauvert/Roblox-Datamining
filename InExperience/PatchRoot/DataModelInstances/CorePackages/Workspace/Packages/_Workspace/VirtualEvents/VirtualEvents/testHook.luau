local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local reactRobloxModule = require(virtualEvents.Parent.ReactRoblox)
local withMockProvidersModule = require(virtualEvents.withMockProviders)

return function(p0)
	-- upvalues: reactRobloxModule (ref), withMockProvidersModule (ref), reactModule (ref)
	local var4 = reactRobloxModule.createRoot(Instance.new("ScreenGui"))
	local var5 = withMockProvidersModule({
		HookTester = reactModule.createElement(function()
			-- upvalues: p0 (ref)
			p0()
			
			return nil
		end)
	})
	reactRobloxModule.act(function()
		-- upvalues: var4 (ref), var5 (ref)
		var4:render(var5)
	end)
end