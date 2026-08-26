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

return if fFlagLuaAppEnhancedVideoAdLabelPropUpdateModule then reactModule.memo(if fFlagLuaAppEnhancedVideoAdLabelPropUpdateModule then function(p1)
	-- upvalues: enhancedVideoStoreModule (ref), useSignalState (ref), reactModule (ref), adLabel (ref)
	local var1 = enhancedVideoStoreModule(false)
	
	return reactModule.createElement(adLabel, {
		sendPauseEvent = p1.sendPauseEvent,
		adDisclosureText = useSignalState(var1.getAdDisclosureText),
		showAdPreferencesUrl = useSignalState(var1.getShowAdPreferencesUrl)
	})
end else nil) else reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), enums (ref), enhancedVideoStoreModule (ref), useSignalState (ref), reactModule (ref), adDisclosureTelemetry (ref), view (ref), menu (ref), text (ref), icon (ref), whyThisAdModal (ref)
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
	local var2 = enhancedVideoStoreModule(false)
	local var3 = useSignalState(var2.getAdDisclosureText)
	local var4 = useSignalState(var2.getShowAdPreferencesUrl)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	
	local function _(p2)
		-- upvalues: adDisclosureTelemetry (copy), var6 (ref)
		adDisclosureTelemetry.logAdDisclosureMenuToggled(p2)
		var6(p2)
	end
	
	local _ = function(p2)
		-- upvalues: adDisclosureTelemetry (copy), var8 (ref)
		adDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(p2)
		var8(p2)
	end
	
	return reactModule.createElement(view, { tag = "size-full margin-bottom-medium" }, {
		Menu = reactModule.createElement(menu, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -10, 1, 0),
			isOpen = var5,
			items = list,
			size = enums.InputSize.Medium,
			align = enums.PopoverAlign.End,
			width = UDim.new(0, 180),
			onPressedOutside = function()
				-- upvalues: adDisclosureTelemetry (copy), var6 (ref)
				adDisclosureTelemetry.logAdDisclosureMenuToggled(false)
				var6(false)
			end,
			onActivated = function(p2)
				-- upvalues: adDisclosureTelemetry (copy), var6 (ref), var8 (ref), p1 (ref)
				if p2 == "whyThisAd" then
					adDisclosureTelemetry.logAdDisclosureMenuToggled(false)
					var6(false)
					adDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(true)
					var8(true)
					p1.sendPauseEvent()
				end
			end
		}, {
			AdLabel = reactModule.createElement(view, {
				tag = "size-1300-600 bg-over-media-100 radius-small stroke-standard stroke-default row align-x-center align-y-center",
				onActivated = function()
					-- upvalues: var5 (ref), adDisclosureTelemetry (copy), var6 (ref)
					local var9 = not var5
					adDisclosureTelemetry.logAdDisclosureMenuToggled(var9)
					var6(var9)
				end
			}, {
				AdText = reactModule.createElement(text, {
					tag = "auto-x size-0-full text-label-small",
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
		}),
		WhyThisAdModal = if var7 then reactModule.createElement(whyThisAdModal, {
			adDisclosureBody = if var3 ~= "" then var1.errorAdDisclosureText else var3,
			showAdPreferencesUrl = var4,
			onClose = function()
				-- upvalues: adDisclosureTelemetry (copy), var8 (ref)
				adDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(false)
				var8(false)
			end
		}) else nil
	})
end)