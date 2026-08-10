local commandsModule = require(script.Parent.Commands)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: commandsModule (ref)
	for i, v in commandsModule do
		for i_1, v_1 in v.aliases do
			if p0 == v_1 or string.find(p0, "^" .. v_1 .. "%s") ~= nil then
				return v.run(p0, p1)
			end
		end
	end
	return nil
end