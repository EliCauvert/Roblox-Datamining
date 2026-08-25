local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local checkbox = foundationModule.Checkbox
local text = foundationModule.Text
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens
local focusable = require(parent.RoactGamepad).Focusable
local expandingFrameModule = require(script.Parent.ExpandingFrame)

local function CheckboxButtonItem(p0)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), focusable (ref), checkbox (ref), inputSize (ref), expandingFrameModule (ref)
	local var5 = useTokens()
	local var6 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		if p0.onActivated then
			p0.onActivated(p0.id)
		end
	end, { p0.onActivated, p0.id })
	local itemHeight = p0.itemHeight or var5.Size.Size_900
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useBinding(itemHeight)
	local var11 = reactModule.useCallback(function(p1)
		-- upvalues: itemHeight (ref), p0 (ref), var5 (ref), var10 (ref)
		local var12 = itemHeight
		
		if p1 then
			var12 += p1.AbsoluteSize.Y
		end
		if not p0.hideDivider then
			var12 += var5.Size.Size_50
		end
		var10(var12)
		
		if p0.onHeightChanged then
			p0.onHeightChanged(var12)
		end
	end, { itemHeight, p0.hideDivider, var10, p0.onHeightChanged })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var8 (ref)
		var11(var8.current)
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = var9:map(function(p2)
			return UDim2.new(1, 0, 0, p2)
		end),
		LayoutOrder = p0.layoutOrder,
		ref = p0.frameRef,
		NextSelectionLeft = p0.NextSelectionLeft,
		NextSelectionRight = p0.NextSelectionRight,
		NextSelectionUp = p0.NextSelectionUp,
		NextSelectionDown = p0.NextSelectionDown
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		}),
		Contents = reactModule.createElement(view, {
			tag = "size-full row items-center padding-left-large padding-y-medium padding-right-none",
			LayoutOrder = 1,
			ref = p0.defaultChildRef,
			NextSelectionDown = if p0.expandedView and p0.isSelected == true then var8 else nil,
			SelectionImageObject = p0.SelectionImageObject
		}, {
			ClickableTextArea = reactModule.createElement("TextButton", {
				Size = UDim2.new(1, (-var5.Size.Size_400) - var5.Size.Size_400, 1, 0),
				BackgroundTransparency = 1,
				Text = "",
				Active = not p0.isDisabled,
				[reactModule.Event.Activated] = if not p0.isDisabled then var6 else nil,
				LayoutOrder = 1
			}, {
				CustomViewFrame = p0.customView and reactModule.createElement(view, {
					tag = "gui-object-defaults",
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 1, 0)
				}, { CustomView = p0.customView }),
				TitleText = p0.text and (not p0.customView and reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "text-title-medium content-default text-align-x-left auto-y",
					Size = UDim2.new(1, 0, 1, 0),
					Text = p0.text
				}))
			}),
			RightContent = reactModule.createElement(focusable[checkbox], {
				label = "",
				LayoutOrder = 3,
				isChecked = p0.isSelected,
				isDisabled = p0.isDisabled,
				onActivated = var6,
				size = inputSize.Medium
			})
		}),
		ExpandingFrame = p0.expandedView and reactModule.createElement(focusable[expandingFrameModule], {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, p0.expandedViewHeight or 0),
			isExpanded = p0.isSelected == true,
			onAbsoluteSizeChanged = var11,
			ref = var8,
			NextSelectionUp = p0.defaultChildRef
		}, { ExpandedView = p0.expandedView })
	})
end

return reactModule.forwardRef(function(p3, p4)
	-- upvalues: reactModule (ref), CheckboxButtonItem (ref), cryoModule (ref)
	return reactModule.createElement(CheckboxButtonItem, cryoModule.Dictionary.join(p3, { frameRef = p4 }))
end)