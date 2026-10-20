local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local Parent = UserActivationFramework.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.Constant.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local TextButton = UIBloxModule.App.Button.TextButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Text = require(Parent.Foundation).Text
local GetFFlagEnableSignupFoundationTextFunction = require(Parent.SharedFlags).GetFFlagEnableSignupFoundationText
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(UserActivationFramework.Types)
local _ = require(UserActivationFramework.Components.ActivationFrameworkTokenMapper)
local FullPageActivationFrameworkContextModule = require(UserActivationFramework.Context.FullPageActivationFrameworkContext)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), FullPageActivationFrameworkContextModule (copy), TextButton (copy), IconButton (copy), IconSize (copy), Images (copy), StyledTextLabel (copy), GetFFlagEnableSignupFoundationTextFunction (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		headingText = p1.headingTextKey,
		titleText = p1.titleTextKey,
		bodyText = p1.bodyTextKey,
		ixpTitleText = p1.ixpTitleTextKey,
		ixpBodyText = p1.ixpBodyTextKey,
		skipText = p1.skipProps.skipButtonTextKey
	})
	local TitleText = UseLocalizationResult.titleText
	local BodyText = UseLocalizationResult.bodyText
	
	if type(UseLocalizationResult.ixpTitleText) == "string" and #UseLocalizationResult.ixpTitleText > 0 then
		TitleText = UseLocalizationResult.ixpTitleText
	end
	if type(UseLocalizationResult.ixpBodyText) == "string" and #UseLocalizationResult.ixpBodyText > 0 then
		BodyText = UseLocalizationResult.ixpBodyText
	end
	local UseStyleResult = UseStyleFunction()
	local ActivationFramework = UseDesignTokensFunction().LuaApps.ActivationFramework
	local ActivationFrameworkState = ReactModule.useContext(FullPageActivationFrameworkContextModule).activationFrameworkState
	
	local function OnActivated()
		-- upvalues: ActivationFrameworkState (copy), p1 (copy)
		if not ActivationFrameworkState.isLoading then
			p1.backProps.onBack()
			
			return
		end
	end
	
	local function OnActivated1()
		-- upvalues: ActivationFrameworkState (copy), p1 (copy)
		if not ActivationFrameworkState.isLoading then
			p1.skipProps.onSkip()
			
			return
		end
	end
	
	local function _(): number
		-- upvalues: ActivationFramework (copy)
		return ActivationFramework.headerIconSize + 8
	end
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 10)
		}),
		TopRow = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, ActivationFramework.headerIconSize + 8)
		}, {
			BackButton = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, -8, 0.5, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				BackButtonContent = p1.backProps.shouldShowBackButton and ReactModule.createElement(IconButton, {
					iconSize = IconSize.Medium,
					icon = Images[p1.backProps.icon],
					onActivated = OnActivated
				}) or nil
			}),
			HeadingFrame = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AutomaticSize = Enum.AutomaticSize.X
			}, {
				HeadingTextContent = (function()
					-- upvalues: p1 (copy), ReactModule (upval), StyledTextLabel (upval), UseLocalizationResult (copy), UseStyleResult (copy)
					return if p1.headingTextKey == nil then nil else ReactModule.createElement(StyledTextLabel, {
						text = UseLocalizationResult.headingText,
						fontStyle = UseStyleResult.Font.Header1,
						colorStyle = UseStyleResult.Theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Center
					})
				end)()
			}),
			SkipButton = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.fromScale(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				SkipButtonContent = p1.skipProps.shouldShowSkipButton and ReactModule.createElement(TextButton, {
					text = UseLocalizationResult.skipText,
					onActivated = OnActivated1,
					Size = UDim2.new(1, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.XY
				}) or nil
			})
		}),
		BottomRow = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 5)
			}),
			Title = if GetFFlagEnableSignupFoundationTextFunction() then ReactModule.createElement(Text, {
				TextWrapped = true,
				tag = "text-heading-medium text-align-x-left auto-xy content-emphasis",
				Text = TitleText,
				fontStyle = { LineHeight = 1 }
			}) else ReactModule.createElement(StyledTextLabel, {
				textWrapped = true,
				lineHeight = 1,
				text = TitleText,
				fontStyle = UseStyleResult.Font.Title,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Body = if GetFFlagEnableSignupFoundationTextFunction() then ReactModule.createElement(Text, {
				tag = "text-body-medium text-align-x-left auto-xy content-default",
				TextWrapped = true,
				Text = BodyText,
				fontStyle = { LineHeight = 1 }
			}) else ReactModule.createElement(StyledTextLabel, {
				textWrapped = true,
				lineHeight = 1,
				text = BodyText,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			})
		})
	})
end