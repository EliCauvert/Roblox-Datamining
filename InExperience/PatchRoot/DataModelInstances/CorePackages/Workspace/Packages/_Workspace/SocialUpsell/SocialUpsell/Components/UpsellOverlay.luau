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

local var1 = function(p1, p2)
	-- upvalues: fIntMinDaysToShowCountdownLabelModule (ref), fIntMaxDaysToShowCountDownLabelModule (ref)
	if not p1 or p1 == 0 then
		return nil
	end
	local floored = math.floor((p1 - os.time()) / 86400)
	
	return if floored < fIntMinDaysToShowCountdownLabelModule or fIntMaxDaysToShowCountDownLabelModule < floored then nil elseif floored < 1 then p2.dayLeft else p2.daysLeft:gsub("{(.-)}", { daysLeft = tostring(floored) })
end

local var2 = if fFlagEnableAEGIS2CommsFAEUpsell then displayModule.GetDisplayStore(false).getViewportSize else nil

return function(p1)
	-- upvalues: t (ref), useSocialUpsellOverlayControllerModule (ref), reactModule (ref), useScaledValue (ref), reactFocusNavigationModule (ref), reactUtilsModule (ref), httpService (ref), socialUpsellAnalyticsModule (ref), upsellComponentModule (ref), useLocalization (ref), var1 (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), signalsReactModule (ref), var2 (write), useSelector (ref), minHeightFor (ref), eventTypes (ref), fFlagAddUpsellEntryComponentToAnalyticsModule (ref), constantsModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref), view (ref), image (ref), bannerBadge (ref), foundationModule (ref), iconName (ref), badgeVariant (ref), text (ref)
	p1 = p1 or t
	local var3 = useSocialUpsellOverlayControllerModule(p1.isInExperience)
	local var4 = reactModule.useRef(nil)
	local vector2 = Vector2.new(useScaledValue(320), useScaledValue(180))
	local var5, var6 = reactFocusNavigationModule.useDefaultFocusBehavior()
	local var7 = reactModule.useRef(nil)
	local var8 = reactUtilsModule.useComposedRef(var6, var7)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		if var7.current then
			local scrollingFrame = var7.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if scrollingFrame then
				scrollingFrame.Selectable = false
			end
		end
	end, {})
	local var9 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), httpService (copy)
		return p1.impressionId or httpService:GenerateGUID(false)
	end, {
		p1.impressionId,
		p1.upsellEntrySurface,
		p1.upsellPurpose,
		p1.upsellEntryComponent
	})
	local var10 = reactModule.useMemo(function()
		-- upvalues: socialUpsellAnalyticsModule (copy), p1 (ref), upsellComponentModule (copy)
		return socialUpsellAnalyticsModule.evaluateUpsellStage(p1.upsellEntrySurface, upsellComponentModule.Modal, p1.upsellEntryComponent)
	end, { p1.upsellEntrySurface, p1.upsellEntryComponent })
	local var11 = useLocalization({
		daysLeft = "Feature.FAE.Label.DaysLeft",
		dayLeft = "Feature.FAE.Label.DayLeft"
	})
	local var12 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (copy), var11 (ref)
		return if p1.countDownBadge then var1(p1.countDownBadge.deadlineUtcTimestamp, var11) else nil
	end, { p1.countDownBadge, var11 })
	local var13 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var12 (ref)
		return if p1.countDownBadge then if p1.countDownBadge.text then p1.countDownBadge.text else var12 else nil
	end, { var12, p1.countDownBadge })
	local var14 = minHeightFor <= (if fFlagEnableAEGIS2CommsFAEUpsell then signalsReactModule.useSignalState(var2) else useSelector(function(p2)
		return p2.ScreenSize
	end)).Y
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var4 (ref), socialUpsellAnalyticsModule (copy), eventTypes (copy), p1 (ref), var10 (ref), upsellComponentModule (copy), fFlagAddUpsellEntryComponentToAnalyticsModule (copy)
		if var9 and var4.current ~= var9 then
			socialUpsellAnalyticsModule.logUpsellEvent(eventTypes.SocialUpsellShown, {
				upsellPurpose = p1.upsellPurpose,
				upsellEntrySurface = p1.upsellEntrySurface,
				upsellStage = var10,
				upsellImpressionId = var9,
				upsellComponent = upsellComponentModule.Modal,
				upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then p1.upsellEntryComponent else nil
			})
			var4.current = var9
		end
	end, {
		p1.upsellEntrySurface,
		p1.upsellPurpose,
		var9,
		var10,
		if fFlagAddUpsellEntryComponentToAnalyticsModule then p1.upsellEntryComponent else nil
	})
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: socialUpsellAnalyticsModule (copy), eventTypes (copy), p1 (ref), var10 (ref), var9 (ref), upsellComponentModule (copy), fFlagAddUpsellEntryComponentToAnalyticsModule (copy)
		socialUpsellAnalyticsModule.logUpsellEvent(eventTypes.SocialUpsellButtonClick, {
			upsellPurpose = p1.upsellPurpose,
			upsellEntrySurface = p1.upsellEntrySurface,
			upsellStage = var10,
			upsellImpressionId = var9,
			upsellComponent = upsellComponentModule.Modal,
			btn = p2,
			upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then p1.upsellEntryComponent else nil
		})
	end, {
		p1.upsellEntrySurface,
		p1.upsellPurpose,
		var9,
		var10,
		if fFlagAddUpsellEntryComponentToAnalyticsModule then p1.upsellEntryComponent else nil
	})
	local var16 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), constantsModule (copy), p1 (ref)
		var15(constantsModule.UPSELL_OVERLAY_BUTTON_ACTION.Primary)
		p1.primaryAction.onActivated()
	end, { p1.primaryAction, var15 })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = dialogSize.Medium,
		onClose = reactModule.useCallback(function()
			-- upvalues: var15 (ref), constantsModule (copy), var3 (ref), p1 (ref)
			var15(constantsModule.UPSELL_OVERLAY_BUTTON_ACTION.Dismiss)
			var3.closeSocialOverlay()
			
			if p1.onClose then
				p1.onClose()
			end
		end, { var15, p1.onClose, var3.closeSocialOverlay }),
		ref = var8
	}, {
		DialogContent = reactModule.createElement(dialog.Content, {}, {
			Content = reactModule.createElement(view, {
				tag = "col auto-y size-full-0 gap-medium padding-top-xlarge",
				LayoutOrder = 1
			}, {
				Image = if p1.imageId and var14 then reactModule.createElement(image, {
					tag = "size-full-full self-center content-emphasis",
					aspectRatio = 1.777777777778,
					Image = p1.imageId,
					sizeConstraint = { MaxSize = vector2 }
				}) else nil,
				Badge = if var13 then reactModule.createElement(bannerBadge, {
					LayoutOrder = 1,
					icon = {
						variant = foundationModule.Enums.IconVariant.Filled,
						position = foundationModule.Enums.IconPosition.Left,
						name = iconName.Clock
					},
					text = var13,
					variant = badgeVariant.Neutral
				}) else nil,
				TextContainer = reactModule.createElement(view, {
					tag = "col gap-medium size-full-0 auto-y padding-right-xxlarge padding-bottom-xsmall",
					LayoutOrder = 2
				}, {
					Title = if p1.title then reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
						TitleText = reactModule.createElement(text, {
							tag = "size-full-0 auto-y content-emphasis text-wrap text-align-x-left text-heading-medium",
							Text = p1.title
						})
					}) else nil,
					BodyText = if p1.bodyText then reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-medium",
						LayoutOrder = 3,
						Text = p1.bodyText
					}) else nil
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = if var13 then 3 else 4,
			actions = reactModule.useMemo(function()
				-- upvalues: p1 (ref), buttonVariant (copy), var16 (ref), var5 (ref)
				local t = {}
				table.insert(t, {
					text = p1.primaryAction.text,
					variant = buttonVariant.Emphasis,
					onActivated = var16,
					ref = var5
				})
				
				return t
			end, { var16, p1.primaryAction, var5 })
		})
	})
end