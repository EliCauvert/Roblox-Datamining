local ReactModule = require(script:FindFirstAncestor("AppBlox").Parent.React)
local _ = require(script.Parent.Parent.Types)

return function(p1, HeaderContainer, Vector, Vector1) --[[ Line: 9 | Named "useDetailsPageRenderItems" ]]
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 15 ]]
		-- upvalues: p1 (copy)
		local List = {}
		
		for Key, value in p1 do
			table.insert(List, {
				index = value.portraitLayoutOrder + 1,
				renderComponent = value.renderComponent,
				showCornerGradient = value.showCornerGradient,
				useSelectionBumper = value.useSelectionBumper,
				key = Key
			})
		end
		table.sort(List, function(A, B): boolean --[[ Line: 27 ]]
			return not B.index or (if A.index then A.index <= B.index else false)
		end)
		
		return List
	end, { p1 })
	
	return (ReactModule.useMemo(function() --[[ Line: 40 ]]
		-- upvalues: UseMemoResult (copy), ReactModule (upval), Vector (copy), Vector1 (copy), HeaderContainer (copy)
		local Copy = table.clone(UseMemoResult)
		table.insert(Copy, 1, {
			index = 1,
			key = "Header",
			showCornerGradient = true,
			renderComponent = function() --[[ Line: 47 ]]
				-- upvalues: ReactModule (upval), Vector (upval), Vector1 (upval), HeaderContainer (upval)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, Vector.Y - Vector1.Y * 2)
				}, {
					Layout = ReactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Bottom }),
					HeaderContainer = HeaderContainer
				})
			end
		})
		
		return Copy
	end, { UseMemoResult, HeaderContainer, Vector.Y, Vector1.Y }))
end