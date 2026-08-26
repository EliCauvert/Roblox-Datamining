local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local useSelector = require(virtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local useNavigation = require(virtualEvents.Parent.Navigation).useNavigation
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local useStyle = UIBloxModule.Core.Style.useStyle
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local uDim = UDim.new(0, 24)
local uDim_1 = UDim.new(0, 12)

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: useStyle (ref), useNavigation (ref), useSelector (ref), selectScreenSize (ref), useLocalization (ref), reactModule (ref), partialPageModal (ref), buttonType (ref), uDim (ref), uDim_1 (ref), styledTextLabel (ref)
	local var1 = useStyle()
	local var2 = useNavigation()
	local var3 = useSelector(selectScreenSize)
	local var4 = useLocalization({
		title = "Feature.VirtualEvents.EnableNotificationsModalTitle",
		body = "Feature.VirtualEvents.EnableNotificationsModalBody",
		notNow = "Feature.VirtualEvents.NotNowButton",
		getNotified = "Feature.VirtualEvents.GetNotifiedButton"
	})
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1.onClose then
			p1.onClose()
		end
		var2.goBack()
	end, { p1.onClose, var2 })
	
	return reactModule.createElement(partialPageModal, {
		position = UDim2.fromScale(0.5, 0.5),
		anchorPoint = Vector2.new(0.5, 0.5),
		title = var4.title,
		screenSize = var3,
		buttonStackProps = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = var5, text = var4.notNow }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = reactModule.useCallback(function()
							-- upvalues: p1 (ref), var5 (ref)
							if p1.onConfirm then
								p1.onConfirm()
							end
							var5()
						end, { p1.onConfirm, var5 }),
						text = var4.getNotified
					}
				}
			}
		},
		contentPadding = uDim,
		onCloseClicked = var5
	}, {
		Wrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = uDim_1
			}),
			Padding = reactModule.createElement("UIPadding", { PaddingTop = uDim_1 + uDim_1, PaddingBottom = uDim_1 }),
			Body = reactModule.createElement(styledTextLabel, {
				fluidSizing = false,
				text = var4.body,
				textXAlignment = Enum.TextXAlignment.Center,
				fontStyle = var1.Font.Body,
				colorStyle = var1.Theme.TextMuted,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end