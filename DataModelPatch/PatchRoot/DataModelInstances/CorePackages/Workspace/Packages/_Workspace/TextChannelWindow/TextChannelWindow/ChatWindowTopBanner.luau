local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local ChatLineReportingModule = require(Parent.ChatLineReporting)
local ChatLineReportRoot = ChatLineReportingModule.ChatLineReportRoot
local Constants = ChatLineReportingModule.Constants
local UseInExperienceLocalizationModule = require(script.Parent.useInExperienceLocalization)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Menu = FoundationModule.Menu
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign

local function mapMessagesForReport(MessagesSignalResult, TextChannel)
	local Buffer = table.create(#MessagesSignalResult)
	
	for _, value in MessagesSignalResult do
		if value.messageType == "user" then
			table.insert(Buffer, {
				userId = value.senderUserId,
				text = value.content,
				textChannel = TextChannel,
				messageId = value.messageId,
				prefixText = value.prefixText
			})
		end
	end
	return Buffer
end

return function(p1)
	-- upvalues: UseInExperienceLocalizationModule (copy), ReactModule (copy), UseEventConnectionFunction (copy), GuiService (copy), ChatLineReportRoot (copy), mapMessagesForReport (copy), IconName (copy), Constants (copy), Menu (copy), InputSize (copy), PopoverSide (copy), PopoverAlign (copy), View (copy), Icon (copy), IconSize (copy)
	local UseInExperienceLocalizationModuleResult = UseInExperienceLocalizationModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	UseEventConnectionFunction(GuiService:GetPropertyChangedSignal("MenuIsOpen"), function()
		-- upvalues: GuiService (upval), UseStateResult2 (copy)
		if GuiService.MenuIsOpen then
			UseStateResult2(false)
		end
	end)
	local FeatureReportAbuseActionEnterChatLineReporting = UseInExperienceLocalizationModuleResult("Feature.ReportAbuse.Action.EnterChatLineReporting")
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ChatLineReportRoot (upval), mapMessagesForReport (upval), UseStateResult2 (copy)
		ChatLineReportRoot.initialize((mapMessagesForReport(if p1.messagesSignal then p1.messagesSignal(false) else {}, p1.targetChannel)))
		UseStateResult2(false)
	end, { p1.messagesSignal, p1.targetChannel })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, Constants.TopBannerSize),
		ZIndex = p1.ZIndex
	}, {
		Menu = ReactModule.createElement(Menu, {
			isOpen = UseStateResult,
			items = ReactModule.useMemo(function()
				-- upvalues: IconName (upval), FeatureReportAbuseActionEnterChatLineReporting (copy), UseResult (copy)
				return {
					{
						id = "report",
						icon = IconName.SpeechBubbleExclamation,
						text = FeatureReportAbuseActionEnterChatLineReporting,
						onActivated = UseResult
					}
				}
			end, {
				FeatureReportAbuseActionEnterChatLineReporting,
				UseResult
			}),
			size = InputSize.Medium,
			side = PopoverSide.Right,
			align = PopoverAlign.Start,
			onPressedOutside = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end, {}),
			Position = UDim2.new(1, Constants.IconButtonPositionXOffset, 0, 0)
		}, {
			Button = ReactModule.createElement(View, {
				tag = "align-x-center align-y-center radius-medium",
				Size = UDim2.fromOffset(Constants.IconButtonSize, Constants.IconButtonSize),
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
					UseStateResult2(not UseStateResult)
				end, { UseStateResult })
			}, {
				icon = ReactModule.createElement(Icon, {
					name = IconName.ThreeDotsHorizontal,
					size = IconSize.Large
				})
			})
		})
	})
end