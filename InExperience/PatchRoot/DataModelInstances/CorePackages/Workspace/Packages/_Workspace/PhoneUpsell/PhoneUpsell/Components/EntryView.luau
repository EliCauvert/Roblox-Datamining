local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local getPartialPageModalMiddleContentWidth = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)

local function noOp() end

local t = {
	isButtonDisabled = false,
	isExtraButtonDisabled = false,
	onClose = noOp,
	onExtraButtonClick = noOp
}

local function getButtonStackProps(p1, p2, p3, p4, p5, p6)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.PrimarySystem,
			props = { onActivated = p2, text = p1, isDisabled = p3 }
		}
	}
	
	if p4 and p4 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { onActivated = p5, text = p4, isDisabled = p6 }
		})
	end
	return {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = list
	}
end

return function(p1)
	-- upvalues: mergePropsModule (ref), t (ref), getPartialPageModalMiddleContentWidth (ref), useStyle (ref), useLocalization (ref), reactModule (ref), partialPageModal (ref), getButtonStackProps (ref)
	local var1 = mergePropsModule(t, p1)
	local var2 = getPartialPageModalMiddleContentWidth(var1.screenSize.X)
	local t_1 = {
		titleKey = var1.titleKey,
		descriptionKey = var1.descriptionKey,
		buttonKey = var1.buttonKey
	}
	
	if var1.extraButtonKey and var1.extraButtonKey ~= "" then
		t_1.extraButtonKey = var1.extraButtonKey
	end
	local var3 = useStyle()
	local _ = useLocalization(t_1)
	local t_2 = {
		titleKey = "Before you leave",
		descriptionKey = "This experience would be even more exciting with Voice Chat turned on. Unlock now before your next session.",
		buttonKey = "Unlock voice chat",
		extraButtonKey = "Leave experience"
	}
	
	return reactModule.createElement(partialPageModal, {
		title = t_2.titleKey,
		screenSize = var1.screenSize,
		buttonStackProps = getButtonStackProps(t_2.buttonKey, var1.onButtonClick, var1.isButtonDisabled, t_2.extraButtonKey, var1.onExtraButtonClick, var1.isExtraButtonDisabled),
		onCloseClicked = var1.onClose
	}, {
		Middle = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ContentPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 24)
			}),
			ListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 6)
			}),
			BodyText = reactModule.createElement("TextLabel", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				TextWrapped = true,
				RichText = true,
				Text = t_2.descriptionKey,
				TextSize = var3.Font.BaseSize,
				TextColor3 = var3.Theme.TextDefault.Color,
				TextTransparency = var3.Theme.TextDefault.Transparency,
				Font = var3.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, var2, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end