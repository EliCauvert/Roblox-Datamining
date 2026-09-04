local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local chatLineReportingModule = require(parent.ChatLineReporting)
local chatLineReportRoot = chatLineReportingModule.ChatLineReportRoot
local constants = chatLineReportingModule.Constants
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local view = foundationModule.View
local icon = foundationModule.Icon
local menu = foundationModule.Menu
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign

local function mapMessagesForReport(p1, p2)
	local list = table.create(#p1)
	
	for i, v in p1 do
		if v.messageType == "user" then
			table.insert(list, {
				userId = v.senderUserId,
				text = v.content,
				textChannel = p2,
				messageId = v.messageId,
				prefixText = v.prefixText
			})
		end
	end
	return list
end

return function(p3)
	-- upvalues: useInExperienceLocalization (ref), reactModule (ref), useEventConnection (ref), guiService (ref), chatLineReportRoot (ref), mapMessagesForReport (ref), iconName (ref), constants (ref), menu (ref), inputSize (ref), popoverSide (ref), popoverAlign (ref), view (ref), icon (ref), iconSize (ref)
	local var1 = useInExperienceLocalization()
	local var2, var3 = reactModule.useState(false)
	useEventConnection(guiService:GetPropertyChangedSignal("MenuIsOpen"), function()
		-- upvalues: guiService (copy), var3 (ref)
		if guiService.MenuIsOpen then
			var3(false)
		end
	end)
	local var4 = var1("Feature.ReportAbuse.Action.EnterChatLineReporting")
	local var5 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), chatLineReportRoot (copy), mapMessagesForReport (copy), var3 (ref)
		chatLineReportRoot.initialize(mapMessagesForReport(if p3.messagesSignal then p3.messagesSignal(false) else {}, p3.targetChannel))
		var3(false)
	end, { p3.messagesSignal, p3.targetChannel })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constants.TopBannerSize),
		ZIndex = p3.ZIndex
	}, {
		Menu = reactModule.createElement(menu, {
			isOpen = var2,
			items = reactModule.useMemo(function()
				-- upvalues: iconName (copy), var4 (ref), var5 (ref)
				return {
					{
						id = "report",
						icon = iconName.SpeechBubbleExclamation,
						text = var4,
						onActivated = var5
					}
				}
			end, { var4, var5 }),
			size = inputSize.Medium,
			side = popoverSide.Right,
			align = popoverAlign.Start,
			onPressedOutside = reactModule.useCallback(function()
				-- upvalues: var3 (ref)
				var3(false)
			end, {}),
			Position = UDim2.new(1, constants.IconButtonPositionXOffset, 0, 0)
		}, {
			Button = reactModule.createElement(view, {
				tag = "align-x-center align-y-center radius-medium",
				Size = UDim2.fromOffset(constants.IconButtonSize, constants.IconButtonSize),
				onActivated = reactModule.useCallback(function()
					-- upvalues: var3 (ref), var2 (ref)
					var3(not var2)
				end, { var2 })
			}, {
				icon = reactModule.createElement(icon, {
					name = iconName.ThreeDotsHorizontal,
					size = iconSize.Large
				})
			})
		})
	})
end