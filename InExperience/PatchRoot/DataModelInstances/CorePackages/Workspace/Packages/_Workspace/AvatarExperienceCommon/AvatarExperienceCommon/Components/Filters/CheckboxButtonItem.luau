local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local Checkbox = FoundationModule.Checkbox
local Text = FoundationModule.Text
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Focusable = require(Parent.RoactGamepad).Focusable
local ExpandingFrameModule = require(script.Parent.ExpandingFrame)
local FFlagAXCatalogSpecialFeaturesFilter = require(Parent.AvatarExperienceFlags).FFlagAXCatalogSpecialFeaturesFilter

local function CheckboxButtonItem(Gui)
	-- upvalues: UseTokensFunction (copy), UseStyleFunction (copy), ReactModule (copy), FFlagAXCatalogSpecialFeaturesFilter (copy), View (copy), StyledTextLabel (copy), Text (copy), Focusable (copy), Checkbox (copy), InputSize (copy), ExpandingFrameModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Gui (copy)
		if Gui.onActivated then
			Gui.onActivated(Gui.id)
		end
	end, { Gui.onActivated, Gui.id })
	local ItemHeight = Gui.itemHeight or UseTokensResult.Size.Size_900
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ItemHeight)
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: ItemHeight (copy), Gui (copy), FFlagAXCatalogSpecialFeaturesFilter (upval), UseTokensResult (copy), UseBindingResult2 (copy)
		local NewY = ItemHeight
		
		if Frame then
			NewY += Frame.AbsoluteSize.Y
		end
		if not Gui.hideDivider then
			NewY += if FFlagAXCatalogSpecialFeaturesFilter then 1 else UseTokensResult.Size.Size_50
		end
		UseBindingResult2(NewY)
		
		if Gui.onHeightChanged then
			Gui.onHeightChanged(NewY)
		end
	end, {
		ItemHeight,
		Gui.hideDivider,
		UseBindingResult2,
		Gui.onHeightChanged
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy), UseRefResult (copy)
		UseResult1(UseRefResult.current)
	end, {})
	local IsIsSelected: boolean = Gui.expandedView and Gui.isSelected == true
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UseBindingResult:map(function(YOffset): UDim2
			return UDim2.new(1, 0, 0, YOffset)
		end),
		LayoutOrder = Gui.layoutOrder,
		ref = Gui.frameRef,
		NextSelectionLeft = Gui.NextSelectionLeft,
		NextSelectionRight = Gui.NextSelectionRight,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		}),
		Contents = ReactModule.createElement(View, {
			LayoutOrder = 1,
			Size = if FFlagAXCatalogSpecialFeaturesFilter then UDim2.new(1, 0, 0, ItemHeight) else nil,
			tag = if FFlagAXCatalogSpecialFeaturesFilter then "row items-center" else "size-full row items-center padding-left-large padding-y-medium padding-right-none",
			padding = if FFlagAXCatalogSpecialFeaturesFilter then {
				left = UDim.new(0, 24),
				top = UDim.new(0, 12),
				bottom = UDim.new(0, 12),
				right = UDim.new(0, 12)
			} else nil,
			ref = Gui.defaultChildRef,
			NextSelectionDown = if IsIsSelected then UseRefResult else nil,
			SelectionImageObject = Gui.SelectionImageObject
		}, {
			ClickableTextArea = ReactModule.createElement("TextButton", {
				Size = if FFlagAXCatalogSpecialFeaturesFilter then UDim2.new(1, -24, 1, 0) else UDim2.new(1, -UseTokensResult.Size.Size_400 - UseTokensResult.Size.Size_400, 1, 0),
				BackgroundTransparency = 1,
				Text = "",
				Active = not Gui.isDisabled,
				[ReactModule.Event.Activated] = if Gui.isDisabled then nil else UseResult,
				LayoutOrder = 1
			}, {
				CustomViewFrame = Gui.customView and ReactModule.createElement(View, {
					tag = "gui-object-defaults",
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 1, 0)
				}, { CustomView = Gui.customView }),
				TitleText = Gui.text and (not Gui.customView and (if FFlagAXCatalogSpecialFeaturesFilter then ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 1,
					size = UDim2.new(1, 0, 1, 0),
					colorStyle = if Gui.isSelected then UseStyleResult.Theme.TextEmphasis else UseStyleResult.Theme.TextDefault,
					fontStyle = UseStyleResult.Font.Header2,
					text = Gui.text,
					textXAlignment = Enum.TextXAlignment.Left
				}) else ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "text-title-medium content-default text-align-x-left auto-y",
					Size = UDim2.new(1, 0, 1, 0),
					Text = Gui.text
				})))
			}),
			RightContent = if FFlagAXCatalogSpecialFeaturesFilter then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_600, UseTokensResult.Size.Size_600)
			}, {
				UIScale = ReactModule.createElement("UIScale", { Scale = 24 / UseTokensResult.Size.Size_600 }),
				Checkbox = ReactModule.createElement(Focusable[Checkbox], {
					label = "",
					isChecked = Gui.isSelected,
					isDisabled = Gui.isDisabled,
					onActivated = UseResult,
					size = InputSize.Medium
				})
			}) else ReactModule.createElement(Focusable[Checkbox], {
				label = "",
				LayoutOrder = 3,
				isChecked = Gui.isSelected,
				isDisabled = Gui.isDisabled,
				onActivated = UseResult,
				size = InputSize.Medium
			})
		}),
		ExpandingFrame = Gui.expandedView and ReactModule.createElement(Focusable[ExpandingFrameModule], {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, Gui.expandedViewHeight or 0),
			isExpanded = Gui.isSelected == true,
			onAbsoluteSizeChanged = UseResult1,
			ref = UseRefResult,
			NextSelectionUp = Gui.defaultChildRef
		}, { ExpandedView = Gui.expandedView }),
		Divider = if FFlagAXCatalogSpecialFeaturesFilter and not Gui.hideDivider then ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1)
		}, {
			Line = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -12, 0, 0),
				Size = UDim2.new(1, -24, 1, 0),
				BackgroundColor3 = UseTokensResult.Color.Stroke.Emphasis.Color3,
				BackgroundTransparency = UseTokensResult.Color.Stroke.Emphasis.Transparency
			})
		}) else nil
	})
end

return ReactModule.forwardRef(function(p1, FrameRef)
	-- upvalues: ReactModule (copy), CheckboxButtonItem (copy), CryoModule (copy)
	return ReactModule.createElement(CheckboxButtonItem, CryoModule.Dictionary.join(p1, { frameRef = FrameRef }))
end)