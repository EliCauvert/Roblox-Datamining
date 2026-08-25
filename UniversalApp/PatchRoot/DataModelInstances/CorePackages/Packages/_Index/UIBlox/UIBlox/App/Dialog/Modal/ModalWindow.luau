local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local fitFrameVertical = require(parent_3.FitFrame).FitFrameVertical
local imagesModule = require(parent_1.ImageSet.Images)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local imageSetComponentModule = require(parent_2.Core.ImageSet.ImageSetComponent)
local getModalWindowWidthModule = require(parent.getModalWindowWidth)
local rect = Rect.new(8, 8, 9, 9)
local modalWindow = roactModule.PureComponent:extend("ModalWindow")
modalWindow.validateProps = tModule.strictInterface({
	isFullHeight = tModule.boolean,
	screenSize = tModule.Vector2,
	[roactModule.Children] = tModule.table,
	position = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	distanceFromTop = tModule.optional(tModule.number)
})
modalWindow.defaultProps = { distanceFromTop = 0 }

function modalWindow.init(p0)
	-- upvalues: roactModule (ref)
	local var8, var9 = roactModule.createBinding(Vector2.new(0, 0))
	p0.contentSize = var8
	p0.changeContentSize = var9
end

function modalWindow.isFullWidth(_, p1)
	return p1 < 540
end

function modalWindow.render(p2)
	-- upvalues: withStyleModule (ref), getModalWindowWidthModule (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref), rect (ref), fitFrameVertical (ref)
	return withStyleModule(function(p3)
		-- upvalues: p2 (ref), getModalWindowWidthModule (copy), roactModule (copy), imageSetComponentModule (copy), imagesModule (copy), rect (copy), fitFrameVertical (copy)
		local vector2, var12, var13
		local theme = p3.Theme
		local screenSize = p2.props.screenSize
		local _ = nil
		local _ = nil
		local _ = nil
		local _ = nil
		local uDim = UDim.new(0, getModalWindowWidthModule(screenSize.X))
		
		if p2:isFullWidth(screenSize.X) then
			vector2 = Vector2.new(0.5, 1)
			var12 = "component_assets/bullet_17"
			var13 = p2.props.position or UDim2.new(0.5, 0, 1, 0)
		else
			vector2 = Vector2.new(0.5, 0.5)
			var12 = "component_assets/circle_17"
			var13 = p2.props.position or UDim2.new(0.5, 0, 0.5, 0)
		end
		vector2 = p2.props.anchorPoint or vector2
		
		if not p2.props.isFullHeight then
			return roactModule.createElement(imageSetComponentModule.Button, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
				ClipsDescendants = true,
				Selectable = false,
				Position = var13,
				Size = p2.contentSize:map(function(p4)
					return UDim2.new(0, p4.X, 0, p4.Y)
				end),
				AnchorPoint = vector2,
				Image = imagesModule[var12],
				ImageColor3 = theme.BackgroundUIDefault.Color,
				ImageTransparency = theme.BackgroundUIDefault.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = rect
			}, {
				BackgroundImage = roactModule.createElement(fitFrameVertical, {
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					width = uDim,
					[roactModule.Change.AbsoluteSize] = function(p5)
						-- upvalues: p2 (copy)
						p2.changeContentSize(p5.AbsoluteSize)
					end
				}, p2.props[roactModule.Children])
			})
		end
		local _ = nil
		
		return roactModule.createElement(imageSetComponentModule.Button, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			ClipsDescendants = true,
			Selectable = false,
			Position = var13,
			Size = UDim2.new(uDim, if p2.props.distanceFromTop > 0 then UDim.new(1, -p2.props.distanceFromTop) elseif screenSize.X >= 540 and screenSize.Y >= 700 then UDim.new(0.8, 0) else UDim.new(1, 0)),
			AnchorPoint = vector2,
			Image = imagesModule[var12],
			ImageColor3 = theme.BackgroundUIDefault.Color,
			ImageTransparency = theme.BackgroundUIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = rect
		}, {
			BackgroundImage = roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}, p2.props[roactModule.Children])
		})
	end)
end

return modalWindow