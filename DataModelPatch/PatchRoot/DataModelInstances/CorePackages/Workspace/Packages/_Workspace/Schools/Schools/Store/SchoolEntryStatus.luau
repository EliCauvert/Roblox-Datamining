local Schools = script:FindFirstAncestor("Schools")
local CreateSignalFunction = require(Schools.Parent.Signals).createSignal
local EnumsModule = require(Schools.Common.Enums)
local Signal = CreateSignalFunction(false)
local Signal1 = CreateSignalFunction(false)
local Signal2 = CreateSignalFunction(EnumsModule.SchoolWaitlistVariant.School)

return {
	getVerifiedSignal = function()
		-- upvalues: Signal (copy)
		return Signal
	end,
	getIsLiveSignal = function()
		-- upvalues: Signal1 (copy)
		return Signal1
	end,
	getVariantSignal = function()
		-- upvalues: Signal2 (copy)
		return Signal2
	end
}