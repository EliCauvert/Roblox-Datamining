local httpService = game:GetService("HttpService")
local mrRouterEnvName = game:DefineFastString("MrRouterEnvName", "")
local t = {
	generateTraceparent = function()
		-- upvalues: httpService (ref)
		return string.format("00-%s-%s-01", httpService:GenerateGUID(false):gsub("-", ""):lower(), httpService:GenerateGUID(false):gsub("-", ""):sub(1, 16):lower())
	end,
	mergeMrRouterInTracestate = function(p0, p1)
		local text = "mrrouter-env=" .. p1
		local t = {}
		
		if p0 and #p0 > 0 then
			for i in p0:gmatch(" *([^,]+)") do
				table.insert(t, i)
			end
		end
		local function _(p2)
			return p2:sub(1, 13) == "mrrouter-env="
		end
		
		local var5 = nil
		
		for i, v in ipairs(t) do
			if v:sub(1, 13) == "mrrouter-env=" then
				var5 = i
				break
			end
		end
		if var5 == nil then
			table.insert(t, text)
			
			return table.concat(t, ",")
		end
		local t_1 = {}
		
		for v, v_1 in ipairs(t) do
			if v_1:sub(1, 13) ~= "mrrouter-env=" then
				table.insert(t_1, v_1)
			end
		end
		table.insert(t_1, var5, text)
		
		return table.concat(t_1, ",")
	end
}

function t.injectMrRouterHeaders(p3)
	-- upvalues: mrRouterEnvName (ref), t (ref)
	if #mrRouterEnvName == 0 then
		return p3
	end
	local var7 = if p3 then table.clone(p3) else {}
	
	if not var7.Traceparent then
		var7.Traceparent = t.generateTraceparent()
	end
	var7.Tracestate = t.mergeMrRouterInTracestate(var7.Tracestate, mrRouterEnvName)
	
	return var7
end

return t