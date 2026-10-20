local ReactModule = require(game:GetService("CorePackages").Packages.React)
local TooltipContextModule = require(script.Parent.TooltipContext)

function TooltipProvider(p1)
	-- upvalues: ReactModule (copy), TooltipContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseStateResult2 (copy), UseRefResult (copy), UseRefResult1 (copy)
		UseStateResult2(Current)
		UseRefResult.current = Current
		
		if UseRefResult.current and UseRefResult1.current and UseRefResult.current.id == UseRefResult1.current.id then
			UseRefResult1.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Id)
		-- upvalues: UseRefResult (copy), UseResult (copy), UseRefResult1 (copy), UseRefResult3 (copy)
		if UseRefResult and UseRefResult.current and UseRefResult.current.id == Id then
			UseResult(nil)
		end
		if UseRefResult1 and UseRefResult1.current and UseRefResult1.current.id == Id then
			UseRefResult1.current = nil
		end
		local v1 = nil
		
		for _, value in pairs(UseRefResult3.current) do
			if value.id == Id then
				v1 = value
				break
			end
		end
		if v1 and v1.priority and UseRefResult3.current[v1.priority] then
			UseRefResult3.current[v1.priority] = nil
		end
	end, { UseStateResult })
	UseRefResult2.current = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseResult (copy), UseResult1 (copy), UseRefResult2 (copy)
		if UseRefResult.current or UseRefResult1.current then return end
		local List = {}
		
		for _, value in pairs(UseRefResult3.current) do
			table.insert(List, value)
		end
		table.sort(List, function(A, B): boolean
			return B.priority < A.priority
		end)
		local Entry = List[1]
		
		if Entry then
			UseRefResult1.current = Entry
			task.delay(Entry.showDelay / 1000, function()
				-- upvalues: UseResult (upval), Entry (copy), UseResult1 (upval), UseRefResult2 (upval)
				UseResult(Entry)
				task.delay(Entry.dismissDelay / 1000, function()
					-- upvalues: UseResult1 (upval), Entry (upval), UseRefResult2 (upval)
					UseResult1(Entry.id)
					
					if UseRefResult2.current then
						UseRefResult2.current()
					end
				end)
			end)
			
			return
		end
	end, { UseStateResult })
	
	local function _()
		-- upvalues: UseRefResult2 (copy)
		if UseRefResult2.current then
			UseRefResult2.current()
		end
	end
	
	return ReactModule.createElement(TooltipContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseRefResult3 (copy), UseRefResult2 (copy), UseResult1 (copy), UseStateResult (copy)
			return {
				registerTooltip = function(Id, Priority, ShowDelay, DismissDelay)
					-- upvalues: UseRefResult3 (upval), UseRefResult2 (upval)
					if not UseRefResult3.current[Priority] then
						table.insert(UseRefResult3.current, Priority, {
							id = Id,
							priority = Priority,
							showDelay = ShowDelay,
							dismissDelay = DismissDelay
						})
						
						if UseRefResult2.current then
							UseRefResult2.current()
						end
					end
				end,
				unregisterTooltip = function(p2)
					-- upvalues: UseResult1 (upval), UseRefResult2 (upval)
					UseResult1(p2)
					
					if UseRefResult2.current then
						UseRefResult2.current()
					end
				end,
				dismissTooltip = function(p2, _)
					-- upvalues: UseResult1 (upval), UseRefResult2 (upval)
					UseResult1(p2)
					
					if UseRefResult2.current then
						UseRefResult2.current()
					end
				end,
				isCurrentTooltip = function(Id): boolean
					-- upvalues: UseStateResult (upval)
					return UseStateResult and UseStateResult.id == Id
				end
			}
		end, { UseStateResult })
	}, p1.children)
end

return TooltipProvider