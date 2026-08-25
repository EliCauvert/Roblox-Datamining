local parent = script:FindFirstAncestor("RoactUtils").Parent
local roactRoduxModule = require(parent.RoactRodux)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local act = reactRobloxModule.act

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), roactRoduxModule (ref), reactRobloxModule (ref), act (ref)
	local t = {}
	
	local var4 = function(p3)
		-- upvalues: t (ref), p1 (ref)
		t.current = p1(p3)
		
		return nil
	end
	
	local function createRootElement(p4)
		-- upvalues: reactModule (copy), var4 (ref), p0 (ref), roactRoduxModule (copy)
		local var7 = reactModule.createElement(var4, p4)
		
		if p0 ~= nil then
			var7 = reactModule.createElement(roactRoduxModule.StoreProvider, { store = p0 }, { Wrapper = var7 })
		end
		return var7
	end
	
	local var6 = reactRobloxModule.createRoot(Instance.new("Frame"))
	act(function()
		-- upvalues: var6 (ref), createRootElement (ref), p2 (ref)
		var6:render(createRootElement(p2 or {}))
	end)
	
	return {
		result = t,
		rerender = function(p5)
			-- upvalues: act (copy), var6 (ref), createRootElement (ref)
			act(function()
				-- upvalues: var6 (copy), createRootElement (copy), p5 (ref)
				var6:render(createRootElement(p5))
			end)
		end,
		cleanup = function()
			-- upvalues: var6 (ref)
			var6:unmount()
		end
	}
end