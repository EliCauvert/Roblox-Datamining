local cryoModule = require(script:FindFirstAncestor("UsageTracker").Parent.Cryo)
local isReactComponentModule = require(script.Parent.isReactComponent)
local usageGraphModule = require(script.Parent.UsageGraph)

return function(p1, p2, p3)
	-- upvalues: isReactComponentModule (ref), cryoModule (ref), usageGraphModule (ref)
	local t = {}
	local t_1 = {}
	p3 = p3 or isReactComponentModule
	
	local function wrap(p4, p5)
		-- upvalues: p3 (ref), t (ref), t_1 (ref), wrap (ref), cryoModule (copy)
		local t_2 = {}
		local t_3 = {}
		
		for i, v in p5 do
			if i ~= "__index" and typeof(i) == "string" then
				local text = p4 .. "." .. i
				
				if p3(v) then
					t[text] = {}
					t_2[i] = v
				elseif typeof(v) == "table" and not t_1[v] then
					t_3[i] = wrap(text, v)
				else
					t_3[i] = v
				end
				t_1[v] = true
			end
		end
		return setmetatable(t_3, {
			__index = function(_, p6)
				-- upvalues: t_2 (ref), t_3 (ref), p4 (ref), t (copy), cryoModule (copy)
				local var1 = t_2[p6]
				
				if var1 then
					local text = p4 .. "." .. p5
					local debugInfo, debugInfo_1 = debug.info(2, "sl")
					t[text] = cryoModule.List.join(t[text], { { dmPath = debugInfo, lineNumber = debugInfo_1 } })
					
					return var1
				end
				return rawget(t_3, p6)
			end
		})
	end
	
	local var1 = wrap(p1, p2)
	var1[usageGraphModule.UsageGraphKey] = t
	
	return var1
end