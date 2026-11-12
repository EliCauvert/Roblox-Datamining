local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact084
local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact08
local _ = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	new = function(Callback)
		-- upvalues: FFlagViewRecyclerReact084 (copy), FFlagViewRecyclerReact08 (copy)
		local Flag = true
		local Flag1 = false
		local v1 = nil
		local self = setmetatable({}, { __mode = "k" })
		
		local function check()
			-- upvalues: v1 (ref), Flag (ref), Flag1 (ref), self (copy), Callback (copy)
			local v2 = v1
			
			if not Flag or Flag1 or v2 == nil then return end
			local VisibleRange = v2.visibleRange
			
			if VisibleRange.lastIndex < VisibleRange.firstIndex then return end
			local Count = 0
			
			for _, mountedView in v2.mountedViews do
				local Index = mountedView.state.index
				
				if Index ~= nil and VisibleRange.firstIndex <= Index and Index <= VisibleRange.lastIndex then
					if self[mountedView.itemView] ~= mountedView.state.assignment then return end
					Count += 1
				end
			end
			if Count <= VisibleRange.lastIndex - VisibleRange.firstIndex then return end
			Flag = false
			local CallbackResult: (any) -> () = Callback()
			
			if CallbackResult ~= nil then
				CallbackResult(table.freeze({ visibleRange = VisibleRange }))
			end
		end
		
		return {
			rearm = function()
				-- upvalues: Flag (ref)
				Flag = true
			end,
			present = function(p1, p2, Callback: () -> ())
				-- upvalues: Flag1 (ref), FFlagViewRecyclerReact084 (upval), FFlagViewRecyclerReact08 (upval), v1 (ref), Flag (ref), check (copy)
				Flag1 = true
				local Success = nil
				local Result = nil
				
				if FFlagViewRecyclerReact084 then
					Success, Result = pcall(Callback)
				else
					Success = nil
					Result = nil
					
					if FFlagViewRecyclerReact08 then
						Success, Result = pcall(Callback)
					else
						Callback()
					end
				end
				Flag1 = false
				v1 = p1
				
				if if FFlagViewRecyclerReact084 then not Success else FFlagViewRecyclerReact08 then
					if FFlagViewRecyclerReact084 then
						error(Result, 0)
					elseif not Success then
						error(Result, 0)
					end
				end
				if p2 == 0 then
					Flag = true
					
					return
				else
					check()
				end
			end,
			presentationChanged = function(Key, p1)
				-- upvalues: self (copy), check (copy)
				self[Key] = p1
				check()
			end
		}
	end
}