local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactUtilsModule = require(parent_1.ReactUtils)
local mockStyleComponentModule = require(parent.Utility.mockStyleComponent)
local render = require(parent_1.Dev.ReactTestingLibrary).render
local benchmark = require(parent_1.Dev.JestBenchmark).benchmark

function measureFPS(p0, p1) --[[ line: 14 ]]
	task.wait()
	task.wait()
	p0.start("fps")
	task.wait(p1 or 0.5)
	p0.stop()
end

function mountComponentTimes(p2, p3, p4) --[[ line: 22 ]]
	-- upvalues: mockStyleComponentModule (ref), benchmark (ref), render (ref)
	local t = {}
	
	for i = 1, p3 do
		t[i] = p2
	end
	local var4 = mockStyleComponentModule(t)
	benchmark(`Mount {p4} {p3} times`, function() --[[ line: 29 ]]
		-- upvalues: render (copy), var4 (ref)
		render(var4):unmount()
	end)
end

function AutoScrollingFrame(p5) --[[ line: 35 ]]
	-- upvalues: reactUtilsModule (ref), reactModule (ref)
	return reactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromOffset(100, 100),
		CanvasSize = UDim2.fromOffset(100, 0),
		CanvasPosition = reactUtilsModule.useClock():map(function(p6) --[[ line: 41 ]]
			return Vector2.new(0, p6 * 10000)
		end),
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, p5.children)
end

function scrollComponentTimes(p7, p8, p9) --[[ line: 48 ]]
	-- upvalues: reactModule (ref), mockStyleComponentModule (ref), benchmark (ref), render (ref)
	local t = {}
	
	for i = 1, p8 do
		t[i] = p7
	end
	t[p8 + 1] = reactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		FillDirection = Enum.FillDirection.Vertical
	})
	local var6 = mockStyleComponentModule(reactModule.createElement(AutoScrollingFrame, {}, t))
	benchmark(`Scroll {p9} {p8} times`, function(p10) --[[ line: 62 ]]
		-- upvalues: render (copy), var6 (ref)
		local var7 = render(var6)
		measureFPS(p10)
		var7:unmount()
	end)
end

return {
	mountComponentTimes = mountComponentTimes,
	scrollComponentTimes = scrollComponentTimes,
	measureFPS = measureFPS
}