local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local _ = require(script.Parent.Parent.Enums.Pages)

return require(corePackagesService.Packages.Rodux).createReducer({ currentPage = nil, currentTag = "" }, {
	[require(script.Parent.Parent.Actions.SetCurrentPage).name] = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			currentPage = if p1.page == nil then cryoModule.None else p1.page
		})
	end,
	[require(script.Parent.Parent.Actions.SetCurrentTag).name] = function(p2, p3) --[[ line: 21 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { currentTag = p3.tag })
	end
})