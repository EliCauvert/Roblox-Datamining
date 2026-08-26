local cryoModule = require(script:FindFirstAncestor("ContactImporter").Parent.Cryo)

local function isEmoji(p1)
	return p1 >= 9728 and p1 <= 9983 or p1 >= 9984 and p1 <= 10175 or (p1 >= 127744 and p1 <= 128511 or p1 >= 128512 and p1 <= 128591) or (p1 >= 128640 and p1 <= 128767 or p1 >= 128768 and p1 <= 128895 or (p1 >= 129280 and p1 <= 129535 or p1 >= 127462 and p1 <= 127487)) or (p1 >= 127344 and p1 <= 127569 or p1 >= 129536 and p1 <= 129791)
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
			local var1
			for i, v in utf8.codes(p3.contactName) do
				if isEmoji(v) then
					var1 = true
					local var2
					for v, v_1 in utf8.codes(p4.contactName) do
						if isEmoji(v_1) then
							var2 = true
							return if var1 == var2 then if p3.contactName == p4.contactName then (p3.contactId or "") < (p4.contactId or "") else string.upper(p3.contactName) < string.upper(p4.contactName) else var1
						end
					end
					var2 = false
				end
			end
			var1 = false
		end
	end)
end