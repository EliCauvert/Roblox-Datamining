local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactUtilsModule = require(parent_1.ReactUtils)
local mockStyleComponentModule = require(parent.Utility.mockStyleComponent)
local render = require(parent_1.Dev.ReactTestingLibrary).render
local benchmark = require(parent_1.Dev.JestBenchmark).benchmark

function measureFPS(p1, p2)
	task.wait()
	task.wait()
	p1.start("fps")
	task.wait(p2 or 0.5)
	p1.stop()
end

function mountComponentTimes(p1, p2, p3)
	-- upvalues: mockStyleComponentModule (ref), benchmark (ref), render (ref)
	local t = {}
	
	for i = 1, p2 do
		t[i] = p1
	end
	local var1 = mockStyleComponentModule(t)
	benchmark(`Mount {p3} {p2} times`, function()
		-- upvalues: render (copy), var1 (ref)
		render(var1):unmount()
	end)
end

function AutoScrollingFrame(p4)
	-- upvalues: reactUtilsModule (ref), reactModule (ref)
	return reactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromOffset(100, 100),
		CanvasSize = UDim2.fromOffset(100, 0),
		CanvasPosition = reactUtilsModule.useClock():map(function(p5)
			return Vector2.new(0, p5 * 10000)
		end),
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, p4.children)
end

function scrollComponentTimes(p4, p5, p6)
	-- upvalues: reactModule (ref), mockStyleComponentModule (ref), benchmark (ref), render (ref)
	local t = {}
	
	for i = 1, p5 do
		t[i] = p4
	end
	t[p5 + 1] = reactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		FillDirection = Enum.FillDirection.Vertical
	})
	local var2 = mockStyleComponentModule(reactModule.createElement(AutoScrollingFrame, {}, t))
	benchmark(`Scroll {p6} {p5} times`, function(p7)
		-- upvalues: render (copy), var2 (ref)
		local var3 = render(var2)
		measureFPS(p7)
		var3:unmount()
	end)
end

return {
	mountComponentTimes = mountComponentTimes,
	scrollComponentTimes = scrollComponentTimes,
	measureFPS = measureFPS
}