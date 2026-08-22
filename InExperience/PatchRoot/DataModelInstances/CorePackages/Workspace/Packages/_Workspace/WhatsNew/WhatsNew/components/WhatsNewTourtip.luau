local whatsNew = script:FindFirstAncestor("WhatsNew")
local parent = whatsNew.Parent
local enumsModule = require(whatsNew.Enums)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local getWhatsNewStoreModule = require(whatsNew.store.GetWhatsNewStore)
local useWhatsNewRuntimeStateModule = require(whatsNew.hooks.useWhatsNewRuntimeState)
local whatsNewTelemetryModule = require(whatsNew.telemetry.WhatsNewTelemetry)
local educationalTooltip = foundationModule.EducationalTooltip
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local useLocalization = localizationModule.Hooks.useLocalization

local function _(p0) --[[ line: 28 | named "isRectReady" ]]
	return p0.X > 0 and p0.Y > 0
end

return reactModule.memo(function() --[[ line: 32 | named "WhatsNewTourtip" ]]
	-- upvalues: getWhatsNewStoreModule (ref), useWhatsNewRuntimeStateModule (ref), enumsModule (ref), reactModule (ref), useLocalization (ref), whatsNewTelemetryModule (ref), buttonVariant (ref), view (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref)
	local var8 = getWhatsNewStoreModule()
	local var9 = useWhatsNewRuntimeStateModule()
	local currentEntry = var9.currentEntry
	local globalStepIndex = var9.globalStepIndex
	local var10 = var9.surface == enumsModule.WhatsNewSurface.TourTip and (currentEntry ~= nil and globalStepIndex ~= nil)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	local var13 = useLocalization({
		back = "CommonUI.Controls.Action.Back",
		next = "CommonUI.Controls.Action.Next",
		done = "CommonUI.Controls.Action.Done"
	})
	local var14 = if globalStepIndex ~= nil then 0 else globalStepIndex + 1
	local globalTotalSteps = var9.globalTotalSteps
	local var15 = var10 and globalStepIndex == 0
	local var16 = var10 and globalTotalSteps <= var14
	local var17 = if var10 and currentEntry ~= nil then var8.getAnchorRef(currentEntry.anchorId) else nil
	var12.current = var17
	local var18 = false
	
	if var17 ~= nil then
		local absoluteSize = var17.AbsoluteSize
		var18 = absoluteSize.X > 0 and absoluteSize.Y > 0
	end
	reactModule.useEffect(function() --[[ line: 62 ]]
		-- upvalues: var10 (ref), currentEntry (ref), var11 (ref), whatsNewTelemetryModule (copy), var8 (ref)
		if not var10 or currentEntry == nil then
			var11.current = nil
			
			return
		elseif var11.current == currentEntry.id then
			return
		end
		var11.current = currentEntry.id
		whatsNewTelemetryModule.logTourtipInteraction(whatsNewTelemetryModule.InteractionType.IMPRESSION, currentEntry.id, nil, var8.getRuntimeState())
	end, { var10, currentEntry, var8 })
	local var19 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: currentEntry (ref), var8 (ref)
		if currentEntry == nil then
			return
		end
		var8.next()
	end, { var8, currentEntry })
	local var20 = reactModule.useCallback(function() --[[ line: 86 ]]
		-- upvalues: currentEntry (ref), var8 (ref)
		if currentEntry == nil then
			return
		end
		var8.back()
	end, { var8, currentEntry })
	local var21 = reactModule.useCallback(function() --[[ line: 93 ]]
		-- upvalues: currentEntry (ref), var8 (ref)
		if currentEntry == nil then
			return
		end
		var8.completeTour({ earlyDismiss = true })
	end, { var8, currentEntry })
	
	if not var10 or currentEntry == nil or globalStepIndex == nil then
		return nil
	elseif var17 == nil or not var18 then
		return nil
	end
	local var22 = globalTotalSteps > 1
	local t = {}
	local t_1 = nil
	
	if var22 then
		table.insert(t, {
			testId = "whats-new-tourtip--action-1",
			isDisabled = var15,
			text = var13.back,
			variant = buttonVariant.Standard,
			onActivated = var20
		})
		table.insert(t, {
			testId = "whats-new-tourtip--action-2",
			text = if var16 then var13.done else var13.next,
			variant = buttonVariant.Emphasis,
			onActivated = var19
		})
		t_1 = { current = var14, total = globalTotalSteps }
	end
	return reactModule.createElement(view, {
		tag = "size-full",
		BackgroundTransparency = 1,
		Active = false
	}, {
		[`{currentEntry.id}-{var17:GetFullName()}`] = reactModule.createElement(educationalTooltip, {
			isOpen = true,
			testId = "whats-new-tourtip",
			anchorRef = var12,
			title = currentEntry.title,
			text = currentEntry.text,
			side = currentEntry.side or popoverSide.Bottom,
			align = currentEntry.align or popoverAlign.Center,
			hasActions = var22,
			showSteps = var22,
			steps = t_1,
			onClose = var21,
			actions = t
		})
	})
end)