local _ = require(script.Parent.Types.acpSession)
local _ = require(script.Parent.Types.model)

return {
	capture = function(Tier, Tbl)
		assert(Tier == "default" or Tier == "advanced", "invalid model tier")
		local Copy = if Tbl == nil then nil else table.clone(Tbl)
		
		if Copy ~= nil then
			if Copy.clientToolConfig ~= nil then
				local Copy1 = table.clone(Copy.clientToolConfig)
				Copy1.tools = table.freeze(table.clone(Copy1.tools))
				Copy.clientToolConfig = table.freeze(Copy1)
			end
			table.freeze(Copy)
		end
		return table.freeze({ tier = Tier, experiment = Copy })
	end,
	sameExperiment = function(p1, p2): boolean
		if p1 == nil or p2 == nil then
			return p1 == p2
		end
		if p1.specVersion ~= p2.specVersion or p1.runId ~= p2.runId then
			return false
		end
		local ClientToolConfig = p1.clientToolConfig
		local ClientToolConfig1 = p2.clientToolConfig
		
		if ClientToolConfig == nil or ClientToolConfig1 == nil then
			return ClientToolConfig == ClientToolConfig1
		end
		if ClientToolConfig.mode ~= ClientToolConfig1.mode or #ClientToolConfig.tools ~= #ClientToolConfig1.tools then
			return false
		end
		for i, tool in ClientToolConfig.tools do
			if tool ~= ClientToolConfig1.tools[i] then
				return false
			end
		end
		return true
	end
}