local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactUtilsModule = require(Parent1.ReactUtils)
local MockStyleComponentModule = require(Parent.Utility.mockStyleComponent)
local RenderFunction = require(Parent1.Dev.ReactTestingLibrary).render
local BenchmarkFunction = require(Parent1.Dev.JestBenchmark).benchmark

function measureFPS(p1, p2) --[[ Line: 14 ]]
	task.wait()
	task.wait()
	p1.start("fps")
	task.wait(p2 or 0.5)
	p1.stop()
end

function mountComponentTimes(p1, p2, p3) --[[ Line: 22 ]]
	-- upvalues: MockStyleComponentModule (copy), BenchmarkFunction (copy), RenderFunction (copy)
	local t = {}
	
	for i = 1, p2 do
		t[i] = p1
	end
	local MockStyleComponentModuleResult = MockStyleComponentModule(t)
	BenchmarkFunction(`Mount {p3} {p2} times`, function() --[[ Line: 29 ]]
		-- upvalues: RenderFunction (upval), MockStyleComponentModuleResult (copy)
		RenderFunction(MockStyleComponentModuleResult):unmount()
	end)
end

function AutoScrollingFrame(p4) --[[ Line: 35 ]]
	-- upvalues: ReactUtilsModule (copy), ReactModule (copy)
	return ReactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromOffset(100, 100),
		CanvasSize = UDim2.fromOffset(100, 0),
		CanvasPosition = ReactUtilsModule.useClock():map(function(p5: number): Vector2 --[[ Line: 41 ]]
			return Vector2.new(0, p5 * 10000)
		end),
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, p4.children)
end

function scrollComponentTimes(p4, p5: number, p6) --[[ Line: 48 ]]
	-- upvalues: ReactModule (copy), MockStyleComponentModule (copy), BenchmarkFunction (copy), RenderFunction (copy)
	local UIListLayouts = {}
	
	for i = 1, p5 do
		UIListLayouts[i] = p4
	end
	UIListLayouts[p5 + 1] = ReactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		FillDirection = Enum.FillDirection.Vertical
	})
	local MockStyleComponentModuleResult = MockStyleComponentModule(ReactModule.createElement(AutoScrollingFrame, {}, UIListLayouts))
	BenchmarkFunction(`Scroll {p6} {p5} times`, function(p7) --[[ Line: 62 ]]
		-- upvalues: RenderFunction (upval), MockStyleComponentModuleResult (copy)
		local RenderResult = RenderFunction(MockStyleComponentModuleResult)
		measureFPS(p7)
		RenderResult:unmount()
	end)
end

return {
	mountComponentTimes = mountComponentTimes,
	scrollComponentTimes = scrollComponentTimes,
	measureFPS = measureFPS
}