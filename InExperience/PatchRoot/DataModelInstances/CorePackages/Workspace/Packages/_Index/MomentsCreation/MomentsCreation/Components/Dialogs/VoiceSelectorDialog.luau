local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local loading = foundationModule.Loading
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useDefaultFocusBehavior = reactFocusNavigationModule.useDefaultFocusBehavior
local useLocalization = localizationModule.Hooks.useLocalization
local _ = require(momentsCreation.Components.Voice.voiceCatalog)
local speaker = builderIconsModule.Icon.Speaker
local playSmall = builderIconsModule.Icon.PlaySmall
local list = { 0.9 }
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

local function VoiceRow(p1)
	-- upvalues: reactModule (ref), view (ref), loading (ref), iconSize (ref), iconButton (ref), playSmall (ref), buttonVariant (ref), inputSize (ref), icon (ref), speaker (ref), text (ref)
	local id = p1.voice.id
	local onAudition = p1.onAudition
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small radius-medium",
		ref = p1.focusRef,
		onActivated = function()
			-- upvalues: p1 (ref), id (ref)
			p1.onSelect(id)
		end,
		testId = `voice-row-{id}`,
		LayoutOrder = p1.LayoutOrder
	}, {
		Info = reactModule.createElement(view, {
			tag = "row align-y-center fill gap-medium auto-y",
			LayoutOrder = 1
		}, {
			IconTile = reactModule.createElement(view, {
				tag = "align-x-center align-y-center size-1000-1000 radius-medium bg-surface-300",
				LayoutOrder = 1
			}, {
				VoiceIcon = reactModule.createElement(icon, { name = speaker, size = iconSize.Medium })
			}),
			Name = reactModule.createElement(text, {
				tag = "fill auto-y text-title-medium text-align-x-left content-emphasis",
				LayoutOrder = 2,
				Text = p1.voice.name
			})
		}),
		Play = if onAudition ~= nil then if p1.isAuditioning then reactModule.createElement(view, {
			tag = "align-x-center align-y-center size-800-800",
			LayoutOrder = 2
		}, {
			Spinner = reactModule.createElement(loading, {
				size = iconSize.Small,
				testId = `voice-audition-loading-{id}`
			})
		}) else reactModule.createElement(iconButton, {
			isCircular = true,
			LayoutOrder = 2,
			icon = playSmall,
			variant = buttonVariant.Standard,
			size = inputSize.Small,
			onActivated = function()
				-- upvalues: onAudition (ref), id (ref)
				onAudition(id)
			end,
			testId = `voice-audition-{id}`
		}) else nil
	})
end

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useDefaultFocusBehavior (ref), useLastInputMode (ref), signalsModule (ref), signalsReactModule (ref), VoiceRow (ref), sheet (ref), dialogSize (ref), list (ref), text (ref), view (ref)
	local onSelect = p1.onSelect
	local onAudition = p1.onAudition
	local onClose = p1.onClose
	local var1 = useLocalization({ title = "Feature.Moments.Label.ChooseVoice" })
	local var2, var3 = useDefaultFocusBehavior(useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = t,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onClose (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: onClose (copy)
						onClose()
						p2:cancel()
					end)
				}
			}
		end, { onClose })
	}))
	local isNotFocus = useLastInputMode() ~= "Focus"
	local var4 = signalsReactModule.useSignalState(p1.getAuditioningVoiceId or reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		return signalsModule.createSignal(nil)
	end, {}))
	local t_1 = {}
	
	for i, v in p1.voices do
		t_1[`Voice_{v.id}`] = reactModule.createElement(VoiceRow, {
			voice = v,
			onSelect = onSelect,
			onAudition = onAudition,
			isAuditioning = var4 == v.id,
			focusRef = if v.id == p1.selectedVoiceId then var2 else nil,
			LayoutOrder = i
		})
	end
	return reactModule.createElement(sheet.Root, {
		ref = var3,
		size = dialogSize.Medium,
		snapPoints = list,
		onClose = onClose
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = isNotFocus }, {
			Title = reactModule.createElement(text, {
				tag = "fill auto-y text-heading-small text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = var1.title
			})
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			List = reactModule.createElement(view, { tag = "col gap-xsmall size-full-0 auto-y" }, t_1)
		})
	})
end