local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCatalog)
local PageObjectManager = {}
PageObjectManager.__index = PageObjectManager

function PageObjectManager.new()
	-- upvalues: PageObjectManager (copy)
	local config = { pageObjectMap = {} }
	setmetatable(config, PageObjectManager)
	
	return config
end

function PageObjectManager:storePageObject(p1, p2)
	self.pageObjectMap[p1] = p2
end

function PageObjectManager:getPageObject(p1)
	return self.pageObjectMap[p1]
end

return PageObjectManager