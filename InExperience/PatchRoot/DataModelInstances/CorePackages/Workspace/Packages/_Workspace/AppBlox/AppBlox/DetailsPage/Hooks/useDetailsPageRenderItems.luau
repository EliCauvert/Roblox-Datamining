local reactModule = require(script:FindFirstAncestor("AppBlox").Parent.React)
local _ = require(script.Parent.Parent.Types)

return function(p0, p1, p2, p3) --[[ line: 9 | named "useDetailsPageRenderItems" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useMemo(function() --[[ line: 15 ]]
		-- upvalues: p0 (ref)
		local t = {}
		
		for i, v in p0 do
			table.insert(t, {
				index = v.portraitLayoutOrder + 1,
				renderComponent = v.renderComponent,
				showCornerGradient = v.showCornerGradient,
				useSelectionBumper = v.useSelectionBumper,
				key = i
			})
		end
		table.sort(t, function(p4, p5) --[[ line: 27 ]]
			return if p5.index then if p4.index then p4.index <= p5.index else false else true
		end)
		
		return t
	end, { p0 })
	
	return reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: var1 (ref), reactModule (copy), p2 (ref), p3 (ref), p1 (ref)
		local cloned = table.clone(var1)
		table.insert(cloned, 1, {
			index = 1,
			key = "Header",
			showCornerGradient = true,
			renderComponent = function() --[[ line: 47 ]]
				-- upvalues: reactModule (copy), p2 (copy), p3 (copy), p1 (copy)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, p2.Y - p3.Y * 2)
				}, {
					Layout = reactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Bottom }),
					HeaderContainer = p1
				})
			end
		})
		
		return cloned
	end, { var1, p1, p2.Y, p3.Y })
end