local foundationModule = require(script:FindFirstAncestor("SplitPane").Parent.Foundation)
local _ = require(script.Parent.SplitPaneEducationalTourSteps)
local getSplitPaneEducationalTourVideoAssetIdModule = require(script.Parent.getSplitPaneEducationalTourVideoAssetId)
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign

return function(p1)
	-- upvalues: popoverSide (ref), popoverAlign (ref), getSplitPaneEducationalTourVideoAssetIdModule (ref)
	local step = p1.step
	
	if step == nil then
		return nil
	end
	local var1 = if p1.isCollapsedStepOne and not p1.isDirectionalInput then { side = popoverSide.Bottom, align = popoverAlign.End } elseif p1.isDirectionalInput and (p1.stepIndex == 2 or p1.stepIndex == 3) then { side = popoverSide.Top, align = popoverAlign.Center } elseif p1.stepIndex == 1 then { side = popoverSide.Left, align = popoverAlign.Center } elseif p1.stepIndex == 2 then { side = popoverSide.Top, align = popoverAlign.Center } else { side = popoverSide.Bottom, align = popoverAlign.End }
	
	return {
		stepIndex = p1.stepIndex,
		totalSteps = p1.totalSteps,
		isFinal = step.isFinal == true,
		primaryActionText = if step.isFinal then p1.localized.finishTourButton else p1.localized.continueButton,
		skipActionText = if step.isFinal then nil else p1.localized.skipTourButton,
		title = if p1.stepIndex == 1 then p1.localized.stepOneTitle elseif p1.stepIndex == 2 then p1.localized.stepTwoTitle else p1.localized.stepThreeTitle,
		text = if p1.stepIndex == 1 then if p1.isCollapsedStepOne then p1.localized.stepOneCollapsedDescription else p1.localized.stepOneExpandedDescription elseif p1.stepIndex == 2 then p1.localized.stepTwoDescription else p1.localized.stepThreeDescription,
		side = var1.side,
		align = var1.align,
		videoAssetId = getSplitPaneEducationalTourVideoAssetIdModule(step, p1.isDirectionalInput, p1.isCollapsedStepOne)
	}
end