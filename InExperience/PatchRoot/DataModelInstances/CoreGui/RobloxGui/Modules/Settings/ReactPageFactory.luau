local ReactModule = require(game:GetService("CorePackages").Packages.React)

local function createNewPage(Name) --[[ Line: 19 ]]
	-- upvalues: ReactModule (copy)
	local config = { page = nil, hubRef = nil, name = Name }
	
	function config:setPage(Page) --[[ Line: 26 ]]
		-- upvalues: config (copy)
		config.page = Page
	end
	
	function config:createPage(p1) --[[ Line: 30 ]]
		-- upvalues: config (copy), ReactModule (upval)
		return if config.page then ReactModule.createElement(config.page, p1) else nil
	end
	
	return config
end

return {
	createNewPage = function(_, Name) --[[ Line: 41 ]]
		-- upvalues: createNewPage (copy)
		return (createNewPage(Name))
	end
}