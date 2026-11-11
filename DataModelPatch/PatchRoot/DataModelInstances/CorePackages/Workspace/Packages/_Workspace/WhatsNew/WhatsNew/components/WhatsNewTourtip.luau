local WhatsNew = script:FindFirstAncestor("WhatsNew")
local Parent = WhatsNew.Parent
local EnumsModule = require(WhatsNew.Enums)
local ConstantsModule = require(WhatsNew.Constants)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetWhatsNewStoreModule = require(WhatsNew.store.GetWhatsNewStore)
local UseWhatsNewRuntimeStateModule = require(WhatsNew.hooks.useWhatsNewRuntimeState)
local EducationalTooltip = FoundationModule.EducationalTooltip
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

local function _(_) end

local _ = function(_, _) end

local _ = function(_) end

local _ = function(_) end

return ReactModule.memo(function()
	-- upvalues: GetWhatsNewStoreModule (copy), UseWhatsNewRuntimeStateModule (copy), EnumsModule (copy), ReactModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), EducationalTooltip (copy), PopoverSide (copy), PopoverAlign (copy)
	local WhatsNewStoreModule = GetWhatsNewStoreModule()
	local UseWhatsNewRuntimeStateModuleResult = UseWhatsNewRuntimeStateModule()
	local CurrentEntry = UseWhatsNewRuntimeStateModuleResult.currentEntry
	local GlobalStepIndex: number = UseWhatsNewRuntimeStateModuleResult.globalStepIndex
	local HasGlobalStepIndex: boolean = UseWhatsNewRuntimeStateModuleResult.surface == EnumsModule.WhatsNewSurface.TourTip and (CurrentEntry ~= nil and GlobalStepIndex ~= nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local NewGlobalStepIndex: number = if GlobalStepIndex == nil then 0 else GlobalStepIndex + 1
	local GlobalTotalSteps = UseWhatsNewRuntimeStateModuleResult.globalTotalSteps
	local IsGlobalStepIndexMatch: boolean = HasGlobalStepIndex and GlobalStepIndex == 0
	local IsGlobalTotalStepsBelow: boolean = HasGlobalStepIndex and GlobalTotalSteps <= NewGlobalStepIndex
	local UseLocalizationResult = UseLocalizationFunction({
		back = ConstantsModule.LocalizationKeys.TourtipBack,
		next = ConstantsModule.LocalizationKeys.TourtipNext,
		done = ConstantsModule.LocalizationKeys.TourtipDone
	})
	ReactModule.useEffect(function()
		-- upvalues: HasGlobalStepIndex (copy), CurrentEntry (copy), UseRefResult1 (copy)
		if not HasGlobalStepIndex or CurrentEntry == nil then return end
		if UseRefResult1.current ~= CurrentEntry.id then
			UseRefResult1.current = CurrentEntry.id
			local _ = CurrentEntry.id
			
			return
		end
	end, { HasGlobalStepIndex, CurrentEntry })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CurrentEntry (copy), IsGlobalTotalStepsBelow (copy), WhatsNewStoreModule (copy)
		if CurrentEntry ~= nil then
			local _ = CurrentEntry.id
			WhatsNewStoreModule.next()
			
			return
		end
	end, {
		WhatsNewStoreModule,
		CurrentEntry,
		IsGlobalTotalStepsBelow
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: CurrentEntry (copy), WhatsNewStoreModule (copy)
		if CurrentEntry ~= nil then
			local _ = CurrentEntry.id
			WhatsNewStoreModule.back()
			
			return
		end
	end, { WhatsNewStoreModule, CurrentEntry })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: CurrentEntry (copy), WhatsNewStoreModule (copy)
		if CurrentEntry ~= nil then
			local _ = CurrentEntry.id
			WhatsNewStoreModule.completeTour()
			
			return
		end
	end, { WhatsNewStoreModule, CurrentEntry })
	
	if not HasGlobalStepIndex or CurrentEntry == nil or GlobalStepIndex == nil then
		return nil
	end
	local AnchorRef = WhatsNewStoreModule.getAnchorRef(CurrentEntry.anchorId)
	
	if AnchorRef == nil then
		return nil
	end
	UseRefResult.current = AnchorRef
	local List = {}
	
	if not IsGlobalStepIndexMatch then
		table.insert(List, {
			text = UseLocalizationResult.back,
			onActivated = UseResult1
		})
	end
	table.insert(List, {
		text = if IsGlobalTotalStepsBelow then UseLocalizationResult.done else UseLocalizationResult.next,
		onActivated = UseResult
	})
	
	return ReactModule.createElement(EducationalTooltip, {
		isOpen = true,
		testId = "whats-new-tourtip",
		key = CurrentEntry.anchorId,
		title = CurrentEntry.title,
		text = CurrentEntry.text,
		side = CurrentEntry.side or PopoverSide.Bottom,
		align = CurrentEntry.align or PopoverAlign.Center,
		steps = { current = NewGlobalStepIndex, total = GlobalTotalSteps },
		onClose = UseResult2,
		actions = List,
		anchorRef = UseRefResult
	})
end)