local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local setScreenSizeModule = require(script.Parent.Parent.Parent.Actions.SetScreenSize)
local eventConnectionModule = require(script.Parent.EventConnection)
local screenSizeConnector = roactModule.PureComponent:extend("ScreenSizeConnector")

function screenSizeConnector.init(p0) --[[ line: 15 ]]
	-- upvalues: roactModule (ref)
	p0.state = { layerCollector = nil }
	p0.folderRef = roactModule.createRef()
end

function screenSizeConnector.render(p1) --[[ line: 23 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref)
	if p1.state.layerCollector then
		local absoluteSize = p1.state.layerCollector.AbsoluteSize
		p1.props.setScreenSize(absoluteSize.X, absoluteSize.Y)
		
		return roactModule.createElement(eventConnectionModule, {
			event = p1.state.layerCollector:GetPropertyChangedSignal("AbsoluteSize"),
			callback = function() --[[ line: 29 ]]
				-- upvalues: absoluteSize (write), p1 (ref)
				absoluteSize = p1.state.layerCollector.AbsoluteSize
				p1.props.setScreenSize(absoluteSize.X, absoluteSize.Y)
			end
		})
	end
	return roactModule.createElement("Folder", { [roactModule.Ref] = p1.folderRef })
end

function screenSizeConnector.watchFolderAncestery(p2) --[[ line: 41 ]]
	if p2.folderRef.current and p2.ancesteryConnection == nil then
		local layerCollector = p2.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector")
		
		if layerCollector then
			p2:setState({ layerCollector = layerCollector })
		else
			p2.ancesteryConnection = p2.folderRef.current.AncestryChanged:Connect(function() --[[ line: 49 ]]
				-- upvalues: p2 (ref), layerCollector (write)
				if p2.folderRef.current then
					layerCollector = p2.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector")
					
					if layerCollector then
						p2:setState({ layerCollector = layerCollector })
					end
				end
			end)
		end
	end
end

function screenSizeConnector.didMount(p3) --[[ line: 63 ]]
	p3:watchFolderAncestery()
end

function screenSizeConnector.didUpdate(p4) --[[ line: 67 ]]
	if not p4.state.layerCollector then
		p4:watchFolderAncestery()
		
		return
	elseif p4.ancesteryConnection then
		p4.ancesteryConnection:Disconnect()
		p4.ancesteryConnection = nil
	end
end

function screenSizeConnector.willUnmount(p5) --[[ line: 76 ]]
	if p5.ancesteryConnection then
		p5.ancesteryConnection:Disconnect()
		p5.ancesteryConnection = nil
	end
end

return roactRoduxModule.connect(nil, function(p6) --[[ line: 83 | named "mapDispatchToProps" ]]
	-- upvalues: setScreenSizeModule (ref)
	return {
		setScreenSize = function(value, p7) --[[ line: 85 ]]
			-- upvalues: p6 (ref), setScreenSizeModule (copy)
			return p6(setScreenSizeModule(value, p7))
		end
	}
end)(screenSizeConnector)