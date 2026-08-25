local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local roactModule = require(corePackagesService.Packages.Roact)
local _ = require(corePackagesService.Packages.RoactRodux)
local _ = require(corePackagesService.Packages.UIBlox).App.ImageSet.Images
local watermarkComponent = roactModule.PureComponent:extend("WatermarkComponent")
local policyService = game:GetService("PolicyService")

function watermarkComponent.init(p0)
	-- upvalues: runService (ref), policyService (ref)
	local function UpdateWatermarkVisibility()
		-- upvalues: p0 (ref), runService (copy), policyService (copy)
		p0:setState({
			watermarkVisible = not runService:IsStudio() and (policyService.IsLuobuServer == Enum.TriStateBoolean.True and policyService.LuobuWhitelisted == Enum.TriStateBoolean.False)
		})
	end
	
	policyService:GetPropertyChangedSignal("IsLuobuServer"):connect(function()
		-- upvalues: UpdateWatermarkVisibility (ref)
		UpdateWatermarkVisibility()
	end)
	policyService:GetPropertyChangedSignal("LuobuWhitelisted"):connect(function()
		-- upvalues: UpdateWatermarkVisibility (ref)
		UpdateWatermarkVisibility()
	end)
	p0:setState({
		watermarkVisible = false,
		absoluteSize = Vector2.new(0, 0)
	})
	
	function p0.onAbsoluteSizeChange(p1)
		-- upvalues: p0 (ref)
		p0:setState({ absoluteSize = p1.AbsoluteSize })
	end
	
	UpdateWatermarkVisibility()
end

function watermarkComponent.render(p2)
	-- upvalues: roactModule (ref)
	local function _()
		-- upvalues: p2 (ref)
		return p2.state.absoluteSize.X * 0.968147640378 + p2.state.absoluteSize.Y * 0.250380004054
	end
	
	local _ = function()
		-- upvalues: p2 (ref)
		return p2.state.absoluteSize.Y * 0.968147640378 + p2.state.absoluteSize.X * 0.250380004054
	end
	
	return p2.state.watermarkVisible and roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = 10,
		[roactModule.Change.AbsoluteSize] = p2.onAbsoluteSizeChange
	}, {
		FullScreenFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Rotation = 14.5,
			Size = UDim2.new(0, p2.state.absoluteSize.X * 0.968147640378 + p2.state.absoluteSize.Y * 0.250380004054, 0, p2.state.absoluteSize.Y * 0.968147640378 + p2.state.absoluteSize.X * 0.250380004054),
			Position = UDim2.new(0, (p2.state.absoluteSize.X - (p2.state.absoluteSize.X * 0.968147640378 + p2.state.absoluteSize.Y * 0.250380004054)) * 0.5, 0, (p2.state.absoluteSize.Y - (p2.state.absoluteSize.Y * 0.968147640378 + p2.state.absoluteSize.X * 0.250380004054)) * 0.5)
		}, (function()
			-- upvalues: p2 (ref), roactModule (copy)
			local ceiled = math.ceil((p2.state.absoluteSize.X * 0.968147640378 + p2.state.absoluteSize.Y * 0.250380004054) / 450)
			local t = {}
			
			for i_1 = 0, math.ceil((p2.state.absoluteSize.Y * 0.968147640378 + p2.state.absoluteSize.X * 0.250380004054) / 450) - 1 do
				for i = 0, ceiled - 1 do
					table.insert(t, roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextTransparency = 0.75,
						Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130",
						TextSize = 30,
						TextColor3 = Color3.new(1, 1, 1),
						Size = UDim2.new(0, 225, 0, 225),
						Position = UDim2.new(0, i * 450, 0, i_1 * 450)
					}))
					table.insert(t, roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextTransparency = 0.91,
						Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130",
						TextSize = 30,
						TextColor3 = Color3.new(0, 0, 0),
						Size = UDim2.new(0, 225, 0, 225),
						Position = UDim2.new(0, i * 450 + 1, 0, i_1 * 450 + 1)
					}))
					table.insert(t, roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextTransparency = 0.75,
						Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130",
						TextSize = 30,
						TextColor3 = Color3.new(1, 1, 1),
						Size = UDim2.new(0, 225, 0, 225),
						Position = UDim2.new(0, i * 450 + 225, 0, i_1 * 450 + 225)
					}))
					table.insert(t, roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextTransparency = 0.91,
						Text = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130",
						TextSize = 30,
						TextColor3 = Color3.new(0, 0, 0),
						Size = UDim2.new(0, 225, 0, 225),
						Position = UDim2.new(0, i * 450 + 226, 0, i_1 * 450 + 226)
					}))
				end
			end
			return t
		end)())
	}) or nil
end

return watermarkComponent