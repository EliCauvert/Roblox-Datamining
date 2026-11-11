local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local Text = FoundationModule.Text
local Menu = FoundationModule.Menu
local Enums = FoundationModule.Enums
local WhyThisAdModalModule = require(Parent.WhyThisAdModal)
local AdDisclosureTelemetryModule = require(Parent.AdDisclosureTelemetry)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), Enums (copy), ReactModule (copy), AdDisclosureTelemetryModule (copy), View (copy), Menu (copy), Text (copy), Icon (copy), WhyThisAdModalModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		adLabel = "Feature.EnhancedVideo.Label.Ad",
		whyThisAdLabel = "Feature.GameDetails.Action.WhyThisAd",
		errorAdDisclosureText = "Feature.GameDetails.Message.SponsoredDisclosure.Error"
	})
	local Items = {
		{
			id = "whyThisAd",
			icon = Enums.IconName.CircleI,
			text = UseLocalizationResult.whyThisAdLabel
		}
	}
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	local function _(p2)
		-- upvalues: AdDisclosureTelemetryModule (upval), UseStateResult2 (copy)
		AdDisclosureTelemetryModule.logAdDisclosureMenuToggled(p2)
		UseStateResult2(p2)
	end
	
	local _ = function(p2)
		-- upvalues: AdDisclosureTelemetryModule (upval), UseStateResult2_1 (copy)
		AdDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(p2)
		UseStateResult2_1(p2)
	end
	
	return ReactModule.createElement(View, { tag = "size-full margin-bottom-medium" }, {
		Menu = ReactModule.createElement(Menu, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -10, 1, 0),
			isOpen = UseStateResult,
			items = Items,
			size = Enums.InputSize.Medium,
			align = Enums.PopoverAlign.End,
			width = UDim.new(0, 180),
			onPressedOutside = function()
				-- upvalues: AdDisclosureTelemetryModule (upval), UseStateResult2 (copy)
				AdDisclosureTelemetryModule.logAdDisclosureMenuToggled(false)
				UseStateResult2(false)
			end,
			onActivated = function(p2)
				-- upvalues: AdDisclosureTelemetryModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), p1 (copy)
				if p2 == "whyThisAd" then
					AdDisclosureTelemetryModule.logAdDisclosureMenuToggled(false)
					UseStateResult2(false)
					AdDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(true)
					UseStateResult2_1(true)
					p1.sendPauseEvent()
				end
			end
		}, {
			AdLabel = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center size-1300-600 stroke-standard stroke-default radius-small bg-over-media-100",
				onActivated = function()
					-- upvalues: UseStateResult (copy), AdDisclosureTelemetryModule (upval), UseStateResult2 (copy)
					local NoUseStateResult = not UseStateResult
					AdDisclosureTelemetryModule.logAdDisclosureMenuToggled(NoUseStateResult)
					UseStateResult2(NoUseStateResult)
				end
			}, {
				AdText = ReactModule.createElement(Text, {
					tag = "size-0-full auto-x text-label-small",
					LayoutOrder = 1,
					Text = UseLocalizationResult.adLabel
				}),
				TrailingIconWrapper = ReactModule.createElement(View, { tag = "auto-xy padding-left-small", LayoutOrder = 2 }, {
					MoreIcon = ReactModule.createElement(Icon, {
						name = Enums.IconName.CircleThreeDotsHorizontal,
						size = Enums.IconSize.XSmall
					})
				})
			})
		}),
		WhyThisAdModal = if UseStateResult1 then ReactModule.createElement(WhyThisAdModalModule, {
			adDisclosureBody = if p1.adDisclosureText == nil or p1.adDisclosureText == "" then UseLocalizationResult.errorAdDisclosureText else p1.adDisclosureText,
			showAdPreferencesUrl = p1.showAdPreferencesUrl,
			onClose = function()
				-- upvalues: AdDisclosureTelemetryModule (upval), UseStateResult2_1 (copy)
				AdDisclosureTelemetryModule.logAdDisclosureWhyThisAdToggled(false)
				UseStateResult2_1(false)
			end
		}) else nil
	})
end)