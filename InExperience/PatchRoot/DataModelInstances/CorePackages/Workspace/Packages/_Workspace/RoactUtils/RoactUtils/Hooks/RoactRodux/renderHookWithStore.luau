local Parent = script:FindFirstAncestor("RoactUtils").Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ActFunction = ReactRobloxModule.act

return function(Store, Callback, p1) --[[ Line: 12 | Named "renderHookWithStore" ]]
	-- upvalues: ReactModule (copy), RoactRoduxModule (copy), ReactRobloxModule (copy), ActFunction (copy)
	local Result = {}
	
	local function v5(p2) --[[ Line: 15 ]]
		-- upvalues: Result (copy), Callback (copy)
		Result.current = Callback(p2)
		
		return nil
	end
	
	local function createRootElement(p2) --[[ Line: 20 ]]
		-- upvalues: ReactModule (upval), v5 (copy), Store (copy), RoactRoduxModule (upval)
		local Element = ReactModule.createElement(v5, p2)
		
		if Store ~= nil then
			Element = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, { Wrapper = Element })
		end
		return Element
	end
	
	local Root = ReactRobloxModule.createRoot((Instance.new("Frame")))
	ActFunction(function() --[[ Line: 35 ]]
		-- upvalues: Root (copy), createRootElement (copy), p1 (copy)
		Root:render((createRootElement(p1 or {})))
	end)
	
	return {
		result = Result,
		rerender = function(p2) --[[ Line: 39 ]]
			-- upvalues: ActFunction (upval), Root (copy), createRootElement (copy)
			ActFunction(function() --[[ Line: 40 ]]
				-- upvalues: Root (upval), createRootElement (upval), p2 (copy)
				Root:render((createRootElement(p2)))
			end)
		end,
		cleanup = function() --[[ Line: 45 ]]
			-- upvalues: Root (copy)
			Root:unmount()
		end
	}
end