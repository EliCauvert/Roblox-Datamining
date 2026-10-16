local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Loading = FoundationModule.Loading
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(MomentsCreation.Components.Voice.voiceCatalog)
local Speaker = BuilderIconsModule.Icon.Speaker
local PlaySmall = BuilderIconsModule.Icon.PlaySmall
local SnapPoints = { 0.9 }
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function VoiceRow(Frame) --[[ Line: 79 ]]
	-- upvalues: ReactModule (copy), View (copy), Loading (copy), IconSize (copy), IconButton (copy), PlaySmall (copy), ButtonVariant (copy), InputSize (copy), Icon (copy), Speaker (copy), Text (copy)
	local Id = Frame.voice.id
	local OnAuditionFunction = Frame.onAudition
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small radius-medium",
		ref = Frame.focusRef,
		onActivated = function() --[[ Line: 114 ]]
			-- upvalues: Frame (copy), Id (copy)
			Frame.onSelect(Id)
		end,
		testId = `voice-row-{Id}`,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Info = ReactModule.createElement(View, {
			tag = "row align-y-center fill gap-medium auto-y",
			LayoutOrder = 1
		}, {
			IconTile = ReactModule.createElement(View, {
				tag = "align-x-center align-y-center size-1000-1000 radius-medium bg-surface-300",
				LayoutOrder = 1
			}, {
				VoiceIcon = ReactModule.createElement(Icon, { name = Speaker, size = IconSize.Medium })
			}),
			Name = ReactModule.createElement(Text, {
				tag = "fill auto-y text-title-medium text-align-x-left content-emphasis",
				LayoutOrder = 2,
				Text = Frame.voice.name
			})
		}),
		Play = if OnAuditionFunction == nil then nil elseif Frame.isAuditioning then ReactModule.createElement(View, {
			tag = "align-x-center align-y-center size-800-800",
			LayoutOrder = 2
		}, {
			Spinner = ReactModule.createElement(Loading, {
				size = IconSize.Small,
				testId = `voice-audition-loading-{Id}`
			})
		}) else ReactModule.createElement(IconButton, {
			isCircular = true,
			LayoutOrder = 2,
			icon = PlaySmall,
			variant = ButtonVariant.Standard,
			size = InputSize.Small,
			onActivated = function() --[[ Line: 103 ]]
				-- upvalues: OnAuditionFunction (copy), Id (copy)
				OnAuditionFunction(Id)
			end,
			testId = `voice-audition-{Id}`
		})
	})
end

return function(p1) --[[ Line: 144 | Named "VoiceSelectorDialog" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseDefaultFocusBehaviorFunction (copy), UseLastInputModeFunction (copy), SignalsModule (copy), SignalsReactModule (copy), VoiceRow (copy), Sheet (copy), DialogSize (copy), SnapPoints (copy), Text (copy), View (copy)
	local OnSelect = p1.onSelect
	local OnAudition = p1.onAudition
	local OnCloseFunction = p1.onClose
	local FeatureMomentsLabelChooseVoice = UseLocalizationFunction({ title = "Feature.Moments.Label.ChooseVoice" })
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function() --[[ Line: 153 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 156 ]]
						-- upvalues: OnCloseFunction (upval)
						OnCloseFunction()
						p2:cancel()
					end)
				}
			}
		end, { OnCloseFunction })
	})))
	local IsNotFocus = UseLastInputModeFunction() ~= "Focus"
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 175 ]]
		-- upvalues: SignalsModule (upval)
		return (SignalsModule.createSignal(nil))
	end, {})
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.getAuditioningVoiceId or UseMemoResult)
	local Elements = {}
	
	for LayoutOrder, voice in p1.voices do
		Elements[`Voice_{voice.id}`] = ReactModule.createElement(VoiceRow, {
			voice = voice,
			onSelect = OnSelect,
			onAudition = OnAudition,
			isAuditioning = UseSignalStateResult == voice.id,
			focusRef = if voice.id == p1.selectedVoiceId then UseDefaultFocusBehaviorResult else nil,
			LayoutOrder = LayoutOrder
		})
	end
	return ReactModule.createElement(Sheet.Root, {
		ref = UseDefaultFocusBehaviorResult2,
		size = DialogSize.Medium,
		snapPoints = SnapPoints,
		onClose = OnCloseFunction
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = IsNotFocus }, {
			Title = ReactModule.createElement(Text, {
				tag = "fill auto-y text-heading-small text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = FeatureMomentsLabelChooseVoice.title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, {}, {
			List = ReactModule.createElement(View, { tag = "col gap-xsmall size-full-0 auto-y" }, Elements)
		})
	})
end