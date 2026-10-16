local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonEnum = UIBloxModule.App.Button.Enum
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local SocialLibrariesModule = require(AppChat.SocialLibraries)
local Info = SocialLibrariesModule.Components.AlertViews.Info
local Warning = SocialLibrariesModule.Components.AlertViews.Warning
local config = {
	titleText = "",
	cancelAlertText = "",
	bodyText = "",
	isButtonDisabled = false,
	screenSize = Vector2.new(1000, 1000),
	onActivated = function() --[[ Line: 41 ]] end,
	onDismissed = function() --[[ Line: 42 ]] end
}

return ReactModule.memo(function(p1) --[[ Line: 45 | Named "PartialModal" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseIsInExperienceModule (copy), Warning (copy), Info (copy), ReactModule (copy), PartialPageModal (copy), ButtonEnum (copy), StyledTextLabel (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = UnionResult.style or UseStyleResult
	local Size600: number = Style.Tokens.Size.Size_600
	local LineHeight140 = Style.Tokens.LineHeight.LineHeight_140
	
	return if UseIsInExperienceModule() then ReactModule.createElement(if UnionResult.actionText then Warning else Info, {
		soakAreaTransparency = 0.8,
		displayFailed = false,
		titleText = UnionResult.titleText,
		bodyText = UnionResult.bodyText,
		cancelText = if UnionResult.actionText then UnionResult.cancelAlertText else nil,
		confirmText = if UnionResult.actionText then UnionResult.actionText else UnionResult.cancelAlertText,
		screenSize = UnionResult.screenSize,
		soakAreaColor3 = Color3.fromRGB(25, 25, 25),
		width = UDim.new(0.8, 0),
		onActivated = UnionResult.onActivated,
		onModalClose = UnionResult.onDismissed
	}) else ReactModule.createElement(PartialPageModal, {
		title = UnionResult.titleText,
		buttonStackProps = if UnionResult.actionText then {
			buttons = {
				{
					buttonType = ButtonEnum.ButtonType.PrimarySystem,
					props = {
						onActivated = UnionResult.onActivated,
						text = UnionResult.actionText,
						isDisabled = UnionResult.isButtonDisabled
					}
				}
			}
		} else nil,
		screenSize = UnionResult.screenSize,
		onCloseClicked = UnionResult.onDismissed
	}, {
		Body = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ContentPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Size600 / 2),
				PaddingBottom = if UnionResult.actionText then UDim.new(0, Size600) else nil
			}),
			Body = ReactModule.createElement(StyledTextLabel, {
				fluidSizing = false,
				text = UnionResult.bodyText,
				textXAlignment = Enum.TextXAlignment.Left,
				fontStyle = Style.Font.Body,
				lineHeight = LineHeight140,
				colorStyle = Style.Theme.TextDefault,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end)