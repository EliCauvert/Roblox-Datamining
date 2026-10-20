local Players = game:GetService("Players")
local Parent = script.Parent.Parent.Parent
local TextKeysModule = require(Parent.Common.TextKeys)
local DependenciesModule = require(Parent.dependencies)
local EventNamesModule = require(Parent.Analytics.Enums.EventNames)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local Checkbox = DependenciesModule.Foundation.Checkbox
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelistModule = require(Parent.Flags.DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist)
local UseStyleFunction = UIBlox.Core.Style.useStyle
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local RadioButtonList = UIBlox.App.InputButton.RadioButtonList
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local IconSize = UIBlox.App.Constant.IconSize
local config = {
	["1"] = "Discoverable",
	["2"] = "NotDiscoverable",
	["nil"] = "Unset"
}

return function(p1)
	-- upvalues: Players (copy), DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelistModule (copy), React (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), EventNamesModule (copy), config (copy), ImageSetLabel (copy), Images (copy), IconSize (copy), Checkbox (copy), StyledTextLabel (copy), RadioButtonList (copy), PartialPageModal (copy), ButtonType (copy)
	local PrefillDiscoverabilitySetting = (not Players.LocalPlayer or not DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelistModule.isWhitelistedUserId(Players.LocalPlayer.UserId)) and p1.prefillDiscoverabilitySetting
	local UseStateResult, UseStateResult2 = React.useState(if PrefillDiscoverabilitySetting then 1 else nil)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local UseLocalizationResult = UseLocalizationFunction({
		optInText = TextKeysModule.DISCOVERABILITY_OPT_IN,
		infoText = TextKeysModule.DISCOVERABILITY_INFO,
		learnMoreText = TextKeysModule.LEARN_MORE,
		continueText = TextKeysModule.CONTINUE,
		yesText = TextKeysModule.YES_OPT_IN,
		noText = TextKeysModule.NO_OPT_OUT,
		titleText = TextKeysModule.DISCOVERABILITY_TITLE,
		titleTextPrefillDiscoverable = TextKeysModule.DISCOVERABILITY_TITLE_PREFILL_DISCOVERABLE,
		optInTextPrefillDiscoverable = TextKeysModule.DISCOVERABILITY_OPT_IN_PREFILL_DISCOVERABLE,
		infoTextPrefillDiscoverable = TextKeysModule.DISCOVERABILITY_INFO_PREFILL_DISCOVERABLE
	})
	
	local function OnActivated(p2)
		-- upvalues: p1 (copy), EventNamesModule (upval), config (upval), UseStateResult2 (copy)
		p1.analytics.fireAnalyticsEvent(EventNamesModule.DiscoverabilityModalRadioButtonClick, { selected = config[tostring(p2)] })
		UseStateResult2(p2)
	end
	
	local function OnActivated1()
		-- upvalues: p1 (copy), config (upval), UseStateResult (copy)
		p1.onActivated(config[tostring(UseStateResult)])
	end
	local Element = nil
	local Offset = nil
	local TitleTextPrefillDiscoverable = nil
	local Color = nil
	local Frame = nil
	local InfoTextPrefillDiscoverable = nil
	
	if PrefillDiscoverabilitySetting then
		local function OnActivated2()
			-- upvalues: UseStateResult (copy), p1 (copy), EventNamesModule (upval), config (upval), UseStateResult2 (copy)
			local v1: number = if UseStateResult == 1 then 2 else 1
			p1.analytics.fireAnalyticsEvent(EventNamesModule.DiscoverabilityModalRadioButtonClick, { selected = config[tostring(v1)] })
			UseStateResult2(v1)
		end
		
		TitleTextPrefillDiscoverable = UseLocalizationResult.titleTextPrefillDiscoverable
		Offset = 12
		Element = React.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = Images["icons/graphic/findfriends_xlarge"],
			ImageTransparency = Theme.IconEmphasis.Transparency,
			Size = UDim2.fromOffset(IconSize.XLarge, IconSize.XLarge),
			Position = UDim2.fromScale(0.5, 0.5)
		})
		Frame = React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			UIPadding = React.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 24)
			}),
			Checkbox = React.createElement(Checkbox, {
				label = "",
				LayoutOrder = 1,
				onActivated = OnActivated2,
				isChecked = UseStateResult == 1
			}),
			CheckboxLabel = React.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Font = UseStyleResultFont.Body.Font,
				Size = UDim2.fromScale(1, 0),
				Text = UseLocalizationResult.optInTextPrefillDiscoverable,
				TextColor3 = Theme.TextDefault.Color,
				TextSize = UseStyleResultFont.Body.RelativeSize * UseStyleResultFont.BaseSize,
				TextTransparency = Theme.TextDefault.Transparency,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 2,
				[React.Event.Activated] = OnActivated2
			})
		})
		InfoTextPrefillDiscoverable = UseLocalizationResult.infoTextPrefillDiscoverable
		Color = Theme.TextLink.Color
	else
		TitleTextPrefillDiscoverable = UseLocalizationResult.titleText
		Offset = 24
		Element = React.createElement(StyledTextLabel, {
			layoutOrder = 1,
			text = UseLocalizationResult.optInText,
			fontStyle = UseStyleResultFont.Body,
			colorStyle = Theme.TextDefault,
			size = UDim2.fromScale(1, 0),
			automaticSize = Enum.AutomaticSize.Y,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Top
		})
		Frame = React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			RadioButtonList = React.createElement(RadioButtonList, {
				layoutOrder = 1,
				radioButtons = {
					{ label = UseLocalizationResult.yesText },
					{ label = UseLocalizationResult.noText }
				},
				elementSize = UDim2.new(1, 0, 0, 50),
				onActivated = OnActivated,
				initialValue = UseStateResult,
				padding = UDim.new(0, 0)
			})
		})
		InfoTextPrefillDiscoverable = UseLocalizationResult.infoText
		Color = Theme.TextEmphasis.Color
	end
	return React.createElement(PartialPageModal, {
		title = TitleTextPrefillDiscoverable,
		screenSize = p1.screenSize,
		onCloseClicked = function()
			-- upvalues: p1 (copy), config (upval), UseStateResult (copy)
			p1.onCloseClicked(config[tostring(UseStateResult)])
		end,
		buttonStackProps = {
			buttonHeight = 48,
			marginBetween = 6,
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = OnActivated1,
						text = UseLocalizationResult.continueText
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Vertical
		}
	}, {
		ViewContainer = React.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12),
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			UIPadding = React.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Offset),
				PaddingBottom = UDim.new(0, 36)
			}),
			Header = Element,
			Selector = Frame,
			Description = React.createElement(StyledTextLabel, {
				layoutOrder = 3,
				text = InfoTextPrefillDiscoverable,
				fontStyle = UseStyleResultFont.CaptionBody,
				colorStyle = Theme.TextDefault,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y,
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Top
			}),
			LearnMore = React.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Font = UseStyleResultFont.CaptionBody.Font,
				Size = UDim2.fromScale(1, 0),
				Text = UseLocalizationResult.learnMoreText,
				TextColor3 = Color,
				TextSize = UseStyleResultFont.CaptionBody.RelativeSize * UseStyleResultFont.BaseSize,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 4,
				[React.Event.Activated] = p1.onLearnMoreClick
			})
		})
	})
end