local TModule = require(script:FindFirstAncestor("CurrencyTransfers").Parent.t)
local ProcessTransferModelModule = {}

function ProcessTransferModelModule.new(p1) --[[ Line: 11 ]]
	-- upvalues: ProcessTransferModelModule (copy)
	assert(ProcessTransferModelModule.isValid(p1))
	ProcessTransferModelModule.__index = ProcessTransferModelModule
	setmetatable(p1, ProcessTransferModelModule)
	
	return p1
end

function ProcessTransferModelModule.mock(p1) --[[ Line: 23 ]]
	-- upvalues: ProcessTransferModelModule (copy)
	return (ProcessTransferModelModule.new({ success = (p1 or {}).success or true }))
end

function ProcessTransferModelModule.format(p1) --[[ Line: 33 ]]
	-- upvalues: ProcessTransferModelModule (copy)
	return (ProcessTransferModelModule.new({ success = p1.success }))
end

ProcessTransferModelModule.isValid = TModule.strictInterface({ success = TModule.boolean })

return ProcessTransferModelModule