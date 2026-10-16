local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(ViewRecyclerReact ~= nil, "JumpControls must be mounted under view-recycler-react")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local CreateElementFunction = ReactModule.createElement

return function(p1) --[[ Line: 8 | Named "JumpControls" ]]
	-- upvalues: CreateElementFunction (copy), ReactModule (copy)
	local function _(p2) --[[ Line: 9 | Named "jump" ]]
		-- upvalues: p1 (copy)
		local Current = p1.listRef.current
		
		if Current ~= nil then
			Current.scrollToIndex(p2, { alignment = p1.alignment })
		end
	end
	
	return CreateElementFunction("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		First = CreateElementFunction("TextButton", {
			Position = UDim2.fromOffset(8, 6),
			Size = UDim2.fromOffset(100, 30),
			Text = "Jump to #1",
			[ReactModule.Event.Activated] = function() --[[ Line: 26 ]]
				-- upvalues: p1 (copy)
				local Current = p1.listRef.current
				
				if Current ~= nil then
					Current.scrollToIndex(1, { alignment = p1.alignment })
				end
			end
		}),
		Target = CreateElementFunction("TextButton", {
			Position = UDim2.fromOffset(114, 6),
			Size = UDim2.fromOffset(176, 30),
			Text = `Jump to #{p1.target} ({p1.alignment})`,
			[ReactModule.Event.Activated] = function() --[[ Line: 34 ]]
				-- upvalues: p1 (copy)
				local Target = p1.target
				local Current = p1.listRef.current
				
				if Current ~= nil then
					Current.scrollToIndex(Target, { alignment = p1.alignment })
				end
			end
		}),
		Last = CreateElementFunction("TextButton", {
			Position = UDim2.fromOffset(296, 6),
			Size = UDim2.fromOffset(120, 30),
			Text = `Jump to #{p1.itemCount}`,
			[ReactModule.Event.Activated] = function() --[[ Line: 42 ]]
				-- upvalues: p1 (copy)
				local ItemCount = p1.itemCount
				local Current = p1.listRef.current
				
				if Current ~= nil then
					Current.scrollToIndex(ItemCount, { alignment = p1.alignment })
				end
			end
		})
	})
end