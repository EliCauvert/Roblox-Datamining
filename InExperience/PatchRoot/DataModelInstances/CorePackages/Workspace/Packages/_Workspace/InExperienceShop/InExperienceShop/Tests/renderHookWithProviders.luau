local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationProvider = require(parent.Foundation).FoundationProvider

return function(p0)
	-- upvalues: reactRobloxModule (ref), reactModule (ref), foundationProvider (ref)
	local t = {}
	local screenGui = Instance.new("ScreenGui")
	local var4 = reactRobloxModule.createRoot(screenGui)
	
	local function TestHarness()
		-- upvalues: t (ref), p0 (ref)
		t.current = p0()
		
		return nil
	end
	
	reactRobloxModule.act(function()
		-- upvalues: var4 (ref), reactModule (copy), foundationProvider (copy), TestHarness (ref)
		var4:render(reactModule.createElement(foundationProvider, { colorMode = "Dark" }, reactModule.createElement(TestHarness)))
	end)
	
	return t, function()
		-- upvalues: reactRobloxModule (copy), var4 (ref), screenGui (ref)
		reactRobloxModule.act(function()
			-- upvalues: var4 (copy)
			var4:unmount()
		end)
		screenGui:Destroy()
	end
end