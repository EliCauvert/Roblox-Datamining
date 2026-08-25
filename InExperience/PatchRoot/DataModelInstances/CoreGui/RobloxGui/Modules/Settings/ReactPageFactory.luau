local reactModule = require(game:GetService("CorePackages").Packages.React)
local t = {}

local function createNewPage(p0)
	-- upvalues: reactModule (ref)
	local t = { page = nil, hubRef = nil, name = p0 }
	
	function t.setPage(_, p1)
		-- upvalues: t (ref)
		t.page = p1
	end
	
	function t.createPage(_, p2)
		-- upvalues: t (ref), reactModule (copy)
		return if t.page then reactModule.createElement(t.page, p2) else nil
	end
	
	return t
end

function t.createNewPage(_, p3)
	-- upvalues: createNewPage (ref)
	return createNewPage(p3)
end

return t