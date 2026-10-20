local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationProvider = require(Parent.Foundation).FoundationProvider

return function(Callback)
	-- upvalues: ReactRobloxModule (copy), ReactModule (copy), FoundationProvider (copy)
	local t = {}
	local ScreenGui = Instance.new("ScreenGui")
	local Root = ReactRobloxModule.createRoot(ScreenGui)
	
	local function TestHarness()
		-- upvalues: t (copy), Callback (copy)
		t.current = Callback()
		
		return nil
	end
	
	ReactRobloxModule.act(function()
		-- upvalues: Root (copy), ReactModule (upval), FoundationProvider (upval), TestHarness (copy)
		Root:render(ReactModule.createElement(FoundationProvider, { colorMode = "Dark" }, ReactModule.createElement(TestHarness)))
	end)
	
	return t, function()
		-- upvalues: ReactRobloxModule (upval), Root (copy), ScreenGui (copy)
		ReactRobloxModule.act(function()
			-- upvalues: Root (upval)
			Root:unmount()
		end)
		ScreenGui:Destroy()
	end
end