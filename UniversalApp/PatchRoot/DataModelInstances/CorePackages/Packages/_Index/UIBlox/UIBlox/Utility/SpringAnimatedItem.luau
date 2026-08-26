local parent = script.Parent.Parent.Parent
local otterModule = require(parent.Otter)
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local var1 = tModule.intersection(tModule.strictInterface({
	animatedValues = tModule.table,
	mapValuesToProps = tModule.callback,
	springOptions = tModule.optional(tModule.table),
	onComplete = tModule.optional(tModule.callback),
	regularProps = tModule.table,
	[roactModule.Children] = tModule.optional(tModule.table)
}), function(p1)
	-- upvalues: roactModule (ref)
	if p1[roactModule.Children] == nil or p1.regularProps[roactModule.Children] == nil then
		return true
	end
	return false, "Children must be specified in one place, but the [Roact.Children] key was found in both props and props.regularProps on SpringAnimatedItem."
end)
local t = {
	wrap = function(p1)
		-- upvalues: roactModule (ref), otterModule (ref), var1 (ref), cryoModule (ref)
		local var2 = roactModule.PureComponent:extend(string.format("SpringAnimatedItem(%s)", tostring(p1)))
		var2.defaultProps = { regularProps = {} }
		
		function var6.init(p2)
			-- upvalues: roactModule (copy)
			p2.ref = p2.props.regularProps[roactModule.Ref] or roactModule.createRef()
			
			function p2.applyAnimatedValues(p3)
				-- upvalues: p2 (ref)
				local current = p2.ref.current
				
				if current == nil then return end
				for i, v in pairs(p2.props.mapValuesToProps(p3)) do
					current[i] = v
				end
			end
			
			function p2.onComplete()
				-- upvalues: p2 (ref)
				if p2.props.onComplete then
					p2.props.onComplete()
				end
			end
			
			p2.motor = nil
		end
		
		function var6.didMount(p3)
			-- upvalues: otterModule (copy)
			local animatedValues = p3.props.animatedValues
			p3.applyAnimatedValues(animatedValues)
			p3.motor = otterModule.createGroupMotor(animatedValues)
			p3.motor:onStep(function(p4)
				-- upvalues: p3 (ref)
				p3.applyAnimatedValues(p4)
			end)
			p3.motor:onComplete(p3.onComplete)
			p3.motor:start()
		end
		
		function var6.willUpdate(p3, p4)
			-- upvalues: roactModule (copy)
			if p3.props.regularProps[roactModule.Ref] ~= p4.regularProps[roactModule.Ref] and p4.regularProps[roactModule.Ref] ~= nil then
				p3.ref = p4.regularProps[roactModule.Ref]
			end
		end
		
		function var6.render(p3)
			-- upvalues: var1 (copy), cryoModule (copy), roactModule (copy), p1 (ref)
			assert(var1(p3.props))
			
			return roactModule.createElement(p1, cryoModule.Dictionary.join(p3.props.regularProps, {
				[roactModule.Ref] = p3.ref,
				[roactModule.Children] = p3.props[roactModule.Children]
			}))
		end
		
		function var6.didUpdate(p3, p4)
			-- upvalues: otterModule (copy)
			if p3.props.animatedValues ~= p4.animatedValues then
				local t = {}
				local var3 = false
				
				for i, v in pairs(p3.props.animatedValues) do
					t[i] = otterModule.spring(v, p3.props.springOptions)
					
					if v ~= p4.animatedValues[i] then
						var3 = true
					end
				end
				if var3 then
					p3.motor:setGoal(t)
				end
			end
		end
		
		function var6.willUnmount(p5)
			if p5.motor then
				p5.motor:destroy()
				p5.motor = nil
			end
		end
		
		return var2
	end
}
t.AnimatedFrame = t.wrap("Frame")
t.AnimatedScrollingFrame = t.wrap("ScrollingFrame")
t.AnimatedImageLabel = t.wrap("ImageLabel")
t.AnimatedTextButton = t.wrap("TextButton")
t.AnimatedUIScale = t.wrap("UIScale")

return t