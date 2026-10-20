local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local ChatLineReportInfoModule = require(ChatLineReporting.Components.ChatLineReportInfo)
local ChatLineReportModalWindowModule = require(ChatLineReporting.Components.ChatLineReportModalWindow)
local ChatLineReportSelectableLineModule = require(ChatLineReporting.Components.ChatLineReportSelectableLine)
local IsSystemMessageModule = require(ChatLineReporting.Common.isSystemMessage)
local FFlagChatLineSelectionModalCleanupSizeListenersModule = require(ChatLineReporting.Flags.FFlagChatLineSelectionModalCleanupSizeListeners)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FoundationModule = require(Parent.Foundation)
local Empty = FoundationModule.Empty
local RadioGroup = FoundationModule.RadioGroup
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility

local function createChildren(Messages, _, LocalizedText, ScrollViewSizeX)
	-- upvalues: IsSystemMessageModule (copy), ReactModule (copy), RadioGroup (copy), ChatLineReportSelectableLineModule (copy)
	local Elements = {}
	local t = {}
	local Count = -1
	
	for Value, message in pairs(Messages) do
		if not IsSystemMessageModule(message) then
			Count += 1
			t[Value] = Count
			table.insert(Elements, ReactModule.createElement(RadioGroup.Item, {
				value = Value,
				label = ReactModule.createElement(ChatLineReportSelectableLineModule, {
					message = message,
					localizedText = LocalizedText,
					scrollViewSizeX = ScrollViewSizeX
				})
			}))
		end
	end
	return Elements, t
end

local function useAbsoluteSizeListener(Current, UseRefResult)
	-- upvalues: ReactModule (copy)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(Current)
	UseRefResult2.current = Current
	
	return ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		if UseRefResult then
			UseRefResult.current = Current
		end
		if UseRefResult1.current then
			UseRefResult1.current:Disconnect()
			UseRefResult1.current = nil
		end
		if Current then
			UseRefResult1.current = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseRefResult2 (upval), Current (copy)
				UseRefResult2.current(Current)
			end)
		end
	end, {})
end

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), createChildren (copy), CryoModule (copy), UseLayerCollectorFunction (copy), FFlagChatLineSelectionModalCleanupSizeListenersModule (copy), useAbsoluteSizeListener (copy), ChatLineReportModalWindowModule (copy), ButtonType (copy), ChatLineReportInfoModule (copy), Empty (copy), ScrollView (copy), ScrollBarVisibility (copy), RadioGroup (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.ChatLineLocalizationKeys)
	local Children, Children2 = createChildren(p1.messages, p1.setSelectedMessage, UseLocalizationResult, UseStateResult3)
	local IsEmpty = CryoModule.isEmpty(Children)
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local AbsoluteSize = UseLayerCollectorResult.absoluteSize
	local v1 = nil
	local v2 = nil
	
	if FFlagChatLineSelectionModalCleanupSizeListenersModule then
		v1 = useAbsoluteSizeListener(function(Frame)
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(Frame.AbsoluteSize.Y)
		end)
		v2 = useAbsoluteSizeListener(function(Frame)
			-- upvalues: UseStateResult2_2 (copy)
			UseStateResult2_2(Frame.AbsoluteSize.X)
		end, UseRefResult1)
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagChatLineSelectionModalCleanupSizeListenersModule (upval), UseRefResult (copy), UseStateResult2_1 (copy)
		if FFlagChatLineSelectionModalCleanupSizeListenersModule then return end
		if UseRefResult.current then
			UseRefResult.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseStateResult2_1 (upval), UseRefResult (upval)
				UseStateResult2_1(UseRefResult.current.AbsoluteSize.Y)
			end)
		end
	end, { UseRefResult.current, AbsoluteSize })
	ReactModule.useEffect(function()
		-- upvalues: FFlagChatLineSelectionModalCleanupSizeListenersModule (upval), UseRefResult1 (copy), UseStateResult2_2 (copy)
		if FFlagChatLineSelectionModalCleanupSizeListenersModule then return end
		if UseRefResult1.current then
			UseRefResult1.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseStateResult2_2 (upval), UseRefResult1 (upval)
				UseStateResult2_2(UseRefResult1.current.AbsoluteSize.X)
			end)
		end
	end, { UseRefResult1.current, AbsoluteSize })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), ConstantsModule (upval)
		if UseRefResult1.current then
			local ScrollingFrame = UseRefResult1.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if ScrollingFrame then
				UseRefResult2.current = ScrollingFrame
				UseRefResult2.current.CanvasPosition = Vector2.new(0, ConstantsModule.SelectionModalCanvasPositionTopPadding)
				UseRefResult2.current.Selectable = false
			end
		end
	end, { UseRefResult1.current })
	
	return ReactModule.createElement(ChatLineReportModalWindowModule, {
		screenSize = Vector2.new(AbsoluteSize.X, AbsoluteSize.Y - UseLayerCollectorResult.insets.top),
		position = UDim2.new(0.5, 0, 0, UseLayerCollectorResult.insets.top + ConstantsModule.SelectionModalPositionOffset),
		anchorPoint = Vector2.new(0.5, 0),
		title = UseLocalizationResult.ChatSelectionModalTitle,
		onCloseClicked = p1.onBack,
		onInfoClicked = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
			UseStateResult2(not UseStateResult)
		end, { UseStateResult, UseStateResult2 }),
		buttonStackProps = {
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
		}
	}, {
		infoView = ReactModule.createElement(ChatLineReportInfoModule, { visible = UseStateResult }),
		messageView = if IsEmpty then ReactModule.createElement(Empty, {}) else ReactModule.createElement(ScrollView, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, (math.min(AbsoluteSize.Y - UseLayerCollectorResult.insets.top - ConstantsModule.SelectionModalScreenSizeOffset, UseStateResult1 + ConstantsModule.SelectionModalRadioGroupOffset, if p1.maxContentHeight then p1.maxContentHeight else 1e999))),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				scrollBarVisibility = ScrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			ref = if FFlagChatLineSelectionModalCleanupSizeListenersModule then v2 else UseRefResult1
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12)
			}),
			RadioGroup = ReactModule.createElement(RadioGroup.Root, {
				onValueChanged = function(p2)
					-- upvalues: p1 (copy), ConstantsModule (upval), Children2 (copy)
					p1.setSelectedMessage(p1.messages[p2])
					p1.analyticsDispatch({
						type = ConstantsModule.AnalyticsActions.SetChatLineSelected,
						selected_chat_line_index = Children2[p2]
					})
				end,
				ref = if FFlagChatLineSelectionModalCleanupSizeListenersModule then v1 else UseRefResult
			}, Children)
		})
	})
end