local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local useNavigation = require(virtualEvents.Parent.Navigation).useNavigation
local useSelector = require(virtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local urlBuilder = require(virtualEvents.Parent.UrlBuilder).UrlBuilder
local selectableTextLabelModule = require(script.Parent.SelectableTextLabel)
local uDim = UDim.new(0, 24)
local uDim_1 = UDim.new(0, 8)
local uDim_2 = UDim.new(0, 2)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useStyle = UIBloxModule.Core.Style.useStyle

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: useStyle (ref), useSelector (ref), selectScreenSize (ref), useNavigation (ref), reactModule (ref), urlBuilder (ref), useLocalization (ref), partialPageModal (ref), uDim (ref), styledTextLabel (ref), uDim_2 (ref), uDim_1 (ref), selectableTextLabelModule (ref), button (ref), buttonType (ref)
	local var1 = useStyle()
	local var2 = useSelector(selectScreenSize)
	local var3 = useNavigation()
	local var4 = reactModule.useMemo(function()
		-- upvalues: urlBuilder (copy), p1 (ref)
		return urlBuilder.virtualevents.appsflyer({ eventId = p1.virtualEventId })
	end, { p1.virtualEventId })
	local var5 = useLocalization({
		title = "Feature.VirtualEvents.ShareModalTitle",
		body = "Feature.VirtualEvents.ShareModalBody",
		copyLink = "Feature.VirtualEvents.ShareModalLinkCopy",
		callToAction = "Feature.VirtualEvents.ShareModalCallToAction"
	})
	
	return reactModule.createElement(partialPageModal, {
		title = var5.title,
		screenSize = var2,
		contentPadding = uDim,
		onCloseClicked = reactModule.useCallback(function()
			-- upvalues: var3 (ref), p1 (ref)
			var3.goBack()
			
			if p1.onClose then
				p1.onClose()
			end
		end, { p1, var3 })
	}, {
		Wrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = uDim }),
			Padding = reactModule.createElement("UIPadding", { PaddingTop = uDim }),
			Body = reactModule.createElement(styledTextLabel, {
				layoutOrder = 1,
				fluidSizing = false,
				text = var5.body,
				fontStyle = var1.Font.Body,
				colorStyle = var1.Theme.TextMuted,
				size = UDim2.new(1, 0, 0, 40)
			}),
			Deeplink = reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = uDim
				}),
				Field = reactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(0.8, 0) - UDim2.fromOffset(uDim.Offset, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = var1.Theme.UIMuted.Color
				}, {
					Corner = reactModule.createElement("UICorner", { CornerRadius = uDim_2 }),
					Border = reactModule.createElement("UIStroke", { Color = var1.Theme.UIDefault.Color }),
					Padding = reactModule.createElement("UIPadding", {
						PaddingTop = uDim_1,
						PaddingRight = uDim_1,
						PaddingBottom = uDim_1,
						PaddingLeft = uDim_1
					}),
					Label = reactModule.createElement(selectableTextLabelModule, {
						fontStyle = var1.Font.Body,
						colorStyle = var1.Theme.TextMuted,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = var4
					})
				}),
				Action = reactModule.createElement(button, {
					layoutOrder = 2,
					buttonType = buttonType.PrimarySystem,
					text = var5.copyLink,
					size = UDim2.new(0.2, 0, 0, 32),
					onActivated = reactModule.useCallback(function()
						-- upvalues: p1 (ref), var4 (ref)
						if p1.onCopy then
							p1.onCopy(var4)
						end
					end, { var4, p1.onCopy })
				})
			})
		})
	})
end