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

function AutoScrollingFrame(p1)
	-- upvalues: reactUtilsModule (ref), reactModule (ref)
	return reactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromOffset(100, 100),
		CanvasSize = UDim2.fromOffset(100, 0),
		CanvasPosition = reactUtilsModule.useClock():map(function(p1)
			return Vector2.new(0, p1 * 10000)
		end),
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, p1.children)
end

function scrollComponentTimes(p1, p2, p3)
	-- upvalues: reactModule (ref), mockStyleComponentModule (ref), benchmark (ref), render (ref)
	local t = {}
	
	for i = 1, p2 do
		t[i] = p1
	end
	t[p2 + 1] = reactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		FillDirection = Enum.FillDirection.Vertical
	})
	local var1 = mockStyleComponentModule(reactModule.createElement(AutoScrollingFrame, {}, t))
	benchmark(`Scroll {p3} {p2} times`, function(p1)
		-- upvalues: render (copy), var1 (ref)
		local var1 = render(var1)
		measureFPS(p1)
		var1:unmount()
	end)
end

return {
	mountComponentTimes = mountComponentTimes,
	scrollComponentTimes = scrollComponentTimes,
	measureFPS = measureFPS
}