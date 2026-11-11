local Parent = script:FindFirstAncestor("ChallengeDialog").Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local NewResult = RoduxModule.Store.new(function()
	return {}
end, {}, { RoduxModule.thunkMiddleware })

return {
	createTreeWithProviders = function(p1, p2, p3)
		-- upvalues: RoactModule (copy), RoactRoduxModule (copy), NewResult (copy)
		local MountResult = RoactModule.mount((RoactModule.createFragment({
			storeProvider = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = if p3 == nil then NewResult else p3 }, { myElement = RoactModule.createElement(p1, p2) })
		})))
		
		return MountResult, function()
			-- upvalues: RoactModule (upval), MountResult (copy)
			RoactModule.unmount(MountResult)
		end
	end
}