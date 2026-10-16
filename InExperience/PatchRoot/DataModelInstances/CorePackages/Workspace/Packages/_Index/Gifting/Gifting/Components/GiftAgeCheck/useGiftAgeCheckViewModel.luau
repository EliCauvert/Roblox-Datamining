local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.GiftAgeCheckView)

return function(p1) --[[ Line: 26 | Named "useGiftAgeCheckViewModel" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	local UseScaledValueResult = FoundationModule.Hooks.useScaledValue(320)
	local UseScaledValueResult1 = FoundationModule.Hooks.useScaledValue(180)
	
	return {
		isOpen = p1.isOpen,
		titleText = p1.copy.titleText,
		descriptionText = p1.copy.descriptionText,
		continueLabel = p1.copy.continueLabel,
		mobileSnapPoint = FoundationModule.Hooks.useScaledValue(363),
		pictogramSize = ReactModule.useMemo(function(): UDim2 --[[ Line: 30 ]]
			-- upvalues: UseScaledValueResult (copy), UseScaledValueResult1 (copy)
			return UDim2.fromOffset(UseScaledValueResult, UseScaledValueResult1)
		end, { UseScaledValueResult, UseScaledValueResult1 }),
		onContinue = p1.onContinue,
		onClose = p1.onClose
	}
end