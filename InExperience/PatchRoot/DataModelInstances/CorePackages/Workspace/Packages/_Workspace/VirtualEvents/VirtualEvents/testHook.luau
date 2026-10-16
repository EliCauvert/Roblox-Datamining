local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local ReactRobloxModule = require(VirtualEvents.Parent.ReactRoblox)
local WithMockProvidersModule = require(VirtualEvents.withMockProviders)

return function(Callback) --[[ Line: 7 | Named "testHook" ]]
	-- upvalues: ReactRobloxModule (copy), WithMockProvidersModule (copy), ReactModule (copy)
	local Root = ReactRobloxModule.createRoot((Instance.new("ScreenGui")))
	local WithMockProvidersModuleResult = WithMockProvidersModule({
		HookTester = ReactModule.createElement(function() --[[ Line: 11 | Named "HookTester" ]]
			-- upvalues: Callback (copy)
			Callback()
			
			return nil
		end)
	})
	ReactRobloxModule.act(function() --[[ Line: 20 ]]
		-- upvalues: Root (copy), WithMockProvidersModuleResult (copy)
		Root:render(WithMockProvidersModuleResult)
	end)
end