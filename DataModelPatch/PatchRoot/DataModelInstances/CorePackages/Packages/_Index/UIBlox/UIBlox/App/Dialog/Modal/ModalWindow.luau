local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local FitFrameVertical = require(Parent3.FitFrame).FitFrameVertical
local ImagesModule = require(Parent1.ImageSet.Images)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local ImageSetComponentModule = require(Parent2.Core.ImageSet.ImageSetComponent)
local GetModalWindowWidthModule = require(Parent.getModalWindowWidth)
local _Rect = Rect.new(8, 8, 9, 9)
local ModalWindow = RoactModule.PureComponent:extend("ModalWindow")
ModalWindow.validateProps = TModule.strictInterface({
	isFullHeight = TModule.boolean,
	screenSize = TModule.Vector2,
	[RoactModule.Children] = TModule.table,
	position = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	distanceFromTop = TModule.optional(TModule.number)
})
ModalWindow.defaultProps = { distanceFromTop = 0 }

function ModalWindow.init(p1)
	-- upvalues: RoactModule (copy)
	p1.contentSize, p1.changeContentSize = RoactModule.createBinding(Vector2.new(0, 0))
end

function ModalWindow:isFullWidth(X: number): boolean
	return X < 540
end

function ModalWindow.render(p1)
	-- upvalues: WithStyleModule (copy), GetModalWindowWidthModule (copy), RoactModule (copy), ImageSetComponentModule (copy), ImagesModule (copy), _Rect (copy), FitFrameVertical (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), GetModalWindowWidthModule (upval), RoactModule (upval), ImageSetComponentModule (upval), ImagesModule (upval), _Rect (upval), FitFrameVertical (upval)
		local Theme = p2.Theme
		local ScreenSize = p1.props.screenSize
		local _UDim = UDim.new(0, GetModalWindowWidthModule(ScreenSize.X))
		local _Vector2 = nil
		local v1 = nil
		local Position = nil
		
		if p1:isFullWidth(ScreenSize.X) then
			_Vector2 = Vector2.new(0.5, 1)
			v1 = "component_assets/bullet_17"
			Position = p1.props.position or UDim2.new(0.5, 0, 1, 0)
		else
			_Vector2 = Vector2.new(0.5, 0.5)
			v1 = "component_assets/circle_17"
			Position = p1.props.position or UDim2.new(0.5, 0, 0.5, 0)
		end
		local AnchorPoint = p1.props.anchorPoint or _Vector2
		
		return if p1.props.isFullHeight then RoactModule.createElement(ImageSetComponentModule.Button, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			ClipsDescendants = true,
			Selectable = false,
			Position = Position,
			Size = UDim2.new(_UDim, if p1.props.distanceFromTop > 0 then UDim.new(1, -p1.props.distanceFromTop) elseif ScreenSize.X >= 540 and ScreenSize.Y >= 700 then UDim.new(0.8, 0) else UDim.new(1, 0)),
			AnchorPoint = AnchorPoint,
			Image = ImagesModule[v1],
			ImageColor3 = Theme.BackgroundUIDefault.Color,
			ImageTransparency = Theme.BackgroundUIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = _Rect
		}, {
			BackgroundImage = RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}, p1.props[RoactModule.Children])
		}) else RoactModule.createElement(ImageSetComponentModule.Button, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			ClipsDescendants = true,
			Selectable = false,
			Position = Position,
			Size = p1.contentSize:map(function(Vector): UDim2
				return UDim2.new(0, Vector.X, 0, Vector.Y)
			end),
			AnchorPoint = AnchorPoint,
			Image = ImagesModule[v1],
			ImageColor3 = Theme.BackgroundUIDefault.Color,
			ImageTransparency = Theme.BackgroundUIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = _Rect
		}, {
			BackgroundImage = RoactModule.createElement(FitFrameVertical, {
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				width = _UDim,
				[RoactModule.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p1 (upval)
					p1.changeContentSize(Frame.AbsoluteSize)
				end
			}, p1.props[RoactModule.Children])
		})
	end)
end

return ModalWindow