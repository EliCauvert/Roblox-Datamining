local function _(p1)
	return if p1 ~= nil then p1 == "" else true
end

return function(p1, p2)
	local var1
	if p1 then
		local username = p1.username
		var1 = if if username ~= nil then username == "" else true then nil else p1.username
	end
	local var2 = var1 or (p2.username or "")
	local var3 = var1 ~= nil and var1 ~= p2.username
	local var4 = if p1 then p1.displayName else nil
	
	if if var4 ~= nil then var4 == "" else true then
		var4 = if var3 then var2 else p2.displayName
	end
	return {
		username = var2,
		displayName = var4,
		didUsernameChange = var3
	}
end