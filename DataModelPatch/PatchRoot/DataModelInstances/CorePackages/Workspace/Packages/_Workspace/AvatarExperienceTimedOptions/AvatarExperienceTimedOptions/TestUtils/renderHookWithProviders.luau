local AvatarExperienceTimedOptions = script:FindFirstAncestor("AvatarExperienceTimedOptions")
local Parent = AvatarExperienceTimedOptions.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoduxModule = require(Parent.Rodux)
local ActFunction = ReactRobloxModule.act
local MakeTestRootModule = require(AvatarExperienceTimedOptions.TestUtils.makeTestRoot)

return function(Callback, p1, p2)
	-- upvalues: MakeTestRootModule (copy), RoduxModule (copy), ReactModule (copy), ReactRobloxModule (copy), ActFunction (copy)
	local v1 = nil
	
	local function v7()
		-- upvalues: v1 (ref), Callback (copy), p1 (copy)
		v1 = Callback(p1)
		
		return nil
	end
	
	local function createRootElement()
		-- upvalues: MakeTestRootModule (upval), p2 (copy), RoduxModule (upval), ReactModule (upval), v7 (copy)
		return ReactModule.createElement(MakeTestRootModule({
			store = p2 or RoduxModule.Store.new(RoduxModule.createReducer({}, {}))
		}), {}, ReactModule.createElement(v7, {}))
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