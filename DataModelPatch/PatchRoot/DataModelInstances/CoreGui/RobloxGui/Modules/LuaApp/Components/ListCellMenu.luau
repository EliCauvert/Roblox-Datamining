local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FormFactor = require(game:GetService("CorePackages").Workspace.Packages.FormFactor).Enums.FormFactor
local ListCellModule = require(Modules.LuaApp.Components.ListCell)
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local _Rect = Rect.new(8, 8, 9, 9)
local ListCellMenu = RoactModule.PureComponent:extend("ListCellMenu")
ListCellMenu.defaultProps = { itemHeight = 66, maxHeight = 10000, visibleItem = 5.58 }

function ListCellMenu.init(p1)
	-- upvalues: FormFactor (copy)
	function p1.onCanvasSizeChanged(ScrollFrame)
		-- upvalues: p1 (copy), FormFactor (upval)
		local Offset = ScrollFrame.CanvasSize.Y.Offset
		local MaxHeight: number = p1.props.maxHeight
		local ItemHeight = p1.props.itemHeight
		local ScreenHeight: number = p1.props.screenHeight
		local VisibleItem = p1.props.visibleItem
		local Smallest: number = if p1.props.formFactor == FormFactor.COMPACT then math.min(MaxHeight, VisibleItem * ItemHeight) else math.min(MaxHeight, ScreenHeight * 0.5)
		
		if Offset <= Smallest then
			ScrollFrame.ScrollingEnabled = false
		else
			ScrollFrame.ScrollingEnabled = true
			Offset = Smallest
		end
		ScrollFrame.Size = UDim2.new(0, p1.props.width, 0, Offset)
	end
end

function ListCellMenu.render(p1)
	-- upvalues: RoactModule (copy), ListCellModule (copy), FitChildrenModule (copy), _Rect (copy)
	local Items = p1.props.items
	local LayoutOrder = p1.props.layoutOrder
	local _UDim2 = UDim2.new(0, p1.props.width, 0, 0)
	local ContextualMenu = p1.props.appTheme.ContextualMenu
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local LayoutOrder1 = 0
	
	for i, item in ipairs(Items) do
		LayoutOrder1 += 1
		config["Item_" .. i] = RoactModule.createElement(ListCellModule, { item = item, layoutOrder = LayoutOrder1 })
		
		if i < #Items then
			LayoutOrder1 += 1
			config["Divider_" .. i] = RoactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				BackgroundColor3 = ContextualMenu.Divider.Color,
				LayoutOrder = LayoutOrder1,
				Size = UDim2.new(1, 0, 0, 1)
			})
		end
	end
	return RoactModule.createElement(FitChildrenModule.FitImageLabel, {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Image = "LuaApp/buttons/buttonFill",
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		ImageColor3 = ContextualMenu.Background.Color,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = _Rect,
		fitAxis = FitChildrenModule.FitAxis.Both,
		LayoutOrder = LayoutOrder
	}, {
		ScrollingFrame = RoactModule.createElement(FitChildrenModule.FitScrollingFrame, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Size = _UDim2,
			fitFields = { CanvasSize = FitChildrenModule.FitAxis.Height },
			[RoactModule.Change.CanvasSize] = p1.onCanvasSizeChanged
		}, config)
	})
end

return (WithThemeDEPRECATEDModule((RoactRoduxModule.connect(function(p2, _)
	return {
		formFactor = p2.FormFactor,
		screenWidth = p2.ScreenSize.X,
		screenHeight = p2.ScreenSize.Y
	}
end)(ListCellMenu))))