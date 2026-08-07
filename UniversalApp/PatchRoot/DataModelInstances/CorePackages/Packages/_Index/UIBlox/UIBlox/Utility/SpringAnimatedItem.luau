local parent = script.Parent.Parent.Parent
local otterModule = require(parent.Otter)
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local var4 = tModule.intersection(tModule.strictInterface({
	animatedValues = tModule.table,
	mapValuesToProps = tModule.callback,
	springOptions = tModule.optional(tModule.table),
	onComplete = tModule.optional(tModule.callback),
	regularProps = tModule.table,
	[roactModule.Children] = tModule.optional(tModule.table)
}), function(p0) --[[ line: 53 ]]
	-- upvalues: roactModule (ref)
	if p0[roactModule.Children] == nil or p0.regularProps[roactModule.Children] == nil then
		return true
	end
	return false, "Children must be specified in one place, but the [Roact.Children] key was found in both props and props.regularProps on SpringAnimatedItem."
end)
local t = {
	wrap = function(p1) --[[ line: 66 ]]
		-- upvalues: roactModule (ref), otterModule (ref), var4 (ref), cryoModule (ref)
		local var6 = roactModule.PureComponent:extend(string.format("SpringAnimatedItem(%s)", tostring(p1)))
		var6.defaultProps = { regularProps = {} }
		
		function var6.init(p2) --[[ line: 73 ]]
			-- upvalues: roactModule (copy)
			p2.ref = p2.props.regularProps[roactModule.Ref] or roactModule.createRef()
			
			function p2.applyAnimatedValues(p3) --[[ line: 76 ]]
				-- upvalues: p2 (ref)
				local current = p2.ref.current
				
				if current == nil then return end
				for i, v in pairs(p2.props.mapValuesToProps(p3)) do
					current[i] = v
				end
			end
			
			function p2.onComplete() --[[ line: 90 ]]
				-- upvalues: p2 (ref)
				if p2.props.onComplete then
					p2.props.onComplete()
				end
			end
			
			p2.motor = nil
		end
		
		function var6.didMount(p4) --[[ line: 99 ]]
			-- upvalues: otterModule (copy)
			local animatedValues = p4.props.animatedValues
			p4.applyAnimatedValues(animatedValues)
			p4.motor = otterModule.createGroupMotor(animatedValues)
			p4.motor:onStep(function(p5) --[[ line: 107 ]]
				-- upvalues: p4 (ref)
				p4.applyAnimatedValues(p5)
			end)
			p4.motor:onComplete(p4.onComplete)
			p4.motor:start()
		end
		
		function var6.willUpdate(p6, p7) --[[ line: 114 ]]
			-- upvalues: roactModule (copy)
			if p6.props.regularProps[roactModule.Ref] ~= p7.regularProps[roactModule.Ref] and p7.regularProps[roactModule.Ref] ~= nil then
				p6.ref = p7.regularProps[roactModule.Ref]
			end
		end
		
		function var6.render(p8) --[[ line: 123 ]]
			-- upvalues: var4 (copy), cryoModule (copy), roactModule (copy), p1 (ref)
			assert(var4(p8.props))
			
			return roactModule.createElement(p1, cryoModule.Dictionary.join(p8.props.regularProps, {
				[roactModule.Ref] = p8.ref,
				[roactModule.Children] = p8.props[roactModule.Children]
			}))
		end
		
		function var6.didUpdate(p9, p10) --[[ line: 135 ]]
			-- upvalues: otterModule (copy)
			if p9.props.animatedValues ~= p10.animatedValues then
				local t = {}
				local var8 = false
				
				for i, v in pairs(p9.props.animatedValues) do
					t[i] = otterModule.spring(v, p9.props.springOptions)
					
					if v ~= p10.animatedValues[i] then
						var8 = true
					end
				end
				if var8 then
					p9.motor:setGoal(t)
				end
			end
		end
		
		function var6.willUnmount(p11) --[[ line: 153 ]]
			if p11.motor then
				p11.motor:destroy()
				p11.motor = nil
			end
		end
		
		return var6
	end
}
t.AnimatedFrame = t.wrap("Frame")
t.AnimatedScrollingFrame = t.wrap("ScrollingFrame")
t.AnimatedImageLabel = t.wrap("ImageLabel")
t.AnimatedTextButton = t.wrap("TextButton")
t.AnimatedUIScale = t.wrap("UIScale")

return t