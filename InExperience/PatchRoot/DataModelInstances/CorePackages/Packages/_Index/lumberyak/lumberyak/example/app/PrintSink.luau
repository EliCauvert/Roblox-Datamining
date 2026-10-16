local LoggerModule = require(script.Parent.Parent.Parent.Logger)
local PrintSinkModule = {}

function PrintSinkModule.new(MaxLevel) --[[ Line: 5 ]]
	-- upvalues: PrintSinkModule (copy)
	local config = { maxLevel = MaxLevel }
	setmetatable(config, PrintSinkModule)
	
	return config
end

function PrintSinkModule:log(p1, p2) --[[ Line: 14 ]]
	-- upvalues: LoggerModule (copy)
	if p2.level == LoggerModule.Levels.Error then
		error(p1, 5)
		
		return
	end
	if p2.level == LoggerModule.Levels.Warning then
		warn(p1)
		
		return
	else
		print(p1)
	end
end

return PrintSinkModule