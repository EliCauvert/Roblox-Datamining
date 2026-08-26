local httpService = game:GetService("HttpService")
local mrRouterEnvName = game:DefineFastString("MrRouterEnvName", "")
local t = {
	generateTraceparent = function()
		-- upvalues: httpService (ref)
		return string.format("00-%s-%s-01", httpService:GenerateGUID(false):gsub("-", ""):lower(), httpService:GenerateGUID(false):gsub("-", ""):sub(1, 16):lower())
	end,
	mergeMrRouterInTracestate = function(p1, p2)
		local text = "mrrouter-env=" .. p1
		local t = {}
		
		if p1 and #p1 > 0 then
			for i in p1:gmatch(" *([^,]+)") do
				table.insert(t, i)
			end
		end
		local function _(p3)
			return p3:sub(1, 13) == "mrrouter-env="
		end
		
		local var1 = nil
		
		for i, v in ipairs(t) do
			if v:sub(1, 13) == "mrrouter-env=" then
				var1 = i
				break
			end
		end
		if var1 == nil then
			table.insert(t, text)
			
			return table.concat(t, ",")
		end
		local t_1 = {}
		
		for v, v_1 in ipairs(t) do
			if v_1:sub(1, 13) ~= "mrrouter-env=" then
				table.insert(t_1, v_1)
			end
		end
		table.insert(t_1, var1, text)
		
		return table.concat(t_1, ",")
	end
}

function t.injectMrRouterHeaders(p3)
	-- upvalues: mrRouterEnvName (ref), t (ref)
	if #mrRouterEnvName == 0 then
		return p3
	end
	local var2 = if p3 then table.clone(p3) else {}
	
	if not var2.Traceparent then
		var2.Traceparent = t.generateTraceparent()
	end
	var2.Tracestate = t.mergeMrRouterInTracestate(var2.Tracestate, mrRouterEnvName)
	
	return var2
end

return t