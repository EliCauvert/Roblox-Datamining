local commandsModule = require(script.Parent.Commands)

return function(p1, p2)
	-- upvalues: commandsModule (ref)
	for i, v in commandsModule do
		for i_1, v_1 in v.aliases do
			if p1 == v_1 or string.find(p1, "^" .. v_1 .. "%s") ~= nil then
				return v.run(p1, p2)
			end
		end
	end
	return nil
end