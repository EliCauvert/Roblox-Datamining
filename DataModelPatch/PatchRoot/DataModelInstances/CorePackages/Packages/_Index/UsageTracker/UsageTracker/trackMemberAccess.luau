local CryoModule = require(script:FindFirstAncestor("UsageTracker").Parent.Cryo)
local IsReactComponentModule = require(script.Parent.isReactComponent)
local UsageGraphModule = require(script.Parent.UsageGraph)

return function(p1, p2, p3)
	-- upvalues: IsReactComponentModule (copy), CryoModule (copy), UsageGraphModule (copy)
	local JoinResults = {}
	local t = {}
	local Callback = p3 or IsReactComponentModule
	
	local function wrap(Text, List)
		-- upvalues: Callback (copy), JoinResults (copy), t (copy), wrap (copy), CryoModule (upval)
		local t1 = {}
		local t2 = {}
		
		for i, value in List do
			if i ~= "__index" and typeof(i) == "string" then
				local Text1 = Text .. "." .. i
				
				if Callback(value) then
					JoinResults[Text1] = {}
					t1[i] = value
				elseif typeof(value) == "table" and not t[value] then
					t2[i] = wrap(Text1, value)
				else
					t2[i] = value
				end
				t[value] = true
			end
		end
		return (setmetatable(t2, {
			__index = function(_, Text1)
				-- upvalues: t1 (copy), t2 (copy), Text (copy), JoinResults (upval), CryoModule (upval)
				local Entry = t1[Text1]
				
				if Entry then
					local Text2 = Text .. "." .. Text1
					local DebugInfo, DebugInfo2 = debug.info(2, "sl")
					JoinResults[Text2] = CryoModule.List.join(JoinResults[Text2], { { dmPath = DebugInfo, lineNumber = DebugInfo2 } })
					
					return Entry
				else
					return (rawget(t2, Text1))
				end
			end
		}))
	end
	
	local WrapResult = wrap(p1, p2)
	WrapResult[UsageGraphModule.UsageGraphKey] = JoinResults
	
	return WrapResult
end