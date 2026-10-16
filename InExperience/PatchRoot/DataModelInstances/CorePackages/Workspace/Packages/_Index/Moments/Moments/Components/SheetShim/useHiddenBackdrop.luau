local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local _ = require(script.Parent.getSheetStructure)

return function(p1, p2) --[[ Line: 12 | Named "useHiddenBackdrop" ]]
	-- upvalues: ReactModule (copy)
	ReactModule.useLayoutEffect(function() --[[ Line: 13 ]]
		-- upvalues: p1 (copy), p2 (copy)
		local Backdrop = if p1 == nil or not p2 then nil else p1.backdrop
		
		if Backdrop == nil then
			return nil
		else
			local Gradient = Instance.new("UIGradient")
			Gradient.Transparency = NumberSequence.new(1)
			Gradient.Parent = Backdrop
			
			return function() --[[ Line: 22 ]]
				-- upvalues: Gradient (copy)
				Gradient:Destroy()
			end
		end
	end, { p1, p2 })
end