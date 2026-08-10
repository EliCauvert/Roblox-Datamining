return function(p0, p1) --[[ line: 5 | named "consumeEntrySource" ]]
	if not p0 or not p0.getParam then
		return "watch_tab"
	end
	local extraProps = p0.getParam("extraProps")
	
	if type(extraProps) == "table" and type(extraProps.source) == "string" then
		local var1 = `extraProps:{tostring(extraProps)}:{extraProps.source}`
		
		if not p1[var1] then
			p1[var1] = true
			
			return extraProps.source
		end
	end
	local source = p0.getParam("source")
	
	if type(source) == "string" then
		local state = p0.state
		local var3 = `params:{tostring(if type(state) == "table" and state.params ~= nil then state.params else state)}:{source}`
		
		if p1[var3] then
			return "watch_tab"
		else
			p1[var3] = true
			
			return source
		end
	end
end