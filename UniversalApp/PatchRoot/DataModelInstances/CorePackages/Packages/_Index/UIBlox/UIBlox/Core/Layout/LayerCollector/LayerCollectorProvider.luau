local roactModule = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local layerCollectorContextModule = require(script.Parent.LayerCollectorContext)
local guiService = game:GetService("GuiService")
local layerCollectorProvider = roactModule.PureComponent:extend("LayerCollectorProvider")

function layerCollectorProvider.init(p1)
	-- upvalues: roactModule (ref)
	p1.rootRef = roactModule.createRef()
	p1.state = {
		absoluteSize = Vector2.new(0, 0),
		insets = { top = 0, left = 0, bottom = 0, right = 0 }
	}
end

function layerCollectorProvider.watchLayerCollector(p1, p2)
	-- upvalues: guiService (ref)
	local absoluteSize = p2.AbsoluteSize
	local vector2 = Vector2.new(0, 0)
	local vector2_1 = Vector2.new(0, 0)
	
	if p2:IsA("ScreenGui") then
		local ok, status = pcall(function()
			-- upvalues: p2 (ref)
			return p2.IgnoreGuiInset
		end)
		
		if ok and status then
			local guiInset, guiInset_1 = guiService:GetGuiInset()
			vector2 = guiInset
			vector2_1 = guiInset_1
		end
	end
	p1:setState({
		absoluteSize = absoluteSize,
		insets = {
			top = vector2.Y,
			left = vector2.X,
			bottom = vector2_1.Y,
			right = vector2_1.X
		}
	})
	p1.absoluteSizeConnection = p2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: absoluteSize (write), p2 (ref), p1 (ref), vector2 (write), vector2_1 (write)
		absoluteSize = p2.AbsoluteSize
		p1:setState({
			absoluteSize = absoluteSize,
			insets = {
				top = vector2.Y,
				left = vector2.X,
				bottom = vector2_1.Y,
				right = vector2_1.X
			}
		})
	end)
end

function layerCollectorProvider.didMount(p1)
	local current = p1.rootRef.current
	local layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
	
	if layerCollector == nil then
		p1.ancestryConnection = current.AncestryChanged:Connect(function()
			-- upvalues: layerCollector (write), current (ref), p1 (ref)
			layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if layerCollector ~= nil then
				p1.ancestryConnection:Disconnect()
				p1.ancestryConnection = nil
				p1:watchLayerCollector(layerCollector)
			end
		end)
	else
		p1:watchLayerCollector(layerCollector)
	end
end

function layerCollectorProvider.render(p1)
	-- upvalues: roactModule (ref), layerCollectorContextModule (ref)
	return roactModule.createElement(layerCollectorContextModule.Provider, {
		value = {
			absoluteSize = p1.state.absoluteSize,
			insets = p1.state.insets
		}
	}, {
		LayerCollectorChildRef = roactModule.createElement("Frame", { Visible = false, [roactModule.Ref] = p1.rootRef }),
		Children = roactModule.createFragment(p1.props[roactModule.Children])
	})
end

return layerCollectorProvider