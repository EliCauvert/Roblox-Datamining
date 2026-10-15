local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(script.Parent.GiftAgeCheckView)

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref)
	local var1 = foundationModule.Hooks.useScaledValue(363)
	local var2 = foundationModule.Hooks.useScaledValue(320)
	local var3 = foundationModule.Hooks.useScaledValue(180)
	
	return {
		isOpen = p1.isOpen,
		titleText = p1.copy.titleText,
		descriptionText = p1.copy.descriptionText,
		continueLabel = p1.copy.continueLabel,
		mobileSnapPoint = var1,
		pictogramSize = reactModule.useMemo(function()
			-- upvalues: var2 (ref), var3 (ref)
			return UDim2.fromOffset(var2, var3)
		end, { var2, var3 }),
		onContinue = p1.onContinue,
		onClose = p1.onClose
	}
end