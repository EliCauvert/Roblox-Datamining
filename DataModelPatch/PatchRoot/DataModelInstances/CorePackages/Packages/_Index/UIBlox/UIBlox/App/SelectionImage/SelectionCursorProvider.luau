local Parent = script.Parent.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local RoactGamepadModule = require(Parent.RoactGamepad)
local CryoModule = require(Parent.Cryo)
local CursorKindModule = require(script.Parent.CursorKind)
local SelectionImageContextModule = require(script.Parent.SelectionImageContext)
local OnRootedListenerModule = require(script.Parent.OnRootedListener)
local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")
local SelectionCursorProvider = RoactModule.PureComponent:extend("SelectionCursorProvider")

function SelectionCursorProvider.init(p1)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), CursorKindModule (copy), CryoModule (copy), CoreGui (copy), GuiService (copy)
	p1.ref = RoactModule.createRef()
	p1.refs = RoactGamepadModule.createRefCache()
	p1.state = {
		currentSelection = nil,
		currentCoreSelection = nil,
		mountedCursors = {}
	}
	
	function p1.getSelectionCursor(p2)
		-- upvalues: CursorKindModule (upval), p1 (copy), CryoModule (upval)
		assert(CursorKindModule.isEnumValue(p2), ("Invalid arg #1: expected a CursorKind enum variant, got %s"):format((tostring(p2))))
		warn("UIBlox's SelectionCursor is deprecated and should not be used anymore.")
		
		if p1.state.mountedCursors[p2] == nil then
			p1:setState(function(p3)
				-- upvalues: CryoModule (upval), p2 (copy)
				return {
					mountedCursors = CryoModule.Dictionary.join(p3.mountedCursors, { [p2] = true })
				}
			end)
		end
		return p1.refs[p2]
	end
	
	function p1.initSelectionChangedListener(Object)
		-- upvalues: p1 (copy), CoreGui (upval), GuiService (upval)
		if Object == nil then return end
		if p1.coreSelectionListener ~= nil then
			p1.coreSelectionListener:Disconnect()
			p1.coreSelectionListener = nil
		end
		if p1.selectionListener ~= nil then
			p1.selectionListener:Disconnect()
			p1.selectionListener = nil
		end
		if Object:IsDescendantOf(CoreGui) then
			p1.coreSelectionListener = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
				-- upvalues: p1 (upval), GuiService (upval)
				if p1.state.currentCoreSelection == nil or GuiService.SelectedCoreObject == nil or p1.state.currentCoreSelection.SelectionImageObject ~= GuiService.SelectedCoreObject.SelectionImageObject then
					p1:setState({ currentCoreSelection = GuiService.SelectedCoreObject })
				end
			end)
			
			return
		else
			p1.selectionListener = GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
				-- upvalues: p1 (upval), GuiService (upval)
				if p1.state.currentSelection == nil or GuiService.SelectedObject == nil or p1.state.currentSelection.SelectionImageObject ~= GuiService.SelectedObject.SelectionImageObject then
					p1:setState({ currentSelection = GuiService.SelectedObject })
				end
			end)
		end
	end
end

function SelectionCursorProvider.didMount(p1)
	p1.initSelectionChangedListener(p1.ref:getValue())
end

function SelectionCursorProvider.willUnmount(p1)
	if p1.coreSelectionListener ~= nil then
		p1.coreSelectionListener:Disconnect()
		p1.coreSelectionListener = nil
	end
	if p1.selectionListener ~= nil then
		p1.selectionListener:Disconnect()
		p1.selectionListener = nil
	end
end

function SelectionCursorProvider.render(p1)
	-- upvalues: RoactModule (copy), SelectionImageContextModule (copy), OnRootedListenerModule (copy)
	local Elements = {}
	
	for i, _ in pairs(p1.state.mountedCursors) do
		local RawValueResult = i.rawValue()
		local Text = tostring(RawValueResult)
		local IsVisible = false
		
		if p1.refs[i] ~= nil and (p1.state.currentSelection ~= nil and p1.refs[i].current == p1.state.currentSelection.SelectionImageObject or p1.state.currentCoreSelection ~= nil and p1.refs[i].current == p1.state.currentCoreSelection.SelectionImageObject) then
			IsVisible = true
		end
		Elements[Text] = RoactModule.createElement(RawValueResult, { isVisible = IsVisible, cursorRef = p1.refs[i] })
	end
	return RoactModule.createElement(SelectionImageContextModule.Provider, { value = p1.getSelectionCursor }, {
		CursorContainer = RoactModule.createElement("Frame", { Visible = false, Size = UDim2.new(0, 0, 0, 0) }, Elements),
		OnRootedListener = RoactModule.createElement(OnRootedListenerModule, { onRooted = p1.initSelectionChangedListener }),
		Children = RoactModule.createFragment(p1.props[RoactModule.Children])
	})
end

return SelectionCursorProvider