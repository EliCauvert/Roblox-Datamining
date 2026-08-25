local parent = script:FindFirstAncestor("PeekView").Parent
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local immutable = require(parent.AppCommonLib).Immutable
local symbol = require(parent.AppCommonLib).Symbol
local t = {
	FitAxis = {
		Width = symbol.named("Width"),
		Height = symbol.named("Height"),
		Both = symbol.named("Both")
	}
}

function t.wrap(p0)
	-- upvalues: roactModule (ref), t (ref), immutable (ref), cryoModule (ref)
	local var3 = roactModule.PureComponent:extend(("FitChildren(%s)"):format(tostring(p0)))
	
	function var3.disconnectSignals(value)
		for i, v in ipairs(value.signals) do
			v:Disconnect()
		end
	end
	
	function var3.resize(p1)
		-- upvalues: t (copy)
		local fitFields = p1.props.fitFields or (if p1.props.fitAxis then { Size = p1.props.fitAxis } else { Size = t.FitAxis.Both })
		p1:disconnectSignals()
		p1.signals = {}
		local current = p1.ref.current
		
		if current == nil then return end
		local UIGridStyleLayout = current:FindFirstChildWhichIsA("UIGridStyleLayout")
		
		if UIGridStyleLayout then
			table.insert(p1.signals, UIGridStyleLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				-- upvalues: UIGridStyleLayout (ref), p1 (ref), fitFields (write)
				local absoluteContentSize = UIGridStyleLayout.AbsoluteContentSize
				p1:applyFit(fitFields, absoluteContentSize.x, absoluteContentSize.y)
			end))
			local absoluteContentSize = UIGridStyleLayout.AbsoluteContentSize
			p1:applyFit(fitFields, absoluteContentSize.x, absoluteContentSize.y)
		else
			p1:resizeFromChildren(fitFields)
			
			for i, v in ipairs(current:GetChildren()) do
				if v:IsA("GuiBase2d") then
					table.insert(p1.signals, v:GetPropertyChangedSignal("Size"):Connect(function()
						-- upvalues: p1 (ref), fitFields (write)
						p1:resizeFromChildren(fitFields)
					end))
					table.insert(p1.signals, v:GetPropertyChangedSignal("Position"):Connect(function()
						-- upvalues: p1 (ref), fitFields (write)
						p1:resizeFromChildren(fitFields)
					end))
				end
			end
		end
	end
	
	function var3.resizeFromChildren(p2, p3)
		local current = p2.ref.current
		
		if current == nil then return end
		local absolutePosition = current.AbsolutePosition
		local children = current:GetChildren()
		local var7 = 0
		local var8 = 0
		
		for i, v in ipairs(children) do
			if v:IsA("GuiBase2d") then
				local absoluteSize = v.AbsoluteSize
				local absolutePosition_1 = v.AbsolutePosition
				var7 = math.max(var7, absolutePosition_1.x - absolutePosition.x + absoluteSize.x)
				var8 = math.max(var8, absolutePosition_1.y - absolutePosition.y + absoluteSize.y)
			end
		end
		p2:applyFit(p3, var7, var8)
	end
	
	function var3.applyFit(p4, p5, p6, p7)
		-- upvalues: t (copy)
		local current = p4.ref.current
		
		if current == nil then return end
		local UIPadding = current:FindFirstChildOfClass("UIPadding")
		local size = p4.props.Size or UDim2.new(0, 0, 0, 0)
		local width = t.FitAxis.Width
		local height = t.FitAxis.Height
		
		local function calculateAxis(p8, p9, p10, p11, p12, p13)
			-- upvalues: t (copy), UIPadding (ref)
			local var16 = if p8 ~= p9 then p8 == t.FitAxis.Both else true
			local _ = nil
			local var17 = nil
			
			if not var16 then
				return p11.Scale, p11.Offset
			end
			local var18 = 0
			
			if not UIPadding then
				return var18, p10
			end
			local var19 = UIPadding[p12].Scale + UIPadding[p13].Scale
			local var20 = UIPadding[p12].Offset + UIPadding[p13].Offset
			
			if var19 == 1 then
				error("Can not apply FitChildren to a component with 100% padding width")
				
				return var18, var17
			end
			return var18, (p10 + var20) / (1 - var19)
		end
		
		for i, v in pairs(p5) do
			local var12, var13 = calculateAxis(v, width, p6, size.X, "PaddingLeft", "PaddingRight")
			local var14, var15 = calculateAxis(v, height, p7, size.Y, "PaddingTop", "PaddingBottom")
			current[i] = UDim2.new(var12, var13, var14, var15)
		end
	end
	
	function var3.init(p14)
		-- upvalues: var3 (ref), roactModule (copy)
		p14.signals = {}
		local forwardRef = p14.props.forwardRef
		assert(type(forwardRef) ~= "function", ("%s does not support function ref forwarding"):format(tostring(var3)))
		p14.ref = forwardRef or roactModule.createRef()
	end
	
	function var3.render(p15)
		-- upvalues: immutable (copy), roactModule (copy), p0 (ref)
		local fitAxis = immutable.RemoveFromDictionary(p15.props, "fitAxis", "fitFields", "forwardRef")
		fitAxis[roactModule.Ref] = p15.ref
		
		return roactModule.createElement(p0, fitAxis)
	end
	
	function var3.didMount(p16)
		p16:resize()
	end
	
	function var3.didUpdate(p17)
		p17:resize()
	end
	
	function var3.willUnmount(p18)
		p18:disconnectSignals()
	end
	
	return roactModule.forwardRef(function(p19, p20)
		-- upvalues: roactModule (copy), var3 (ref), cryoModule (copy)
		return roactModule.createElement(var3, cryoModule.Dictionary.join(p19, { forwardRef = p20 }))
	end)
end

t.FitFrame = t.wrap("Frame")
t.FitScrollingFrame = t.wrap("ScrollingFrame")
t.FitTextButton = t.wrap("TextButton")

return t