local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local CanvasContextModule = require(Graphing.CanvasContext)
local TypesModule = require(Graphing.Types)
local GridLineModule = require(Graphing.Components.GridLine)
local GridUtilModule = require(Graphing.Util.GridUtil)
local StyleUtilModule = require(Graphing.Util.StyleUtil)

function Grid(p1)
	-- upvalues: ReactModule (copy), CanvasContextModule (copy), SignalsReactModule (copy), GridUtilModule (copy), TypesModule (copy), GridLineModule (copy), StyleUtilModule (copy)
	local UseContextResult = ReactModule.useContext(CanvasContextModule)
	SignalsReactModule.useSignalState(UseContextResult.viewportRectGetter)
	local ZIndex = p1.ZIndex or -1
	local Values = if p1.XAxis then GridUtilModule.getValues(TypesModule.AXIS_X, p1.XAxis, UseContextResult) else {}
	local Values1 = if p1.YAxis then GridUtilModule.getValues(TypesModule.AXIS_Y, p1.YAxis, UseContextResult) else {}
	local Values2 = if p1.XAxisMinor then GridUtilModule.getValues(TypesModule.AXIS_X, p1.XAxisMinor, UseContextResult, Values) else {}
	local Values3 = if p1.YAxisMinor then GridUtilModule.getValues(TypesModule.AXIS_Y, p1.YAxisMinor, UseContextResult, Values1) else {}
	local Elements = {}
	
	for _, value in Values do
		Elements[`X{value}`] = ReactModule.createElement(GridLineModule, {
			Orientation = "Vertical",
			Position = value,
			Tag = p1.Tag,
			Color3 = StyleUtilModule.GRID_COLOR3,
			Thickness = StyleUtilModule.GRID_THICKNESS,
			Transparency = StyleUtilModule.GRID_TRANSPARENCY
		})
	end
	for _, Position in Values2 do
		Elements[`Xm{Position}`] = ReactModule.createElement(GridLineModule, {
			Orientation = "Vertical",
			Position = Position,
			Tag = p1.Tag,
			Color3 = StyleUtilModule.GRID_COLOR3_MINOR,
			Thickness = StyleUtilModule.GRID_THICKNESS_MINOR,
			Transparency = StyleUtilModule.GRID_TRANSPARENCY_MINOR
		})
	end
	for _, Position1 in Values1 do
		Elements[`Y{Position1}`] = ReactModule.createElement(GridLineModule, {
			Orientation = "Horizontal",
			Position = Position1,
			Tag = p1.Tag,
			Color3 = StyleUtilModule.GRID_COLOR3,
			Thickness = StyleUtilModule.GRID_THICKNESS,
			Transparency = StyleUtilModule.GRID_TRANSPARENCY
		})
	end
	for _, Position2 in Values3 do
		Elements[`Ym{Position2}`] = ReactModule.createElement(GridLineModule, {
			Orientation = "Horizontal",
			Position = Position2,
			Tag = p1.Tag,
			Color3 = StyleUtilModule.GRID_COLOR3_MINOR,
			Thickness = StyleUtilModule.GRID_THICKNESS_MINOR,
			Transparency = StyleUtilModule.GRID_TRANSPARENCY_MINOR
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		ZIndex = ZIndex
	}, Elements)
end

return Grid