local CommandsModule = require(script.Parent.Commands)

return function(Text: string, p1) --[[ Line: 11 ]]
	-- upvalues: CommandsModule (copy)
	for _, value in CommandsModule do
		for _, alias in value.aliases do
			if Text == alias or string.find(Text, "^" .. alias .. "%s") ~= nil then
				return value.run(Text, p1)
			end
		end
	end
	return nil
end