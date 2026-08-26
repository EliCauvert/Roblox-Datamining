local parent = script:FindFirstAncestor("AuthCommon").Parent
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

function t.wrap(p1)
	-- upvalues: roactModule (ref), t (ref), immutable (ref), cryoModule (ref)
	local var1 = roactModule.PureComponent:extend(("FitChildren(%s)"):format(tostring(p1)))
	
	function var3.disconnectSignals(value)
		for i, v in ipairs(value.signals) do
			v:Disconnect()
		end
	end
	
	function var3.resize(p2)
		-- upvalues: t (copy)
		local fitFields = p2.props.fitFields or (if p2.props.fitAxis then { Size = p2.props.fitAxis } else { Size = t.FitAxis.Both })
		p2:disconnectSignals()
		p2.signals = {}
		local current = p2.ref.current
		
		if current == nil then return end
		local UIGridStyleLayout = current:FindFirstChildWhichIsA("UIGridStyleLayout")
		
		if UIGridStyleLayout then
			table.insert(p2.signals, UIGridStyleLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				-- upvalues: UIGridStyleLayout (ref), p2 (ref), fitFields (write)
				local absoluteContentSize = UIGridStyleLayout.AbsoluteContentSize
				p2:applyFit(fitFields, absoluteContentSize.x, absoluteContentSize.y)
			end))
			local absoluteContentSize = UIGridStyleLayout.AbsoluteContentSize
			p2:applyFit(fitFields, absoluteContentSize.x, absoluteContentSize.y)
		else
			p2:resizeFromChildren(fitFields)
			
			for i, v in ipairs(current:GetChildren()) do
				if v:IsA("GuiBase2d") then
					table.insert(p2.signals, v:GetPropertyChangedSignal("Size"):Connect(function()
						-- upvalues: p2 (ref), fitFields (write)
						p2:resizeFromChildren(fitFields)
					end))
					table.insert(p2.signals, v:GetPropertyChangedSignal("Position"):Connect(function()
						-- upvalues: p2 (ref), fitFields (write)
						p2:resizeFromChildren(fitFields)
					end))
				end
			end
		end
	end
	
	function var3.resizeFromChildren(p3, p4)
		local current = p3.ref.current
		
		if current == nil then return end
		local absolutePosition = current.AbsolutePosition
		local children = current:GetChildren()
		local var2 = 0
		local var3 = 0
		
		for i, v in ipairs(children) do
			if v:IsA("GuiBase2d") then
				local absoluteSize = v.AbsoluteSize
				local absolutePosition_1 = v.AbsolutePosition
				var2 = math.max(var2, absolutePosition_1.x - absolutePosition.x + absoluteSize.x)
				var3 = math.max(var3, absolutePosition_1.y - absolutePosition.y + absoluteSize.y)
			end
		end
		p3:applyFit(p4, var2, var3)
	end
	
	function var3.applyFit(p5, p6, p7, p8)
		-- upvalues: t (copy)
		local current = p5.ref.current
		
		if current == nil then return end
		local UIPadding = current:FindFirstChildOfClass("UIPadding")
		local size = p5.props.Size or UDim2.new(0, 0, 0, 0)
		local width = t.FitAxis.Width
		local height = t.FitAxis.Height
		
		local function calculateAxis(p9, p10, p11, p12, p13, p14)
			-- upvalues: t (copy), UIPadding (ref)
			local var4 = if p9 ~= p10 then p9 == t.FitAxis.Both else true
			local _ = nil
			local var5 = nil
			
			if not var4 then
				return p12.Scale, p12.Offset
			end
			local var6 = 0
			
			if not UIPadding then
				return var6, p11
			end
			local var7 = UIPadding[p13].Scale + UIPadding[p14].Scale
			local var8 = UIPadding[p13].Offset + UIPadding[p14].Offset
			
			if var7 == 1 then
				error("Can not apply FitChildren to a component with 100% padding width")
				
				return var6, var5
			end
			return var6, (p11 + var8) / (1 - var7)
		end
		
		for i, v in pairs(p6) do
			local var4, var5 = calculateAxis(v, width, p7, size.X, "PaddingLeft", "PaddingRight")
			local var6, var7 = calculateAxis(v, height, p8, size.Y, "PaddingTop", "PaddingBottom")
			current[i] = UDim2.new(var4, var5, var6, var7)
		end
	end
	
	function var3.init(p9)
		-- upvalues: var1 (ref), roactModule (copy)
		p9.signals = {}
		local forwardRef = p9.props.forwardRef
		assert(type(forwardRef) ~= "function", ("%s does not support function ref forwarding"):format(tostring(var1)))
		p9.ref = forwardRef or roactModule.createRef()
	end
	
	function var3.render(p9)
		-- upvalues: immutable (copy), roactModule (copy), p1 (ref)
		local fitAxis = immutable.RemoveFromDictionary(p9.props, "fitAxis", "fitFields", "forwardRef")
		fitAxis[roactModule.Ref] = p9.ref
		
		return roactModule.createElement(p1, fitAxis)
	end
	
	function var3.didMount(p9)
		p9:resize()
	end
	
	function var3.didUpdate(p9)
		p9:resize()
	end
	
	function var3.willUnmount(p9)
		p9:disconnectSignals()
	end
	
	return roactModule.forwardRef(function(p9, p10)
		-- upvalues: roactModule (copy), var1 (ref), cryoModule (copy)
		return roactModule.createElement(var1, cryoModule.Dictionary.join(p9, { forwardRef = p10 }))
	end)
end

t.FitFrame = t.wrap("Frame")
t.FitScrollingFrame = t.wrap("ScrollingFrame")
t.FitTextButton = t.wrap("TextButton")

return t