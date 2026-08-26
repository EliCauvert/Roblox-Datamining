local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local setScreenSizeModule = require(script.Parent.Parent.Parent.Actions.SetScreenSize)
local eventConnectionModule = require(script.Parent.EventConnection)
local screenSizeConnector = roactModule.PureComponent:extend("ScreenSizeConnector")

function screenSizeConnector.init(p1)
	-- upvalues: roactModule (ref)
	p1.state = { layerCollector = nil }
	p1.folderRef = roactModule.createRef()
end

function screenSizeConnector.render(p1)
	-- upvalues: roactModule (ref), eventConnectionModule (ref)
	if p1.state.layerCollector then
		local absoluteSize = p1.state.layerCollector.AbsoluteSize
		p1.props.setScreenSize(absoluteSize.X, absoluteSize.Y)
		
		return roactModule.createElement(eventConnectionModule, {
			event = p1.state.layerCollector:GetPropertyChangedSignal("AbsoluteSize"),
			callback = function()
				-- upvalues: absoluteSize (write), p1 (ref)
				absoluteSize = p1.state.layerCollector.AbsoluteSize
				p1.props.setScreenSize(absoluteSize.X, absoluteSize.Y)
			end
		})
	end
	return roactModule.createElement("Folder", { [roactModule.Ref] = p1.folderRef })
end

function screenSizeConnector.watchFolderAncestery(p1)
	if p1.folderRef.current and p1.ancesteryConnection == nil then
		local layerCollector = p1.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector")
		
		if layerCollector then
			p1:setState({ layerCollector = layerCollector })
		else
			p1.ancesteryConnection = p1.folderRef.current.AncestryChanged:Connect(function()
				-- upvalues: p1 (ref), layerCollector (write)
				if p1.folderRef.current then
					layerCollector = p1.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector")
					
					if layerCollector then
						p1:setState({ layerCollector = layerCollector })
					end
				end
			end)
		end
	end
end

function screenSizeConnector.didMount(p1)
	p1:watchFolderAncestery()
end

function screenSizeConnector.didUpdate(p1)
	if not p1.state.layerCollector then
		p1:watchFolderAncestery()
		
		return
	elseif p1.ancesteryConnection then
		p1.ancesteryConnection:Disconnect()
		p1.ancesteryConnection = nil
	end
end

function screenSizeConnector.willUnmount(p1)
	if p1.ancesteryConnection then
		p1.ancesteryConnection:Disconnect()
		p1.ancesteryConnection = nil
	end
end

return roactRoduxModule.connect(nil, function(p1)
	-- upvalues: setScreenSizeModule (ref)
	return {
		setScreenSize = function(value, p2)
			-- upvalues: p1 (ref), setScreenSizeModule (copy)
			return p1(setScreenSizeModule(value, p2))
		end
	}
end)(screenSizeConnector)