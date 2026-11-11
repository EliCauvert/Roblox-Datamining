local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Interactable = UIBloxModule.Core.Control.Interactable
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local FilterUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local ExpandingFrame = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.Filters.ExpandingFrame
local ComponentAssetsCircle24Stroke1 = Images["component_assets/circle_24_stroke_1"]
local ComponentAssetsCircle16 = Images["component_assets/circle_16"]
local config = {
	[ControlState.Default] = "BackgroundDefault",
	[ControlState.Hover] = "BackgroundOnHover",
	[ControlState.Pressed] = "BackgroundOnPress"
}
local config1 = {
	[ControlState.Default] = "IconDefault",
	[ControlState.Hover] = "IconEmphasis",
	[ControlState.Pressed] = "IconDefault"
}

local function getCellStyle(p1, Default, p2)
	-- upvalues: ControlState (copy)
	local v1 = p1[Default] or p1[ControlState.Default]
	local config = {
		Color = p2.Theme[v1].Color,
		Transparency = p2.Theme[v1].Transparency
	}
	
	if Default == ControlState.Default or Default == ControlState.Disabled then
		config.Transparency = 1
	end
	return config
end

local function getIconStyle(p1, Default, p2)
	-- upvalues: ControlState (copy)
	local v1 = p1[Default] or p1[ControlState.Default]
	local config = {
		Color = p2.Theme[v1].Color,
		Transparency = p2.Theme[v1].Transparency
	}
	
	if Default == ControlState.Disabled or Default == ControlState.Pressed then
		config.Transparency = 0.5 * config.Transparency + 0.5
	end
	return config
end

local function _(ColorStyle, Disabled)
	-- upvalues: ControlState (copy)
	local config = {
		Color = ColorStyle.Color,
		Transparency = ColorStyle.Transparency
	}
	
	if Disabled == ControlState.Disabled or Disabled == ControlState.Pressed then
		config.Transparency = 0.5 * config.Transparency + 0.5
	end
	return config
end

local function RadioButtonItem(Gui)
	-- upvalues: ReactModule (copy), ControlState (copy), UseStyleFunction (copy), getIconStyle (copy), config1 (copy), getCellStyle (copy), config (copy), FilterUtilsModule (copy), Focusable (copy), Interactable (copy), StyledTextLabel (copy), ImageSetLabel (copy), ComponentAssetsCircle24Stroke1 (copy), ComponentAssetsCircle16 (copy), ExpandingFrame (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlState.Initialize)
	local UseResult = ReactModule.useCallback(function(_, p1)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p1)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Gui (copy)
		if Gui.onActivated then
			Gui.onActivated(Gui.id)
		end
	end, { Gui.onActivated, Gui.id })
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local Default = Gui.useDefaultControlState and ControlState.Default or UseStateResult
	local IconStyle = getIconStyle(config1, Default, UseStyleResult)
	local CellStyle = getCellStyle(config, Default, UseStyleResult)
	local TextEmphasis = if Gui.isSelected then Theme.TextEmphasis else Theme.TextDefault
	local ColorStyle = {
		Color = TextEmphasis.Color,
		Transparency = TextEmphasis.Transparency
	}
	
	if Default == ControlState.Disabled or Default == ControlState.Pressed then
		ColorStyle.Transparency = 0.5 * ColorStyle.Transparency + 0.5
	end
	local ItemHeight = Gui.itemHeight or 45
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ItemHeight)
	
	local function onAbsoluteSizeChanged(Frame)
		-- upvalues: ItemHeight (copy), Gui (copy), UseBindingResult2 (copy)
		local NewY: number = ItemHeight
		
		if Frame then
			NewY += Frame.AbsoluteSize.Y
		end
		if not Gui.hideDivider then
			NewY += 1
		end
		UseBindingResult2(NewY)
		
		if Gui.onHeightChanged then
			Gui.onHeightChanged(NewY)
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), ItemHeight (copy), Gui (copy), UseBindingResult2 (copy)
		local Current = UseRefResult.current
		local NewY: number = ItemHeight
		
		if Current then
			NewY += Current.AbsoluteSize.Y
		end
		if not Gui.hideDivider then
			NewY += 1
		end
		UseBindingResult2(NewY)
		
		if Gui.onHeightChanged then
			Gui.onHeightChanged(NewY)
		end
	end, {})
	local IsIsSelected: boolean = Gui.expandedView and Gui.isSelected == true
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UseBindingResult:map(FilterUtilsModule.mapHeightToSize),
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
		Interactable = ReactModule.createElement(Focusable[Interactable], {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, ItemHeight),
			BackgroundColor3 = CellStyle.Color,
			BackgroundTransparency = CellStyle.Transparency,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			[ReactModule.Event.Activated] = not Gui.isDisabled and UseResult1,
			ref = Gui.defaultChildRef,
			NextSelectionDown = if IsIsSelected then UseRefResult else nil,
			SelectionImageObject = Gui.SelectionImageObject,
			isDisabled = Gui.isDisabled,
			onStateChanged = UseResult
		}, {
			Contents = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, ItemHeight)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				CustomViewFrame = Gui.customView and ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, -48, 1, 0)
				}, { CustomView = Gui.customView }),
				CustomViewSpacer = Gui.customView and ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(0, 24, 1, 0)
				}),
				TitleText = Gui.text and (not Gui.customView and ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 1,
					size = UDim2.new(1, -24, 1, 0),
					colorStyle = ColorStyle,
					fontStyle = UseStyleResultFont.Header2,
					text = Gui.text,
					textXAlignment = Enum.TextXAlignment.Left
				})),
				RightContent = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(0, 24, 1, 0)
				}, {
					SelectionImage = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						Image = ComponentAssetsCircle24Stroke1,
						Size = UDim2.new(0, 24, 0, 24),
						ImageColor3 = IconStyle.Color,
						ImageTransparency = IconStyle.Transparency,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					}, {
						SelectedImage = Gui.isSelected and ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							Image = ComponentAssetsCircle16,
							Size = UDim2.new(0, 16, 0, 16),
							ImageColor3 = IconStyle.Color,
							ImageTransparency = IconStyle.Transparency,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					})
				})
			})
		}),
		ExpandingFrame = Gui.expandedView and ReactModule.createElement(Focusable[ExpandingFrame], {
			LayoutOrder = 2,
			Size = UDim2.new(1, -24, 0, Gui.expandedViewHeight or 0),
			isExpanded = Gui.isSelected == true,
			onAbsoluteSizeChanged = onAbsoluteSizeChanged,
			ref = UseRefResult,
			NextSelectionUp = Gui.defaultChildRef
		}, { ExpandedView = Gui.expandedView }),
		DividerFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 1)
		}, {
			Divider = not Gui.hideDivider and ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -24, 0, 1),
				Position = UDim2.new(1, -12, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Theme.Divider.Color,
				BackgroundTransparency = Theme.Divider.Transparency
			})
		})
	})
end

return ReactModule.forwardRef(function(p1, FrameRef)
	-- upvalues: ReactModule (copy), RadioButtonItem (copy), CryoModule (copy)
	return ReactModule.createElement(RadioButtonItem, CryoModule.Dictionary.join(p1, { frameRef = FrameRef }))
end)