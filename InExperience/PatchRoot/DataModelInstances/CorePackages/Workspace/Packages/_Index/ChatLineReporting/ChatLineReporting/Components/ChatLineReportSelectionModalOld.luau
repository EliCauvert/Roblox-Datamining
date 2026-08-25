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
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local foundationModule = require(parent.Foundation)
local empty = foundationModule.Empty
local radioGroup = foundationModule.RadioGroup
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility

local function createChildren(p0, _, p1, p2)
	-- upvalues: isSystemMessageModule (ref), reactModule (ref), radioGroup (ref), chatLineReportSelectableLineModule (ref)
	local t = {}
	local t_1 = {}
	local var13 = -1
	
	for i, v in pairs(p0) do
		if not isSystemMessageModule(v) then
			var13 += 1
			t_1[i] = var13
			table.insert(t, reactModule.createElement(radioGroup.Item, {
				value = i,
				label = reactModule.createElement(chatLineReportSelectableLineModule, { message = v, localizedText = p1, scrollViewSizeX = p2 })
			}))
		end
	end
	return t, t_1
end

return function(p3)
	-- upvalues: reactModule (ref), useLocalization (ref), constantsModule (ref), createChildren (ref), cryoModule (ref), useLayerCollector (ref), fFlagChatLineReportingFocusFixesEnabled (ref), chatLineReportModalWindowModule (ref), buttonType (ref), chatLineReportInfoModule (ref), empty (ref), scrollView (ref), scrollBarVisibility (ref), radioGroup (ref)
	local var14, var15 = reactModule.useState(false)
	local var16 = reactModule.useRef(nil)
	local var17, var18 = reactModule.useState(0)
	local var19 = reactModule.useRef(nil)
	local var20, var21 = reactModule.useState(0)
	local var22 = reactModule.useRef(nil)
	local var23 = useLocalization(constantsModule.ChatLineLocalizationKeys)
	local var24, var25 = createChildren(p3.messages, p3.setSelectedMessage, var23, var20)
	local var26 = cryoModule.isEmpty(var24)
	local var27 = useLayerCollector()
	local absoluteSize = var27.absoluteSize
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var18 (ref)
		if var16.current then
			var16.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var18 (copy), var16 (copy)
				var18(var16.current.AbsoluteSize.Y)
			end)
		end
	end, { var16.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var21 (ref)
		if var19.current then
			var19.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var21 (copy), var19 (copy)
				var21(var19.current.AbsoluteSize.X)
			end)
		end
	end, { var19.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var22 (ref), constantsModule (copy), fFlagChatLineReportingFocusFixesEnabled (copy)
		if var19.current then
			local scrollingFrame = var19.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if scrollingFrame then
				var22.current = scrollingFrame
				var22.current.CanvasPosition = Vector2.new(0, constantsModule.SelectionModalCanvasPositionTopPadding)
				
				if fFlagChatLineReportingFocusFixesEnabled then
					var22.current.Selectable = false
				end
			end
		end
	end, { var19.current })
	
	return reactModule.createElement(chatLineReportModalWindowModule, {
		screenSize = Vector2.new(absoluteSize.X, absoluteSize.Y - var27.insets.top),
		position = UDim2.new(0.5, 0, 0, var27.insets.top + constantsModule.SelectionModalPositionOffset),
		anchorPoint = Vector2.new(0.5, 0),
		title = var23.ChatSelectionModalTitle,
		onCloseClicked = p3.onBack,
		onInfoClicked = reactModule.useCallback(function()
			-- upvalues: var15 (ref), var14 (ref)
			var15(not var14)
		end, { var14, var15 }),
		buttonStackProps = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p3.onContinue,
						text = var23.ChatSelectionModalButton,
						isDisabled = var26 or p3.selectedMessage == nil
					}
				}
			}
		}
	}, {
		infoView = reactModule.createElement(chatLineReportInfoModule, { visible = var14 }),
		messageView = if var26 then reactModule.createElement(empty, {}) else reactModule.createElement(scrollView, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, math.min(absoluteSize.Y - var27.insets.top - constantsModule.SelectionModalScreenSizeOffset, var17 + constantsModule.SelectionModalRadioGroupOffset, if p3.maxContentHeight then p3.maxContentHeight else 1e999)),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			ref = var19
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12)
			}),
			RadioGroup = reactModule.createElement(radioGroup.Root, {
				onValueChanged = function(p4)
					-- upvalues: p3 (ref), constantsModule (copy), var25 (ref)
					p3.setSelectedMessage(p3.messages[p4])
					p3.analyticsDispatch({
						type = constantsModule.AnalyticsActions.SetChatLineSelected,
						selected_chat_line_index = var25[p4]
					})
				end,
				ref = var16
			}, var24)
		})
	})
end