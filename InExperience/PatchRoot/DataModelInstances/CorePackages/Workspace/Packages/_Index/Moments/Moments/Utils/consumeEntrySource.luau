return function(p1, p2)
	if not p1 or not p1.getParam then
		return "watch_tab"
	end
	local ExtraPropsParam = p1.getParam("extraProps")
	
	if type(ExtraPropsParam) == "table" and type(ExtraPropsParam.source) == "string" then
		local ExtraPropsName: string = `extraProps:{tostring(ExtraPropsParam)}:{ExtraPropsParam.source}`
		
		if not p2[ExtraPropsName] then
			p2[ExtraPropsName] = true
			
			return ExtraPropsParam.source
		end
	end
	local SourceParam = p1.getParam("source")
	
	if type(SourceParam) == "string" then
		local State = p1.state
		local ParamsName: string = `params:{tostring(if type(State) == "table" and State.params ~= nil then State.params else State)}:{SourceParam}`
		
		if not p2[ParamsName] then
			p2[ParamsName] = true
			
			return SourceParam
		end
	end
	return "watch_tab"
end