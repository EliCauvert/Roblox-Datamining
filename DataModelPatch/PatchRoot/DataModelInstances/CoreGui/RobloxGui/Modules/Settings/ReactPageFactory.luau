local ReactModule = require(game:GetService("CorePackages").Packages.React)

local function createNewPage(Name)
	-- upvalues: ReactModule (copy)
	local config = { page = nil, hubRef = nil, name = Name }
	
	function config:setPage(Page)
		-- upvalues: config (copy)
		config.page = Page
	end
	
	function config:createPage(p1)
		-- upvalues: config (copy), ReactModule (upval)
		return if config.page then ReactModule.createElement(config.page, p1) else nil
	end
	
	return config
end

return {
	createNewPage = function(_, Name)
		-- upvalues: createNewPage (copy)
		return (createNewPage(Name))
	end
}