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

local function getButtonStackProps(p0, p1, p2, p3, p4, p5)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.PrimarySystem,
			props = { onActivated = p1, text = p0, isDisabled = p2 }
		}
	}
	
	if p3 and p3 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { onActivated = p4, text = p3, isDisabled = p5 }
		})
	end
	return {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = list
	}
end

return function(p6)
	-- upvalues: mergePropsModule (ref), t (ref), getPartialPageModalMiddleContentWidth (ref), useStyle (ref), useLocalization (ref), reactModule (ref), partialPageModal (ref), getButtonStackProps (ref)
	local var8 = mergePropsModule(t, p6)
	local var9 = getPartialPageModalMiddleContentWidth(var8.screenSize.X)
	local t_1 = {
		titleKey = var8.titleKey,
		descriptionKey = var8.descriptionKey,
		buttonKey = var8.buttonKey
	}
	
	if var8.extraButtonKey and var8.extraButtonKey ~= "" then
		t_1.extraButtonKey = var8.extraButtonKey
	end
	local var11 = useStyle()
	local _ = useLocalization(t_1)
	local t_2 = {
		titleKey = "Before you leave",
		descriptionKey = "This experience would be even more exciting with Voice Chat turned on. Unlock now before your next session.",
		buttonKey = "Unlock voice chat",
		extraButtonKey = "Leave experience"
	}
	
	return reactModule.createElement(partialPageModal, {
		title = t_2.titleKey,
		screenSize = var8.screenSize,
		buttonStackProps = getButtonStackProps(t_2.buttonKey, var8.onButtonClick, var8.isButtonDisabled, t_2.extraButtonKey, var8.onExtraButtonClick, var8.isExtraButtonDisabled),
		onCloseClicked = var8.onClose
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
				TextSize = var11.Font.BaseSize,
				TextColor3 = var11.Theme.TextDefault.Color,
				TextTransparency = var11.Theme.TextDefault.Transparency,
				Font = var11.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, var9, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end