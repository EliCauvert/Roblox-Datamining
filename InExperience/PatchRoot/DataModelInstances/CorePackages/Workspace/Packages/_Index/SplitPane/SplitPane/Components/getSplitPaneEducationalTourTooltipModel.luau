local FoundationModule = require(script:FindFirstAncestor("SplitPane").Parent.Foundation)
local _ = require(script.Parent.SplitPaneEducationalTourSteps)
local GetSplitPaneEducationalTourVideoAssetIdModule = require(script.Parent.getSplitPaneEducationalTourVideoAssetId)
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign

return function(p1)
	-- upvalues: PopoverSide (copy), PopoverAlign (copy), GetSplitPaneEducationalTourVideoAssetIdModule (copy)
	local Step = p1.step
	
	if Step == nil then
		return nil
	else
		local Config = if p1.isCollapsedStepOne and not p1.isDirectionalInput then { side = PopoverSide.Bottom, align = PopoverAlign.End } elseif p1.isDirectionalInput and (p1.stepIndex == 2 or p1.stepIndex == 3) then { side = PopoverSide.Top, align = PopoverAlign.Center } elseif p1.stepIndex == 1 then { side = PopoverSide.Left, align = PopoverAlign.Center } elseif p1.stepIndex == 2 then { side = PopoverSide.Top, align = PopoverAlign.Center } else { side = PopoverSide.Bottom, align = PopoverAlign.End }
		
		return {
			stepIndex = p1.stepIndex,
			totalSteps = p1.totalSteps,
			isFinal = Step.isFinal == true,
			primaryActionText = if Step.isFinal then p1.localized.finishTourButton else p1.localized.continueButton,
			skipActionText = if Step.isFinal then nil else p1.localized.skipTourButton,
			title = if p1.stepIndex == 1 then p1.localized.stepOneTitle elseif p1.stepIndex == 2 then p1.localized.stepTwoTitle else p1.localized.stepThreeTitle,
			text = if p1.stepIndex == 1 then if p1.isCollapsedStepOne then p1.localized.stepOneCollapsedDescription else p1.localized.stepOneExpandedDescription elseif p1.stepIndex == 2 then p1.localized.stepTwoDescription else p1.localized.stepThreeDescription,
			side = Config.side,
			align = Config.align,
			videoAssetId = GetSplitPaneEducationalTourVideoAssetIdModule(Step, p1.isDirectionalInput, p1.isCollapsedStepOne)
		}
	end
end