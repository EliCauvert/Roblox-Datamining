-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:57 2026 Pacific Standard Time.

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

function selectionCursorProvider.init(p0) --[[ line: 16 ]]
	-- upvalues: roactModule (ref), roactGamepadModule (ref), cursorKindModule (ref), cryoModule (ref), coreGuiService (ref), guiService (ref)
	p0.ref = roactModule.createRef()
	p0.refs = roactGamepadModule.createRefCache()
	p0.state = {
		currentSelection = nil,
		currentCoreSelection = nil,
		mountedCursors = {}
	}
	
	function p0.getSelectionCursor(p1) --[[ line: 25 ]]
		-- upvalues: cursorKindModule (copy), p0 (ref), cryoModule (copy)
		assert(cursorKindModule.isEnumValue(p1), ("Invalid arg #1: expected a CursorKind enum variant, got %s"):format(tostring(p1)))
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		
		if p0.state.mountedCursors[p1] == nil then
			p0:setState(function(p2) --[[ line: 33 ]]
				-- upvalues: cryoModule (copy), p1 (ref)
				return {
					mountedCursors = cryoModule.Dictionary.join(p2.mountedCursors, { [p1] = true })
				}
			end)
		end
		return p0.refs[p1]
	end
	
	function p0.initSelectionChangedListener(p3) --[[ line: 49 ]]
		-- upvalues: p0 (ref), coreGuiService (copy), guiService (copy)
		if p3 == nil then return end
		if p0.coreSelectionListener ~= nil then
			p0.coreSelectionListener:Disconnect()
			p0.coreSelectionListener = nil
		end
		if p0.selectionListener ~= nil then
			p0.selectionListener:Disconnect()
			p0.selectionListener = nil
		end
		if p3:IsDescendantOf(coreGuiService) then
			p0.coreSelectionListener = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ line: 66 ]]
				-- upvalues: p0 (copy), guiService (copy)
				if p0.state.currentCoreSelection == nil or guiService.SelectedCoreObject == nil or p0.state.currentCoreSelection.SelectionImageObject ~= guiService.SelectedCoreObject.SelectionImageObject then
					p0:setState({ currentCoreSelection = guiService.SelectedCoreObject })
				end
			end)
			
			return
		end
		p0.selectionListener = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ line: 79 ]]
			-- upvalues: p0 (copy), guiService (copy)
			if p0.state.currentSelection == nil or guiService.SelectedObject == nil or p0.state.currentSelection.SelectionImageObject ~= guiService.SelectedObject.SelectionImageObject then
				p0:setState({ currentSelection = guiService.SelectedObject })
			end
		end)
	end
end

function selectionCursorProvider.didMount(p4) --[[ line: 93 ]]
	p4.initSelectionChangedListener(p4.ref:getValue())
end

function selectionCursorProvider.willUnmount(p5) --[[ line: 97 ]]
	if p5.coreSelectionListener ~= nil then
		p5.coreSelectionListener:Disconnect()
		p5.coreSelectionListener = nil
	end
	if p5.selectionListener ~= nil then
		p5.selectionListener:Disconnect()
		p5.selectionListener = nil
	end
end

function selectionCursorProvider.render(p6) --[[ line: 109 ]]
	-- upvalues: roactModule (ref), selectionImageContextModule (ref), onRootedListenerModule (ref)
	local t = {}
	
	for i, v in pairs(p6.state.mountedCursors) do
		local var10 = i.rawValue()
		t[tostring(var10)] = roactModule.createElement(var10, {
			isVisible = not (p6.refs[i] == nil or (p6.state.currentSelection == nil or p6.refs[i].current ~= p6.state.currentSelection.SelectionImageObject) and (p6.state.currentCoreSelection == nil or p6.refs[i].current ~= p6.state.currentCoreSelection.SelectionImageObject)) and true,
			cursorRef = p6.refs[i]
		})
	end
	return roactModule.createElement(selectionImageContextModule.Provider, { value = p6.getSelectionCursor }, {
		CursorContainer = roactModule.createElement("Frame", { Visible = false, Size = UDim2.new(0, 0, 0, 0) }, t),
		OnRootedListener = roactModule.createElement(onRootedListenerModule, { onRooted = p6.initSelectionChangedListener }),
		Children = roactModule.createFragment(p6.props[roactModule.Children])
	})
end

return selectionCursorProvider