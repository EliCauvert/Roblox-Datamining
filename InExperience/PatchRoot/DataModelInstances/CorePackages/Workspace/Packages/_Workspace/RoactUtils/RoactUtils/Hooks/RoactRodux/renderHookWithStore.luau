local Parent = script:FindFirstAncestor("RoactUtils").Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ActFunction = ReactRobloxModule.act

return function(Store, Callback, p1)
	-- upvalues: ReactModule (copy), RoactRoduxModule (copy), ReactRobloxModule (copy), ActFunction (copy)
	local Result = {}
	
	local function v5(p2)
		-- upvalues: Result (copy), Callback (copy)
		Result.current = Callback(p2)
		
		return nil
	end
	
	local function createRootElement(p2)
		-- upvalues: ReactModule (upval), v5 (copy), Store (copy), RoactRoduxModule (upval)
		local Element = ReactModule.createElement(v5, p2)
		
		if Store ~= nil then
			Element = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, { Wrapper = Element })
		end
		return Element
	end
	
	local Root = ReactRobloxModule.createRoot((Instance.new("Frame")))
	ActFunction(function()
		-- upvalues: Root (copy), createRootElement (copy), p1 (copy)
		Root:render((createRootElement(p1 or {})))
	end)
	
	return {
		result = Result,
		rerender = function(p2)
			-- upvalues: ActFunction (upval), Root (copy), createRootElement (copy)
			ActFunction(function()
				-- upvalues: Root (upval), createRootElement (upval), p2 (copy)
				Root:render((createRootElement(p2)))
			end)
		end,
		cleanup = function()
			-- upvalues: Root (copy)
			Root:unmount()
		end
	}
end