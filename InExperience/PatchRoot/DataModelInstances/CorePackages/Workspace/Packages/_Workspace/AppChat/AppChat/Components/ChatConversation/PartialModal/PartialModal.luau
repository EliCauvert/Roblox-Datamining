local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local enum = UIBloxModule.App.Button.Enum
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local socialLibrariesModule = require(appChat.SocialLibraries)
local info = socialLibrariesModule.Components.AlertViews.Info
local warning = socialLibrariesModule.Components.AlertViews.Warning
local t = {
	titleText = "",
	cancelAlertText = "",
	bodyText = "",
	isButtonDisabled = false,
	screenSize = Vector2.new(1000, 1000),
	onActivated = function() end,
	onDismissed = function() end
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useIsInExperienceModule (ref), warning (ref), info (ref), reactModule (ref), partialPageModal (ref), enum (ref), styledTextLabel (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local style = var1.style or useStyle()
	local size600 = style.Tokens.Size.Size_600
	
	return if useIsInExperienceModule() then reactModule.createElement(if var1.actionText then warning else info, {
		soakAreaTransparency = 0.8,
		displayFailed = false,
		titleText = var1.titleText,
		bodyText = var1.bodyText,
		cancelText = if var1.actionText then var1.cancelAlertText else nil,
		confirmText = if var1.actionText then var1.actionText else var1.cancelAlertText,
		screenSize = var1.screenSize,
		soakAreaColor3 = Color3.fromRGB(25, 25, 25),
		width = UDim.new(0.8, 0),
		onActivated = var1.onActivated,
		onModalClose = var1.onDismissed
	}) else reactModule.createElement(partialPageModal, {
		title = var1.titleText,
		buttonStackProps = if var1.actionText then {
			buttons = {
				{
					buttonType = enum.ButtonType.PrimarySystem,
					props = {
						onActivated = var1.onActivated,
						text = var1.actionText,
						isDisabled = var1.isButtonDisabled
					}
				}
			}
		} else nil,
		screenSize = var1.screenSize,
		onCloseClicked = var1.onDismissed
	}, {
		Body = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ContentPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, size600 / 2),
				PaddingBottom = if var1.actionText then UDim.new(0, size600) else nil
			}),
			Body = reactModule.createElement(styledTextLabel, {
				fluidSizing = false,
				text = var1.bodyText,
				textXAlignment = Enum.TextXAlignment.Left,
				fontStyle = style.Font.Body,
				lineHeight = style.Tokens.LineHeight.LineHeight_140,
				colorStyle = style.Theme.TextDefault,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end)