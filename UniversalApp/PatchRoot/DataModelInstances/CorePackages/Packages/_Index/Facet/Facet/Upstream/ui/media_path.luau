local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./media_types")
local _ = require("../vendor/compose/core")
local NavPathShapesModule = require("./nav_path_shapes")
local _ = require("./control_types")
local _ = require("./media_props")

return function(p1, p2)
	-- upvalues: NavPathShapesModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Types = p1.types
	local ReadFunction = p1.read
	local TypesUDim2 = Types.UDim2
	local MetricFunction = p1.metric
	p2.Path = p1.construct("Path", function(p3)
		-- upvalues: ReadFunction (copy), MetricFunction (copy), p1 (copy), Host (copy), Compose (copy), NavPathShapesModule (upval), Types (copy), TypesUDim2 (copy)
		assert(p3.points ~= nil, "Facet Path requires points")
		local Width: number = p3.width
		local Height: number = p3.height
		assert(Width == nil or type(Width) == "number" and Width > 0, "Facet Path width must be a positive number")
		assert(Height == nil or type(Height) == "number" and Height > 0, "Facet Path height must be a positive number")
		local config = {
			Name = "Stroke",
			Closed = function(p4): boolean
				-- upvalues: ReadFunction (upval), p3 (copy)
				return ReadFunction(p3.closed, p4) == true
			end
		}
		
		if p3.thickness ~= nil then
			function config.Thickness(p4)
				-- upvalues: ReadFunction (upval), p3 (copy), MetricFunction (upval)
				local ReadResult: number = ReadFunction(p3.thickness, p4)
				
				if type(ReadResult) == "string" then
					return MetricFunction(ReadResult, p4)
				else
					assert(type(ReadResult) == "number" and ReadResult > 0, "Facet Path thickness must be a positive number or a theme metric name")
					
					return ReadResult
				end
			end
		end
		if p3.tint ~= nil then
			function config.Color3(p4)
				-- upvalues: ReadFunction (upval), p3 (copy)
				return assert(ReadFunction(p3.tint, p4))
			end
		end
		local Path = p1.styled(Host.Path2D(config), "path")
		local Tag = nil
		Compose.watch(function(p4)
			-- upvalues: ReadFunction (upval), p3 (copy), Tag (ref), Path (copy)
			local ReadResult = ReadFunction(p3.role, p4) or "content"
			assert(ReadResult == "content" or (ReadResult == "secondary" or ReadResult == "accent"), "Facet Path role must be content, secondary or accent")
			
			if Tag then
				Path:RemoveTag(Tag)
			end
			local Text = "facet-path-" .. ReadResult
			Tag = Text
			Path:AddTag(Text)
		end)
		Compose.watch(function(p4)
			-- upvalues: ReadFunction (upval), p3 (copy), NavPathShapesModule (upval), Types (upval), TypesUDim2 (upval), Path (copy)
			local ReadResult = ReadFunction(p3.points, p4)
			assert(type(ReadResult) == "table", "Facet Path points must be a list of pathShapes points")
			assert(#ReadResult <= NavPathShapesModule.MAX_CONTROL_POINTS, "Facet Path takes at most 100 control points")
			local List = {}
			
			for _, value in ReadResult do
				table.insert(List, Types.Path2DControlPoint.new(TypesUDim2.fromScale(value.x, value.y), TypesUDim2.fromScale(value.inX, value.inY), TypesUDim2.fromScale(value.outX, value.outY)))
			end
			Path:SetControlPoints(List)
		end)
		local PropsResult = p1.props(p3, {
			"points", "thickness", "closed", "role", "tint", "width", "height"
		}, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if Width or Height then TypesUDim2.fromOffset(Width or (Height or 0), Height or (Width or 0)) else nil
		})
		PropsResult[#PropsResult + 1] = Path
		
		return Host.Frame(PropsResult)
	end)
end