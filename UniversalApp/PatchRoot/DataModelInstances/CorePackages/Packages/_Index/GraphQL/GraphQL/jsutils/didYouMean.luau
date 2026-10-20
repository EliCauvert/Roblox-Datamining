local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

return {
	didYouMean = function(p1, p2): string
		local v1 = nil
		local v2 = nil
		
		if p2 then
			v1 = p1
			v2 = p2
		else
			v2 = p1
		end
		local Text = " Did you mean "
		
		if v1 then
			Text ..= v1 .. " "
		end
		local t = {}
		
		for i = 1, #v2 do
			t[i] = ("%q"):format(v2[i])
		end
		local CountT = #t
		
		if CountT == 0 then
			return ""
		elseif CountT == 1 then
			return Text .. t[1] .. "?"
		elseif CountT == 2 then
			return Text .. t[1] .. " or " .. t[2] .. "?"
		else
			local List = {}
			table.move(t, 1, 5, 1, List)
			
			return Text .. table.concat(List, ", ") .. ", or " .. tostring((table.remove(List))) .. "?"
		end
	end
}