local ReducedFunction = require("./motion").reduced
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local _ = require("./media_props")

return function(p1, p2)
	-- upvalues: ReducedFunction (copy)
	local Host = p1.Host
	local Runtime = p1.runtime
	local Compose = p1.Compose
	local Types = p1.types
	local ReadFunction = p1.read
	local TypesEnum = Types.Enum
	local TypesUDim2 = Types.UDim2
	local TypesUDim = Types.UDim
	local TypesVector2 = Types.Vector2
	local MetricFunction = p1.metric
	local ControlSizeFunction = p1.controlSize
	local SharedResource = Compose.createSharedResource(function()
		-- upvalues: Runtime (copy), p1 (copy), Compose (copy), ReducedFunction (upval)
		local TimelineResult = Runtime.timeline({
			repeats = 1e999,
			duration = p1.metric("motion.durations.spinnerLoop")
		})
		local CellResult = Compose.cell(0)
		local ReducedResult = ReducedFunction(p1)
		Compose.watch(function(Callback)
			-- upvalues: ReducedResult (copy), CellResult (copy), TimelineResult (copy)
			if ReducedResult(Callback) or Callback(CellResult) == 0 then
				TimelineResult:pause()
				
				return
			else
				TimelineResult:play()
			end
		end)
		
		return { clock = TimelineResult, visible = CellResult }, nil
	end)
	p2.Skeleton = p1.construct("Skeleton", function(p3)
		-- upvalues: SharedResource (copy), ReducedFunction (upval), p1 (copy), ControlSizeFunction (copy), TypesUDim2 (copy), Host (copy), TypesVector2 (copy), Types (copy), ReadFunction (copy), TypesUDim (copy), MetricFunction (copy), TypesEnum (copy), Compose (copy), Runtime (copy)
		local Form = p3.form or "box"
		assert(Form == "box" or (Form == "circle" or Form == "line"), "Facet Skeleton invalid form")
		assert(p3.lines == nil or Form == "line", "Facet Skeleton lines require line form")
		assert(p3.corners == nil or Form ~= "circle", "Facet Skeleton circle owns its corners")
		local Lines = p3.lines or 1
		assert(Lines >= 1 and Lines % 1 == 0, "Facet Skeleton lines must be positive")
		local SharedResourceResult = SharedResource()
		local Clock = SharedResourceResult.clock
		local ReducedResult = ReducedFunction(p1)
		local List = {}
		
		for i = 1, Lines do
			local UICornerResults = {
				Name = "Placeholder" .. i,
				Size = function(p4)
					-- upvalues: ControlSizeFunction (upval), p3 (copy), Form (copy), TypesUDim2 (upval), Lines (copy), i (copy)
					local ControlSizeResult = ControlSizeFunction(p3.controlSize, if Form == "line" then "iconSize" else "height", p4)
					
					return if Form == "circle" then TypesUDim2.fromOffset(ControlSizeResult, ControlSizeResult) else TypesUDim2.new(if Lines > 1 and i == Lines then 0.6 else 1, 0, 0, ControlSizeResult)
				end,
				Host.UIGradient("Shimmer")({
					Enabled = function(p4): boolean
						-- upvalues: ReducedResult (copy)
						return not ReducedResult(p4)
					end,
					Offset = function(Callback)
						-- upvalues: TypesVector2 (upval), Clock (copy)
						return TypesVector2.new(Callback(Clock.progress) * 2 - 1, 0)
					end,
					Transparency = Types.NumberSequence.new({
						Types.NumberSequenceKeypoint.new(0, 0.4),
						Types.NumberSequenceKeypoint.new(0.5, 0),
						Types.NumberSequenceKeypoint.new(1, 0.4)
					})
				})
			}
			
			if Form == "circle" then
				UICornerResults[#UICornerResults + 1] = Host.UICorner({ CornerRadius = p1.round })
			elseif p3.corners then
				UICornerResults[#UICornerResults + 1] = Host.UICorner({
					CornerRadius = function(p4)
						-- upvalues: ReadFunction (upval), p3 (copy), TypesUDim (upval), MetricFunction (upval)
						local ReadResult: number = ReadFunction(p3.corners, p4)
						
						if ReadResult == "pill" then
							return TypesUDim.new(1, 0)
						elseif ReadResult == "square" then
							return TypesUDim.new(0, 0)
						elseif ReadResult == "rounded" or ReadResult == "control" then
							return TypesUDim.new(0, MetricFunction("radii.control", p4))
						elseif ReadResult == "panel" then
							return TypesUDim.new(0, MetricFunction("radii.panel", p4))
						else
							assert(type(ReadResult) == "number" and ReadResult >= 0, "Facet Skeleton invalid corners")
							
							return TypesUDim.new(0, ReadResult)
						end
					end
				})
			end
			table.insert(List, p1.styled(Host.Frame(UICornerResults), "skeleton"))
		end
		local ColumnResult = p1.column(List, p1.props(p3, { "form", "lines", "controlSize", "corners" }, {
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		}))
		local CellResult = Compose.cell(0)
		Runtime.connect(ColumnResult, "AncestryChanged", function()
			-- upvalues: CellResult (copy)
			CellResult:set(CellResult:peek() + 1)
		end)
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: CellResult (copy), ColumnResult (copy), p1 (upval), Compose (upval), SharedResourceResult (copy)
			Callback(CellResult)
			local List = {}
			local Parent = ColumnResult
			while Parent do
				if Parent:IsA("GuiObject") then
					table.insert(List, p1.observe.Visible(Parent))
				elseif Parent:IsA("LayerCollector") then
					table.insert(List, p1.observe.Enabled(Parent))
					break
				end
				Parent = Parent.Parent
			end
			Compose.watch(function(Callback)
				-- upvalues: List (copy), SharedResourceResult (upval), Compose (upval)
				for _, value in List do
					if not Callback(value) then return end
				end
				SharedResourceResult.visible:set(SharedResourceResult.visible:peek() + 1)
				Compose.cleanup(function()
					-- upvalues: SharedResourceResult (upval)
					SharedResourceResult.visible:set(SharedResourceResult.visible:peek() - 1)
				end)
			end)
		end)
		
		return ColumnResult
	end)
end