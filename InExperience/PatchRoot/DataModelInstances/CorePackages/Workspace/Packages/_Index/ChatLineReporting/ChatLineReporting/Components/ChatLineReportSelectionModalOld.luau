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

local function createChildren(p1, _, p2, p3)
	-- upvalues: isSystemMessageModule (ref), reactModule (ref), radioGroup (ref), chatLineReportSelectableLineModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = -1
	
	for i, v in pairs(p1) do
		if not isSystemMessageModule(v) then
			var1 += 1
			t_1[i] = var1
			table.insert(t, reactModule.createElement(radioGroup.Item, {
				value = i,
				label = reactModule.createElement(chatLineReportSelectableLineModule, { message = v, localizedText = p2, scrollViewSizeX = p3 })
			}))
		end
	end
	return t, t_1
end

return function(p4)
	-- upvalues: reactModule (ref), useLocalization (ref), constantsModule (ref), createChildren (ref), cryoModule (ref), useLayerCollector (ref), fFlagChatLineReportingFocusFixesEnabled (ref), chatLineReportModalWindowModule (ref), buttonType (ref), chatLineReportInfoModule (ref), empty (ref), scrollView (ref), scrollBarVisibility (ref), radioGroup (ref)
	local var2, var3 = reactModule.useState(false)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(0)
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactModule.useState(0)
	local var10 = reactModule.useRef(nil)
	local var11 = useLocalization(constantsModule.ChatLineLocalizationKeys)
	local var12, var13 = createChildren(p4.messages, p4.setSelectedMessage, var11, var8)
	local var14 = cryoModule.isEmpty(var12)
	local var15 = useLayerCollector()
	local absoluteSize = var15.absoluteSize
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var6 (ref)
		if var4.current then
			var4.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var6 (copy), var4 (copy)
				var6(var4.current.AbsoluteSize.Y)
			end)
		end
	end, { var4.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var9 (ref)
		if var7.current then
			var7.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var9 (copy), var7 (copy)
				var9(var7.current.AbsoluteSize.X)
			end)
		end
	end, { var7.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var10 (ref), constantsModule (copy), fFlagChatLineReportingFocusFixesEnabled (copy)
		if var7.current then
			local scrollingFrame = var7.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if scrollingFrame then
				var10.current = scrollingFrame
				var10.current.CanvasPosition = Vector2.new(0, constantsModule.SelectionModalCanvasPositionTopPadding)
				
				if fFlagChatLineReportingFocusFixesEnabled then
					var10.current.Selectable = false
				end
			end
		end
	end, { var7.current })
	
	return reactModule.createElement(chatLineReportModalWindowModule, {
		screenSize = Vector2.new(absoluteSize.X, absoluteSize.Y - var15.insets.top),
		position = UDim2.new(0.5, 0, 0, var15.insets.top + constantsModule.SelectionModalPositionOffset),
		anchorPoint = Vector2.new(0.5, 0),
		title = var11.ChatSelectionModalTitle,
		onCloseClicked = p4.onBack,
		onInfoClicked = reactModule.useCallback(function()
			-- upvalues: var3 (ref), var2 (ref)
			var3(not var2)
		end, { var2, var3 }),
		buttonStackProps = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p4.onContinue,
						text = var11.ChatSelectionModalButton,
						isDisabled = var14 or p4.selectedMessage == nil
					}
				}
			}
		}
	}, {
		infoView = reactModule.createElement(chatLineReportInfoModule, { visible = var2 }),
		messageView = if var14 then reactModule.createElement(empty, {}) else reactModule.createElement(scrollView, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, math.min(absoluteSize.Y - var15.insets.top - constantsModule.SelectionModalScreenSizeOffset, var5 + constantsModule.SelectionModalRadioGroupOffset, if p4.maxContentHeight then p4.maxContentHeight else 1e999)),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			ref = var7
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12)
			}),
			RadioGroup = reactModule.createElement(radioGroup.Root, {
				onValueChanged = function(p5)
					-- upvalues: p4 (ref), constantsModule (copy), var13 (ref)
					p4.setSelectedMessage(p4.messages[p5])
					p4.analyticsDispatch({
						type = constantsModule.AnalyticsActions.SetChatLineSelected,
						selected_chat_line_index = var13[p5]
					})
				end,
				ref = var4
			}, var12)
		})
	})
end