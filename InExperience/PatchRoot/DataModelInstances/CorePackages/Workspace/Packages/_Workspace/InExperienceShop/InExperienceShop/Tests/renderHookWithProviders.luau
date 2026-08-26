local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationProvider = require(parent.Foundation).FoundationProvider

return function(p1)
	-- upvalues: reactRobloxModule (ref), reactModule (ref), foundationProvider (ref)
	local t = {}
	local screenGui = Instance.new("ScreenGui")
	local var1 = reactRobloxModule.createRoot(screenGui)
	
	local function TestHarness()
		-- upvalues: t (ref), p1 (ref)
		t.current = p1()
		
		return nil
	end
	
	reactRobloxModule.act(function()
		-- upvalues: var1 (ref), reactModule (copy), foundationProvider (copy), TestHarness (ref)
		var1:render(reactModule.createElement(foundationProvider, { colorMode = "Dark" }, reactModule.createElement(TestHarness)))
	end)
	
	return t, function()
		-- upvalues: reactRobloxModule (copy), var1 (ref), screenGui (ref)
		reactRobloxModule.act(function()
			-- upvalues: var1 (copy)
			var1:unmount()
		end)
		screenGui:Destroy()
	end
end