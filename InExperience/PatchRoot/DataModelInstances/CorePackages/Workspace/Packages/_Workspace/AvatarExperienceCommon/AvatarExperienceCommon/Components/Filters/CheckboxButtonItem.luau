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

local function CheckboxButtonItem(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), focusable (ref), checkbox (ref), inputSize (ref), expandingFrameModule (ref)
	local var1 = useTokens()
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onActivated then
			p1.onActivated(p1.id)
		end
	end, { p1.onActivated, p1.id })
	local itemHeight = p1.itemHeight or var1.Size.Size_900
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useBinding(itemHeight)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: itemHeight (ref), p1 (ref), var1 (ref), var5 (ref)
		local var7 = itemHeight
		
		if p2 then
			var7 += p2.AbsoluteSize.Y
		end
		if not p1.hideDivider then
			var7 += var1.Size.Size_50
		end
		var5(var7)
		
		if p1.onHeightChanged then
			p1.onHeightChanged(var7)
		end
	end, { itemHeight, p1.hideDivider, var5, p1.onHeightChanged })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var3 (ref)
		var6(var3.current)
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = var4:map(function(p2)
			return UDim2.new(1, 0, 0, p2)
		end),
		LayoutOrder = p1.layoutOrder,
		ref = p1.frameRef,
		NextSelectionLeft = p1.NextSelectionLeft,
		NextSelectionRight = p1.NextSelectionRight,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		}),
		Contents = reactModule.createElement(view, {
			tag = "size-full row items-center padding-left-large padding-y-medium padding-right-none",
			LayoutOrder = 1,
			ref = p1.defaultChildRef,
			NextSelectionDown = if p1.expandedView and p1.isSelected == true then var3 else nil,
			SelectionImageObject = p1.SelectionImageObject
		}, {
			ClickableTextArea = reactModule.createElement("TextButton", {
				Size = UDim2.new(1, (-var1.Size.Size_400) - var1.Size.Size_400, 1, 0),
				BackgroundTransparency = 1,
				Text = "",
				Active = not p1.isDisabled,
				[reactModule.Event.Activated] = if not p1.isDisabled then var2 else nil,
				LayoutOrder = 1
			}, {
				CustomViewFrame = p1.customView and reactModule.createElement(view, {
					tag = "gui-object-defaults",
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 1, 0)
				}, { CustomView = p1.customView }),
				TitleText = p1.text and (not p1.customView and reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "text-title-medium content-default text-align-x-left auto-y",
					Size = UDim2.new(1, 0, 1, 0),
					Text = p1.text
				}))
			}),
			RightContent = reactModule.createElement(focusable[checkbox], {
				label = "",
				LayoutOrder = 3,
				isChecked = p1.isSelected,
				isDisabled = p1.isDisabled,
				onActivated = var2,
				size = inputSize.Medium
			})
		}),
		ExpandingFrame = p1.expandedView and reactModule.createElement(focusable[expandingFrameModule], {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, p1.expandedViewHeight or 0),
			isExpanded = p1.isSelected == true,
			onAbsoluteSizeChanged = var6,
			ref = var3,
			NextSelectionUp = p1.defaultChildRef
		}, { ExpandedView = p1.expandedView })
	})
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), CheckboxButtonItem (ref), cryoModule (ref)
	return reactModule.createElement(CheckboxButtonItem, cryoModule.Dictionary.join(p1, { frameRef = p2 }))
end)