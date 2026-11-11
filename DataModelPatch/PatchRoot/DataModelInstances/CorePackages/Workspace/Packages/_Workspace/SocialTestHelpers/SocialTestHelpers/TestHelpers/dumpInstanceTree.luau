local IndentedLineBufferModule = require(script.Parent.IndentedLineBuffer)

local function dumpInstanceTree(Object, NewResult)
	-- upvalues: dumpInstanceTree (copy)
	if Object == nil then
		NewResult:addLine("[nil Instance]")
		
		return
	end
	if Object.Name == nil then
		NewResult:addLine("[Invalid Instance]")
		
		return
	end
	NewResult:addLine(Object.Name)
	NewResult:indent()
	
	for _, child in ipairs(Object:GetChildren()) do
		dumpInstanceTree(child, NewResult)
	end
	NewResult:unindent()
end

return function(p1): string
	-- upvalues: IndentedLineBufferModule (copy), dumpInstanceTree (copy)
	local NewIndentedLineBuffer = IndentedLineBufferModule.new()
	dumpInstanceTree(p1, NewIndentedLineBuffer)
	
	return (tostring(NewIndentedLineBuffer))
end