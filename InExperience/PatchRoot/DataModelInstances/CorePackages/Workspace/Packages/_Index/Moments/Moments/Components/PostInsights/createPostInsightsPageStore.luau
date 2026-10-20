local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsTypes)
local _ = require(Moments.Components.Feed.Items.Moment.createMomentStore)
local CreateSignalFunction = require(Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	
	return {
		getIsOpen = Signal,
		getContext = Signal1,
		open = function(p1)
			-- upvalues: Signal2_1 (copy), Signal2 (copy)
			Signal2_1(p1)
			Signal2(true)
		end,
		close = function()
			-- upvalues: Signal2 (copy)
			Signal2(false)
		end,
		reset = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(false)
			Signal2_1(nil)
		end
	}
end