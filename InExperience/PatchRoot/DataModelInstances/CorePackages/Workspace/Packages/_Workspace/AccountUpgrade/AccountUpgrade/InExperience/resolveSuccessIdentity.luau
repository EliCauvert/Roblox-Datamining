local function _(p1): boolean
	return p1 == nil or p1 == ""
end

return function(p1, p2)
	local Username = nil
	repeat
		if p1 then
			local Username1 = p1.username
			
			if Username1 ~= nil and Username1 ~= "" then
				Username = p1.username
				break
			end
		end
		Username = nil
	until true
	local Username1 = Username or (p2.username or "")
	local IsNotUsernameMatch: boolean = Username ~= nil and Username ~= p2.username
	local DisplayName = if p1 then p1.displayName else nil
	
	if DisplayName == nil or DisplayName == "" then
		DisplayName = if IsNotUsernameMatch then Username1 else p2.displayName
	end
	return {
		username = Username1,
		displayName = DisplayName,
		didUsernameChange = IsNotUsernameMatch
	}
end