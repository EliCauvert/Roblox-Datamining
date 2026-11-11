local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local _ = require(Foundation.Providers.Style.Tokens)

return {
	animate = function(p1, p2, p3, p4)
		-- upvalues: OtterModule (copy)
		local Value: number = p1.drag:getValue()
		local StartingValue = if Value == nil then nil else 1 - Value
		
		if p4 then
			p1.setPanelGoal(OtterModule.instant(if p2 then 1 else 0))
			p1.setBackdropGoal(OtterModule.instant(if p2 then 0 else 1))
		elseif p2 then
			p1.setPanelGoal(OtterModule.ease(1, {
				easingStyle = p3.Ease.StandardOut,
				duration = p3.Time.Time_300,
				startingValue = Value
			}))
			p1.setBackdropGoal(OtterModule.ease(0, {
				duration = p3.Time.Time_100,
				startingValue = StartingValue
			}))
		else
			p1.setPanelGoal(OtterModule.ease(0, {
				easingStyle = p3.Ease.StandardIn,
				duration = p3.Time.Time_100,
				startingValue = Value
			}))
			p1.setBackdropGoal(OtterModule.ease(1, {
				duration = p3.Time.Time_100,
				startingValue = StartingValue
			}))
		end
		if Value ~= nil then
			p1.setDrag(nil)
		end
	end,
	hold = function(p1)
		-- upvalues: OtterModule (copy)
		p1.setPanelGoal(OtterModule.instant(p1.panelProgress:getValue()))
		p1.setBackdropGoal(OtterModule.instant(p1.backdropTransparency:getValue()))
	end,
	useDrag = function()
		-- upvalues: ReactModule (copy)
		local UseStateResult = ReactModule.useState(function()
			-- upvalues: ReactModule (upval)
			local Binding, Binding2 = ReactModule.createBinding(nil)
			
			return { drag = Binding, setDrag = Binding2 }
		end)
		
		return UseStateResult.drag, UseStateResult.setDrag
	end
}