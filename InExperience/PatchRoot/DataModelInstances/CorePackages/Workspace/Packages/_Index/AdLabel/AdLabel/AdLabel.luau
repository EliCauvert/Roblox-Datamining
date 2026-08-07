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

return reactModule.memo(function(p0) --[[ line: 23 | named "AdLabel" ]]
	-- upvalues: useLocalization (ref), enums (ref), reactModule (ref), adDisclosureTelemetryModule (ref), view (ref), menu (ref), text (ref), icon (ref), whyThisAdModalModule (ref)
	local createElement_1
	local var5 = useLocalization({
		adLabel = "Feature.EnhancedVideo.Label.Ad",
		whyThisAdLabel = "Feature.GameDetails.Action.WhyThisAd",
		errorAdDisclosureText = "Feature.GameDetails.Message.SponsoredDisclosure.Error"
	})
	local list = {
		{
			id = "whyThisAd",
			icon = enums.IconName.CircleI,
			text = var5.whyThisAdLabel
		}
	}
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	
	local function _(p1) --[[ line: 37 | named "toggleMenu" ]]
		-- upvalues: adDisclosureTelemetryModule (copy), var8 (ref)
		adDisclosureTelemetryModule.logAdDisclosureMenuToggled(p1)
		var8(p1)
	end
	
	local _ = function(p2) --[[ line: 42 | named "toggleWhyThisAdModal" ]]
		-- upvalues: adDisclosureTelemetryModule (copy), var10 (ref)
		adDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(p2)
		var10(p2)
	end
	
	local createElement = reactModule.createElement
	local t = { tag = "size-full margin-bottom-medium" }
	local t_1 = {
		Menu = reactModule.createElement(menu, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -10, 1, 0),
			isOpen = var7,
			items = list,
			size = enums.InputSize.Medium,
			align = enums.PopoverAlign.End,
			width = UDim.new(0, 180),
			onPressedOutside = function() --[[ line: 58 ]]
				-- upvalues: adDisclosureTelemetryModule (copy), var8 (ref)
				adDisclosureTelemetryModule.logAdDisclosureMenuToggled(false)
				var8(false)
			end,
			onActivated = function(p3) --[[ line: 61 ]]
				-- upvalues: adDisclosureTelemetryModule (copy), var8 (ref), var10 (ref), p0 (ref)
				if p3 == "whyThisAd" then
					adDisclosureTelemetryModule.logAdDisclosureMenuToggled(false)
					var8(false)
					adDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(true)
					var10(true)
					p0.sendPauseEvent()
				end
			end
		}, {
			AdLabel = reactModule.createElement(view, {
				tag = "row align-x-center align-y-center size-1300-600 stroke-standard stroke-default radius-small bg-over-media-100",
				onActivated = function() --[[ line: 71 ]]
					-- upvalues: var7 (ref), adDisclosureTelemetryModule (copy), var8 (ref)
					local var13 = not var7
					adDisclosureTelemetryModule.logAdDisclosureMenuToggled(var13)
					var8(var13)
				end
			}, {
				AdText = reactModule.createElement(text, {
					tag = "size-0-full auto-x text-label-small",
					LayoutOrder = 1,
					Text = var5.adLabel
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
	
	if var9 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(whyThisAdModalModule, {
			adDisclosureBody = if p0.adDisclosureText == nil or p0.adDisclosureText == "" then var5.errorAdDisclosureText else p0.adDisclosureText,
			showAdPreferencesUrl = p0.showAdPreferencesUrl,
			onClose = function() --[[ line: 97 ]]
				-- upvalues: adDisclosureTelemetryModule (copy), var10 (ref)
				adDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(false)
				var10(false)
			end
		})
	else
		createElement_1 = nil
	end
	t_1.WhyThisAdModal = createElement_1
	
	return createElement(view, t, t_1)
end)