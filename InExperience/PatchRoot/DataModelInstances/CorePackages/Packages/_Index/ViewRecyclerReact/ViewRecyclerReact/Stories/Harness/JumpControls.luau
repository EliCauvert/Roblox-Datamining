local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(viewRecyclerReact ~= nil, "JumpControls must be mounted under view-recycler-react")
local reactModule = require(viewRecyclerReact.Parent.React)
local createElement = reactModule.createElement

return function(p1)
	-- upvalues: createElement (ref), reactModule (ref)
	local function _(p2)
		-- upvalues: p1 (ref)
		local current = p1.listRef.current
		
		if current ~= nil then
			current.scrollToIndex(p2, { alignment = p1.alignment })
		end
	end
	
	return createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		First = createElement("TextButton", {
			Position = UDim2.fromOffset(8, 6),
			Size = UDim2.fromOffset(100, 30),
			Text = "Jump to #1",
			[reactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				local current = p1.listRef.current
				
				if current ~= nil then
					current.scrollToIndex(1, { alignment = p1.alignment })
				end
			end
		}),
		Target = createElement("TextButton", {
			Position = UDim2.fromOffset(114, 6),
			Size = UDim2.fromOffset(176, 30),
			Text = `Jump to #{p1.target} ({p1.alignment})`,
			[reactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				local target = p1.target
				local current = p1.listRef.current
				
				if current ~= nil then
					current.scrollToIndex(target, { alignment = p1.alignment })
				end
			end
		}),
		Last = createElement("TextButton", {
			Position = UDim2.fromOffset(296, 6),
			Size = UDim2.fromOffset(120, 30),
			Text = `Jump to #{p1.itemCount}`,
			[reactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				local itemCount = p1.itemCount
				local current = p1.listRef.current
				
				if current ~= nil then
					current.scrollToIndex(itemCount, { alignment = p1.alignment })
				end
			end
		})
	})
end