local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationProvider = require(Parent.Foundation).FoundationProvider

return function(Callback) --[[ Line: 19 | Named "renderHookWithProviders" ]]
	-- upvalues: ReactRobloxModule (copy), ReactModule (copy), FoundationProvider (copy)
	local t = {}
	local ScreenGui = Instance.new("ScreenGui")
	local Root = ReactRobloxModule.createRoot(ScreenGui)
	
	local function TestHarness() --[[ Line: 24 ]]
		-- upvalues: t (copy), Callback (copy)
		t.current = Callback()
		
		return nil
	end
	
	ReactRobloxModule.act(function() --[[ Line: 29 ]]
		-- upvalues: Root (copy), ReactModule (upval), FoundationProvider (upval), TestHarness (copy)
		Root:render(ReactModule.createElement(FoundationProvider, { colorMode = "Dark" }, ReactModule.createElement(TestHarness)))
	end)
	
	return t, function() --[[ Line: 35 | Named "cleanup" ]]
		-- upvalues: ReactRobloxModule (upval), Root (copy), ScreenGui (copy)
		ReactRobloxModule.act(function() --[[ Line: 36 ]]
			-- upvalues: Root (upval)
			Root:unmount()
		end)
		ScreenGui:Destroy()
	end
end