local _ = require(script.Parent.SduiErrors)

return function(p1, p2)
	if p2 then
		p1.fullName = p2.fullName
		p1.rctPath = p2.rctPath
		p1.templateId = p2.templateId
	end
end