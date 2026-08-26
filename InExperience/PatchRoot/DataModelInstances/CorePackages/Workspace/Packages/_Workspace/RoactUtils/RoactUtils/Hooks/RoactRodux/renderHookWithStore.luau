local parent = script:FindFirstAncestor("RoactUtils").Parent
local roactRoduxModule = require(parent.RoactRodux)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local act = reactRobloxModule.act

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), roactRoduxModule (ref), reactRobloxModule (ref), act (ref)
	local t = {}
	
	local var1 = function(p4)
		-- upvalues: t (ref), p2 (ref)
		t.current = p2(p4)
		
		return nil
	end
	
	local function createRootElement(p4)
		-- upvalues: reactModule (copy), var1 (ref), p1 (ref), roactRoduxModule (copy)
		local var2 = reactModule.createElement(var1, p4)
		
		if p1 ~= nil then
			var2 = reactModule.createElement(roactRoduxModule.StoreProvider, { store = p1 }, { Wrapper = var2 })
		end
		return var2
	end
	
	local var2 = reactRobloxModule.createRoot(Instance.new("Frame"))
	act(function()
		-- upvalues: var2 (ref), createRootElement (ref), p3 (ref)
		var2:render(createRootElement(p3 or {}))
	end)
	
	return {
		result = t,
		rerender = function(p4)
			-- upvalues: act (copy), var2 (ref), createRootElement (ref)
			act(function()
				-- upvalues: var2 (copy), createRootElement (copy), p4 (ref)
				var2:render(createRootElement(p4))
			end)
		end,
		cleanup = function()
			-- upvalues: var2 (ref)
			var2:unmount()
		end
	}
end