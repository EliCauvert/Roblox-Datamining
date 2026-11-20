local Parent = script:FindFirstAncestor("InterstitialAdPlayer").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy), BuilderIconsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: BuilderIconsModule (upval), UseStateResult2 (copy), p1 (copy)
		local List = {}
		
		for _, value in BuilderIconsModule.IconVariant do
			local Label = Instance.new("TextLabel")
			Label.FontFace = BuilderIconsModule.Font[value]
			Label.Text = "x"
			table.insert(List, Label)
		end
		local Flag = true
		
		local function stopWaiting()
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if Flag then
				UseStateResult2(true)
			end
		end
		
		task.spawn(function()
			-- upvalues: p1 (upval), List (copy), Flag (ref), UseStateResult2 (upval)
			pcall(p1, List)
			
			for _, value in List do
				value:Destroy()
			end
			if Flag then
				UseStateResult2(true)
			end
		end)
		local DelayedThread = task.delay(2, stopWaiting)
		
		return function()
			-- upvalues: Flag (ref), DelayedThread (copy)
			Flag = false
			task.cancel(DelayedThread)
		end
	end, { p1 })
	
	return UseStateResult
end