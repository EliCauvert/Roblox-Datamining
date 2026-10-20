local Parent = script.Parent.Parent.Parent
local OtterModule = require(Parent.Otter)
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local IntersectionResult = TModule.intersection(TModule.strictInterface({
	animatedValues = TModule.table,
	mapValuesToProps = TModule.callback,
	springOptions = TModule.optional(TModule.table),
	onComplete = TModule.optional(TModule.callback),
	regularProps = TModule.table,
	[RoactModule.Children] = TModule.optional(TModule.table)
}), function(p1)
	-- upvalues: RoactModule (copy)
	if p1[RoactModule.Children] == nil or p1.regularProps[RoactModule.Children] == nil then
		return true
	else
		return false, "Children must be specified in one place, but the [Roact.Children] key was found in both props and props.regularProps on SpringAnimatedItem."
	end
end)
local SpringAnimatedItemModule = {
	wrap = function(p1)
		-- upvalues: RoactModule (copy), OtterModule (copy), IntersectionResult (copy), CryoModule (copy)
		local ExtendResult = RoactModule.PureComponent:extend(string.format("SpringAnimatedItem(%s)", (tostring(p1))))
		ExtendResult.defaultProps = { regularProps = {} }
		
		function ExtendResult.init(p2)
			-- upvalues: RoactModule (upval)
			p2.ref = p2.props.regularProps[RoactModule.Ref] or RoactModule.createRef()
			
			function p2.applyAnimatedValues(AnimatedValues)
				-- upvalues: p2 (copy)
				local Current = p2.ref.current
				
				if Current == nil then return end
				for i, value in pairs((p2.props.mapValuesToProps(AnimatedValues))) do
					Current[i] = value
				end
			end
			
			function p2.onComplete()
				-- upvalues: p2 (copy)
				if p2.props.onComplete then
					p2.props.onComplete()
				end
			end
			
			p2.motor = nil
		end
		
		function ExtendResult.didMount(p3)
			-- upvalues: OtterModule (upval)
			local AnimatedValues = p3.props.animatedValues
			p3.applyAnimatedValues(AnimatedValues)
			p3.motor = OtterModule.createGroupMotor(AnimatedValues)
			p3.motor:onStep(function(p4)
				-- upvalues: p3 (copy)
				p3.applyAnimatedValues(p4)
			end)
			p3.motor:onComplete(p3.onComplete)
			p3.motor:start()
		end
		
		function ExtendResult.willUpdate(p3, p4)
			-- upvalues: RoactModule (upval)
			if p3.props.regularProps[RoactModule.Ref] ~= p4.regularProps[RoactModule.Ref] and p4.regularProps[RoactModule.Ref] ~= nil then
				p3.ref = p4.regularProps[RoactModule.Ref]
			end
		end
		
		function ExtendResult.render(p3)
			-- upvalues: IntersectionResult (upval), CryoModule (upval), RoactModule (upval), p1 (copy)
			assert(IntersectionResult(p3.props))
			
			return RoactModule.createElement(p1, (CryoModule.Dictionary.join(p3.props.regularProps, {
				[RoactModule.Ref] = p3.ref,
				[RoactModule.Children] = p3.props[RoactModule.Children]
			})))
		end
		
		function ExtendResult.didUpdate(p3, p4)
			-- upvalues: OtterModule (upval)
			if p3.props.animatedValues ~= p4.animatedValues then
				local SpringResults = {}
				local Flag = false
				
				for i, animatedValue in pairs(p3.props.animatedValues) do
					SpringResults[i] = OtterModule.spring(animatedValue, p3.props.springOptions)
					
					if animatedValue ~= p4.animatedValues[i] then
						Flag = true
					end
				end
				if Flag then
					p3.motor:setGoal(SpringResults)
				end
			end
		end
		
		function ExtendResult.willUnmount(p5)
			if p5.motor then
				p5.motor:destroy()
				p5.motor = nil
			end
		end
		
		return ExtendResult
	end
}
SpringAnimatedItemModule.AnimatedFrame = SpringAnimatedItemModule.wrap("Frame")
SpringAnimatedItemModule.AnimatedScrollingFrame = SpringAnimatedItemModule.wrap("ScrollingFrame")
SpringAnimatedItemModule.AnimatedImageLabel = SpringAnimatedItemModule.wrap("ImageLabel")
SpringAnimatedItemModule.AnimatedTextButton = SpringAnimatedItemModule.wrap("TextButton")
SpringAnimatedItemModule.AnimatedUIScale = SpringAnimatedItemModule.wrap("UIScale")

return SpringAnimatedItemModule