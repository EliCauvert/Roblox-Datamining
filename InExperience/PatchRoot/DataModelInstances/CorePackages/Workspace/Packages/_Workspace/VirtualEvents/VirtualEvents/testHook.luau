local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local reactRobloxModule = require(virtualEvents.Parent.ReactRoblox)
local withMockProvidersModule = require(virtualEvents.withMockProviders)

return function(p1)
	-- upvalues: reactRobloxModule (ref), withMockProvidersModule (ref), reactModule (ref)
	local var1 = reactRobloxModule.createRoot(Instance.new("ScreenGui"))
	local var2 = withMockProvidersModule({
		HookTester = reactModule.createElement(function()
			-- upvalues: p1 (ref)
			p1()
			
			return nil
		end)
	})
	reactRobloxModule.act(function()
		-- upvalues: var1 (ref), var2 (ref)
		var1:render(var2)
	end)
end