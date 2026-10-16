local Parent = script:FindFirstAncestor("AuthCommon").Parent
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local Immutable = require(Parent.AppCommonLib).Immutable
local Symbol = require(Parent.AppCommonLib).Symbol
local FitChildrenModule = {
	FitAxis = {
		Width = Symbol.named("Width"),
		Height = Symbol.named("Height"),
		Both = Symbol.named("Both")
	}
}

function FitChildrenModule.wrap(p1) --[[ Line: 23 ]]
	-- upvalues: RoactModule (copy), FitChildrenModule (copy), Immutable (copy), CryoModule (copy)
	local ExtendResult = RoactModule.PureComponent:extend(("FitChildren(%s)"):format((tostring(p1))))
	
	function ExtendResult.disconnectSignals(p2) --[[ Line: 26 ]]
		for _, signal in ipairs(p2.signals) do
			signal:Disconnect()
		end
	end
	
	function ExtendResult.resize(p3) --[[ Line: 32 ]]
		-- upvalues: FitChildrenModule (upval)
		local FitFields = p3.props.fitFields or (if p3.props.fitAxis then { Size = p3.props.fitAxis } else { Size = FitChildrenModule.FitAxis.Both })
		p3:disconnectSignals()
		p3.signals = {}
		local Current = p3.ref.current
		
		if Current == nil then return end
		local UIGridStyleLayout = Current:FindFirstChildWhichIsA("UIGridStyleLayout")
		
		if UIGridStyleLayout then
			table.insert(p3.signals, (UIGridStyleLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 59 | Named "update" ]]
				-- upvalues: UIGridStyleLayout (copy), p3 (copy), FitFields (ref)
				local AbsoluteContentSize = UIGridStyleLayout.AbsoluteContentSize
				p3:applyFit(FitFields, AbsoluteContentSize.x, AbsoluteContentSize.y)
			end)))
			local AbsoluteContentSize = UIGridStyleLayout.AbsoluteContentSize
			p3:applyFit(FitFields, AbsoluteContentSize.x, AbsoluteContentSize.y)
		else
			p3:resizeFromChildren(FitFields)
			
			for _, Gui in ipairs((Current:GetChildren())) do
				if Gui:IsA("GuiBase2d") then
					table.insert(p3.signals, (Gui:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 73 ]]
						-- upvalues: p3 (copy), FitFields (ref)
						p3:resizeFromChildren(FitFields)
					end)))
					table.insert(p3.signals, (Gui:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 77 ]]
						-- upvalues: p3 (copy), FitFields (ref)
						p3:resizeFromChildren(FitFields)
					end)))
				end
			end
		end
	end
	
	function ExtendResult.resizeFromChildren(p4, FitFields) --[[ Line: 86 ]]
		local Current = p4.ref.current
		
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
		p4:applyFit(FitFields, Largest, Largest1)
	end
	
	function ExtendResult.applyFit(p5, FitFields, X, Y) --[[ Line: 108 ]]
		-- upvalues: FitChildrenModule (upval)
		local Current = p5.ref.current
		
		if Current == nil then return end
		local UIPadding = Current:FindFirstChildOfClass("UIPadding")
		local Size = p5.props.Size or UDim2.new(0, 0, 0, 0)
		local Width = FitChildrenModule.FitAxis.Width
		local Height = FitChildrenModule.FitAxis.Height
		
		local function calculateAxis(Both, Height, p6, X, p7, p8) --[[ Line: 119 ]]
			-- upvalues: FitChildrenModule (upval), UIPadding (copy)
			local v1 = nil
			
			if Both ~= Height and Both ~= FitChildrenModule.FitAxis.Both then
				return X.Scale, X.Offset
			end
			local v2 = 0
			
			if not UIPadding then
				return v2, p6
			end
			local NewScale = UIPadding[p7].Scale + UIPadding[p8].Scale
			local NewOffset = UIPadding[p7].Offset + UIPadding[p8].Offset
			
			if NewScale == 1 then
				error("Can not apply FitChildren to a component with 100% padding width")
				
				return v2, v1
			else
				return v2, (p6 + NewOffset) / (1 - NewScale)
			end
		end
		
		for i, fitField in pairs(FitFields) do
			local PaddingLeft, PaddingLeft2 = calculateAxis(fitField, Width, X, Size.X, "PaddingLeft", "PaddingRight")
			local PaddingTop, PaddingTop2 = calculateAxis(fitField, Height, Y, Size.Y, "PaddingTop", "PaddingBottom")
			Current[i] = UDim2.new(PaddingLeft, PaddingLeft2, PaddingTop, PaddingTop2)
		end
	end
	
	function ExtendResult.init(p6) --[[ Line: 150 ]]
		-- upvalues: ExtendResult (copy), RoactModule (upval)
		p6.signals = {}
		local ForwardRefFunction = p6.props.forwardRef
		assert(type(ForwardRefFunction) ~= "function", ("%s does not support function ref forwarding"):format((tostring(ExtendResult))))
		p6.ref = ForwardRefFunction or RoactModule.createRef()
	end
	
	function ExtendResult.render(p6) --[[ Line: 164 ]]
		-- upvalues: Immutable (upval), RoactModule (upval), p1 (copy)
		local FitAxis = Immutable.RemoveFromDictionary(p6.props, "fitAxis", "fitFields", "forwardRef")
		FitAxis[RoactModule.Ref] = p6.ref
		
		return RoactModule.createElement(p1, FitAxis)
	end
	
	function ExtendResult.didMount(p6) --[[ Line: 171 ]]
		p6:resize()
	end
	
	function ExtendResult.didUpdate(p6) --[[ Line: 175 ]]
		p6:resize()
	end
	
	function ExtendResult.willUnmount(p6) --[[ Line: 179 ]]
		p6:disconnectSignals()
	end
	
	return RoactModule.forwardRef(function(p6, ForwardRef) --[[ Line: 183 ]]
		-- upvalues: RoactModule (upval), ExtendResult (copy), CryoModule (upval)
		return RoactModule.createElement(ExtendResult, CryoModule.Dictionary.join(p6, { forwardRef = ForwardRef }))
	end)
end

FitChildrenModule.FitFrame = FitChildrenModule.wrap("Frame")
FitChildrenModule.FitScrollingFrame = FitChildrenModule.wrap("ScrollingFrame")
FitChildrenModule.FitTextButton = FitChildrenModule.wrap("TextButton")

return FitChildrenModule