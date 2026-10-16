local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local Text = FoundationModule.Text
local Menu = FoundationModule.Menu
local Enums = FoundationModule.Enums
local WhyThisAdModal = require(Parent1.AdLabel).WhyThisAdModal
local AdDisclosureTelemetry = require(Parent1.AdLabel).AdDisclosureTelemetry
local AdLabel = require(Parent1.AdLabel).AdLabel
local FFlagLuaAppEnhancedVideoAdLabelPropUpdateModule = require(Parent.Parent.FFlagLuaAppEnhancedVideoAdLabelPropUpdate)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local EnhancedVideoStoreModule = require(Parent.Parent.EnhancedVideoStore)
local UseSignalStateFunction = require(Parent1.SignalsReact).useSignalState

local function LegacyAdLabel(p1) --[[ Line: 27 ]]
	-- upvalues: UseLocalizationFunction (copy), Enums (copy), EnhancedVideoStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), AdDisclosureTelemetry (copy), View (copy), Menu (copy), Text (copy), Icon (copy), WhyThisAdModal (copy)
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
	local EnhancedVideoStoreModuleResult = EnhancedVideoStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(EnhancedVideoStoreModuleResult.getAdDisclosureText)
	local UseSignalStateResult1 = UseSignalStateFunction(EnhancedVideoStoreModuleResult.getShowAdPreferencesUrl)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	local function _(p2) --[[ Line: 45 | Named "toggleMenu" ]]
		-- upvalues: AdDisclosureTelemetry (upval), UseStateResult2 (copy)
		AdDisclosureTelemetry.logAdDisclosureMenuToggled(p2)
		UseStateResult2(p2)
	end
	
	local _ = function(p2) --[[ Line: 50 | Named "toggleWhyThisAdModal" ]]
		-- upvalues: AdDisclosureTelemetry (upval), UseStateResult2_1 (copy)
		AdDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(p2)
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
			onPressedOutside = function() --[[ Line: 66 ]]
				-- upvalues: AdDisclosureTelemetry (upval), UseStateResult2 (copy)
				AdDisclosureTelemetry.logAdDisclosureMenuToggled(false)
				UseStateResult2(false)
			end,
			onActivated = function(p2) --[[ Line: 69 ]]
				-- upvalues: AdDisclosureTelemetry (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), p1 (copy)
				if p2 == "whyThisAd" then
					AdDisclosureTelemetry.logAdDisclosureMenuToggled(false)
					UseStateResult2(false)
					AdDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(true)
					UseStateResult2_1(true)
					p1.sendPauseEvent()
				end
			end
		}, {
			AdLabel = ReactModule.createElement(View, {
				tag = "size-1300-600 bg-over-media-100 radius-small stroke-standard stroke-default row align-x-center align-y-center",
				onActivated = function() --[[ Line: 79 ]]
					-- upvalues: UseStateResult (copy), AdDisclosureTelemetry (upval), UseStateResult2 (copy)
					local NoUseStateResult = not UseStateResult
					AdDisclosureTelemetry.logAdDisclosureMenuToggled(NoUseStateResult)
					UseStateResult2(NoUseStateResult)
				end
			}, {
				AdText = ReactModule.createElement(Text, {
					tag = "auto-x size-0-full text-label-small",
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
		WhyThisAdModal = if UseStateResult1 then ReactModule.createElement(WhyThisAdModal, {
			adDisclosureBody = if UseSignalStateResult == "" then UseLocalizationResult.errorAdDisclosureText else UseSignalStateResult,
			showAdPreferencesUrl = UseSignalStateResult1,
			onClose = function() --[[ Line: 105 ]]
				-- upvalues: AdDisclosureTelemetry (upval), UseStateResult2_1 (copy)
				AdDisclosureTelemetry.logAdDisclosureWhyThisAdToggled(false)
				UseStateResult2_1(false)
			end
		}) else nil
	})
end

local v1 = if FFlagLuaAppEnhancedVideoAdLabelPropUpdateModule then function(p1) --[[ Line: 114 ]]
	-- upvalues: EnhancedVideoStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), AdLabel (copy)
	local EnhancedVideoStoreModuleResult = EnhancedVideoStoreModule(false)
	
	return ReactModule.createElement(AdLabel, {
		sendPauseEvent = p1.sendPauseEvent,
		adDisclosureText = UseSignalStateFunction(EnhancedVideoStoreModuleResult.getAdDisclosureText),
		showAdPreferencesUrl = UseSignalStateFunction(EnhancedVideoStoreModuleResult.getShowAdPreferencesUrl)
	})
end else nil

return if FFlagLuaAppEnhancedVideoAdLabelPropUpdateModule then ReactModule.memo(v1) else ReactModule.memo(LegacyAdLabel)