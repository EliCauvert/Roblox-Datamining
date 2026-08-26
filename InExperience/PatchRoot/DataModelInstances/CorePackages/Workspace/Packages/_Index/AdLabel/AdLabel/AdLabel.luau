local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local icon = foundationModule.Icon
local view = foundationModule.View
local text = foundationModule.Text
local menu = foundationModule.Menu
local enums = foundationModule.Enums
local whyThisAdModalModule = require(parent.WhyThisAdModal)
local adDisclosureTelemetryModule = require(parent.AdDisclosureTelemetry)
local useLocalization = localizationModule.Hooks.useLocalization

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), enums (ref), reactModule (ref), adDisclosureTelemetryModule (ref), view (ref), menu (ref), text (ref), icon (ref), whyThisAdModalModule (ref)
	local createElement_1
	local var1 = useLocalization({
		adLabel = "Feature.EnhancedVideo.Label.Ad",
		whyThisAdLabel = "Feature.GameDetails.Action.WhyThisAd",
		errorAdDisclosureText = "Feature.GameDetails.Message.SponsoredDisclosure.Error"
	})
	local list = {
		{
			id = "whyThisAd",
			icon = enums.IconName.CircleI,
			text = var1.whyThisAdLabel
		}
	}
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	
	local function _(p2)
		-- upvalues: adDisclosureTelemetryModule (copy), var3 (ref)
		adDisclosureTelemetryModule.logAdDisclosureMenuToggled(p2)
		var3(p2)
	end
	
	local _ = function(p2)
		-- upvalues: adDisclosureTelemetryModule (copy), var5 (ref)
		adDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(p2)
		var5(p2)
	end
	
	local createElement = reactModule.createElement
	local t = { tag = "size-full margin-bottom-medium" }
	local t_1 = {
		Menu = reactModule.createElement(menu, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -10, 1, 0),
			isOpen = var2,
			items = list,
			size = enums.InputSize.Medium,
			align = enums.PopoverAlign.End,
			width = UDim.new(0, 180),
			onPressedOutside = function()
				-- upvalues: adDisclosureTelemetryModule (copy), var3 (ref)
				adDisclosureTelemetryModule.logAdDisclosureMenuToggled(false)
				var3(false)
			end,
			onActivated = function(p2)
				-- upvalues: adDisclosureTelemetryModule (copy), var3 (ref), var5 (ref), p1 (ref)
				if p2 == "whyThisAd" then
					adDisclosureTelemetryModule.logAdDisclosureMenuToggled(false)
					var3(false)
					adDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(true)
					var5(true)
					p1.sendPauseEvent()
				end
			end
		}, {
			AdLabel = reactModule.createElement(view, {
				tag = "row align-x-center align-y-center size-1300-600 stroke-standard stroke-default radius-small bg-over-media-100",
				onActivated = function()
					-- upvalues: var2 (ref), adDisclosureTelemetryModule (copy), var3 (ref)
					local var6 = not var2
					adDisclosureTelemetryModule.logAdDisclosureMenuToggled(var6)
					var3(var6)
				end
			}, {
				AdText = reactModule.createElement(text, {
					tag = "size-0-full auto-x text-label-small",
					LayoutOrder = 1,
					Text = var1.adLabel
				}),
				TrailingIconWrapper = reactModule.createElement(view, { tag = "auto-xy padding-left-small", LayoutOrder = 2 }, {
					MoreIcon = reactModule.createElement(icon, {
						name = enums.IconName.CircleThreeDotsHorizontal,
						size = enums.IconSize.XSmall
					})
				})
			})
		})
	}
	
	if var4 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(whyThisAdModalModule, {
			adDisclosureBody = if p1.adDisclosureText == nil or p1.adDisclosureText == "" then var1.errorAdDisclosureText else p1.adDisclosureText,
			showAdPreferencesUrl = p1.showAdPreferencesUrl,
			onClose = function()
				-- upvalues: adDisclosureTelemetryModule (copy), var5 (ref)
				adDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(false)
				var5(false)
			end
		})
	else
		createElement_1 = nil
	end
	t_1.WhyThisAdModal = createElement_1
	
	return createElement(view, t, t_1)
end)