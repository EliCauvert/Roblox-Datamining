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

return function(p1)
	-- upvalues: playersService (ref), discoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelistModule (ref), react (ref), useStyle (ref), useLocalization (ref), textKeysModule (ref), eventNamesModule (ref), t (ref), imageSetLabel (ref), images (ref), iconSize (ref), checkbox (ref), styledTextLabel (ref), radioButtonList (ref), partialPageModal (ref), buttonType (ref)
	local titleText, var1, var2, frame, infoText, color
	local var3 = if playersService.LocalPlayer and discoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelistModule.isWhitelistedUserId(playersService.LocalPlayer.UserId) then false else p1.prefillDiscoverabilitySetting
	local var4, var5 = react.useState(if var3 then 1 else nil)
	local var6 = useStyle()
	local font = var6.Font
	local theme = var6.Theme
	local var7 = useLocalization({
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
	
	local var8 = function(p2)
		-- upvalues: p1 (ref), eventNamesModule (copy), t (copy), var5 (ref)
		p1.analytics.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalRadioButtonClick, { selected = t[tostring(p2)] })
		var5(p2)
	end
	
	local var9 = function()
		-- upvalues: p1 (ref), t (copy), var4 (ref)
		p1.onActivated(t[tostring(var4)])
	end
	
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var3 then
		local var10 = function()
			-- upvalues: var4 (ref), p1 (ref), eventNamesModule (copy), t (copy), var5 (ref)
			local var11 = if var4 == 1 then 2 else 1
			p1.analytics.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalRadioButtonClick, { selected = t[tostring(var11)] })
			var5(var11)
		end
		
		titleText = var7.titleTextPrefillDiscoverable
		var1 = 12
		var2 = react.createElement(imageSetLabel, {
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
				onActivated = var10,
				isChecked = var4 == 1
			}),
			CheckboxLabel = react.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Font = font.Body.Font,
				Size = UDim2.fromScale(1, 0),
				Text = var7.optInTextPrefillDiscoverable,
				TextColor3 = theme.TextDefault.Color,
				TextSize = font.Body.RelativeSize * font.BaseSize,
				TextTransparency = theme.TextDefault.Transparency,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 2,
				[react.Event.Activated] = var10
			})
		})
		infoText = var7.infoTextPrefillDiscoverable
		color = theme.TextLink.Color
	else
		titleText = var7.titleText
		var1 = 24
		var2 = react.createElement(styledTextLabel, {
			layoutOrder = 1,
			text = var7.optInText,
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
				radioButtons = { { label = var7.yesText }, { label = var7.noText } },
				elementSize = UDim2.new(1, 0, 0, 50),
				onActivated = var8,
				initialValue = var4,
				padding = UDim.new(0, 0)
			})
		})
		infoText = var7.infoText
		color = theme.TextEmphasis.Color
	end
	return react.createElement(partialPageModal, {
		title = titleText,
		screenSize = p1.screenSize,
		onCloseClicked = function()
			-- upvalues: p1 (ref), t (copy), var4 (ref)
			p1.onCloseClicked(t[tostring(var4)])
		end,
		buttonStackProps = {
			buttonHeight = 48,
			marginBetween = 6,
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var9, text = var7.continueText }
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
				PaddingTop = UDim.new(0, var1),
				PaddingBottom = UDim.new(0, 36)
			}),
			Header = var2,
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
				Text = var7.learnMoreText,
				TextColor3 = color,
				TextSize = font.CaptionBody.RelativeSize * font.BaseSize,
				TextTransparency = theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 4,
				[react.Event.Activated] = p1.onLearnMoreClick
			})
		})
	})
end