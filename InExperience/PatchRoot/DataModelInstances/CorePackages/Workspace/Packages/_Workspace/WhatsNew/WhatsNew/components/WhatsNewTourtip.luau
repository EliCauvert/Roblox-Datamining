local WhatsNew = script:FindFirstAncestor("WhatsNew")
local Parent = WhatsNew.Parent
local EnumsModule = require(WhatsNew.Enums)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetWhatsNewStoreModule = require(WhatsNew.store.GetWhatsNewStore)
local UseWhatsNewRuntimeStateModule = require(WhatsNew.hooks.useWhatsNewRuntimeState)
local WhatsNewTelemetryModule = require(WhatsNew.telemetry.WhatsNewTelemetry)
local EducationalTooltip = FoundationModule.EducationalTooltip
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

local function _(Vector): boolean
	return Vector.X > 0 and Vector.Y > 0
end

return ReactModule.memo(function()
	-- upvalues: GetWhatsNewStoreModule (copy), UseWhatsNewRuntimeStateModule (copy), EnumsModule (copy), ReactModule (copy), UseLocalizationFunction (copy), WhatsNewTelemetryModule (copy), ButtonVariant (copy), View (copy), EducationalTooltip (copy), PopoverSide (copy), PopoverAlign (copy)
	local WhatsNewStoreModule = GetWhatsNewStoreModule()
	local UseWhatsNewRuntimeStateModuleResult = UseWhatsNewRuntimeStateModule()
	local CurrentEntry = UseWhatsNewRuntimeStateModuleResult.currentEntry
	local GlobalStepIndex: number = UseWhatsNewRuntimeStateModuleResult.globalStepIndex
	local HasGlobalStepIndex: boolean = UseWhatsNewRuntimeStateModuleResult.surface == EnumsModule.WhatsNewSurface.TourTip and (CurrentEntry ~= nil and GlobalStepIndex ~= nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		back = "CommonUI.Controls.Action.Back",
		next = "CommonUI.Controls.Action.Next",
		done = "CommonUI.Controls.Action.Done"
	})
	local NewGlobalStepIndex: number = if GlobalStepIndex == nil then 0 else GlobalStepIndex + 1
	local GlobalTotalSteps: number = UseWhatsNewRuntimeStateModuleResult.globalTotalSteps
	local IsGlobalStepIndexMatch: boolean = HasGlobalStepIndex and GlobalStepIndex == 0
	local IsNewGlobalStepIndexAbove: boolean = HasGlobalStepIndex and NewGlobalStepIndex >= GlobalTotalSteps
	local AnchorRef = if HasGlobalStepIndex and CurrentEntry ~= nil then WhatsNewStoreModule.getAnchorRef(CurrentEntry.anchorId) else nil
	UseRefResult1.current = AnchorRef
	local IsYAbove = false
	
	if AnchorRef ~= nil then
		local AbsoluteSize = AnchorRef.AbsoluteSize
		IsYAbove = AbsoluteSize.X > 0 and AbsoluteSize.Y > 0
	end
	ReactModule.useEffect(function()
		-- upvalues: HasGlobalStepIndex (copy), CurrentEntry (copy), UseRefResult (copy), WhatsNewTelemetryModule (upval), WhatsNewStoreModule (copy)
		if not HasGlobalStepIndex or CurrentEntry == nil then
			UseRefResult.current = nil
			
			return
		end
		if UseRefResult.current ~= CurrentEntry.id then
			UseRefResult.current = CurrentEntry.id
			WhatsNewTelemetryModule.logTourtipInteraction(WhatsNewTelemetryModule.InteractionType.IMPRESSION, CurrentEntry.id, nil, WhatsNewStoreModule.getRuntimeState())
			
			return
		end
	end, { HasGlobalStepIndex, CurrentEntry, WhatsNewStoreModule })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CurrentEntry (copy), WhatsNewStoreModule (copy)
		if CurrentEntry ~= nil then
			WhatsNewStoreModule.next()
			
			return
		end
	end, { WhatsNewStoreModule, CurrentEntry })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: CurrentEntry (copy), WhatsNewStoreModule (copy)
		if CurrentEntry ~= nil then
			WhatsNewStoreModule.back()
			
			return
		end
	end, { WhatsNewStoreModule, CurrentEntry })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: CurrentEntry (copy), WhatsNewStoreModule (copy)
		if CurrentEntry ~= nil then
			WhatsNewStoreModule.completeTour({ earlyDismiss = true })
			
			return
		end
	end, { WhatsNewStoreModule, CurrentEntry })
	
	if not HasGlobalStepIndex or CurrentEntry == nil or GlobalStepIndex == nil then
		return nil
	end
	if AnchorRef == nil or not IsYAbove then
		return nil
	end
	local IsGlobalTotalStepsAbove = GlobalTotalSteps > 1
	local List = {}
	local Steps = nil
	
	if IsGlobalTotalStepsAbove then
		table.insert(List, {
			testId = "whats-new-tourtip--action-1",
			isDisabled = IsGlobalStepIndexMatch,
			text = UseLocalizationResult.back,
			variant = ButtonVariant.Standard,
			onActivated = UseResult1
		})
		table.insert(List, {
			testId = "whats-new-tourtip--action-2",
			text = if IsNewGlobalStepIndexAbove then UseLocalizationResult.done else UseLocalizationResult.next,
			variant = ButtonVariant.Emphasis,
			onActivated = UseResult
		})
		Steps = { current = NewGlobalStepIndex, total = GlobalTotalSteps }
	end
	return ReactModule.createElement(View, {
		tag = "size-full",
		BackgroundTransparency = 1,
		Active = false
	}, {
		[`{CurrentEntry.id}-{AnchorRef:GetFullName()}`] = ReactModule.createElement(EducationalTooltip, {
			isOpen = true,
			testId = "whats-new-tourtip",
			anchorRef = UseRefResult1,
			title = CurrentEntry.title,
			text = CurrentEntry.text,
			side = CurrentEntry.side or PopoverSide.Bottom,
			align = CurrentEntry.align or PopoverAlign.Center,
			hasActions = IsGlobalTotalStepsAbove,
			showSteps = IsGlobalTotalStepsAbove,
			steps = Steps,
			onClose = UseResult2,
			actions = List
		})
	})
end)