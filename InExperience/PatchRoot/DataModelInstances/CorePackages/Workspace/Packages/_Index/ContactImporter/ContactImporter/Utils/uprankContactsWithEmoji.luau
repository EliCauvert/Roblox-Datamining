local CryoModule = require(script:FindFirstAncestor("ContactImporter").Parent.Cryo)

local function isEmoji(p1: number): boolean
	return p1 >= 9728 and p1 <= 9983 or p1 >= 9984 and p1 <= 10175 or p1 >= 127744 and p1 <= 128511 or p1 >= 128512 and p1 <= 128591 or p1 >= 128640 and p1 <= 128767 or p1 >= 128768 and p1 <= 128895 or p1 >= 129280 and p1 <= 129535 or p1 >= 127462 and p1 <= 127487 or p1 >= 127344 and p1 <= 127569 or p1 >= 129536 and p1 <= 129791
end

local function _(p1): boolean
	-- upvalues: isEmoji (copy)
	for _, value in utf8.codes(p1) do
		if isEmoji(value) then
			return true
		end
	end
	return false
end

return function(p2)
	-- upvalues: CryoModule (copy), isEmoji (copy)
	return CryoModule.List.sort(p2, function(p3, p4): boolean
		-- upvalues: isEmoji (upval)
		if p3.contactName and p4.contactName then
			local Flag = false
			
			for _, value in utf8.codes(p3.contactName) do
				if isEmoji(value) then
					Flag = true
					break
				end
			end
			local Flag1 = false
			
			for _, value1 in utf8.codes(p4.contactName) do
				if isEmoji(value1) then
					Flag1 = true
					break
				end
			end
			if Flag ~= Flag1 then
				return Flag
			elseif p3.contactName ~= p4.contactName then
				return string.upper(p3.contactName) < string.upper(p4.contactName)
			end
		end
		return (p3.contactId or "") < (p4.contactId or "")
	end)
end