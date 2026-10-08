local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(viewRecyclerReact ~= nil, "StoryShell must be mounted under view-recycler-react")
local scenarioBannerModule = require(script.Parent.ScenarioBanner)
local createElement = require(viewRecyclerReact.Parent.React).createElement
local uDim2 = UDim2.fromOffset(1280, 720)

local function Component(p1)
	-- upvalues: createElement (ref), uDim2 (ref), scenarioBannerModule (ref)
	local var1 = p1.captureMode == true
	local var2 = if var1 then 44 else p1.bannerHeight or 140
	local var3 = if p1.toolbar == nil then 0 else p1.toolbarHeight or 42
	local children = p1.children
	
	if var1 then
		children = table.clone(p1.children or {})
		children.CaptureLayout = createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	end
	return createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(20, 20, 26),
		Size = if var1 then uDim2 else p1.size or UDim2.fromOffset(760, 700)
	}, {
		Banner = if var1 then createElement("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 18,
			BackgroundColor3 = Color3.fromRGB(25, 26, 34),
			Font = Enum.Font.BuilderSansBold,
			Size = UDim2.new(1, 0, 0, var2),
			Text = `{p1.title} \194\183 Behavior demonstration \226\128\148 not a device benchmark`,
			TextColor3 = Color3.fromRGB(245, 247, 251)
		}) else createElement(scenarioBannerModule, {
			acceptanceCriteria = p1.acceptanceCriteria,
			height = var2,
			instructions = p1.instructions,
			itemUpdate = p1.itemUpdate,
			title = p1.title
		}),
		Status = if p1.status == nil then nil else createElement("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 13,
			BackgroundColor3 = Color3.fromRGB(25, 26, 34),
			Font = Enum.Font.Code,
			Position = UDim2.fromOffset(0, var2),
			Size = UDim2.new(1, 0, 0, 30),
			Text = p1.status,
			TextColor3 = Color3.fromRGB(226, 226, 233),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Toolbar = if p1.toolbar == nil then nil else createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(25, 26, 34),
			Position = UDim2.fromOffset(0, var2 + (if p1.status == nil then 0 else 30)),
			Size = UDim2.new(1, 0, 0, var3)
		}, { Content = p1.toolbar }),
		Content = createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Position = UDim2.fromOffset(0, var2 + (if p1.status == nil then 0 else 30) + var3),
			Size = UDim2.new(1, 0, 1, -(var2 + (if p1.status == nil then 0 else 30) + var3))
		}, children)
	})
end

return {
	Component = Component,
	createStory = function(p1, p2)
		-- upvalues: createElement (ref), Component (ref)
		return function(p3)
			-- upvalues: createElement (copy), Component (copy), p1 (ref), p2 (ref)
			return createElement(Component, {
				acceptanceCriteria = p1.acceptanceCriteria,
				captureMode = (p3.controls or {}).captureMode == true,
				instructions = p1.instructions,
				itemUpdate = p1.itemUpdate,
				size = p1.size,
				title = p1.title
			}, { Scenario = createElement(p2, p3) })
		end
	end
}