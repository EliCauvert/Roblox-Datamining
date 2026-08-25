local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local appBloxModule = require(parent.AppBlox)
local displayModule = require(parent.Display)
local signalsReactModule = require(parent.SignalsReact)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local reactUtilsModule = require(parent.ReactUtils)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local httpService = game:GetService("HttpService")
local fFlagEnableAEGIS2CommsFAEUpsell = require(parent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local socialUpsellAnalyticsModule = require(socialUpsell.Analytics.SocialUpsellAnalytics)
local _ = require(socialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local upsellComponentModule = require(socialUpsell.Analytics.Enum.UpsellComponent)
local _ = require(socialUpsell.Enum.SocialUpsellType)
local constantsModule = require(socialUpsell.Constants)
local bannerBadge = appBloxModule.BannerBadge
local eventTypes = require(parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local fIntMaxDaysToShowCountDownLabelModule = require(socialUpsell.Flag.FIntMaxDaysToShowCountDownLabel)
local fIntMinDaysToShowCountdownLabelModule = require(socialUpsell.Flag.FIntMinDaysToShowCountdownLabel)
local useSocialUpsellOverlayControllerModule = require(socialUpsell.Hooks.useSocialUpsellOverlayController)
local fFlagAddUpsellEntryComponentToAnalyticsModule = require(socialUpsell.Flag.FFlagAddUpsellEntryComponentToAnalytics)
local minHeightFor = responsiveModule.BreakpointConfig.getMinHeightFor(responsiveModule.Keys.Medium)
local badgeVariant = foundationModule.Enums.BadgeVariant
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local view = foundationModule.View
local image = foundationModule.Image
local useScaledValue = foundationModule.Hooks.useScaledValue
local t = { isInExperience = true }

local var19 = function(p0, p1)
	-- upvalues: fIntMinDaysToShowCountdownLabelModule (ref), fIntMaxDaysToShowCountDownLabelModule (ref)
	if not p0 or p0 == 0 then
		return nil
	end
	local floored = math.floor((p0 - os.time()) / 86400)
	
	return if floored < fIntMinDaysToShowCountdownLabelModule or fIntMaxDaysToShowCountDownLabelModule < floored then nil elseif floored < 1 then p1.dayLeft else p1.daysLeft:gsub("{(.-)}", { daysLeft = tostring(floored) })
end

local var20 = if fFlagEnableAEGIS2CommsFAEUpsell then displayModule.GetDisplayStore(false).getViewportSize else nil

return function(p2)
	-- upvalues: t (ref), useSocialUpsellOverlayControllerModule (ref), reactModule (ref), useScaledValue (ref), reactFocusNavigationModule (ref), reactUtilsModule (ref), httpService (ref), socialUpsellAnalyticsModule (ref), upsellComponentModule (ref), useLocalization (ref), var19 (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), signalsReactModule (ref), var20 (write), useSelector (ref), minHeightFor (ref), eventTypes (ref), fFlagAddUpsellEntryComponentToAnalyticsModule (ref), constantsModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref), view (ref), image (ref), bannerBadge (ref), foundationModule (ref), iconName (ref), badgeVariant (ref), text (ref)
	p2 = p2 or t
	local var23 = useSocialUpsellOverlayControllerModule(p2.isInExperience)
	local var24 = reactModule.useRef(nil)
	local vector2 = Vector2.new(useScaledValue(320), useScaledValue(180))
	local var26, var27 = reactFocusNavigationModule.useDefaultFocusBehavior()
	local var28 = reactModule.useRef(nil)
	local var29 = reactUtilsModule.useComposedRef(var27, var28)
	reactModule.useEffect(function()
		-- upvalues: var28 (ref)
		if var28.current then
			local scrollingFrame = var28.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if scrollingFrame then
				scrollingFrame.Selectable = false
			end
		end
	end, {})
	local var30 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), httpService (copy)
		return p2.impressionId or httpService:GenerateGUID(false)
	end, {
		p2.impressionId,
		p2.upsellEntrySurface,
		p2.upsellPurpose,
		p2.upsellEntryComponent
	})
	local var31 = reactModule.useMemo(function()
		-- upvalues: socialUpsellAnalyticsModule (copy), p2 (ref), upsellComponentModule (copy)
		return socialUpsellAnalyticsModule.evaluateUpsellStage(p2.upsellEntrySurface, upsellComponentModule.Modal, p2.upsellEntryComponent)
	end, { p2.upsellEntrySurface, p2.upsellEntryComponent })
	local var32 = useLocalization({
		daysLeft = "Feature.FAE.Label.DaysLeft",
		dayLeft = "Feature.FAE.Label.DayLeft"
	})
	local var33 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), var19 (copy), var32 (ref)
		return if p2.countDownBadge then var19(p2.countDownBadge.deadlineUtcTimestamp, var32) else nil
	end, { p2.countDownBadge, var32 })
	local var34 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), var33 (ref)
		return if p2.countDownBadge then if p2.countDownBadge.text then p2.countDownBadge.text else var33 else nil
	end, { var33, p2.countDownBadge })
	local var35 = minHeightFor <= (if fFlagEnableAEGIS2CommsFAEUpsell then signalsReactModule.useSignalState(var20) else useSelector(function(p3)
		return p3.ScreenSize
	end)).Y
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var24 (ref), socialUpsellAnalyticsModule (copy), eventTypes (copy), p2 (ref), var31 (ref), upsellComponentModule (copy), fFlagAddUpsellEntryComponentToAnalyticsModule (copy)
		if var30 and var24.current ~= var30 then
			socialUpsellAnalyticsModule.logUpsellEvent(eventTypes.SocialUpsellShown, {
				upsellPurpose = p2.upsellPurpose,
				upsellEntrySurface = p2.upsellEntrySurface,
				upsellStage = var31,
				upsellImpressionId = var30,
				upsellComponent = upsellComponentModule.Modal,
				upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then p2.upsellEntryComponent else nil
			})
			var24.current = var30
		end
	end, {
		p2.upsellEntrySurface,
		p2.upsellPurpose,
		var30,
		var31,
		if fFlagAddUpsellEntryComponentToAnalyticsModule then p2.upsellEntryComponent else nil
	})
	local var36 = reactModule.useCallback(function(p4)
		-- upvalues: socialUpsellAnalyticsModule (copy), eventTypes (copy), p2 (ref), var31 (ref), var30 (ref), upsellComponentModule (copy), fFlagAddUpsellEntryComponentToAnalyticsModule (copy)
		socialUpsellAnalyticsModule.logUpsellEvent(eventTypes.SocialUpsellButtonClick, {
			upsellPurpose = p2.upsellPurpose,
			upsellEntrySurface = p2.upsellEntrySurface,
			upsellStage = var31,
			upsellImpressionId = var30,
			upsellComponent = upsellComponentModule.Modal,
			btn = p4,
			upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then p2.upsellEntryComponent else nil
		})
	end, {
		p2.upsellEntrySurface,
		p2.upsellPurpose,
		var30,
		var31,
		if fFlagAddUpsellEntryComponentToAnalyticsModule then p2.upsellEntryComponent else nil
	})
	local var37 = reactModule.useCallback(function()
		-- upvalues: var36 (ref), constantsModule (copy), p2 (ref)
		var36(constantsModule.UPSELL_OVERLAY_BUTTON_ACTION.Primary)
		p2.primaryAction.onActivated()
	end, { p2.primaryAction, var36 })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = dialogSize.Medium,
		onClose = reactModule.useCallback(function()
			-- upvalues: var36 (ref), constantsModule (copy), var23 (ref), p2 (ref)
			var36(constantsModule.UPSELL_OVERLAY_BUTTON_ACTION.Dismiss)
			var23.closeSocialOverlay()
			
			if p2.onClose then
				p2.onClose()
			end
		end, { var36, p2.onClose, var23.closeSocialOverlay }),
		ref = var29
	}, {
		DialogContent = reactModule.createElement(dialog.Content, {}, {
			Content = reactModule.createElement(view, {
				tag = "col auto-y size-full-0 gap-medium padding-top-xlarge",
				LayoutOrder = 1
			}, {
				Image = if p2.imageId and var35 then reactModule.createElement(image, {
					tag = "size-full-full self-center content-emphasis",
					aspectRatio = 1.777777777778,
					Image = p2.imageId,
					sizeConstraint = { MaxSize = vector2 }
				}) else nil,
				Badge = if var34 then reactModule.createElement(bannerBadge, {
					LayoutOrder = 1,
					icon = {
						variant = foundationModule.Enums.IconVariant.Filled,
						position = foundationModule.Enums.IconPosition.Left,
						name = iconName.Clock
					},
					text = var34,
					variant = badgeVariant.Neutral
				}) else nil,
				TextContainer = reactModule.createElement(view, {
					tag = "col gap-medium size-full-0 auto-y padding-right-xxlarge padding-bottom-xsmall",
					LayoutOrder = 2
				}, {
					Title = if p2.title then reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
						TitleText = reactModule.createElement(text, {
							tag = "size-full-0 auto-y content-emphasis text-wrap text-align-x-left text-heading-medium",
							Text = p2.title
						})
					}) else nil,
					BodyText = if p2.bodyText then reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-medium",
						LayoutOrder = 3,
						Text = p2.bodyText
					}) else nil
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = if var34 then 3 else 4,
			actions = reactModule.useMemo(function()
				-- upvalues: p2 (ref), buttonVariant (copy), var37 (ref), var26 (ref)
				local t = {}
				table.insert(t, {
					text = p2.primaryAction.text,
					variant = buttonVariant.Emphasis,
					onActivated = var37,
					ref = var26
				})
				
				return t
			end, { var37, p2.primaryAction, var26 })
		})
	})
end