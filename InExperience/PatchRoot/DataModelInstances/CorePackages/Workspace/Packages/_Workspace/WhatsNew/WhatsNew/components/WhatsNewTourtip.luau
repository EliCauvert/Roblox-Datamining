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

local function _(p1)
	return p1.X > 0 and p1.Y > 0
end

return reactModule.memo(function()
	-- upvalues: getWhatsNewStoreModule (ref), useWhatsNewRuntimeStateModule (ref), enumsModule (ref), reactModule (ref), useLocalization (ref), whatsNewTelemetryModule (ref), buttonVariant (ref), view (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref)
	local var1 = getWhatsNewStoreModule()
	local var2 = useWhatsNewRuntimeStateModule()
	local currentEntry = var2.currentEntry
	local globalStepIndex = var2.globalStepIndex
	local var3 = var2.surface == enumsModule.WhatsNewSurface.TourTip and (currentEntry ~= nil and globalStepIndex ~= nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = useLocalization({
		back = "CommonUI.Controls.Action.Back",
		next = "CommonUI.Controls.Action.Next",
		done = "CommonUI.Controls.Action.Done"
	})
	local var7 = if globalStepIndex ~= nil then 0 else globalStepIndex + 1
	local globalTotalSteps = var2.globalTotalSteps
	local var8 = var3 and globalStepIndex == 0
	local var9 = var3 and globalTotalSteps <= var7
	local var10 = if var3 and currentEntry ~= nil then var1.getAnchorRef(currentEntry.anchorId) else nil
	var5.current = var10
	local var11 = false
	
	if var10 ~= nil then
		local absoluteSize = var10.AbsoluteSize
		var11 = absoluteSize.X > 0 and absoluteSize.Y > 0
	end
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), currentEntry (ref), var4 (ref), whatsNewTelemetryModule (copy), var1 (ref)
		if not var3 or currentEntry == nil then
			var4.current = nil
			
			return
		elseif var4.current == currentEntry.id then
			return
		end
		var4.current = currentEntry.id
		whatsNewTelemetryModule.logTourtipInteraction(whatsNewTelemetryModule.InteractionType.IMPRESSION, currentEntry.id, nil, var1.getRuntimeState())
	end, { var3, currentEntry, var1 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: currentEntry (ref), var1 (ref)
		if currentEntry == nil then
			return
		end
		var1.next()
	end, { var1, currentEntry })
	local var13 = reactModule.useCallback(function()
		-- upvalues: currentEntry (ref), var1 (ref)
		if currentEntry == nil then
			return
		end
		var1.back()
	end, { var1, currentEntry })
	local var14 = reactModule.useCallback(function()
		-- upvalues: currentEntry (ref), var1 (ref)
		if currentEntry == nil then
			return
		end
		var1.completeTour({ earlyDismiss = true })
	end, { var1, currentEntry })
	
	if not var3 or currentEntry == nil or globalStepIndex == nil then
		return nil
	elseif var10 == nil or not var11 then
		return nil
	end
	local var15 = globalTotalSteps > 1
	local t = {}
	local t_1 = nil
	
	if var15 then
		table.insert(t, {
			testId = "whats-new-tourtip--action-1",
			isDisabled = var8,
			text = var6.back,
			variant = buttonVariant.Standard,
			onActivated = var13
		})
		table.insert(t, {
			testId = "whats-new-tourtip--action-2",
			text = if var9 then var6.done else var6.next,
			variant = buttonVariant.Emphasis,
			onActivated = var12
		})
		t_1 = { current = var7, total = globalTotalSteps }
	end
	return reactModule.createElement(view, {
		tag = "size-full",
		BackgroundTransparency = 1,
		Active = false
	}, {
		[`{currentEntry.id}-{var10:GetFullName()}`] = reactModule.createElement(educationalTooltip, {
			isOpen = true,
			testId = "whats-new-tourtip",
			anchorRef = var5,
			title = currentEntry.title,
			text = currentEntry.text,
			side = currentEntry.side or popoverSide.Bottom,
			align = currentEntry.align or popoverAlign.Center,
			hasActions = var15,
			showSteps = var15,
			steps = t_1,
			onClose = var14,
			actions = t
		})
	})
end)