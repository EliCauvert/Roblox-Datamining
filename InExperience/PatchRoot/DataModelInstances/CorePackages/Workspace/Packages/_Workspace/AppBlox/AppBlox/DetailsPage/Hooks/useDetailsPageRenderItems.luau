local reactModule = require(script:FindFirstAncestor("AppBlox").Parent.React)
local _ = require(script.Parent.Parent.Types)

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local t = {}
		
		for i, v in p1 do
			table.insert(t, {
				index = v.portraitLayoutOrder + 1,
				renderComponent = v.renderComponent,
				showCornerGradient = v.showCornerGradient,
				useSelectionBumper = v.useSelectionBumper,
				key = i
			})
		end
		table.sort(t, function(p5, p6)
			return if p6.index then if p5.index then p5.index <= p6.index else false else true
		end)
		
		return t
	end, { p1 })
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), reactModule (copy), p3 (ref), p4 (ref), p2 (ref)
		local cloned = table.clone(var1)
		table.insert(cloned, 1, {
			index = 1,
			key = "Header",
			showCornerGradient = true,
			renderComponent = function()
				-- upvalues: reactModule (copy), p3 (copy), p4 (copy), p2 (copy)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, p3.Y - p4.Y * 2)
				}, {
					Layout = reactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Bottom }),
					HeaderContainer = p2
				})
			end
		})
		
		return cloned
	end, { var1, p2, p3.Y, p4.Y })
end