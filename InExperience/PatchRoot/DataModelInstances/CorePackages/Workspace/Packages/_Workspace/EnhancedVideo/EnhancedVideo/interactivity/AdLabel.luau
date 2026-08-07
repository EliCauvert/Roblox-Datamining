local parent = script.Parent
local parent_1 = parent.Parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local icon = foundationModule.Icon
local view = foundationModule.View
local text = foundationModule.Text
local menu = foundationModule.Menu
local enums = foundationModule.Enums
local whyThisAdModal = require(parent_1.AdLabel).WhyThisAdModal
local adDisclosureTelemetry = require(parent_1.AdLabel).AdDisclosureTelemetry
local adLabel = require(parent_1.AdLabel).AdLabel
local fFlagLuaAppEnhancedVideoAdLabelPropUpdateModule = require(parent.Parent.FFlagLuaAppEnhancedVideoAdLabelPropUpdate)
local useLocalization = localizationModule.Hooks.useLocalization
local enhancedVideoStoreModule = require(parent.Parent.EnhancedVideoStore)
local useSignalState = require(parent_1.SignalsReact).useSignalState

return if fFlagLuaAppEnhancedVideoAdLabelPropUpdateModule then reactModule.memo(if fFlagLuaAppEnhancedVideoAdLabelPropUpdateModule then function(p4) --[[ line: 114 ]]
	-- upvalues: enhancedVideoStoreModule (ref), useSignalState (ref), reactModule (ref), adLabel (ref)
	local var15 = enhancedVideoStoreModule(false)
	
	return reactModule.createElement(adLabel, {
		sendPauseEvent = p4.sendPauseEvent,
		adDisclosureText = useSignalState(var15.getAdDisclosureText),
		showAdPreferencesUrl = useSignalState(var15.getShowAdPreferencesUrl)
	})
end else nil) else reactModule.memo(function(p0) --[[ line: 27 | named "LegacyAdLabel" ]]
	-- upvalues: useLocalization (ref), enums (ref), enhancedVideoStoreModule (ref), useSignalState (ref), reactModule (ref), adDisclosureTelemetry (ref), view (ref), menu (ref), text (ref), icon (ref), whyThisAdModal (ref)
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
	local var7 = enhancedVideoStoreModule(false)
	local var8 = useSignalState(var7.getAdDisclosureText)
	local var9 = useSignalState(var7.getShowAdPreferencesUrl)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(false)
	
	local function _(p1) --[[ line: 45 | named "toggleMenu" ]]
		-- upvalues: adDisclosureTelemetry (copy), var11 (ref)
		adDisclosureTelemetry.logAdDisclosureMenuToggled(p1)
		var11(p1)
	end
	
	local _ = function(p2) --[[ line: 50 | named "toggleWhyThisAdModal" ]]
		-- upvalues: adDisclosureTelemetry (copy), var13 (ref)
		adDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(p2)
		var13(p2)
	end
	
	return reactModule.createElement(view, { tag = "size-full margin-bottom-medium" }, {
		Menu = reactModule.createElement(menu, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -10, 1, 0),
			isOpen = var10,
			items = list,
			size = enums.InputSize.Medium,
			align = enums.PopoverAlign.End,
			width = UDim.new(0, 180),
			onPressedOutside = function() --[[ line: 66 ]]
				-- upvalues: adDisclosureTelemetry (copy), var11 (ref)
				adDisclosureTelemetry.logAdDisclosureMenuToggled(false)
				var11(false)
			end,
			onActivated = function(p3) --[[ line: 69 ]]
				-- upvalues: adDisclosureTelemetry (copy), var11 (ref), var13 (ref), p0 (ref)
				if p3 == "whyThisAd" then
					adDisclosureTelemetry.logAdDisclosureMenuToggled(false)
					var11(false)
					adDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(true)
					var13(true)
					p0.sendPauseEvent()
				end
			end
		}, {
			AdLabel = reactModule.createElement(view, {
				tag = "size-1300-600 bg-over-media-100 radius-small stroke-standard stroke-default row align-x-center align-y-center",
				onActivated = function() --[[ line: 79 ]]
					-- upvalues: var10 (ref), adDisclosureTelemetry (copy), var11 (ref)
					local var14 = not var10
					adDisclosureTelemetry.logAdDisclosureMenuToggled(var14)
					var11(var14)
				end
			}, {
				AdText = reactModule.createElement(text, {
					tag = "auto-x size-0-full text-label-small",
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
		}),
		WhyThisAdModal = if var12 then reactModule.createElement(whyThisAdModal, {
			adDisclosureBody = if var8 ~= "" then var5.errorAdDisclosureText else var8,
			showAdPreferencesUrl = var9,
			onClose = function() --[[ line: 105 ]]
				-- upvalues: adDisclosureTelemetry (copy), var13 (ref)
				adDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(false)
				var13(false)
			end
		}) else nil
	})
end)