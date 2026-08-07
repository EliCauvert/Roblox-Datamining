-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:01 2026 Pacific Standard Time.

return function(p0) --[[ line: 8 | named "createBrickColorsFromIds" ]]
	local t = {}
	
	for i, v in p0 do
		local ok, status = pcall(BrickColor.new, v)
		
		if ok and status then
			table.insert(t, status)
		else
			warn(`createBrickColorsFromIds: Failed to create BrickColor with ID {v}`)
		end
	end
	return t
end