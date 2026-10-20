local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local RoactModule = require(Modules.Common.Roact)
local ImmutableModule = require(Modules.Common.Immutable)
local SymbolModule = require(Modules.Common.Symbol)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local FitChildrenModule = {
	FitAxis = {
		Width = SymbolModule.named("Width"),
		Height = SymbolModule.named("Height"),
		Both = SymbolModule.named("Both")
	}
}

function FitChildrenModule.wrap(DEPRECATEDImageSetButtonModule)
	-- upvalues: RoactModule (copy), FitChildrenModule (copy), ImmutableModule (copy), CryoModule (copy)
	local ExtendResult = RoactModule.PureComponent:extend(("FitChildren(%s)"):format((tostring(DEPRECATEDImageSetButtonModule))))
	
	function ExtendResult.disconnectSignals(p1)
		for _, signal in ipairs(p1.signals) do
			signal:Disconnect()
		end
	end
	
	function ExtendResult.resize(p2)
		-- upvalues: FitChildrenModule (upval)
		local FitFields = p2.props.fitFields or (if p2.props.fitAxis then { Size = p2.props.fitAxis } else { Size = FitChildrenModule.FitAxis.Both })
		p2:disconnectSignals()
		p2.signals = {}
		local Current = p2.ref.current
		
		if Current == nil then return end
		local UIGridStyleLayout = Current:FindFirstChildWhichIsA("UIGridStyleLayout")
		
		if UIGridStyleLayout then
			table.insert(p2.signals, (UIGridStyleLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				-- upvalues: UIGridStyleLayout (copy), p2 (copy), FitFields (ref)
				local AbsoluteContentSize = UIGridStyleLayout.AbsoluteContentSize
				p2:applyFit(FitFields, AbsoluteContentSize.x, AbsoluteContentSize.y)
			end)))
			local AbsoluteContentSize = UIGridStyleLayout.AbsoluteContentSize
			p2:applyFit(FitFields, AbsoluteContentSize.x, AbsoluteContentSize.y)
		else
			p2:resizeFromChildren(FitFields)
			
			for _, Gui in ipairs((Current:GetChildren())) do
				if Gui:IsA("GuiBase2d") then
					table.insert(p2.signals, (Gui:GetPropertyChangedSignal("Size"):Connect(function()
						-- upvalues: p2 (copy), FitFields (ref)
						p2:resizeFromChildren(FitFields)
					end)))
					table.insert(p2.signals, (Gui:GetPropertyChangedSignal("Position"):Connect(function()
						-- upvalues: p2 (copy), FitFields (ref)
						p2:resizeFromChildren(FitFields)
					end)))
				end
			end
		end
	end
	
	function ExtendResult.resizeFromChildren(p3, FitFields)
		local Current = p3.ref.current
		
		if Current == nil then return end
		local AbsolutePosition = Current.AbsolutePosition
		local Largest = 0
		local Largest1 = 0
		
		for _, Gui in ipairs((Current:GetChildren())) do
			if Gui:IsA("GuiBase2d") then
				local AbsoluteSize = Gui.AbsoluteSize
				local AbsolutePosition1 = Gui.AbsolutePosition
				Largest = math.max(Largest, AbsolutePosition1.x - AbsolutePosition.x + AbsoluteSize.x)
				Largest1 = math.max(Largest1, AbsolutePosition1.y - AbsolutePosition.y + AbsoluteSize.y)
			end
		end
		p3:applyFit(FitFields, Largest, Largest1)
	end
	
	function ExtendResult.applyFit(p4, FitFields, X, Y)
		-- upvalues: FitChildrenModule (upval)
		local Current = p4.ref.current
		
		if Current == nil then return end
		local UIPadding = Current:FindFirstChildOfClass("UIPadding")
		local Size = p4.props.Size or UDim2.new(0, 0, 0, 0)
		local Width = FitChildrenModule.FitAxis.Width
		local Height = FitChildrenModule.FitAxis.Height
		
		local function calculateAxis(Both, Height, p5, X, p6, p7)
			-- upvalues: FitChildrenModule (upval), UIPadding (copy)
			local v1 = nil
			
			if Both ~= Height and Both ~= FitChildrenModule.FitAxis.Both then
				return X.Scale, X.Offset
			end
			local v2 = 0
			
			if not UIPadding then
				return v2, p5
			end
			local NewScale = UIPadding[p6].Scale + UIPadding[p7].Scale
			local NewOffset = UIPadding[p6].Offset + UIPadding[p7].Offset
			
			if NewScale == 1 then
				error("Can not apply FitChildren to a component with 100% padding width")
				
				return v2, v1
			else
				return v2, (p5 + NewOffset) / (1 - NewScale)
			end
		end
		
		for i, fitField in pairs(FitFields) do
			local PaddingLeft, PaddingLeft2 = calculateAxis(fitField, Width, X, Size.X, "PaddingLeft", "PaddingRight")
			local PaddingTop, PaddingTop2 = calculateAxis(fitField, Height, Y, Size.Y, "PaddingTop", "PaddingBottom")
			Current[i] = UDim2.new(PaddingLeft, PaddingLeft2, PaddingTop, PaddingTop2)
		end
	end
	
	function ExtendResult.init(p5)
		-- upvalues: RoactModule (upval)
		p5.signals = {}
		local ForwardRefFunction = p5.props.forwardRef
		
		if type(ForwardRefFunction) == "table" then
			p5.ref = ForwardRefFunction
		else
			p5.ref = RoactModule.createRef()
		end
		function p5.setRef(Current)
			-- upvalues: p5 (copy), ForwardRefFunction (copy)
			p5.ref.current = Current
			
			if ForwardRefFunction and type(ForwardRefFunction) == "function" then
				ForwardRefFunction(Current)
			end
		end
	end
	
	function ExtendResult.render(p5)
		-- upvalues: ImmutableModule (upval), RoactModule (upval), DEPRECATEDImageSetButtonModule (copy)
		local FitAxis = ImmutableModule.RemoveFromDictionary(p5.props, "fitAxis", "fitFields", "forwardRef")
		FitAxis[RoactModule.Ref] = p5.setRef
		
		return RoactModule.createElement(DEPRECATEDImageSetButtonModule, FitAxis)
	end
	
	function ExtendResult.didMount(p5)
		p5:resize()
	end
	
	function ExtendResult.didUpdate(p5)
		p5:resize()
	end
	
	function ExtendResult.willUnmount(p5)
		p5:disconnectSignals()
	end
	
	return RoactModule.forwardRef(function(p5, ForwardRef)
		-- upvalues: RoactModule (upval), ExtendResult (copy), CryoModule (upval)
		return RoactModule.createElement(ExtendResult, CryoModule.Dictionary.join(p5, { forwardRef = ForwardRef }))
	end)
end

FitChildrenModule.FitFrame = FitChildrenModule.wrap("Frame")
FitChildrenModule.FitScrollingFrame = FitChildrenModule.wrap("ScrollingFrame")
FitChildrenModule.FitTextButton = FitChildrenModule.wrap("TextButton")
FitChildrenModule.FitImageLabel = FitChildrenModule.wrap(DEPRECATEDImageSetLabelModule)
FitChildrenModule.FitImageButton = FitChildrenModule.wrap(DEPRECATEDImageSetButtonModule)

return FitChildrenModule