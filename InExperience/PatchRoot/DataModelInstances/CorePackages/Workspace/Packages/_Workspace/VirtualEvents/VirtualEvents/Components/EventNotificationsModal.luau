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

local function selectScreenSize(p0) --[[ line: 17 ]]
	return p0.ScreenSize
end

return function(p1) --[[ line: 26 | named "EventNotificationsModal" ]]
	-- upvalues: useStyle (ref), useNavigation (ref), useSelector (ref), selectScreenSize (ref), useLocalization (ref), reactModule (ref), partialPageModal (ref), buttonType (ref), uDim (ref), uDim_1 (ref), styledTextLabel (ref)
	local var6 = useStyle()
	local var7 = useNavigation()
	local var8 = useSelector(selectScreenSize)
	local var9 = useLocalization({
		title = "Feature.VirtualEvents.EnableNotificationsModalTitle",
		body = "Feature.VirtualEvents.EnableNotificationsModalBody",
		notNow = "Feature.VirtualEvents.NotNowButton",
		getNotified = "Feature.VirtualEvents.GetNotifiedButton"
	})
	local var10 = reactModule.useCallback(function() --[[ line: 38 ]]
		-- upvalues: p1 (ref), var7 (ref)
		if p1.onClose then
			p1.onClose()
		end
		var7.goBack()
	end, { p1.onClose, var7 })
	
	return reactModule.createElement(partialPageModal, {
		position = UDim2.fromScale(0.5, 0.5),
		anchorPoint = Vector2.new(0.5, 0.5),
		title = var9.title,
		screenSize = var8,
		buttonStackProps = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = var10, text = var9.notNow }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 46 ]]
							-- upvalues: p1 (ref), var10 (ref)
							if p1.onConfirm then
								p1.onConfirm()
							end
							var10()
						end, { p1.onConfirm, var10 }),
						text = var9.getNotified
					}
				}
			}
		},
		contentPadding = uDim,
		onCloseClicked = var10
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
				text = var9.body,
				textXAlignment = Enum.TextXAlignment.Center,
				fontStyle = var6.Font.Body,
				colorStyle = var6.Theme.TextMuted,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end