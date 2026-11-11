local Parent = script:FindFirstAncestor("BenchmarkUtils").Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local RenderFunction = require(Parent.ReactTestingLibrary).render
local BenchmarkFunction = require(Parent.JestBenchmark).benchmark
local DescribeFunction = require(Parent.JestGlobals).describe

local function AutoScrollingFrame(p1)
	-- upvalues: ReactUtilsModule (copy), ReactModule (copy)
	return ReactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromOffset(100, 100),
		CanvasSize = UDim2.fromOffset(100, 0),
		CanvasPosition = ReactUtilsModule.useClock():map(function(p2: number): Vector2
			return Vector2.new(0, p2 * 10000)
		end),
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, p1.children)
end

return {
	DEFAULT_MOUNT_TIMES = 200,
	DEFAULT_SCROLL_TIMES = 200,
	DEFAULT_FPS_DURATION = 0.5,
	benchFile = function(p1, p2)
		-- upvalues: DescribeFunction (copy)
		DescribeFunction(string.gsub(p1.Name, "%.bench$", ""), p2)
	end,
	measureFPS = function(p1, p2)
		task.wait()
		task.wait()
		p1.start("fps")
		task.wait(p2 or 0.5)
		p1.stop()
	end,
	mountComponentTimes = function(p1, p2, p3)
		-- upvalues: BenchmarkFunction (copy), ReactModule (copy), RenderFunction (copy)
		local P4 = p3 or 200
		BenchmarkFunction(`Mount {p2} {P4} times`, function()
			-- upvalues: P4 (copy), p1 (copy), ReactModule (upval), RenderFunction (upval)
			local t = {}
			
			for i = 1, P4 do
				t[i] = p1
			end
			RenderFunction((ReactModule.createElement("Frame", { Size = UDim2.fromScale(1, 1) }, t))):unmount()
		end)
	end,
	scrollComponentTimes = function(p4, p5, p6)
		-- upvalues: ReactModule (copy), AutoScrollingFrame (copy), BenchmarkFunction (copy), RenderFunction (copy)
		local P9 = p6 or 200
		local Children = {}
		
		for i = 1, P9 do
			Children[i] = p4
		end
		Children[P9 + 1] = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirection = Enum.FillDirection.Vertical
		})
		local ScreenGui = ReactModule.createElement("ScreenGui", {}, {
			Content = ReactModule.createElement(AutoScrollingFrame, { children = Children })
		})
		BenchmarkFunction(`Scroll {p5} {P9} times`, function(p7)
			-- upvalues: RenderFunction (upval), ScreenGui (copy)
			local RenderResult = RenderFunction(ScreenGui)
			task.wait()
			task.wait()
			p7.start("fps")
			task.wait(0.5)
			p7.stop()
			RenderResult:unmount()
		end)
	end,
	benchmarkRender = function(p7, p8)
		-- upvalues: BenchmarkFunction (copy), RenderFunction (copy)
		BenchmarkFunction(`Render {p8}`, function()
			-- upvalues: RenderFunction (upval), p7 (copy)
			RenderFunction(p7):unmount()
		end)
	end,
	benchmarkRerender = function(Callback, p7, Entry)
		-- upvalues: BenchmarkFunction (copy), RenderFunction (copy)
		assert(#Entry > 0, "propChanges must contain at least one element")
		BenchmarkFunction(`Rerender {p7} with prop changes`, function()
			-- upvalues: RenderFunction (upval), Callback (copy), Entry (copy)
			local RenderResult = RenderFunction(Callback(Entry[1]))
			
			for i = 2, #Entry do
				RenderResult:rerender(Callback(Entry[i]))
			end
			RenderResult:unmount()
		end)
	end,
	AutoScrollingFrame = AutoScrollingFrame
}