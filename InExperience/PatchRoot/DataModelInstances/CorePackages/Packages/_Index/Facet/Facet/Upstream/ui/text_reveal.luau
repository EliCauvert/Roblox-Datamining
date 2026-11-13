local _ = require("./types")
local _ = require("../vendor/compose/core")
local ReducedFunction = require("./motion").reduced
local self = setmetatable({}, { __mode = "k" })

return function(p1, Label, p2)
	-- upvalues: ReducedFunction (copy), self (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesUDim2 = p1.types.UDim2
	local Frames = Runtime.host.frames
	
	if Frames ~= nil then
		local ReducedResult = ReducedFunction(p1)
		local TextFitsResult = p1.observe.TextFits(Label)
		local TextResult = p1.observe.Text(Label)
		local CellResult = Compose.cell(0)
		local End = "rest"
		local Total = 0
		local LargestRatio = nil
		local MountFragmentResult: (() -> ())? = nil
		local OnFrameResult: (() -> ())? = nil
		
		local function _()
			-- upvalues: MountFragmentResult (ref), self (upval), p1 (copy), Label (copy), LargestRatio (ref)
			if MountFragmentResult then
				MountFragmentResult()
				MountFragmentResult = nil
			end
			if self[p1] == Label then
				self[p1] = nil
			end
			LargestRatio = nil
		end
		
		local function strip()
			-- upvalues: p1 (copy), TextResult (copy), TypesUDim2 (copy), Label (copy), Host (copy), Runtime (copy), CellResult (copy), Compose (copy), LargestRatio (ref)
			local Full = p1.text({
				Name = "Full",
				Text = function(Callback)
					-- upvalues: TextResult (upval)
					return Callback(TextResult)
				end,
				Size = TypesUDim2.fromScale(0, 1),
				AutomaticSize = p1.types.Enum.AutomaticSize.X,
				TextYAlignment = Label.TextYAlignment,
				RichText = Label.RichText
			})
			
			for _, tag in Label:GetTags() do
				Full:AddTag(tag)
			end
			local TextBoundsResult = p1.observe.TextBounds(Label)
			local v1 = Host.Frame("Reveal")({
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = function(Callback)
					-- upvalues: TypesUDim2 (upval), TextBoundsResult (copy)
					return TypesUDim2.new(1, 0, 0, Callback(TextBoundsResult).Y)
				end,
				Full
			})
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(v1)
			local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Full)
			Runtime.decorate(Full, {
				Position = function(Callback)
					-- upvalues: AbsoluteSizeResult (copy), AbsoluteSizeResult1 (copy), TypesUDim2 (upval), CellResult (upval)
					local X: number = Callback(AbsoluteSizeResult).X
					local Largest = math.max(0, Callback(AbsoluteSizeResult1).X - X)
					local NewLargest = Largest + (if Largest > 0 then 2 else 0)
					
					return TypesUDim2.fromScale(if X > 0 then -NewLargest / X * Callback(CellResult) else 0, 0)
				end
			})
			Compose.watch(function(Callback)
				-- upvalues: AbsoluteSizeResult (copy), AbsoluteSizeResult1 (copy), TextResult (upval), LargestRatio (upval)
				local X: number = Callback(AbsoluteSizeResult).X
				local X1: number = Callback(AbsoluteSizeResult1).X
				local Length: number = utf8.len(Callback(TextResult)) or 0
				LargestRatio = if X1 > 0 then math.max(0, X1 - X) / X1 * Length / 3 else nil
			end)
			
			return {
				v1,
				Host.UIGradient("RevealHold")({ Transparency = p1.types.NumberSequence.new(1) })
			}
		end
		
		local function step(Amount: number)
			-- upvalues: Total (ref), End (ref), self (upval), p1 (copy), Label (copy), MountFragmentResult (ref), Runtime (copy), strip (copy), LargestRatio (ref), CellResult (copy)
			Total += Amount
			
			if End ~= "rest" then
				if End ~= "end" then
					if LargestRatio == nil then
						Total = 0
						
						return
					end
					local LargestRatio1: number = LargestRatio
					local Smallest: number = if LargestRatio1 > 0 then math.min(1, Total / LargestRatio1) else 1
					CellResult:set(if End == "out" then Smallest else 1 - Smallest)
					
					if Smallest >= 1 then
						if End == "back" then
							if MountFragmentResult then
								MountFragmentResult()
								MountFragmentResult = nil
							end
							if self[p1] == Label then
								self[p1] = nil
							end
							LargestRatio = nil
						end
						End = if End == "out" then "end" else "rest"
						Total = 0
					end
				elseif Total >= 1.2 then
					End = "back"
					Total = 0
					
					return
				end
			elseif Total >= 1.2 and self[p1] == nil then
				self[p1] = Label
				MountFragmentResult = Runtime.mountFragment(strip, Label)
				End = "out"
				Total = 0
				
				return
			end
		end
		
		local function reset()
			-- upvalues: OnFrameResult (ref), MountFragmentResult (ref), self (upval), p1 (copy), Label (copy), LargestRatio (ref), End (ref), Total (ref), CellResult (copy)
			if OnFrameResult then
				OnFrameResult()
				OnFrameResult = nil
			end
			if MountFragmentResult then
				MountFragmentResult()
				MountFragmentResult = nil
			end
			if self[p1] == Label then
				self[p1] = nil
			end
			LargestRatio = nil
			End = "rest"
			Total = 0
			CellResult:set(0)
		end
		
		Compose.watch(function(Callback)
			-- upvalues: TextResult (copy), TextFitsResult (copy), ReducedResult (copy), p2 (copy), OnFrameResult (ref), MountFragmentResult (ref), self (upval), p1 (copy), Label (copy), LargestRatio (ref), End (ref), Total (ref), CellResult (copy), Frames (copy), step (copy)
			Callback(TextResult)
			local Inverted: boolean = not Callback(TextFitsResult) and (not ReducedResult(Callback) and not Callback(p2))
			
			if OnFrameResult then
				OnFrameResult()
				OnFrameResult = nil
			end
			if MountFragmentResult then
				MountFragmentResult()
				MountFragmentResult = nil
			end
			if self[p1] == Label then
				self[p1] = nil
			end
			LargestRatio = nil
			End = "rest"
			Total = 0
			CellResult:set(0)
			
			if Inverted then
				OnFrameResult = Frames.onFrame(step)
			end
		end)
		Compose.cleanup(reset)
		
		return
	end
end