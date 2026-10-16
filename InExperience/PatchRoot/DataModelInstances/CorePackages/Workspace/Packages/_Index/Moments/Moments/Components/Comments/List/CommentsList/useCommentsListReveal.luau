local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ViewRecycler)
local _ = require(script.Parent.Parent.Rows.CommentRowTypes)
local CreateCommentsListRevealTrackerModule = require(script.Parent.createCommentsListRevealTracker)

return function(Layout, Current, Current1) --[[ Line: 18 | Named "useCommentsListReveal" ]]
	-- upvalues: ReactModule (copy), CreateCommentsListRevealTrackerModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(Current1)
	UseRefResult1.current = Current1
	local UseStateResult = ReactModule.useState(function() --[[ Line: 24 ]]
		-- upvalues: CreateCommentsListRevealTrackerModule (upval), Layout (copy), UseRefResult (copy), UseRefResult1 (copy)
		return CreateCommentsListRevealTrackerModule({
			layout = Layout,
			getItemKey = function(p1) --[[ Line: 27 ]]
				-- upvalues: UseRefResult (upval)
				local CurrentEntry = UseRefResult.current[p1]
				
				return if CurrentEntry == nil then nil else CurrentEntry.key
			end,
			onReady = function() --[[ Line: 31 ]]
				-- upvalues: UseRefResult1 (upval)
				local CurrentFunction: () -> () = UseRefResult1.current
				
				if CurrentFunction ~= nil then
					CurrentFunction()
				end
			end
		})
	end)
	ReactModule.useEffect(function() --[[ Line: 40 ]]
		-- upvalues: UseStateResult (copy)
		local DelayedThread = task.delay(1, UseStateResult.reveal)
		
		return function() --[[ Line: 42 ]]
			-- upvalues: UseStateResult (upval), DelayedThread (copy)
			UseStateResult.destroy()
			pcall(task.cancel, DelayedThread)
		end
	end, { UseStateResult })
	
	return UseStateResult
end