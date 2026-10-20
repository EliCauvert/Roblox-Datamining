local RoactModule = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local LayerCollectorContextModule = require(script.Parent.LayerCollectorContext)
local GuiService = game:GetService("GuiService")
local LayerCollectorProvider = RoactModule.PureComponent:extend("LayerCollectorProvider")

function LayerCollectorProvider.init(p1)
	-- upvalues: RoactModule (copy)
	p1.rootRef = RoactModule.createRef()
	p1.state = {
		absoluteSize = Vector2.new(0, 0),
		insets = { top = 0, left = 0, bottom = 0, right = 0 }
	}
end

function LayerCollectorProvider.watchLayerCollector(p1, ScreenGui)
	-- upvalues: GuiService (copy)
	local AbsoluteSize = ScreenGui.AbsoluteSize
	local _Vector2 = Vector2.new(0, 0)
	local _Vector2_1 = Vector2.new(0, 0)
	
	if ScreenGui:IsA("ScreenGui") then
		local Success, Result = pcall(function()
			-- upvalues: ScreenGui (copy)
			return ScreenGui.IgnoreGuiInset
		end)
		
		if Success and Result then
			_Vector2, _Vector2_1 = GuiService:GetGuiInset()
		end
	end
	p1:setState({
		absoluteSize = AbsoluteSize,
		insets = {
			top = _Vector2.Y,
			left = _Vector2.X,
			bottom = _Vector2_1.Y,
			right = _Vector2_1.X
		}
	})
	p1.absoluteSizeConnection = ScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: AbsoluteSize (ref), ScreenGui (copy), p1 (copy), _Vector2 (ref), _Vector2_1 (ref)
		AbsoluteSize = ScreenGui.AbsoluteSize
		p1:setState({
			absoluteSize = AbsoluteSize,
			insets = {
				top = _Vector2.Y,
				left = _Vector2.X,
				bottom = _Vector2_1.Y,
				right = _Vector2_1.X
			}
		})
	end)
end

function LayerCollectorProvider.didMount(p1)
	local Current = p1.rootRef.current
	local LayerCollector = Current:FindFirstAncestorWhichIsA("LayerCollector")
	
	if LayerCollector == nil then
		p1.ancestryConnection = Current.AncestryChanged:Connect(function()
			-- upvalues: LayerCollector (ref), Current (copy), p1 (copy)
			LayerCollector = Current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector ~= nil then
				p1.ancestryConnection:Disconnect()
				p1.ancestryConnection = nil
				p1:watchLayerCollector(LayerCollector)
			end
		end)
	else
		p1:watchLayerCollector(LayerCollector)
	end
end

function LayerCollectorProvider.render(p1)
	-- upvalues: RoactModule (copy), LayerCollectorContextModule (copy)
	return RoactModule.createElement(LayerCollectorContextModule.Provider, {
		value = {
			absoluteSize = p1.state.absoluteSize,
			insets = p1.state.insets
		}
	}, {
		LayerCollectorChildRef = RoactModule.createElement("Frame", { Visible = false, [RoactModule.Ref] = p1.rootRef }),
		Children = RoactModule.createFragment(p1.props[RoactModule.Children])
	})
end

return LayerCollectorProvider