local graphing = script:FindFirstAncestor("Graphing")
local parent = graphing.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local canvasContextModule = require(graphing.CanvasContext)
local typesModule = require(graphing.Types)
local gridLineModule = require(graphing.Components.GridLine)
local gridUtilModule = require(graphing.Util.GridUtil)
local styleUtilModule = require(graphing.Util.StyleUtil)

function Grid(p1)
	-- upvalues: reactModule (ref), canvasContextModule (ref), signalsReactModule (ref), gridUtilModule (ref), typesModule (ref), gridLineModule (ref), styleUtilModule (ref)
	local var1 = reactModule.useContext(canvasContextModule)
	signalsReactModule.useSignalState(var1.viewportRectGetter)
	local zIndex = p1.ZIndex or -1
	local var2 = if p1.XAxis then gridUtilModule.getValues(typesModule.AXIS_X, p1.XAxis, var1) else {}
	local var3 = if p1.YAxis then gridUtilModule.getValues(typesModule.AXIS_Y, p1.YAxis, var1) else {}
	local var4 = if p1.XAxisMinor then gridUtilModule.getValues(typesModule.AXIS_X, p1.XAxisMinor, var1, var2) else {}
	local var5 = if p1.YAxisMinor then gridUtilModule.getValues(typesModule.AXIS_Y, p1.YAxisMinor, var1, var3) else {}
	local t = {}
	
	for i, v in var2 do
		t[`X{v}`] = reactModule.createElement(gridLineModule, {
			Orientation = "Vertical",
			Position = v,
			Tag = p1.Tag,
			Color3 = styleUtilModule.GRID_COLOR3,
			Thickness = styleUtilModule.GRID_THICKNESS,
			Transparency = styleUtilModule.GRID_TRANSPARENCY
		})
	end
	for i, v_1 in var4 do
		t[`Xm{v_1}`] = reactModule.createElement(gridLineModule, {
			Orientation = "Vertical",
			Position = v_1,
			Tag = p1.Tag,
			Color3 = styleUtilModule.GRID_COLOR3_MINOR,
			Thickness = styleUtilModule.GRID_THICKNESS_MINOR,
			Transparency = styleUtilModule.GRID_TRANSPARENCY_MINOR
		})
	end
	for i, v_2 in var3 do
		t[`Y{v_2}`] = reactModule.createElement(gridLineModule, {
			Orientation = "Horizontal",
			Position = v_2,
			Tag = p1.Tag,
			Color3 = styleUtilModule.GRID_COLOR3,
			Thickness = styleUtilModule.GRID_THICKNESS,
			Transparency = styleUtilModule.GRID_TRANSPARENCY
		})
	end
	for i, v_3 in var5 do
		t[`Ym{v_3}`] = reactModule.createElement(gridLineModule, {
			Orientation = "Horizontal",
			Position = v_3,
			Tag = p1.Tag,
			Color3 = styleUtilModule.GRID_COLOR3_MINOR,
			Thickness = styleUtilModule.GRID_THICKNESS_MINOR,
			Transparency = styleUtilModule.GRID_TRANSPARENCY_MINOR
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		ZIndex = zIndex
	}, t)
end

return Grid