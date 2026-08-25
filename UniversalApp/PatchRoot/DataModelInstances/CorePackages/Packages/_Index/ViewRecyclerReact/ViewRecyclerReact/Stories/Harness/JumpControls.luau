local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(viewRecyclerReact ~= nil, "JumpControls must be mounted under view-recycler-react")
local reactModule = require(viewRecyclerReact.Parent.React)
local createElement = reactModule.createElement

return function(p0)
	-- upvalues: createElement (ref), reactModule (ref)
	local function _(p1)
		-- upvalues: p0 (ref)
		local current = p0.listRef.current
		
		if current ~= nil then
			current.scrollToIndex(p1, { alignment = p0.alignment })
		end
	end
	
	return createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		First = createElement("TextButton", {
			Position = UDim2.fromOffset(8, 6),
			Size = UDim2.fromOffset(100, 30),
			Text = "Jump to #1",
			[reactModule.Event.Activated] = function()
				-- upvalues: p0 (ref)
				local current = p0.listRef.current
				
				if current ~= nil then
					current.scrollToIndex(1, { alignment = p0.alignment })
				end
			end
		}),
		Target = createElement("TextButton", {
			Position = UDim2.fromOffset(114, 6),
			Size = UDim2.fromOffset(176, 30),
			Text = `Jump to #{p0.target} ({p0.alignment})`,
			[reactModule.Event.Activated] = function()
				-- upvalues: p0 (ref)
				local target = p0.target
				local current = p0.listRef.current
				
				if current ~= nil then
					current.scrollToIndex(target, { alignment = p0.alignment })
				end
			end
		}),
		Last = createElement("TextButton", {
			Position = UDim2.fromOffset(296, 6),
			Size = UDim2.fromOffset(120, 30),
			Text = `Jump to #{p0.itemCount}`,
			[reactModule.Event.Activated] = function()
				-- upvalues: p0 (ref)
				local itemCount = p0.itemCount
				local current = p0.listRef.current
				
				if current ~= nil then
					current.scrollToIndex(itemCount, { alignment = p0.alignment })
				end
			end
		})
	})
end