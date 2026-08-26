local parent = script.Parent.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local roactGamepadModule = require(parent.RoactGamepad)
local cryoModule = require(parent.Cryo)
local cursorKindModule = require(script.Parent.CursorKind)
local selectionImageContextModule = require(script.Parent.SelectionImageContext)
local onRootedListenerModule = require(script.Parent.OnRootedListener)
local guiService = game:GetService("GuiService")
local coreGuiService = game:GetService("CoreGui")
local selectionCursorProvider = roactModule.PureComponent:extend("SelectionCursorProvider")

function selectionCursorProvider.init(p1)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), cursorKindModule (ref), cryoModule (ref), coreGuiService (ref), guiService (ref)
	p1.ref = roactModule.createRef()
	p1.refs = roactGamepadModule.createRefCache()
	p1.state = {
		currentSelection = nil,
		currentCoreSelection = nil,
		mountedCursors = {}
	}
	
	function p0.getSelectionCursor(p2)
		-- upvalues: cursorKindModule (copy), p1 (ref), cryoModule (copy)
		assert(cursorKindModule.isEnumValue(p2), ("Invalid arg #1: expected a CursorKind enum variant, got %s"):format(tostring(p2)))
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		
		if p1.state.mountedCursors[p2] == nil then
			p1:setState(function(p3)
				-- upvalues: cryoModule (copy), p2 (ref)
				return {
					mountedCursors = cryoModule.Dictionary.join(p3.mountedCursors, { [p2] = true })
				}
			end)
		end
		return p1.refs[p2]
	end
	
	function p0.initSelectionChangedListener(p2)
		-- upvalues: p1 (ref), coreGuiService (copy), guiService (copy)
		if p2 == nil then return end
		if p1.coreSelectionListener ~= nil then
			p1.coreSelectionListener:Disconnect()
			p1.coreSelectionListener = nil
		end
		if p1.selectionListener ~= nil then
			p1.selectionListener:Disconnect()
			p1.selectionListener = nil
		end
		if p2:IsDescendantOf(coreGuiService) then
			p1.coreSelectionListener = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: p1 (copy), guiService (copy)
				if p1.state.currentCoreSelection == nil or guiService.SelectedCoreObject == nil or p1.state.currentCoreSelection.SelectionImageObject ~= guiService.SelectedCoreObject.SelectionImageObject then
					p1:setState({ currentCoreSelection = guiService.SelectedCoreObject })
				end
			end)
			
			return
		end
		p1.selectionListener = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
			-- upvalues: p1 (copy), guiService (copy)
			if p1.state.currentSelection == nil or guiService.SelectedObject == nil or p1.state.currentSelection.SelectionImageObject ~= guiService.SelectedObject.SelectionImageObject then
				p1:setState({ currentSelection = guiService.SelectedObject })
			end
		end)
	end
end

function selectionCursorProvider.didMount(p1)
	p1.initSelectionChangedListener(p1.ref:getValue())
end

function selectionCursorProvider.willUnmount(p1)
	if p1.coreSelectionListener ~= nil then
		p1.coreSelectionListener:Disconnect()
		p1.coreSelectionListener = nil
	end
	if p1.selectionListener ~= nil then
		p1.selectionListener:Disconnect()
		p1.selectionListener = nil
	end
end

function selectionCursorProvider.render(p1)
	-- upvalues: roactModule (ref), selectionImageContextModule (ref), onRootedListenerModule (ref)
	local t = {}
	
	for i, v in pairs(p1.state.mountedCursors) do
		local var1 = i.rawValue()
		t[tostring(var1)] = roactModule.createElement(var1, {
			isVisible = not (p1.refs[i] == nil or (p1.state.currentSelection == nil or p1.refs[i].current ~= p1.state.currentSelection.SelectionImageObject) and (p1.state.currentCoreSelection == nil or p1.refs[i].current ~= p1.state.currentCoreSelection.SelectionImageObject)) and true,
			cursorRef = p1.refs[i]
		})
	end
	return roactModule.createElement(selectionImageContextModule.Provider, { value = p1.getSelectionCursor }, {
		CursorContainer = roactModule.createElement("Frame", { Visible = false, Size = UDim2.new(0, 0, 0, 0) }, t),
		OnRootedListener = roactModule.createElement(onRootedListenerModule, { onRooted = p1.initSelectionChangedListener }),
		Children = roactModule.createFragment(p1.props[roactModule.Children])
	})
end

return selectionCursorProvider