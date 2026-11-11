local Element = require(script.Parent.Parent.Rhodium).Element

return function(p1, p2)
	-- upvalues: Element (copy)
	local NewElement = Element.new(p1)
	
	if p2 then
		NewElement:clickWithoutValidation()
	else
		NewElement:click()
	end
	wait(0)
end