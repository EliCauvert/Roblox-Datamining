local ContactImporter = script:FindFirstAncestor("ContactImporter")
local ReactRoblox = require(ContactImporter.dependencies).ReactRoblox
local ActFunction = ReactRoblox.act
local CreateTreeWithProvidersFunction = require(ContactImporter.devDependencies).createTreeWithProviders

return function(Callback, p1)
	-- upvalues: CreateTreeWithProvidersFunction (copy), ReactRoblox (copy), ActFunction (copy)
	local Result = nil
	
	local function v3(p2)
		-- upvalues: Result (ref), Callback (copy)
		Result = Callback(p2)
		
		return nil
	end
	
	local function _(_)
		-- upvalues: CreateTreeWithProvidersFunction (upval), v3 (copy), p1 (copy)
		return (CreateTreeWithProvidersFunction(v3, p1 or {}))
	end
	
	local Root = ReactRoblox.createRoot((Instance.new("Frame")))
	ActFunction(function()
		-- upvalues: Root (copy), CreateTreeWithProvidersFunction (upval), v3 (copy), p1 (copy)
		Root:render((CreateTreeWithProvidersFunction(v3, p1 or {})))
	end)
	
	return {
		result = Result,
		rerender = function(p2)
			-- upvalues: ActFunction (upval), Root (copy), CreateTreeWithProvidersFunction (upval), v3 (copy), p1 (copy)
			ActFunction(function()
				-- upvalues: Root (upval), p2 (copy), CreateTreeWithProvidersFunction (upval), v3 (upval), p1 (upval)
				Root:render((CreateTreeWithProvidersFunction(v3, p1 or {})))
			end)
		end,
		cleanup = function()
			-- upvalues: Root (copy)
			Root:unmount()
		end
	}
end