local cryoModule = require(script:FindFirstAncestor("ContactImporter").Parent.Cryo)

local function isEmoji(p0)
	return p0 >= 9728 and p0 <= 9983 or p0 >= 9984 and p0 <= 10175 or (p0 >= 127744 and p0 <= 128511 or p0 >= 128512 and p0 <= 128591) or (p0 >= 128640 and p0 <= 128767 or p0 >= 128768 and p0 <= 128895 or (p0 >= 129280 and p0 <= 129535 or p0 >= 127462 and p0 <= 127487)) or (p0 >= 127344 and p0 <= 127569 or p0 >= 129536 and p0 <= 129791)
end

local function _(p1)
	-- upvalues: isEmoji (ref)
	for i, v in utf8.codes(p1) do
		if isEmoji(v) then
			return true
		end
	end
	return false
end

return function(p2)
	-- upvalues: cryoModule (ref), isEmoji (ref)
	return cryoModule.List.sort(p2, function(p3, p4)
		-- upvalues: isEmoji (copy)
		if p3.contactName and p4.contactName then
			local var2
			for i, v in utf8.codes(p3.contactName) do
				if isEmoji(v) then
					var2 = true
					local var3
					for v, v_1 in utf8.codes(p4.contactName) do
						if isEmoji(v_1) then
							var3 = true
							return if var2 == var3 then if p3.contactName == p4.contactName then (p3.contactId or "") < (p4.contactId or "") else string.upper(p3.contactName) < string.upper(p4.contactName) else var2
						end
					end
					var3 = false
				end
			end
			var2 = false
		end
	end)
end