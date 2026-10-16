local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SetScreenSizeModule = require(script.Parent.Parent.Parent.Actions.SetScreenSize)
local EventConnectionModule = require(script.Parent.EventConnection)
local ScreenSizeConnector = RoactModule.PureComponent:extend("ScreenSizeConnector")

function ScreenSizeConnector.init(p1) --[[ Line: 15 ]]
	-- upvalues: RoactModule (copy)
	p1.state = { layerCollector = nil }
	p1.folderRef = RoactModule.createRef()
end

function ScreenSizeConnector.render(p1) --[[ Line: 23 ]]
	-- upvalues: RoactModule (copy), EventConnectionModule (copy)
	if p1.state.layerCollector then
		local AbsoluteSize = p1.state.layerCollector.AbsoluteSize
		p1.props.setScreenSize(AbsoluteSize.X, AbsoluteSize.Y)
		
		return RoactModule.createElement(EventConnectionModule, {
			event = p1.state.layerCollector:GetPropertyChangedSignal("AbsoluteSize"),
			callback = function() --[[ Line: 29 ]]
				-- upvalues: AbsoluteSize (ref), p1 (copy)
				AbsoluteSize = p1.state.layerCollector.AbsoluteSize
				p1.props.setScreenSize(AbsoluteSize.X, AbsoluteSize.Y)
			end
		})
	else
		local AbsoluteSize = RoactModule
		AbsoluteSize = AbsoluteSize.createElement
		
		return AbsoluteSize("Folder", { [RoactModule.Ref] = p1.folderRef })
	end
end

function ScreenSizeConnector.watchFolderAncestery(p1) --[[ Line: 41 ]]
	if p1.folderRef.current and p1.ancesteryConnection == nil then
		local LayerCollector = p1.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector")
		
		if LayerCollector then
			p1:setState({ layerCollector = LayerCollector })
		else
			p1.ancesteryConnection = p1.folderRef.current.AncestryChanged:Connect(function() --[[ Line: 49 ]]
				-- upvalues: p1 (copy), LayerCollector (ref)
				if p1.folderRef.current then
					LayerCollector = p1.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector")
					
					if LayerCollector then
						p1:setState({ layerCollector = LayerCollector })
					end
				end
			end)
		end
	end
end

function ScreenSizeConnector.didMount(p1) --[[ Line: 63 ]]
	p1:watchFolderAncestery()
end

function ScreenSizeConnector.didUpdate(p1) --[[ Line: 67 ]]
	if not p1.state.layerCollector then
		p1:watchFolderAncestery()
		
		return
	end
	if p1.ancesteryConnection then
		p1.ancesteryConnection:Disconnect()
		p1.ancesteryConnection = nil
	end
end

function ScreenSizeConnector.willUnmount(p1) --[[ Line: 76 ]]
	if p1.ancesteryConnection then
		p1.ancesteryConnection:Disconnect()
		p1.ancesteryConnection = nil
	end
end

return RoactRoduxModule.connect(nil, function(Callback) --[[ Line: 83 | Named "mapDispatchToProps" ]]
	-- upvalues: SetScreenSizeModule (copy)
	return {
		setScreenSize = function(p1, p2) --[[ Line: 85 ]]
			-- upvalues: Callback (copy), SetScreenSizeModule (upval)
			return Callback(SetScreenSizeModule(p1, p2))
		end
	}
end)(ScreenSizeConnector)