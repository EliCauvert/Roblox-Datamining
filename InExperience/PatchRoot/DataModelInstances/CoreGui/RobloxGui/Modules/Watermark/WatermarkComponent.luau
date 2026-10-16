local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local RoactModule = require(CorePackages.Packages.Roact)
local _ = require(CorePackages.Packages.RoactRodux)
local _ = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local WatermarkComponent = RoactModule.PureComponent:extend("WatermarkComponent")
local PolicyService = game:GetService("PolicyService")

function WatermarkComponent.init(p1) --[[ Line: 17 ]]
	-- upvalues: RunService (copy), PolicyService (copy)
	local function UpdateWatermarkVisibility() --[[ Line: 18 ]]
		-- upvalues: p1 (copy), RunService (upval), PolicyService (upval)
		p1:setState({
			watermarkVisible = not RunService:IsStudio() and (PolicyService.IsLuobuServer == Enum.TriStateBoolean.True and PolicyService.LuobuWhitelisted == Enum.TriStateBoolean.False)
		})
	end
	
	PolicyService:GetPropertyChangedSignal("IsLuobuServer"):connect(function() --[[ Line: 26 ]]
		-- upvalues: UpdateWatermarkVisibility (copy)
		UpdateWatermarkVisibility()
	end)
	PolicyService:GetPropertyChangedSignal("LuobuWhitelisted"):connect(function() --[[ Line: 30 ]]
		-- upvalues: UpdateWatermarkVisibility (copy)
		UpdateWatermarkVisibility()
	end)
	p1:setState({
		watermarkVisible = false,
		absoluteSize = Vector2.new(0, 0)
	})
	
	function p1.onAbsoluteSizeChange(Frame) --[[ Line: 39 ]]
		-- upvalues: p1 (copy)
		p1:setState({ absoluteSize = Frame.AbsoluteSize })
	end
	
	UpdateWatermarkVisibility()
end

function WatermarkComponent.render(p1) --[[ Line: 48 ]]
	-- upvalues: RoactModule (copy)
	local function _() --[[ Line: 49 | Named "CalculateRotatedFrameWidth" ]]
		-- upvalues: p1 (copy)
		return p1.state.absoluteSize.X * 0.9681476403781077 + p1.state.absoluteSize.Y * 0.25038000405444144
	end
	
	local _ = function() --[[ Line: 54 | Named "CalculateRotatedFrameHeight" ]]
		-- upvalues: p1 (copy)
		return p1.state.absoluteSize.Y * 0.9681476403781077 + p1.state.absoluteSize.X * 0.25038000405444144
	end
	
	local function CreateGridItems() --[[ Line: 59 ]]
		-- upvalues: p1 (copy), RoactModule (upval)
		local Ceiled = math.ceil((p1.state.absoluteSize.X * 0.9681476403781077 + p1.state.absoluteSize.Y * 0.25038000405444144) / 450)
		local List = {}
		
		for i = 0, math.ceil((p1.state.absoluteSize.Y * 0.9681476403781077 + p1.state.absoluteSize.X * 0.25038000405444144) / 450) - 1 do
			for i1 = 0, Ceiled - 1 do
				table.insert(List, RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextTransparency = 0.75,
					Text = "仅用于测试，\n非正式发表。",
					TextSize = 30,
					TextColor3 = Color3.new(1, 1, 1),
					Size = UDim2.new(0, 225, 0, 225),
					Position = UDim2.new(0, i1 * 450, 0, i * 450)
				}))
				table.insert(List, RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextTransparency = 0.91,
					Text = "仅用于测试，\n非正式发表。",
					TextSize = 30,
					TextColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(0, 225, 0, 225),
					Position = UDim2.new(0, i1 * 450 + 1, 0, i * 450 + 1)
				}))
				table.insert(List, RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextTransparency = 0.75,
					Text = "仅用于测试，\n非正式发表。",
					TextSize = 30,
					TextColor3 = Color3.new(1, 1, 1),
					Size = UDim2.new(0, 225, 0, 225),
					Position = UDim2.new(0, i1 * 450 + 225, 0, i * 450 + 225)
				}))
				table.insert(List, RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextTransparency = 0.91,
					Text = "仅用于测试，\n非正式发表。",
					TextSize = 30,
					TextColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(0, 225, 0, 225),
					Position = UDim2.new(0, i1 * 450 + 226, 0, i * 450 + 226)
				}))
			end
		end
		return List
	end
	
	return p1.state.watermarkVisible and RoactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = 10,
		[RoactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange
	}, {
		FullScreenFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Rotation = 14.5,
			Size = UDim2.new(0, p1.state.absoluteSize.X * 0.9681476403781077 + p1.state.absoluteSize.Y * 0.25038000405444144, 0, p1.state.absoluteSize.Y * 0.9681476403781077 + p1.state.absoluteSize.X * 0.25038000405444144),
			Position = UDim2.new(0, (p1.state.absoluteSize.X - (p1.state.absoluteSize.X * 0.9681476403781077 + p1.state.absoluteSize.Y * 0.25038000405444144)) * 0.5, 0, (p1.state.absoluteSize.Y - (p1.state.absoluteSize.Y * 0.9681476403781077 + p1.state.absoluteSize.X * 0.25038000405444144)) * 0.5)
		}, (CreateGridItems()))
	}) or nil
end

return WatermarkComponent