local foundationModule = require(script:FindFirstAncestor("SplitPane").Parent.Foundation)
local _ = require(script.Parent.SplitPaneEducationalTourSteps)
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign

local function _(value, p1, p2)
	if p2 then
		return if p1 and value.collapsedGamepadVideoAssetId ~= nil then value.collapsedGamepadVideoAssetId elseif value.collapsedVideoAssetId == nil then if p1 and value.gamepadVideoAssetId ~= nil then value.gamepadVideoAssetId else value.videoAssetId else value.collapsedVideoAssetId
	end
end

return function(p1)
	-- upvalues: popoverSide (ref), popoverAlign (ref)
	local step = p1.step
	
	if step == nil then
		return nil
	end
	local var1
	local var2 = if p1.isCollapsedStepOne and not p1.isDirectionalInput then { side = popoverSide.Bottom, align = popoverAlign.End } elseif p1.isDirectionalInput and (p1.stepIndex == 2 or p1.stepIndex == 3) then { side = popoverSide.Top, align = popoverAlign.Center } elseif p1.stepIndex == 1 then { side = popoverSide.Left, align = popoverAlign.Center } elseif p1.stepIndex == 2 then { side = popoverSide.Top, align = popoverAlign.Center } else { side = popoverSide.Bottom, align = popoverAlign.End }
	local t = {
		stepIndex = p1.stepIndex,
		totalSteps = p1.totalSteps,
		isFinal = step.isFinal == true,
		primaryActionText = if step.isFinal then p1.localized.finishTourButton else p1.localized.continueButton,
		skipActionText = if step.isFinal then nil else p1.localized.skipTourButton,
		title = if p1.stepIndex == 1 then p1.localized.stepOneTitle elseif p1.stepIndex == 2 then p1.localized.stepTwoTitle else p1.localized.stepThreeTitle,
		text = if p1.stepIndex == 1 then if p1.isCollapsedStepOne then p1.localized.stepOneCollapsedDescription else p1.localized.stepOneExpandedDescription elseif p1.stepIndex == 2 then p1.localized.stepTwoDescription else p1.localized.stepThreeDescription,
		side = var2.side,
		align = var2.align
	}
	local isDirectionalInput = p1.isDirectionalInput
	
	if p1.isCollapsedStepOne then
		var1 = if isDirectionalInput and step.collapsedGamepadVideoAssetId ~= nil then step.collapsedGamepadVideoAssetId elseif step.collapsedVideoAssetId ~= nil then if isDirectionalInput and step.gamepadVideoAssetId ~= nil then step.gamepadVideoAssetId else step.videoAssetId else step.collapsedVideoAssetId
	end
	t.videoAssetId = var1
	
	return t
end