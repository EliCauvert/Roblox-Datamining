local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(ViewRecyclerReact ~= nil, "StoryShell must be mounted under view-recycler-react")
local ScenarioBannerModule = require(script.Parent.ScenarioBanner)
local CreateElementFunction = require(ViewRecyclerReact.Parent.React).createElement
local _UDim2 = UDim2.fromOffset(1280, 720)

local function Component(p1)
	-- upvalues: CreateElementFunction (copy), _UDim2 (copy), ScenarioBannerModule (copy)
	local IsCaptureMode = p1.captureMode == true
	local BannerHeight = if IsCaptureMode then 44 else p1.bannerHeight or 140
	local ToolbarHeight = if p1.toolbar == nil then 0 else p1.toolbarHeight or 42
	local Children = p1.children
	
	if IsCaptureMode then
		Children = table.clone(p1.children or {})
		Children.CaptureLayout = CreateElementFunction("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	end
	return CreateElementFunction("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(20, 20, 26),
		Size = if IsCaptureMode then _UDim2 else p1.size or UDim2.fromOffset(760, 700)
	}, {
		Banner = if IsCaptureMode then CreateElementFunction("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 18,
			BackgroundColor3 = Color3.fromRGB(25, 26, 34),
			Font = Enum.Font.BuilderSansBold,
			Size = UDim2.new(1, 0, 0, BannerHeight),
			Text = `{p1.title} · Behavior demonstration — not a device benchmark`,
			TextColor3 = Color3.fromRGB(245, 247, 251)
		}) else CreateElementFunction(ScenarioBannerModule, {
			acceptanceCriteria = p1.acceptanceCriteria,
			height = BannerHeight,
			instructions = p1.instructions,
			itemUpdate = p1.itemUpdate,
			title = p1.title
		}),
		Status = if p1.status == nil then nil else CreateElementFunction("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 13,
			BackgroundColor3 = Color3.fromRGB(25, 26, 34),
			Font = Enum.Font.Code,
			Position = UDim2.fromOffset(0, BannerHeight),
			Size = UDim2.new(1, 0, 0, 30),
			Text = p1.status,
			TextColor3 = Color3.fromRGB(226, 226, 233),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Toolbar = if p1.toolbar == nil then nil else CreateElementFunction("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(25, 26, 34),
			Position = UDim2.fromOffset(0, BannerHeight + (if p1.status == nil then 0 else 30)),
			Size = UDim2.new(1, 0, 0, ToolbarHeight)
		}, { Content = p1.toolbar }),
		Content = CreateElementFunction("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Position = UDim2.fromOffset(0, BannerHeight + (if p1.status == nil then 0 else 30) + ToolbarHeight),
			Size = UDim2.new(1, 0, 1, -(BannerHeight + (if p1.status == nil then 0 else 30) + ToolbarHeight))
		}, Children)
	})
end

return {
	Component = Component,
	createStory = function(p1, p2)
		-- upvalues: CreateElementFunction (copy), Component (copy)
		return function(p3)
			-- upvalues: CreateElementFunction (upval), Component (upval), p1 (copy), p2 (copy)
			return CreateElementFunction(Component, {
				acceptanceCriteria = p1.acceptanceCriteria,
				captureMode = (p3.controls or {}).captureMode == true,
				instructions = p1.instructions,
				itemUpdate = p1.itemUpdate,
				size = p1.size,
				title = p1.title
			}, { Scenario = CreateElementFunction(p2, p3) })
		end
	end
}