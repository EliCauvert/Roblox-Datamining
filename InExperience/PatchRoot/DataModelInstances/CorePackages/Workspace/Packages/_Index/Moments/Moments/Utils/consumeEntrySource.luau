return function(p1, p2)
	if not p1 or not p1.getParam then
		return "watch_tab"
	end
	local extraProps = p1.getParam("extraProps")
	
	if type(extraProps) == "table" and type(extraProps.source) == "string" then
		local var1 = `extraProps:{tostring(extraProps)}:{extraProps.source}`
		
		if not p2[var1] then
			p2[var1] = true
			
			return extraProps.source
		end
	end
	local source = p1.getParam("source")
	
	if type(source) == "string" then
		local state = p1.state
		local var2 = `params:{tostring(if type(state) == "table" and state.params ~= nil then state.params else state)}:{source}`
		
		if p2[var2] then
			return "watch_tab"
		else
			p2[var2] = true
			
			return source
		end
	end
end