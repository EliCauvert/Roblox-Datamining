local Players = game:GetService("Players")
local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local EventNames = MomentsCommonModule.Analytics.EventNames

local function fireVoiceCoachmarkFtuxEvent(FTUXTooltipDismissed)
	-- upvalues: FireAnalyticsEventModule (copy), Players (copy)
	FireAnalyticsEventModule(FTUXTooltipDismissed, {
		identifier = "moments_tts_voice",
		userId = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else 0),
		timestamp = tostring(os.time())
	})
end

local EducationalTooltip = FoundationModule.EducationalTooltip
local Icon = FoundationModule.Icon
local Loading = FoundationModule.Loading
local Text = FoundationModule.Text
local View = FoundationModule.View
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local GetFFlagMomentsCoachmarkPersistenceFunction = MomentsCommonModule.Flags.GetFFlagMomentsCoachmarkPersistence
local GetFIntMomentsCoachmarkMaxImpressionsFunction = MomentsCommonModule.Flags.GetFIntMomentsCoachmarkMaxImpressions
local GetFIntMomentsCoachmarkAutoDismissSecondsFunction = MomentsCommonModule.Flags.GetFIntMomentsCoachmarkAutoDismissSeconds
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCreationControllerFunction = require(MomentsCreation.CreationController).useCreationController
local _ = require(MomentsCreation.Types.CreationFlowTypes)

local function VoiceCoachmark(p1)
	-- upvalues: UseCreationControllerFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), fireVoiceCoachmarkFtuxEvent (copy), EventNames (copy), EducationalTooltip (copy), FoundationModule (copy)
	local UseCreationControllerResult = UseCreationControllerFunction()
	local UseLocalizationResult = UseLocalizationFunction({ title = p1.titleKey, text = p1.textKey })
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
		-- upvalues: UseCreationControllerResult (copy)
		return not UseCreationControllerResult.getVoiceCoachmarkDismissed(false)
	end)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), fireVoiceCoachmarkFtuxEvent (upval), EventNames (upval)
		if UseStateResult and not UseRefResult.current then
			UseRefResult.current = true
			fireVoiceCoachmarkFtuxEvent(EventNames.FTUXTooltipImpression)
		end
	end, { UseStateResult })
	
	return if UseStateResult then ReactModule.createElement(EducationalTooltip, {
		LayoutOrder = p1.layoutOrder,
		isOpen = not p1.hidden,
		onClose = function()
			-- upvalues: fireVoiceCoachmarkFtuxEvent (upval), EventNames (upval), UseCreationControllerResult (copy), UseStateResult2 (copy)
			fireVoiceCoachmarkFtuxEvent(EventNames.FTUXTooltipDismissed)
			UseCreationControllerResult.dismissVoiceCoachmark()
			UseStateResult2(false)
		end,
		side = FoundationModule.Enums.PopoverSide.Bottom,
		align = FoundationModule.Enums.PopoverAlign.End,
		title = UseLocalizationResult.title,
		text = UseLocalizationResult.text
	}, p1.children) else p1.children
end

local function PersistentToolCoachmark(p1)
	-- upvalues: UseCreationControllerFunction (copy), UseLocalizationFunction (copy), Parent (copy), ReactModule (copy), fireVoiceCoachmarkFtuxEvent (copy), EventNames (copy), FoundationModule (copy)
	local UseCreationControllerResult = UseCreationControllerFunction()
	local UseLocalizationResult = UseLocalizationFunction({ title = p1.titleKey, text = p1.textKey })
	
	return ReactModule.createElement(require(Parent.MomentsCommon.PersistentCoachmark), {
		layoutOrder = p1.layoutOrder,
		title = UseLocalizationResult.title,
		text = UseLocalizationResult.text,
		impressionCache = p1.impressionCache,
		maxImpressions = p1.maxImpressions,
		autoDismissSeconds = p1.autoDismissSeconds,
		isSessionHandled = UseCreationControllerResult.getVoiceCoachmarkDismissed(false),
		onSessionHandled = UseCreationControllerResult.dismissVoiceCoachmark,
		onImpression = function()
			-- upvalues: fireVoiceCoachmarkFtuxEvent (upval), EventNames (upval)
			fireVoiceCoachmarkFtuxEvent(EventNames.FTUXTooltipImpression)
		end,
		onDismissed = function()
			-- upvalues: fireVoiceCoachmarkFtuxEvent (upval), EventNames (upval)
			fireVoiceCoachmarkFtuxEvent(EventNames.FTUXTooltipDismissed)
		end,
		side = FoundationModule.Enums.PopoverSide.Bottom,
		align = FoundationModule.Enums.PopoverAlign.End,
		hidden = p1.hidden
	}, p1.children)
end

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), GetFFlagEnableMomentTextGenerationFunction (copy), Loading (copy), FoundationModule (copy), Icon (copy), Text (copy), GetFFlagMomentsCoachmarkPersistenceFunction (copy), PersistentToolCoachmark (copy), GetFIntMomentsCoachmarkMaxImpressionsFunction (copy), GetFIntMomentsCoachmarkAutoDismissSecondsFunction (copy), VoiceCoachmark (copy), GradientBackdrop (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local IsLoadingMap = p1.isLoadingMap
	local IsDisabledMap = p1.isDisabledMap
	local SizeRatio = UseTokensResult.Size.Size_600 / UseTokensResult.Size.Size_1200
	local LocalizationKeys = {}
	
	for _, tool in p1.tools do
		LocalizationKeys[tool.cta.localizationKey] = tool.cta.localizationKey
	end
	local UseLocalizationResult = UseLocalizationFunction(LocalizationKeys)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(UDim2.new(0, 1.5 * Frame.AbsoluteSize.X, 1, 0))
	end, {})
	local Elements = {}
	local Coachmark = p1.coachmark
	
	for i, tool1 in p1.tools do
		local Kind = tool1.kind
		local IsIsLoading: boolean = IsLoadingMap ~= nil and IsLoadingMap[Kind] == true
		local IsIsDisabled: boolean = IsDisabledMap ~= nil and IsDisabledMap[Kind] == true
		local Element = ReactModule.createElement(View, {
			tag = "row align-x-right align-y-center gap-medium auto-xy padding-xsmall radius-medium",
			LayoutOrder = tool1.cta.order or i,
			onActivated = if IsIsLoading then nil elseif IsIsDisabled then if p1.onDisabledToolActivated == nil then nil else function()
				-- upvalues: p1 (copy), Kind (copy)
				p1.onDisabledToolActivated(Kind)
			end else function()
				-- upvalues: p1 (copy), Kind (copy)
				p1.onToolSelected(Kind)
			end
		}, {
			Icon = if IsIsLoading then if GetFFlagEnableMomentTextGenerationFunction() then ReactModule.createElement(View, { LayoutOrder = 2, tag = "auto-xy", scale = SizeRatio }, {
				Loading = ReactModule.createElement(Loading, { size = FoundationModule.Enums.IconSize.Large })
			}) else ReactModule.createElement(Loading, {
				LayoutOrder = 2,
				size = FoundationModule.Enums.IconSize.Small
			}) else ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = tool1.cta.icon,
				size = FoundationModule.Enums.IconSize.Large
			}),
			Text = if p1.showText then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-medium content-emphasis",
				Text = UseLocalizationResult[tool1.cta.localizationKey]
			}) else nil
		})
		
		if Coachmark == nil or Coachmark.kind ~= Kind then
			Elements["Tool_" .. Kind] = Element
		elseif GetFFlagMomentsCoachmarkPersistenceFunction() and Coachmark.impressionCache ~= nil then
			Elements["Tool_" .. Kind] = ReactModule.createElement(PersistentToolCoachmark, {
				layoutOrder = tool1.cta.order or i,
				titleKey = Coachmark.titleKey,
				textKey = Coachmark.textKey,
				impressionCache = Coachmark.impressionCache,
				maxImpressions = Coachmark.maxImpressions or GetFIntMomentsCoachmarkMaxImpressionsFunction(),
				autoDismissSeconds = Coachmark.autoDismissSeconds or GetFIntMomentsCoachmarkAutoDismissSecondsFunction(),
				hidden = p1.hidden
			}, Element)
		else
			Elements["Tool_" .. Kind] = ReactModule.createElement(VoiceCoachmark, {
				layoutOrder = tool1.cta.order or i,
				titleKey = Coachmark.titleKey,
				textKey = Coachmark.textKey,
				hidden = p1.hidden
			}, Element)
		end
	end
	return ReactModule.createElement(View, {
		tag = "position-center-right anchor-center-right size-0-full auto-x",
		Visible = not p1.hidden,
		ZIndex = p1.zIndex
	}, {
		GradientBackdrop = ReactModule.createElement(GradientBackdrop, {
			rotation = 180,
			color3 = UseTokensResult.Color.Common.Scrim.Color3,
			size = UseBindingResult
		}),
		EditCTABar = ReactModule.createElement(View, {
			tag = "col align-x-right align-y-center gap-small position-center-right anchor-center-right size-0-full auto-x",
			onAbsoluteSizeChanged = UseResult,
			padding = {
				left = UDim.new(0, UseTokensResult.Padding.Large),
				right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
			}
		}, Elements)
	})
end