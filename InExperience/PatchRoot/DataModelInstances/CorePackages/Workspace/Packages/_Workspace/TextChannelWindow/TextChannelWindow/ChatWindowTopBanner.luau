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

local function mapMessagesForReport(p0, p1) --[[ line: 35 ]]
	local list = table.create(#p0)
	
	for i, v in p0 do
		if v.messageType == "user" then
			table.insert(list, {
				userId = v.senderUserId,
				text = v.content,
				textChannel = p1,
				messageId = v.messageId,
				prefixText = v.prefixText
			})
		end
	end
	return list
end

return function(p2) --[[ line: 51 | named "ChatWindowTopBanner" ]]
	-- upvalues: useInExperienceLocalization (ref), reactModule (ref), useEventConnection (ref), guiService (ref), chatLineReportRoot (ref), mapMessagesForReport (ref), iconName (ref), constants (ref), menu (ref), inputSize (ref), popoverSide (ref), popoverAlign (ref), view (ref), icon (ref), iconSize (ref)
	local var6 = useInExperienceLocalization()
	local var7, var8 = reactModule.useState(false)
	useEventConnection(guiService:GetPropertyChangedSignal("MenuIsOpen"), function() --[[ line: 55 ]]
		-- upvalues: guiService (copy), var8 (ref)
		if guiService.MenuIsOpen then
			var8(false)
		end
	end)
	local var9 = var6("Feature.ReportAbuse.Action.EnterChatLineReporting")
	local var10 = reactModule.useCallback(function() --[[ line: 71 ]]
		-- upvalues: p2 (ref), chatLineReportRoot (copy), mapMessagesForReport (copy), var8 (ref)
		chatLineReportRoot.initialize(mapMessagesForReport(if p2.messagesSignal then p2.messagesSignal(false) else {}, p2.targetChannel))
		var8(false)
	end, { p2.messagesSignal, p2.targetChannel })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constants.TopBannerSize),
		ZIndex = p2.ZIndex
	}, {
		Menu = reactModule.createElement(menu, {
			isOpen = var7,
			items = reactModule.useMemo(function() --[[ line: 77 ]]
				-- upvalues: iconName (copy), var9 (ref), var10 (ref)
				return {
					{
						id = "report",
						icon = iconName.SpeechBubbleExclamation,
						text = var9,
						onActivated = var10
					}
				}
			end, { var9, var10 }),
			size = inputSize.Medium,
			side = popoverSide.Right,
			align = popoverAlign.Start,
			onPressedOutside = reactModule.useCallback(function() --[[ line: 67 ]]
				-- upvalues: var8 (ref)
				var8(false)
			end, {}),
			Position = UDim2.new(1, constants.IconButtonPositionXOffset, 0, 0)
		}, {
			Button = reactModule.createElement(view, {
				tag = "align-x-center align-y-center radius-medium",
				Size = UDim2.fromOffset(constants.IconButtonSize, constants.IconButtonSize),
				onActivated = reactModule.useCallback(function() --[[ line: 63 ]]
					-- upvalues: var8 (ref), var7 (ref)
					var8(not var7)
				end, { var7 })
			}, {
				icon = reactModule.createElement(icon, {
					name = iconName.ThreeDotsHorizontal,
					size = iconSize.Large
				})
			})
		})
	})
end