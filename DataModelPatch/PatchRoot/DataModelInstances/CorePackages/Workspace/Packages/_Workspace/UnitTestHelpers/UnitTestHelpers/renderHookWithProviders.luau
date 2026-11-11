local ReactRobloxModule = require(script.Parent.Parent.Dev.ReactRoblox)
local ActFunction = ReactRobloxModule.act
local CreateTreeWithProvidersModule = require(script.Parent.createTreeWithProviders)

return function(Callback, p1)
	-- upvalues: CreateTreeWithProvidersModule (copy), ReactRobloxModule (copy), ActFunction (copy)
	local Result = nil
	local Callback1 = nil
	
	local function v3(p2)
		-- upvalues: Result (ref), Callback (copy)
		Result = Callback(p2)
		
		return nil
	end
	
	local function _(p2)
		-- upvalues: CreateTreeWithProvidersModule (upval), v3 (copy)
		return (CreateTreeWithProvidersModule(v3, p2))
	end
	
	local Root = ReactRobloxModule.createRoot((Instance.new("Frame")))
	ActFunction(function()
		-- upvalues: Root (copy), p1 (copy), CreateTreeWithProvidersModule (upval), v3 (copy)
		Root:render((CreateTreeWithProvidersModule(v3, p1)))
	end)
	
	local function rerender(p2)
		-- upvalues: ActFunction (upval), Root (copy), p1 (copy), CreateTreeWithProvidersModule (upval), v3 (copy), Callback1 (ref)
		ActFunction(function()
			-- upvalues: Root (upval), p2 (copy), p1 (upval), CreateTreeWithProvidersModule (upval), v3 (upval)
			Root:render((CreateTreeWithProvidersModule(v3, p2 or p1)))
		end)
		
		return Callback1()
	end
	
	local function cleanup()
		-- upvalues: Root (copy)
		Root:unmount()
	end
	
	Callback1 = function()
		-- upvalues: Result (ref), rerender (copy), cleanup (copy)
		return { result = Result, rerender = rerender, cleanup = cleanup }
	end
	
	return Callback1()
end