local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local _ = require(parent.ViewRecycler)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)
local createCommentsListRevealTrackerModule = require(script.Parent.createCommentsListRevealTracker)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), createCommentsListRevealTrackerModule (ref)
	local var1 = reactModule.useRef(p2)
	var1.current = p2
	local var2 = reactModule.useRef(p3)
	var2.current = p3
	local var3 = reactModule.useState(function()
		-- upvalues: createCommentsListRevealTrackerModule (copy), p1 (ref), var1 (ref), var2 (ref)
		return createCommentsListRevealTrackerModule({
			layout = p1,
			getItemKey = function(p4)
				-- upvalues: var1 (copy)
				local var4 = var1.current[p4]
				
				return if var4 == nil then nil else var4.key
			end,
			onReady = function()
				-- upvalues: var2 (copy)
				local current = var2.current
				
				if current ~= nil then
					current()
				end
			end
		})
	end)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		local delayedThread = task.delay(1, var3.reveal)
		
		return function()
			-- upvalues: var3 (copy), delayedThread (ref)
			var3.destroy()
			pcall(task.cancel, delayedThread)
		end
	end, { var3 })
	
	return var3
end