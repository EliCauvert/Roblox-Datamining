local cryoModule = require(script:FindFirstAncestor("UsageTracker").Parent.Cryo)
local isReactComponentModule = require(script.Parent.isReactComponent)
local usageGraphModule = require(script.Parent.UsageGraph)

return function(p0, p1, p2) --[[ line: 11 | named "trackMemberAccess" ]]
	-- upvalues: isReactComponentModule (ref), cryoModule (ref), usageGraphModule (ref)
	local t = {}
	local t_1 = {}
	p2 = p2 or isReactComponentModule
	
	local function wrap(p3, p4) --[[ line: 17 ]]
		-- upvalues: p2 (ref), t (ref), t_1 (ref), wrap (ref), cryoModule (copy)
		local t_2 = {}
		local t_3 = {}
		
		for i, v in p4 do
			if i ~= "__index" and typeof(i) == "string" then
				local text = p3 .. "." .. i
				
				if p2(v) then
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
			__index = function(_, p5) --[[ line: 41 ]]
				-- upvalues: t_2 (ref), t_3 (ref), p3 (ref), t (copy), cryoModule (copy)
				local var11 = t_2[p5]
				
				if var11 then
					local text = p3 .. "." .. p5
					local debugInfo, debugInfo_1 = debug.info(2, "sl")
					t[text] = cryoModule.List.join(t[text], { { dmPath = debugInfo, lineNumber = debugInfo_1 } })
					
					return var11
				end
				return rawget(t_3, p5)
			end
		})
	end
	
	local var7 = wrap(p0, p1)
	var7[usageGraphModule.UsageGraphKey] = t
	
	return var7
end