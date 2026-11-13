local _ = require("../vendor/compose/core")
local _ = require("./types")
local ScrollLockModule = require("./scroll_lock")

return function(p1, ScrollFrame, List, p2)
	-- upvalues: ScrollLockModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local IsHug: boolean = p2 ~= nil and p2.hug == true
	local Bound = if IsHug and p2 then p2.bound else nil
	local config = {
		BackgroundTransparency = 1,
		Name = if p2 and p2.name then p2.name else "Flow",
		Size = if IsHug then TypesUDim2.fromOffset(0, 0) else TypesUDim2.new(1, 0, 0, 0),
		AutomaticSize = if IsHug then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y
	}
	
	if Bound then
		function config.Size(Callback)
			-- upvalues: TypesUDim2 (copy), Bound (copy)
			return TypesUDim2.fromOffset(if Callback(Bound.wide) > 0 then Bound.limit(Callback) else 0, 0)
		end
		
		function config.AutomaticSize(Callback)
			-- upvalues: Bound (copy), TypesEnum (copy)
			return if Callback(Bound.wide) > 0 then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY
		end
	end
	for _, value in List do
		config[#config + 1] = value
	end
	local FrameResult = Host.Frame(config)
	local AbsoluteSizeResult = p1.observe.AbsoluteSize(FrameResult)
	local CellResult = Compose.cell(0)
	ScrollFrame.AutomaticCanvasSize = TypesEnum.AutomaticSize.None
	
	function ScrollFrame.CanvasSize(Callback)
		-- upvalues: TypesUDim2 (copy), Bound (copy), CellResult (copy)
		return TypesUDim2.fromOffset(if Bound then Callback(Bound.wide) else 0, Callback(CellResult))
	end
	
	ScrollFrame[#ScrollFrame + 1] = Host.Frame("Measure")({
		BackgroundTransparency = 1,
		Size = if IsHug then TypesUDim2.fromOffset(0, 100000) else TypesUDim2.new(1, 0, 0, 100000),
		AutomaticSize = if IsHug then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.None,
		FrameResult
	})
	local ScrollingFrameResult = Host.ScrollingFrame(ScrollFrame)
	ScrollLockModule.own(ScrollingFrameResult, p1)
	local LayoutSizeResult = p1.layoutSize(FrameResult, p1.layoutUnit(ScrollingFrameResult))
	Compose.watch(function(Callback)
		-- upvalues: CellResult (copy), LayoutSizeResult (copy)
		CellResult:set((math.ceil(Callback(LayoutSizeResult).Y - 0.01)))
	end)
	
	return ScrollingFrameResult, FrameResult, AbsoluteSizeResult, CellResult, if p2 and p2.rest then p1.runtime.settled({
		sample = function()
			-- upvalues: CellResult (copy)
			return CellResult:peek()
		end,
		equals = function(p3, p4: number): boolean
			-- upvalues: AbsoluteSizeResult (copy)
			return if p4 > 0 then p3 == p4 else AbsoluteSizeResult:peek().X > 0 and p3 == p4
		end,
		timeout = p1.metric("motion.restLimit")
	}) else Compose.cell(true)
end