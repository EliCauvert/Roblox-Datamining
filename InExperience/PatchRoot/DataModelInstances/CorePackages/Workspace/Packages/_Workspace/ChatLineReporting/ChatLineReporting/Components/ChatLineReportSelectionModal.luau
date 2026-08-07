local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagChatLineReportingFocusFixesEnabled = require(parent.SharedFlags).FFlagChatLineReportingFocusFixesEnabled
local constantsModule = require(chatLineReporting.Common.Constants)
local chatLineReportInfoModule = require(chatLineReporting.Components.ChatLineReportInfo)
local chatLineReportModalWindowModule = require(chatLineReporting.Components.ChatLineReportModalWindow)
local chatLineReportSelectableLineModule = require(chatLineReporting.Components.ChatLineReportSelectableLine)
local isSystemMessageModule = require(chatLineReporting.Common.isSystemMessage)
local chatLineSelectionModeModule = require(chatLineReporting.Enums.ChatLineSelectionMode)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local foundationModule = require(parent.Foundation)
local empty = foundationModule.Empty
local radioGroup = foundationModule.RadioGroup
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local view = foundationModule.View

return reactModule.memo(function(p0) --[[ line: 46 | named "ChatLineReportSelectionModal" ]]
	-- upvalues: chatLineSelectionModeModule (ref), reactModule (ref), useLocalization (ref), constantsModule (ref), cryoModule (ref), isSystemMessageModule (ref), useLayerCollector (ref), fFlagChatLineReportingFocusFixesEnabled (ref), chatLineReportModalWindowModule (ref), buttonType (ref), chatLineReportInfoModule (ref), view (ref), empty (ref), scrollView (ref), scrollBarVisibility (ref), radioGroup (ref), chatLineReportSelectableLineModule (ref)
	local mode = p0.mode or chatLineSelectionModeModule.Radio
	local var12, var13 = reactModule.useState(false)
	local var14 = reactModule.useRef(nil)
	local var15, var16 = reactModule.useState(0)
	local var17 = reactModule.useRef(nil)
	local var18 = useLocalization(constantsModule.ChatLineLocalizationKeys)
	local var19 = reactModule.useMemo(function() --[[ line: 54 ]]
		-- upvalues: cryoModule (copy), p0 (ref), isSystemMessageModule (copy)
		return cryoModule.List.filter(p0.messages, function(p1) --[[ line: 55 ]]
			-- upvalues: isSystemMessageModule (copy)
			return not isSystemMessageModule(p1)
		end)
	end, { p0.messages })
	local var20 = cryoModule.isEmpty(var19)
	local var21 = useLayerCollector()
	local absoluteSize = var21.absoluteSize
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: var14 (ref), var16 (ref)
		if var14.current then
			var14.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 66 ]]
				-- upvalues: var16 (copy), var14 (copy)
				var16(var14.current.AbsoluteSize.Y)
			end)
		end
	end, { var14.current, absoluteSize })
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: var17 (ref), constantsModule (copy), fFlagChatLineReportingFocusFixesEnabled (copy)
		if var17.current then
			local scrollingFrame = var17.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if scrollingFrame then
				scrollingFrame.CanvasPosition = Vector2.new(0, constantsModule.SelectionModalCanvasPositionTopPadding)
				
				if fFlagChatLineReportingFocusFixesEnabled then
					scrollingFrame.Selectable = false
				end
			end
		end
	end, { var17.current })
	
	return reactModule.createElement(chatLineReportModalWindowModule, {
		screenSize = Vector2.new(absoluteSize.X, absoluteSize.Y - var21.insets.top),
		position = if p0.isCentered then UDim2.fromScale(0.5, 0.5) else UDim2.new(0.5, 0, 0, var21.insets.top + constantsModule.SelectionModalPositionOffset),
		anchorPoint = if p0.isCentered then Vector2.new(0.5, 0.5) else Vector2.new(0.5, 0),
		title = var18.ChatSelectionModalTitle,
		onCloseClicked = p0.onBack,
		onInfoClicked = reactModule.useCallback(function() --[[ line: 85 ]]
			-- upvalues: var13 (ref)
			var13(function(p2) --[[ line: 86 ]]
				return not p2
			end)
		end, {}),
		buttonStackProps = if mode == chatLineSelectionModeModule.Radio then {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p0.onContinue,
						text = var18.ChatSelectionModalButton,
						isDisabled = var20 or p0.selectedMessage == nil
					}
				}
			}
		} else nil
	}, {
		infoView = reactModule.createElement(chatLineReportInfoModule, { visible = var12 }),
		messageView = if var20 then reactModule.createElement(view, { tag = "margin-medium auto-xy" }, reactModule.createElement(empty, { text = var18.ChatSelectionModalNoMessages })) else reactModule.createElement(scrollView, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, math.min(absoluteSize.Y - var21.insets.top - constantsModule.SelectionModalScreenSizeOffset, var15, if p0.maxContentHeight then p0.maxContentHeight else 1e999)),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
			},
			ref = var17
		}, reactModule.createElement(view, {
			tag = "col auto-y padding-y-medium",
			Size = UDim2.new(1, 0, 0, 0),
			ref = var14
		}, {
			RadioList = mode == chatLineSelectionModeModule.Radio and reactModule.createElement(radioGroup.Root, {
				onValueChanged = reactModule.useCallback(function(p3) --[[ line: 91 ]]
					-- upvalues: p0 (ref), var19 (ref), constantsModule (copy)
					if p0.setSelectedMessage then
						p0.setSelectedMessage(var19[p3])
					end
					p0.analyticsDispatch({
						type = constantsModule.AnalyticsActions.SetChatLineSelected,
						selected_chat_line_index = p3
					})
				end, { p0.setSelectedMessage, p0.analyticsDispatch })
			}, cryoModule.List.map(var19, function(p4, p5) --[[ line: 172 ]]
				-- upvalues: reactModule (copy), radioGroup (copy), chatLineReportSelectableLineModule (copy), var18 (ref)
				return reactModule.createElement(radioGroup.Item, {
					key = p4.messageId,
					value = p5,
					label = reactModule.createElement(chatLineReportSelectableLineModule, {
						tag = "shrink",
						adjustForRadioGroup = true,
						scrollViewSizeX = 0,
						chatLineReportingReworkEnabled = true,
						message = p4,
						localizedText = var18
					})
				})
			end)),
			DirectList = mode == chatLineSelectionModeModule.Direct and reactModule.createElement(view, { tag = "col size-full-0 auto-y padding-right-medium" }, cryoModule.List.map(var19, function(p6, p7) --[[ line: 192 ]]
				-- upvalues: reactModule (copy), view (copy), p0 (ref), constantsModule (copy), chatLineReportSelectableLineModule (copy), var18 (ref)
				return reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-small radius-medium",
					key = p6.messageId,
					onActivated = function() --[[ line: 198 ]]
						-- upvalues: p0 (copy), p6 (ref), constantsModule (copy), p7 (ref)
						if p0.setSelectedMessage then
							p0.setSelectedMessage(p6)
						end
						p0.analyticsDispatch({
							type = constantsModule.AnalyticsActions.SetChatLineSelected,
							selected_chat_line_index = p7
						})
						p0.onContinue(p6)
					end
				}, reactModule.createElement(chatLineReportSelectableLineModule, {
					scrollViewSizeX = 0,
					chatLineReportingReworkEnabled = true,
					message = p6,
					localizedText = var18
				}))
			end))
		}))
	})
end)