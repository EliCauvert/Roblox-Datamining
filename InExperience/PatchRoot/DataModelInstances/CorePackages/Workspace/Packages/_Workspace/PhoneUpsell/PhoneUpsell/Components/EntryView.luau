local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)

local function noOp() --[[ Line: 34 ]] end

local config = {
	isButtonDisabled = false,
	isExtraButtonDisabled = false,
	onClose = noOp,
	onExtraButtonClick = noOp
}

local function getButtonStackProps(Text, OnActivated, IsDisabled, Text1, OnActivated1, IsDisabled1) --[[ Line: 43 ]]
	-- upvalues: ButtonType (copy)
	local Buttons = {
		{
			buttonType = ButtonType.PrimarySystem,
			props = {
				onActivated = OnActivated,
				text = Text,
				isDisabled = IsDisabled
			}
		}
	}
	
	if Text1 and Text1 ~= "" then
		table.insert(Buttons, 1, {
			buttonType = ButtonType.Secondary,
			props = {
				onActivated = OnActivated1,
				text = Text1,
				isDisabled = IsDisabled1
			}
		})
	end
	return {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = Buttons
	}
end

return function(p1) --[[ Line: 79 | Named "EntryView" ]]
	-- upvalues: MergePropsModule (copy), config (copy), GetPartialPageModalMiddleContentWidthFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), PartialPageModal (copy), getButtonStackProps (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local MergePropsModuleResult = MergePropsModule(config, p1)
	local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(MergePropsModuleResult.screenSize.X)
	local config1 = {
		titleKey = MergePropsModuleResult.titleKey,
		descriptionKey = MergePropsModuleResult.descriptionKey,
		buttonKey = MergePropsModuleResult.buttonKey
	}
	
	if MergePropsModuleResult.extraButtonKey and MergePropsModuleResult.extraButtonKey ~= "" then
		config1.extraButtonKey = MergePropsModuleResult.extraButtonKey
	end
	local UseStyleResult = UseStyleFunction()
	local _ = UseLocalizationFunction(config1)
	local config2 = {
		titleKey = "Before you leave",
		descriptionKey = "This experience would be even more exciting with Voice Chat turned on. Unlock now before your next session.",
		buttonKey = "Unlock voice chat",
		extraButtonKey = "Leave experience"
	}
	
	return ReactModule.createElement(PartialPageModal, {
		title = config2.titleKey,
		screenSize = MergePropsModuleResult.screenSize,
		buttonStackProps = getButtonStackProps(config2.buttonKey, MergePropsModuleResult.onButtonClick, MergePropsModuleResult.isButtonDisabled, config2.extraButtonKey, MergePropsModuleResult.onExtraButtonClick, MergePropsModuleResult.isExtraButtonDisabled),
		onCloseClicked = MergePropsModuleResult.onClose
	}, {
		Middle = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ContentPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 24)
			}),
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 6)
			}),
			BodyText = ReactModule.createElement("TextLabel", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				TextWrapped = true,
				RichText = true,
				Text = config2.descriptionKey,
				TextSize = UseStyleResult.Font.BaseSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
				Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end