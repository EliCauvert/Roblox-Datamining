local HttpService = game:GetService("HttpService")
local MrRouterEnvName = game:DefineFastString("MrRouterEnvName", "")
local MrRouterHeadersModule = {
	generateTraceparent = function(): string --[[ Line: 17 ]]
		-- upvalues: HttpService (copy)
		return string.format("00-%s-%s-01", HttpService:GenerateGUID(false):gsub("-", ""):lower(), (HttpService:GenerateGUID(false):gsub("-", ""):sub(1, 16):lower()))
	end,
	mergeMrRouterInTracestate = function(Text: string, MrRouterEnvName): string --[[ Line: 23 ]]
		local Text1 = "mrrouter-env=" .. MrRouterEnvName
		local List = {}
		
		if Text and #Text > 0 then
			for i in Text:gmatch(" *([^,]+)") do
				table.insert(List, i)
			end
		end
		local function _(Text: string): boolean --[[ Line: 33 | Named "isMrRouterEntry" ]]
			return Text:sub(1, 13) == "mrrouter-env="
		end
		
		local v1 = nil
		
		for i1, Text2 in ipairs(List) do
			if Text2:sub(1, 13) == "mrrouter-env=" then
				v1 = i1
				break
			end
		end
		if v1 == nil then
			table.insert(List, Text1)
			
			return table.concat(List, ",")
		end
		local List1 = {}
		
		for _, Text3 in ipairs(List) do
			if Text3:sub(1, 13) ~= "mrrouter-env=" then
				table.insert(List1, Text3)
			end
		end
		table.insert(List1, v1, Text1)
		
		return table.concat(List1, ",")
	end
}

function MrRouterHeadersModule.injectMrRouterHeaders(Tbl) --[[ Line: 64 ]]
	-- upvalues: MrRouterEnvName (copy), MrRouterHeadersModule (copy)
	if #MrRouterEnvName == 0 then
		return Tbl
	end
	local Copy = if Tbl then table.clone(Tbl) else {}
	
	if not Copy.Traceparent then
		Copy.Traceparent = MrRouterHeadersModule.generateTraceparent()
	end
	Copy.Tracestate = MrRouterHeadersModule.mergeMrRouterInTracestate(Copy.Tracestate, MrRouterEnvName)
	
	return Copy
end

MrRouterHeadersModule["jest.config"] = script["jest.config"]

return MrRouterHeadersModule