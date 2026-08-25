local playersService = game:GetService("Players")
local parent = script.Parent.Parent.Parent
local textKeysModule = require(parent.Common.TextKeys)
local dependenciesModule = require(parent.dependencies)
local eventNamesModule = require(parent.Analytics.Enums.EventNames)
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local checkbox = dependenciesModule.Foundation.Checkbox
local useLocalization = dependenciesModule.Hooks.useLocalization
local discoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelistModule = require(parent.Flags.DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist)
local useStyle = UIBlox.Core.Style.useStyle
local partialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local buttonType = UIBlox.App.Button.Enum.ButtonType
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local radioButtonList = UIBlox.App.InputButton.RadioButtonList
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local iconSize = UIBlox.App.Constant.IconSize
local t = {
	["1"] = "Discoverable",
	["2"] = "NotDiscoverable",
	["nil"] = "Unset"
}

return function(p0)
	-- upvalues: playersService (ref), discoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelistModule (ref), react (ref), useStyle (ref), useLocalization (ref), textKeysModule (ref), eventNamesModule (ref), t (ref), imageSetLabel (ref), images (ref), iconSize (ref), checkbox (ref), styledTextLabel (ref), radioButtonList (ref), partialPageModal (ref), buttonType (ref)
	local titleText, var13, var14, frame, infoText, color
	local var6 = if playersService.LocalPlayer and discoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelistModule.isWhitelistedUserId(playersService.LocalPlayer.UserId) then false else p0.prefillDiscoverabilitySetting
	local var7, var8 = react.useState(if var6 then 1 else nil)
	local var9 = useStyle()
	local font = var9.Font
	local theme = var9.Theme
	local var10 = useLocalization({
		optInText = textKeysModule.DISCOVERABILITY_OPT_IN,
		infoText = textKeysModule.DISCOVERABILITY_INFO,
		learnMoreText = textKeysModule.LEARN_MORE,
		continueText = textKeysModule.CONTINUE,
		yesText = textKeysModule.YES_OPT_IN,
		noText = textKeysModule.NO_OPT_OUT,
		titleText = textKeysModule.DISCOVERABILITY_TITLE,
		titleTextPrefillDiscoverable = textKeysModule.DISCOVERABILITY_TITLE_PREFILL_DISCOVERABLE,
		optInTextPrefillDiscoverable = textKeysModule.DISCOVERABILITY_OPT_IN_PREFILL_DISCOVERABLE,
		infoTextPrefillDiscoverable = textKeysModule.DISCOVERABILITY_INFO_PREFILL_DISCOVERABLE
	})
	
	local var11 = function(p1)
		-- upvalues: p0 (ref), eventNamesModule (copy), t (copy), var8 (ref)
		p0.analytics.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalRadioButtonClick, { selected = t[tostring(p1)] })
		var8(p1)
	end
	
	local var12 = function()
		-- upvalues: p0 (ref), t (copy), var7 (ref)
		p0.onActivated(t[tostring(var7)])
	end
	
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var6 then
		local var16 = function()
			-- upvalues: var7 (ref), p0 (ref), eventNamesModule (copy), t (copy), var8 (ref)
			local var17 = if var7 == 1 then 2 else 1
			p0.analytics.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalRadioButtonClick, { selected = t[tostring(var17)] })
			var8(var17)
		end
		
		titleText = var10.titleTextPrefillDiscoverable
		var13 = 12
		var14 = react.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = images["icons/graphic/findfriends_xlarge"],
			ImageTransparency = theme.IconEmphasis.Transparency,
			Size = UDim2.fromOffset(iconSize.XLarge, iconSize.XLarge),
			Position = UDim2.fromScale(0.5, 0.5)
		})
		frame = react.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = react.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			UIPadding = react.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 24)
			}),
			Checkbox = react.createElement(checkbox, {
				label = "",
				LayoutOrder = 1,
				onActivated = var16,
				isChecked = var7 == 1
			}),
			CheckboxLabel = react.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Font = font.Body.Font,
				Size = UDim2.fromScale(1, 0),
				Text = var10.optInTextPrefillDiscoverable,
				TextColor3 = theme.TextDefault.Color,
				TextSize = font.Body.RelativeSize * font.BaseSize,
				TextTransparency = theme.TextDefault.Transparency,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 2,
				[react.Event.Activated] = var16
			})
		})
		infoText = var10.infoTextPrefillDiscoverable
		color = theme.TextLink.Color
	else
		titleText = var10.titleText
		var13 = 24
		var14 = react.createElement(styledTextLabel, {
			layoutOrder = 1,
			text = var10.optInText,
			fontStyle = font.Body,
			colorStyle = theme.TextDefault,
			size = UDim2.fromScale(1, 0),
			automaticSize = Enum.AutomaticSize.Y,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Top
		})
		frame = react.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			RadioButtonList = react.createElement(radioButtonList, {
				layoutOrder = 1,
				radioButtons = { { label = var10.yesText }, { label = var10.noText } },
				elementSize = UDim2.new(1, 0, 0, 50),
				onActivated = var11,
				initialValue = var7,
				padding = UDim.new(0, 0)
			})
		})
		infoText = var10.infoText
		color = theme.TextEmphasis.Color
	end
	return react.createElement(partialPageModal, {
		title = titleText,
		screenSize = p0.screenSize,
		onCloseClicked = function()
			-- upvalues: p0 (ref), t (copy), var7 (ref)
			p0.onCloseClicked(t[tostring(var7)])
		end,
		buttonStackProps = {
			buttonHeight = 48,
			marginBetween = 6,
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var12, text = var10.continueText }
				}
			},
			forcedFillDirection = Enum.FillDirection.Vertical
		}
	}, {
		ViewContainer = react.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = react.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12),
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			UIPadding = react.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var13),
				PaddingBottom = UDim.new(0, 36)
			}),
			Header = var14,
			Selector = frame,
			Description = react.createElement(styledTextLabel, {
				layoutOrder = 3,
				text = infoText,
				fontStyle = font.CaptionBody,
				colorStyle = theme.TextDefault,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y,
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Top
			}),
			LearnMore = react.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Font = font.CaptionBody.Font,
				Size = UDim2.fromScale(1, 0),
				Text = var10.learnMoreText,
				TextColor3 = color,
				TextSize = font.CaptionBody.RelativeSize * font.BaseSize,
				TextTransparency = theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 4,
				[react.Event.Activated] = p0.onLearnMoreClick
			})
		})
	})
end