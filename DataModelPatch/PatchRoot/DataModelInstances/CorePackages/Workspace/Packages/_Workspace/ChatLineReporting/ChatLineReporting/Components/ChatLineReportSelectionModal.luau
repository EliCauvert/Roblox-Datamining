local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagChatLineReportingFocusFixesEnabled = require(Parent.SharedFlags).FFlagChatLineReportingFocusFixesEnabled
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local ChatLineReportInfoModule = require(ChatLineReporting.Components.ChatLineReportInfo)
local ChatLineReportModalWindowModule = require(ChatLineReporting.Components.ChatLineReportModalWindow)
local ChatLineReportSelectableLineModule = require(ChatLineReporting.Components.ChatLineReportSelectableLine)
local IsSystemMessageModule = require(ChatLineReporting.Common.isSystemMessage)
local ChatLineSelectionModeModule = require(ChatLineReporting.Enums.ChatLineSelectionMode)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FoundationModule = require(Parent.Foundation)
local Empty = FoundationModule.Empty
local RadioGroup = FoundationModule.RadioGroup
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local View = FoundationModule.View

return ReactModule.memo(function(p1)
	-- upvalues: ChatLineSelectionModeModule (copy), ReactModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), CryoModule (copy), IsSystemMessageModule (copy), UseLayerCollectorFunction (copy), FFlagChatLineReportingFocusFixesEnabled (copy), ChatLineReportModalWindowModule (copy), ButtonType (copy), ChatLineReportInfoModule (copy), View (copy), Empty (copy), ScrollView (copy), ScrollBarVisibility (copy), RadioGroup (copy), ChatLineReportSelectableLineModule (copy)
	local Mode = p1.mode or ChatLineSelectionModeModule.Radio
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.ChatLineLocalizationKeys)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), IsSystemMessageModule (upval)
		return CryoModule.List.filter(p1.messages, function(p2): boolean
			-- upvalues: IsSystemMessageModule (upval)
			return not IsSystemMessageModule(p2)
		end)
	end, { p1.messages })
	local IsEmpty = CryoModule.isEmpty(UseMemoResult)
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local AbsoluteSize = UseLayerCollectorResult.absoluteSize
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		if UseRefResult.current then
			UseRefResult.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseStateResult2_1 (upval), UseRefResult (upval)
				UseStateResult2_1(UseRefResult.current.AbsoluteSize.Y)
			end)
		end
	end, { UseRefResult.current, AbsoluteSize })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), ConstantsModule (upval), FFlagChatLineReportingFocusFixesEnabled (upval)
		if UseRefResult1.current then
			local ScrollingFrame = UseRefResult1.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if ScrollingFrame then
				ScrollingFrame.CanvasPosition = Vector2.new(0, ConstantsModule.SelectionModalCanvasPositionTopPadding)
				
				if FFlagChatLineReportingFocusFixesEnabled then
					ScrollingFrame.Selectable = false
				end
			end
		end
	end, { UseRefResult1.current })
	local UseResult = ReactModule.useCallback(function(Selected_chat_line_index)
		-- upvalues: p1 (copy), UseMemoResult (copy), ConstantsModule (upval)
		if p1.setSelectedMessage then
			p1.setSelectedMessage(UseMemoResult[Selected_chat_line_index])
		end
		p1.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.SetChatLineSelected,
			selected_chat_line_index = Selected_chat_line_index
		})
	end, { p1.setSelectedMessage, p1.analyticsDispatch })
	
	return ReactModule.createElement(ChatLineReportModalWindowModule, {
		screenSize = Vector2.new(AbsoluteSize.X, AbsoluteSize.Y - UseLayerCollectorResult.insets.top),
		position = if p1.isCentered then UDim2.fromScale(0.5, 0.5) else UDim2.new(0.5, 0, 0, UseLayerCollectorResult.insets.top + ConstantsModule.SelectionModalPositionOffset),
		anchorPoint = if p1.isCentered then Vector2.new(0.5, 0.5) else Vector2.new(0.5, 0),
		title = UseLocalizationResult.ChatSelectionModalTitle,
		onCloseClicked = p1.onBack,
		onInfoClicked = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p2): boolean
				return not p2
			end)
		end, {}),
		buttonStackProps = if Mode == ChatLineSelectionModeModule.Radio then {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = p1.onContinue,
						text = UseLocalizationResult.ChatSelectionModalButton,
						isDisabled = IsEmpty or p1.selectedMessage == nil
					}
				}
			}
		} else nil
	}, {
		infoView = ReactModule.createElement(ChatLineReportInfoModule, { visible = UseStateResult }),
		messageView = if IsEmpty then ReactModule.createElement(View, { tag = "margin-medium auto-xy" }, ReactModule.createElement(Empty, {
			text = UseLocalizationResult.ChatSelectionModalNoMessages
		})) else ReactModule.createElement(ScrollView, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, (math.min(AbsoluteSize.Y - UseLayerCollectorResult.insets.top - ConstantsModule.SelectionModalScreenSizeOffset, UseStateResult1, if p1.maxContentHeight then p1.maxContentHeight else 1e999))),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				scrollBarVisibility = ScrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			},
			ref = UseRefResult1
		}, ReactModule.createElement(View, {
			tag = "col auto-y padding-y-medium",
			Size = UDim2.new(1, 0, 0, 0),
			ref = UseRefResult
		}, {
			RadioList = Mode == ChatLineSelectionModeModule.Radio and ReactModule.createElement(RadioGroup.Root, { onValueChanged = UseResult }, CryoModule.List.map(UseMemoResult, function(Message, Value)
				-- upvalues: ReactModule (upval), RadioGroup (upval), ChatLineReportSelectableLineModule (upval), UseLocalizationResult (copy)
				return ReactModule.createElement(RadioGroup.Item, {
					key = Message.messageId,
					value = Value,
					label = ReactModule.createElement(ChatLineReportSelectableLineModule, {
						tag = "shrink",
						adjustForRadioGroup = true,
						scrollViewSizeX = 0,
						chatLineReportingReworkEnabled = true,
						message = Message,
						localizedText = UseLocalizationResult
					})
				})
			end)),
			DirectList = Mode == ChatLineSelectionModeModule.Direct and ReactModule.createElement(View, { tag = "col size-full-0 auto-y padding-right-medium" }, CryoModule.List.map(UseMemoResult, function(Message, Selected_chat_line_index)
				-- upvalues: ReactModule (upval), View (upval), p1 (copy), ConstantsModule (upval), ChatLineReportSelectableLineModule (upval), UseLocalizationResult (copy)
				return ReactModule.createElement(View, {
					tag = "size-full-0 auto-y padding-small radius-medium",
					key = Message.messageId,
					onActivated = function()
						-- upvalues: p1 (upval), Message (copy), ConstantsModule (upval), Selected_chat_line_index (copy)
						if p1.setSelectedMessage then
							p1.setSelectedMessage(Message)
						end
						p1.analyticsDispatch({
							type = ConstantsModule.AnalyticsActions.SetChatLineSelected,
							selected_chat_line_index = Selected_chat_line_index
						})
						p1.onContinue(Message)
					end
				}, ReactModule.createElement(ChatLineReportSelectableLineModule, {
					scrollViewSizeX = 0,
					chatLineReportingReworkEnabled = true,
					message = Message,
					localizedText = UseLocalizationResult
				}))
			end))
		}))
	})
end)