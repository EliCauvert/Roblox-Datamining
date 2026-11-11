local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local RoduxModule = require(Parent.Rodux)
local ActFunction = ReactRobloxModule.act
local MakeTestRootModule = require(script.Parent.makeTestRoot)

return function(Callback, p1, p2)
	-- upvalues: ReactModule (copy), MakeTestRootModule (copy), RoduxModule (copy), ReactRobloxModule (copy), ActFunction (copy)
	local v1 = nil
	
	local function v6()
		-- upvalues: v1 (ref), Callback (copy), p1 (copy), ReactModule (upval)
		v1 = Callback(p1)
		
		return ReactModule.createElement("Frame")
	end
	
	local function createRootElement()
		-- upvalues: MakeTestRootModule (upval), p2 (copy), RoduxModule (upval), ReactModule (upval), v6 (copy)
		return ReactModule.createElement(MakeTestRootModule({
			store = p2 or RoduxModule.Store.new(RoduxModule.createReducer({}, {}))
		}), { children = ReactModule.createElement(v6, {}) })
	end
	
	local Root = ReactRobloxModule.createRoot((Instance.new("Frame")))
	ActFunction(function()
		-- upvalues: Root (copy), createRootElement (copy)
		Root:render(createRootElement())
	end)
	
	return {
		getResult = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		cleanup = function()
			-- upvalues: Root (copy)
			Root:unmount()
		end
	}
end