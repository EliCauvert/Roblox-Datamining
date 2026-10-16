local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local DisplayModule = require(Parent.Display)
local SignalsReactModule = require(Parent.SignalsReact)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ReactUtilsModule = require(Parent.ReactUtils)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local HttpService = game:GetService("HttpService")
local FFlagEnableAEGIS2CommsFAEUpsell = require(Parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local SocialUpsellAnalyticsModule = require(SocialUpsell.Analytics.SocialUpsellAnalytics)
local _ = require(SocialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local UpsellComponentModule = require(SocialUpsell.Analytics.Enum.UpsellComponent)
local _ = require(SocialUpsell.Enum.SocialUpsellType)
local ConstantsModule = require(SocialUpsell.Constants)
local BannerBadge = require(Parent.AppBlox).BannerBadge
local EventTypes = require(Parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local FIntMaxDaysToShowCountDownLabelModule = require(SocialUpsell.Flag.FIntMaxDaysToShowCountDownLabel)
local FIntMinDaysToShowCountdownLabelModule = require(SocialUpsell.Flag.FIntMinDaysToShowCountdownLabel)
local UseSocialUpsellOverlayControllerModule = require(SocialUpsell.Hooks.useSocialUpsellOverlayController)
local MinHeightFor = ResponsiveModule.BreakpointConfig.getMinHeightFor(ResponsiveModule.Keys.Medium)
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local View = FoundationModule.View
local Image = FoundationModule.Image
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local config = { isInExperience = true }

local function v31(DeadlineUtcTimestamp, p1) --[[ Line: 80 ]]
	-- upvalues: FIntMinDaysToShowCountdownLabelModule (copy), FIntMaxDaysToShowCountDownLabelModule (copy)
	if DeadlineUtcTimestamp and DeadlineUtcTimestamp ~= 0 then
		local Floored = math.floor((DeadlineUtcTimestamp - os.time()) / 86400)
		
		return if Floored < FIntMinDaysToShowCountdownLabelModule or FIntMaxDaysToShowCountDownLabelModule < Floored then nil elseif Floored < 1 then p1.dayLeft else p1.daysLeft:gsub("{(.-)}", { daysLeft = tostring(Floored) })
	else
		return nil
	end
end

local GetViewportSize = if FFlagEnableAEGIS2CommsFAEUpsell then DisplayModule.GetDisplayStore(false).getViewportSize else nil

return function(p1) --[[ Line: 108 ]]
	-- upvalues: config (copy), UseSocialUpsellOverlayControllerModule (copy), ReactModule (copy), UseScaledValueFunction (copy), ReactFocusNavigationModule (copy), ReactUtilsModule (copy), HttpService (copy), SocialUpsellAnalyticsModule (copy), UpsellComponentModule (copy), UseLocalizationFunction (copy), v31 (copy), FFlagEnableAEGIS2CommsFAEUpsell (copy), SignalsReactModule (copy), GetViewportSize (ref), UseSelectorFunction (copy), MinHeightFor (copy), EventTypes (copy), ConstantsModule (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy), View (copy), Image (copy), BannerBadge (copy), FoundationModule (copy), IconName (copy), BadgeVariant (copy), Text (copy)
	local P2 = p1 or config
	local UseSocialUpsellOverlayControllerModuleResult = UseSocialUpsellOverlayControllerModule(P2.isInExperience)
	local UseRefResult = ReactModule.useRef(nil)
	local _Vector2 = Vector2.new(UseScaledValueFunction(320), UseScaledValueFunction(180))
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior()
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(UseDefaultFocusBehaviorResult2, UseRefResult1)
	ReactModule.useEffect(function() --[[ Line: 117 ]]
		-- upvalues: UseRefResult1 (copy)
		if UseRefResult1.current then
			local ScrollingFrame = UseRefResult1.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if ScrollingFrame then
				ScrollingFrame.Selectable = false
			end
		end
	end, {})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 128 ]]
		-- upvalues: P2 (copy), HttpService (upval)
		return P2.impressionId or HttpService:GenerateGUID(false)
	end, {
		P2.impressionId,
		P2.upsellEntrySurface,
		P2.upsellPurpose,
		P2.upsellEntryComponent
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 139 ]]
		-- upvalues: SocialUpsellAnalyticsModule (upval), P2 (copy), UpsellComponentModule (upval)
		return SocialUpsellAnalyticsModule.evaluateUpsellStage(P2.upsellEntrySurface, UpsellComponentModule.Modal, P2.upsellEntryComponent)
	end, { P2.upsellEntrySurface, P2.upsellEntryComponent })
	local UseLocalizationResult = UseLocalizationFunction({
		daysLeft = "Feature.FAE.Label.DaysLeft",
		dayLeft = "Feature.FAE.Label.DayLeft"
	})
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 152 ]]
		-- upvalues: P2 (copy), v31 (upval), UseLocalizationResult (copy)
		return if P2.countDownBadge then v31(P2.countDownBadge.deadlineUtcTimestamp, UseLocalizationResult) else nil
	end, { P2.countDownBadge, UseLocalizationResult })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 159 ]]
		-- upvalues: P2 (copy), UseMemoResult2 (copy)
		return if P2.countDownBadge then if P2.countDownBadge.text then P2.countDownBadge.text else UseMemoResult2 else nil
	end, { UseMemoResult2, P2.countDownBadge })
	local IsMinHeightForBelow = MinHeightFor <= (if FFlagEnableAEGIS2CommsFAEUpsell then SignalsReactModule.useSignalState(GetViewportSize) else UseSelectorFunction(function(p2) --[[ Line: 172 ]]
		return p2.ScreenSize
	end)).Y
	ReactModule.useEffect(function() --[[ Line: 180 ]]
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), SocialUpsellAnalyticsModule (upval), EventTypes (upval), P2 (copy), UseMemoResult1 (copy), UpsellComponentModule (upval)
		if UseMemoResult and UseRefResult.current ~= UseMemoResult then
			SocialUpsellAnalyticsModule.logUpsellEvent(EventTypes.SocialUpsellShown, {
				upsellPurpose = P2.upsellPurpose,
				upsellEntrySurface = P2.upsellEntrySurface,
				upsellStage = UseMemoResult1,
				upsellImpressionId = UseMemoResult,
				upsellComponent = UpsellComponentModule.Modal,
				upsellEntryComponent = P2.upsellEntryComponent
			})
			UseRefResult.current = UseMemoResult
		end
	end, {
		P2.upsellEntrySurface,
		P2.upsellPurpose,
		UseMemoResult,
		UseMemoResult1,
		P2.upsellEntryComponent
	})
	local UseResult = ReactModule.useCallback(function(Btn) --[[ Line: 204 ]]
		-- upvalues: SocialUpsellAnalyticsModule (upval), EventTypes (upval), P2 (copy), UseMemoResult1 (copy), UseMemoResult (copy), UpsellComponentModule (upval)
		SocialUpsellAnalyticsModule.logUpsellEvent(EventTypes.SocialUpsellButtonClick, {
			upsellPurpose = P2.upsellPurpose,
			upsellEntrySurface = P2.upsellEntrySurface,
			upsellStage = UseMemoResult1,
			upsellImpressionId = UseMemoResult,
			upsellComponent = UpsellComponentModule.Modal,
			btn = Btn,
			upsellEntryComponent = P2.upsellEntryComponent
		})
	end, {
		P2.upsellEntrySurface,
		P2.upsellPurpose,
		UseMemoResult,
		UseMemoResult1,
		P2.upsellEntryComponent
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 226 ]]
		-- upvalues: UseResult (copy), ConstantsModule (upval), P2 (copy)
		UseResult(ConstantsModule.UPSELL_OVERLAY_BUTTON_ACTION.Primary)
		P2.primaryAction.onActivated()
	end, { P2.primaryAction, UseResult })
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = DialogSize.Medium,
		onClose = ReactModule.useCallback(function() --[[ Line: 238 ]]
			-- upvalues: UseResult (copy), ConstantsModule (upval), UseSocialUpsellOverlayControllerModuleResult (copy), P2 (copy)
			UseResult(ConstantsModule.UPSELL_OVERLAY_BUTTON_ACTION.Dismiss)
			UseSocialUpsellOverlayControllerModuleResult.closeSocialOverlay()
			
			if P2.onClose then
				P2.onClose()
			end
		end, {
			UseResult,
			P2.onClose,
			UseSocialUpsellOverlayControllerModuleResult.closeSocialOverlay
		}),
		ref = UseComposedRefResult
	}, {
		DialogContent = ReactModule.createElement(Dialog.Content, {}, {
			Content = ReactModule.createElement(View, {
				tag = "col auto-y size-full-0 gap-medium padding-top-xlarge",
				LayoutOrder = 1
			}, {
				Image = if P2.imageId and IsMinHeightForBelow then ReactModule.createElement(Image, {
					tag = "size-full-full self-center content-emphasis",
					aspectRatio = 1.7777777777777777,
					Image = P2.imageId,
					sizeConstraint = { MaxSize = _Vector2 }
				}) else nil,
				Badge = if UseMemoResult3 then ReactModule.createElement(BannerBadge, {
					LayoutOrder = 1,
					icon = {
						variant = FoundationModule.Enums.IconVariant.Filled,
						position = FoundationModule.Enums.IconPosition.Left,
						name = IconName.Clock
					},
					text = UseMemoResult3,
					variant = BadgeVariant.Neutral
				}) else nil,
				TextContainer = ReactModule.createElement(View, {
					tag = "col gap-medium size-full-0 auto-y padding-right-xxlarge padding-bottom-xsmall",
					LayoutOrder = 2
				}, {
					Title = if P2.title then ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
						TitleText = ReactModule.createElement(Text, {
							tag = "size-full-0 auto-y content-emphasis text-wrap text-align-x-left text-heading-medium",
							Text = P2.title
						})
					}) else nil,
					BodyText = if P2.bodyText then ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-medium",
						LayoutOrder = 3,
						Text = P2.bodyText
					}) else nil
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = if UseMemoResult3 then 3 else 4,
			actions = ReactModule.useMemo(function() --[[ Line: 252 ]]
				-- upvalues: P2 (copy), ButtonVariant (upval), UseResult1 (copy), UseDefaultFocusBehaviorResult (copy)
				local List = {}
				table.insert(List, {
					text = P2.primaryAction.text,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult1,
					ref = UseDefaultFocusBehaviorResult
				})
				
				return List
			end, {
				UseResult1,
				P2.primaryAction,
				UseDefaultFocusBehaviorResult
			})
		})
	})
end