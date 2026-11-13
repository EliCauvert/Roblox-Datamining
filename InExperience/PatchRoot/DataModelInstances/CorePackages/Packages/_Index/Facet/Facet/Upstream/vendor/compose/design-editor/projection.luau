local _ = require("../core")
local _ = require("../design")
local DevicesModule = require("./devices")
local _ = require("./ui")

local function project(p1, Tbl, p2, p3)
	-- upvalues: project (copy), DevicesModule (copy)
	if p3[Tbl] then
		return p3[Tbl]
	end
	local Copy = table.clone(Tbl)
	p3[Tbl] = Copy
	Copy.kinds = {}
	
	for i, kind in Tbl.kinds do
		local Copy1 = table.clone(kind)
		
		if kind.design then
			local Copy2 = table.clone(kind.design)
			Copy2.library = project(p1, Copy2.library, p2, p3)
			Copy1.design = Copy2
		end
		function Copy1.build(p4, List, Name)
			-- upvalues: kind (copy), p1 (copy), DevicesModule (upval), p2 (copy)
			local BuildResult = kind.build(p4, List, Name)
			
			if not p1.isA(BuildResult, "LayerCollector") then
				return BuildResult
			end
			local Runtime = p1.runtime
			local Enabled = Runtime.observe(p1.node(BuildResult), "Enabled")
			local config = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Name = Name,
				Visible = function(Callback): boolean
					-- upvalues: Enabled (copy)
					return Callback(Enabled) == true
				end
			}
			
			if p1.isA(BuildResult, "ScreenGui") then
				local ScreenInsets = Runtime.observe(p1.node(BuildResult), "ScreenInsets")
				
				local function _(Callback)
					-- upvalues: ScreenInsets (copy), DevicesModule (upval), p2 (upval)
					return DevicesModule.area(p2, string.match(tostring(Callback(ScreenInsets)), "([^%.]+)$") or "CoreUISafeInsets")
				end
				
				function config.Position(Callback)
					-- upvalues: ScreenInsets (copy), DevicesModule (upval), p2 (upval), p1 (upval)
					local AreaResult = DevicesModule.area(p2, string.match(tostring(Callback(ScreenInsets)), "([^%.]+)$") or "CoreUISafeInsets")
					
					return p1.values.udim2(0, AreaResult.x, 0, AreaResult.y)
				end
				
				function config.Size(Callback)
					-- upvalues: ScreenInsets (copy), DevicesModule (upval), p2 (upval), p1 (upval)
					local AreaResult = DevicesModule.area(p2, string.match(tostring(Callback(ScreenInsets)), "([^%.]+)$") or "CoreUISafeInsets")
					
					return p1.values.udim2(0, AreaResult.width, 0, AreaResult.height)
				end
			elseif p1.isA(BuildResult, "BillboardGui") then
				local Size = Runtime.observe(p1.node(BuildResult), "Size")
				local StudsOffsetWorldSpace = Runtime.observe(p1.node(BuildResult), "StudsOffsetWorldSpace")
				
				local _ = function(Callback)
					-- upvalues: p2 (upval), p1 (upval), StudsOffsetWorldSpace (copy)
					return p2.size.Y / (math.tan(math.rad(p2.fieldOfView) / 2) * 2 * math.max(0.01, 12 - p1.vector(Callback(StudsOffsetWorldSpace)).Z))
				end
				
				config.AnchorPoint = p1.values.vector2(0.5, 0.5)
				
				function config.Position(Callback)
					-- upvalues: p1 (upval), StudsOffsetWorldSpace (copy), p2 (upval)
					local Vector = p1.vector(Callback(StudsOffsetWorldSpace))
					local YRatio = p2.size.Y / (math.tan(math.rad(p2.fieldOfView) / 2) * 2 * math.max(0.01, 12 - p1.vector(Callback(StudsOffsetWorldSpace)).Z))
					
					return p1.values.udim2(0.5, Vector.X * YRatio, 0.5, -Vector.Y * YRatio)
				end
				
				function config.Size(Callback)
					-- upvalues: Size (copy), p2 (upval), p1 (upval), StudsOffsetWorldSpace (copy)
					local CallbackResult = Callback(Size)
					local YRatio = p2.size.Y / (math.tan(math.rad(p2.fieldOfView) / 2) * 2 * math.max(0.01, 12 - p1.vector(Callback(StudsOffsetWorldSpace)).Z))
					local X = p1.get(CallbackResult, "X")
					local Y = p1.get(CallbackResult, "Y")
					
					return p1.values.udim2(0, p1.number(X, "Offset") + p1.number(X, "Scale") * YRatio, 0, p1.number(Y, "Offset") + p1.number(Y, "Scale") * YRatio)
				end
			else
				error("Unsupported Design layer collector: " .. p1.text(BuildResult, "ClassName"))
			end
			for i, value in List do
				config[i] = p1.node(value)
			end
			return Runtime.create("Frame")(config)
		end
		
		Copy.kinds[i] = Copy1
	end
	return Copy
end

return function(p4, p5, p6)
	-- upvalues: project (copy)
	return (project(p4, p5, p6, {}))
end