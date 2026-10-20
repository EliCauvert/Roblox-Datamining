local ReactRobloxModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.Dev.ReactRoblox)
local ActFunction = ReactRobloxModule.act
local CreateTreeWithProvidersModule = require(script.Parent.createTreeWithProviders)

return function(Callback, p1)
	-- upvalues: CreateTreeWithProvidersModule (copy), ReactRobloxModule (copy), ActFunction (copy)
	local Result = nil
	
	local function v3(p2)
		-- upvalues: Result (ref), Callback (copy)
		Result = Callback(p2)
		
		return nil
	end
	
	local function _(_)
		-- upvalues: CreateTreeWithProvidersModule (upval), v3 (copy), p1 (copy)
		return (CreateTreeWithProvidersModule(v3, p1 or {}))
	end
	
	local Root = ReactRobloxModule.createRoot((Instance.new("Frame")))
	ActFunction(function()
		-- upvalues: Root (copy), CreateTreeWithProvidersModule (upval), v3 (copy), p1 (copy)
		Root:render((CreateTreeWithProvidersModule(v3, p1 or {})))
	end)
	
	return {
		result = Result,
		rerender = function(p2)
			-- upvalues: ActFunction (upval), Root (copy), CreateTreeWithProvidersModule (upval), v3 (copy), p1 (copy)
			ActFunction(function()
				-- upvalues: Root (upval), p2 (copy), CreateTreeWithProvidersModule (upval), v3 (upval), p1 (upval)
				Root:render((CreateTreeWithProvidersModule(v3, p1 or {})))
			end)
		end,
		cleanup = function()
			-- upvalues: Root (copy)
			Root:unmount()
		end
	}
end