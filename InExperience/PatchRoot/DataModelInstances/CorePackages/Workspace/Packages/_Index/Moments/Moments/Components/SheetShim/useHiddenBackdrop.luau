local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local _ = require(script.Parent.getSheetStructure)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), p2 (ref)
		local var1 = if p1 == nil or not p2 then nil else p1.backdrop
		
		if var1 == nil then
			return nil
		end
		local UIGradient = Instance.new("UIGradient")
		UIGradient.Transparency = NumberSequence.new(1)
		UIGradient.Parent = var1
		
		return function()
			-- upvalues: UIGradient (ref)
			UIGradient:Destroy()
		end
	end, { p1, p2 })
end