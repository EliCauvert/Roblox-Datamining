local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local ListPickerItemModule = require(Modules.LuaApp.Components.ListPickerItem)
game:DefineFastInt("AutomaticSizingListPickerHotfix", 0)
local ListPicker = RoactModule.PureComponent:extend("ListPicker")
ListPicker.defaultProps = {
	itemHeight = 54,
	maxHeight = 10000,
	visibleItem = 5.58,
	Selectable = false
}

function ListPicker.init(p1)
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
			p1:setState({ scrollingEnabled = false, canvasSizeYOffset = Offset })
			
			return
		else
			p1:setState({ scrollingEnabled = true, canvasSizeYOffset = Smallest })
		end
	end
	
	p1:setState({ scrollingEnabled = false, canvasSizeYOffset = 0 })
end

function ListPicker.render(p1)
	-- upvalues: RoactModule (copy), ListPickerItemModule (copy), WithStyleFunction (copy), FitChildrenModule (copy)
	local Items = p1.props.items
	local LayoutOrder = p1.props.layoutOrder
	local ScrollingEnabled = p1.state.scrollingEnabled
	local _UDim2 = UDim2.fromOffset(p1.props.width, p1.state.canvasSizeYOffset)
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for LayoutOrder1, item in ipairs(Items) do
		config[LayoutOrder1] = RoactModule.createElement(ListPickerItemModule, {
			item = item,
			layoutOrder = LayoutOrder1,
			separatorEnabled = LayoutOrder1 < #Items
		})
	end
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), FitChildrenModule (upval), LayoutOrder (copy), _UDim2 (copy), ScrollingEnabled (copy), p1 (copy), config (copy)
		return RoactModule.createElement(FitChildrenModule.FitScrollingFrame, {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIDefault.Transparency,
			LayoutOrder = LayoutOrder,
			ScrollBarThickness = 0,
			Size = _UDim2,
			ScrollingEnabled = ScrollingEnabled,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			fitFields = { CanvasSize = FitChildrenModule.FitAxis.Height },
			[RoactModule.Change.CanvasSize] = p1.onCanvasSizeChanged,
			Selectable = p1.props.Selectable
		}, config)
	end)
end

return (RoactRoduxModule.connect(function(p2, _)
	return {
		formFactor = p2.FormFactor,
		screenWidth = p2.ScreenSize.X,
		screenHeight = p2.ScreenSize.Y
	}
end)(ListPicker))