return function(p1, p2): string --[[ Line: 8 | Named "formatCaughtError" ]]
	local CoreScriptsErrorBoundaryName: string = `[CoreScriptsErrorBoundary surface={p2.surface}]`
	
	if p2.componentStack then
		CoreScriptsErrorBoundaryName ..= p2.componentStack
	end
	return if typeof(p1) == "table" and p1.message ~= nil and p1.stack ~= nil then CoreScriptsErrorBoundaryName .. "\n------ Error caught by React ------\n" .. tostring(p1.message) .. "\n------ Error caught by React ------\n" .. tostring(p1.stack) else tostring(p1) .. "\n" .. CoreScriptsErrorBoundaryName
end