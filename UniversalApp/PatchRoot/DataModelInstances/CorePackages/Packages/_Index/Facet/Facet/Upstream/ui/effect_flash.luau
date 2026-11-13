local _ = require("./types")
local _ = require("./control_types")
local _ = require("./navigation_types")
local _ = require("./effect_props")
local ReducedFunction = require("./motion").reduced

return function(p1, p2, p3)
	-- upvalues: ReducedFunction (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	p2.Flash = p1.construct("Flash", function(p4)
		-- upvalues: ReducedFunction (upval), p1 (copy), Host (copy), p3 (copy), Compose (copy), Runtime (copy)
		local ReducedResult = ReducedFunction(p1)
		local FrameResult = Host.Frame(p1.props(p4, { "target", "progress", "color", "mode" }, {
			BackgroundTransparency = 1,
			Size = p1.types.UDim2.fromOffset(0, 0)
		}))
		local OverlayResult = p3.overlay(FrameResult, true, function()
			-- upvalues: p3 (upval), FrameResult (copy), p1 (upval), Host (upval), Compose (upval), p4 (copy), ReducedResult (copy)
			local Frame = assert(p3.parent(FrameResult))
			local LayoutUnitResult = p1.layoutUnit(Frame)
			local FacetFlash = p1.styled(Host.Frame({
				Name = "FlashPaint",
				BorderSizePixel = 0,
				ZIndex = 1000,
				Active = false,
				Interactable = false,
				Selectable = false
			}), "facet-flash")
			Compose.watch(function(Callback)
				-- upvalues: p1 (upval), p4 (upval), LayoutUnitResult (copy), FacetFlash (copy), ReducedResult (upval), Frame (copy)
				local ReadResult = p1.read(p4.target, Callback)
				assert(ReadResult:IsA("GuiObject"), "Facet Flash requires a GuiObject target")
				p1.read(p1.observe.AbsolutePosition(ReadResult), Callback)
				p1.read(p1.observe.AbsoluteSize(ReadResult), Callback)
				local AbsolutePosition = ReadResult.AbsolutePosition
				local AbsoluteSize = ReadResult.AbsoluteSize
				local ClampedValue = math.clamp(p1.read(p4.progress, Callback), 0, 1)
				local Largest = math.max(Callback(LayoutUnitResult), 0.001)
				FacetFlash.Visible = not ReducedResult(Callback) and (ReadResult.Parent ~= nil and (ReadResult.Visible and (ClampedValue > 0 and ClampedValue < 1)))
				FacetFlash.Position = p1.types.UDim2.fromOffset((AbsolutePosition.X - Frame.AbsolutePosition.X) / Largest, (AbsolutePosition.Y - Frame.AbsolutePosition.Y) / Largest)
				FacetFlash.Size = p1.types.UDim2.fromOffset(AbsoluteSize.X / Largest * (if p4.mode == "sweep" then ClampedValue else 1), AbsoluteSize.Y / Largest)
				
				if p4.color then
					FacetFlash.BackgroundColor3 = p1.read(p4.color, Callback)
				end
				FacetFlash.BackgroundTransparency = 1 - ClampedValue * 4 * (1 - ClampedValue)
			end)
			
			return FacetFlash
		end)
		Runtime.mountFragment(function()
			-- upvalues: OverlayResult (copy)
			return { OverlayResult }
		end, FrameResult)
		
		return FrameResult
	end)
end