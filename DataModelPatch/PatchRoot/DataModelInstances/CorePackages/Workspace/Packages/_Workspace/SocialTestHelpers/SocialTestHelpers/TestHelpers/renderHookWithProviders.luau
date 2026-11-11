local DependenciesModule = require(script:FindFirstAncestor("SocialTestHelpers").dependencies)
local ReactRoblox = DependenciesModule.ReactRoblox
local ActFunction = ReactRoblox.act
local Dash = DependenciesModule.Dash
local CreateTreeWithProvidersModule = require(script.Parent.createTreeWithProviders)

return function(Callback, p1)
	-- upvalues: Dash (copy), CreateTreeWithProvidersModule (copy), ReactRoblox (copy), ActFunction (copy)
	local Entry = nil
	
	local function v4(p2)
		-- upvalues: Entry (ref), Callback (copy)
		Entry = { Callback(p2) }
		
		return nil
	end
	
	local function createRootElement(p2, p3)
		-- upvalues: Dash (upval), p1 (copy), CreateTreeWithProvidersModule (upval), v4 (copy)
		local JoinResult = Dash.join(p1 or {}, p3 or {})
		JoinResult.props = Dash.join(JoinResult.props or {}, p2 or {})
		
		return (CreateTreeWithProvidersModule(v4, JoinResult))
	end
	
	local Root = ReactRoblox.createRoot((Instance.new("Frame")))
	ActFunction(function()
		-- upvalues: Root (copy), createRootElement (copy)
		Root:render((createRootElement({})))
	end)
	
	return {
		result = if Entry then Entry[1] else nil,
		getResult = function()
			-- upvalues: Entry (ref)
			return if Entry then Entry[1] else nil
		end,
		getResults = function()
			-- upvalues: Entry (ref)
			return unpack(Entry)
		end,
		rerender = function(p2, p3)
			-- upvalues: ActFunction (upval), Root (copy), createRootElement (copy)
			ActFunction(function()
				-- upvalues: Root (upval), createRootElement (upval), p2 (copy), p3 (copy)
				Root:render((createRootElement(p2, p3)))
			end)
		end,
		cleanup = function()
			-- upvalues: Root (copy)
			Root:unmount()
		end
	}
end