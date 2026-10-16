local _ = require(script.Parent.types)

local function _(p1) --[[ Line: 5 | Named "once" ]]
	local v1 = false
	
	return function() --[[ Line: 7 | Named "notAgain" ]]
		-- upvalues: v1 (ref), p1 (copy)
		if not v1 then
			v1 = true
			p1()
		end
	end
end

return function(Callback) --[[ Line: 16 | Named "createCachedResource" ]]
	local v1 = nil
	local v2 = nil
	local Count = 0
	
	local function disposeResource() --[[ Line: 21 ]]
		-- upvalues: Count (ref), v1 (ref), v2 (ref)
		Count -= 1
		
		if Count == 0 then
			v1 = nil
			
			if v2 ~= nil then
				local Callback: () -> () = v2
				v2 = nil
				Callback()
			end
		end
	end
	
	local function constructResource() --[[ Line: 33 ]]
		-- upvalues: v2 (ref), v1 (ref), Callback (copy)
		v2, v3 = Callback()
	end
	
	local function handleError(Success, ...) --[[ Line: 37 ]]
		-- upvalues: Count (ref), v1 (ref), v2 (ref)
		if not Success then
			Count -= 1
			
			if Count == 0 then
				v1 = nil
				
				if v2 ~= nil then
					local Callback: () -> () = v2
					v2 = nil
					Callback()
				end
			end
			error(...)
		end
	end
	
	return function() --[[ Line: 44 | Named "cachedResource" ]]
		-- upvalues: Count (ref), handleError (copy), constructResource (copy), disposeResource (copy), v1 (ref)
		Count += 1
		
		if Count == 1 then
			handleError(pcall(constructResource))
		end
		local v3 = false
		
		return function() --[[ Line: 7 | Named "notAgain" ]]
			-- upvalues: v3 (ref), disposeResource (copy)
			if not v3 then
				v3 = true
				disposeResource()
			end
		end, v1
	end
end